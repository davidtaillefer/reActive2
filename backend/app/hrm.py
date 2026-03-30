import pymysql
import os
import json
import xmltodict
from .db import exdb
from flask import Blueprint, jsonify, flash, request, redirect, url_for
from werkzeug.utils import secure_filename
from datetime import datetime, timedelta
import re
from garmin_fit_sdk import Decoder, Stream
import math
import numbers
import time
import pymysql

# import dateutil.parser

hrm_bp = Blueprint("hrm", __name__)

# GET the contents of an HRM file


@hrm_bp.route("/hrm/<hrmfile>")
def readhrm(hrmfile):
    file_name, file_extension = os.path.splitext(hrmfile)
    base_path = "/mnt/data/gps/"

    if file_extension == ".tcx":
        base_path = base_path + "tcx/"
        with open(base_path + hrmfile) as xml_file:
            data_dict = xmltodict.parse(xml_file.read())
            res = tcx_to_fit_like(data_dict)
            # res=jsonify(data_dict)
            # res.status_code = 200
            return res
    elif file_extension == ".fit":
        base_path = base_path + "fit/"

        data_dict = {}
        activity = {}
        laps = {}
        datapoint = {}
        track = {}
        tracks = {}
        li = 0
        ti = {}
        ct = 0
        lnct = 0
        st = 0
        set_list = {}
        has_laps = False
        has_lengths = False

        stream = Stream.from_file(base_path + hrmfile)
        decoder = Decoder(stream)
        messages, errors = decoder.read()

        # Process the activity record and create the base dict
        start_time = time.perf_counter()

        for record in messages["activity_mesgs"]:
            for field_name in record:
                if isinstance(field_name, int):
                    continue
                field_value = record[field_name]
                try:
                    if math.isnan(field_value):
                        continue
                except:
                    a = 1
                if field_value != None:
                    if isinstance(field_value, datetime):
                        field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                    if "local_timestamp" in field_name:
                        field_value = datetime.fromtimestamp(field_value + 631080000)
                    #    if 'device' in data.name:
                    #        #data.value = 'Forerunner 965'
                    #        print ('Device'+data.value+'|')
                    #    print (data.name)
                    #    key = data.name
                    activity[field_name] = field_value
            data_dict["Activities"] = activity

        # Add session data to the activity dict

        for record in messages["session_mesgs"]:
            for field_name in record:
                if isinstance(field_name, int):
                    continue
                field_value = record[field_name]
                try:
                    if math.isnan(field_value):
                        continue
                except:
                    a = 1
                if (
                    not re.search("unknown", field_name)
                    and field_value != None
                    and field_value != (None, None)
                    and field_value != (None, None, None, None)
                ):
                    if isinstance(field_value, datetime):
                        field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                    if "lat" in field_name or "long" in field_name:
                        field_value = field_value / ((2**32) / 360)
                    activity[field_name] = field_value
            data_dict["Activities"] |= activity

        # Process laps and add them as a child dict to the activity dict

        try:
            data_dict["Activities"] |= {"Lap": {}}
            for record in messages["lap_mesgs"]:
                has_laps = True
                lap = {}
                for field_name in record:
                    if isinstance(field_name, int):
                        continue
                    field_value = record[field_name]
                    try:
                        if math.isnan(field_value):
                            continue
                    except:
                        a = 1
                    if (
                        not re.search("unknown", field_name)
                        and field_value != None
                        and field_value != (None, None)
                        and field_value != (None, None, None, None)
                    ):
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                            starttime = field_value
                        if "lat" in field_name or "long" in field_name:
                            field_value = field_value / ((2**32) / 360)
                        lap[field_name] = field_value
                format = "%Y-%m-%dT%H:%M:%S.%fZ"
                lap["end_time"] = datetime.strptime(
                    lap["start_time"], format
                ) + timedelta(seconds=lap["total_elapsed_time"])
                # print(lap)
                laps[li] = lap
                data_dict["Activities"]["Lap"] |= laps
                data_dict["Activities"]["Lap"][li] |= {"Track": {}}
                tracks[li] = {}
                ti[li] = 0
                li += 1

        except:
            has_laps = False

        # if li <=1:
        #   has_laps = False

        # Process pool lenghts and add them to corresponding laps

        if has_laps:
            for lap in data_dict["Activities"]["Lap"]:
                data_dict["Activities"]["Lap"][lap] |= {"Length": {}}
                tracks[lap] = {}
                ti[lap] = 0

        try:
            for length in messages["length_mesgs"]:
                has_lengths = True
                lnct += 1
                track = {}
                found = -1
                for field_name in length:
                    field_value = length[field_name]
                    if not re.search("unknown", field_name) and field_value != None:
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                        track[field_name] = field_value
                length_index = track["message_index"]
                for lap in data_dict["Activities"]["Lap"]:
                    first_length = data_dict["Activities"]["Lap"][lap][
                        "first_length_index"
                    ]
                    num_lengths = data_dict["Activities"]["Lap"][lap]["num_lengths"]
                    if num_lengths == 0:
                        num_lengths = 1
                    # data_dict['Activities']['Lap'][lap] |= {'Length': {}}
                    if first_length <= length_index < first_length + num_lengths:
                        found = lap
                        data_dict["Activities"]["Lap"][lap]["Length"][
                            length_index
                        ] = track
                        break

        except Exception as error:
            print(error)

        # Read the trackpoint records
        # add them to the corresponding lap record and to a flat list of trackpoints

        if has_laps:

            flat_tracks = {}

            try:
                prev_point = None
                grade_window = []
                WINDOW_SIZE = 5

                for trackpoint in messages["record_mesgs"]:
                    track = {}

                    for field_name in trackpoint:
                        field_value = trackpoint[field_name]

                        try:
                            if (
                                not re.search("unknown", field_name)
                                and field_value != None
                            ):
                                if isinstance(field_value, datetime):
                                    field_value = field_value.strftime(
                                        "%Y-%m-%dT%H:%M:%S.%fZ"
                                    )
                                if "lat" in field_name or "long" in field_name:
                                    field_value = field_value / ((2**32) / 360)
                                track[field_name] = field_value
                        except:
                            continue

                    if prev_point:
                        try:
                            lat1 = prev_point.get("position_lat")
                            lon1 = prev_point.get("position_long")
                            ele1 = prev_point.get("enhanced_altitude")

                            lat2 = track.get("position_lat")
                            lon2 = track.get("position_long")
                            ele2 = track.get("enhanced_altitude")

                            if None not in (lat1, lon1, lat2, lon2, ele1, ele2):
                                dist = haversine(lat1, lon1, lat2, lon2)
                                if dist > 0:
                                    grade = ((ele2 - ele1) / dist) * 100
                                    track["grade"] = round(grade, 2)

                                    grade_window.append(grade)
                                    if len(grade_window) > WINDOW_SIZE:
                                        grade_window.pop(0)

                                    track["grade_smooth"] = round(
                                        sum(grade_window) / len(grade_window), 2
                                    )
                        except:
                            pass

                    prev_point = track
                    flat_tracks[ct] = track
                    ct += 1
                print(flat_tracks)    
                for k in flat_tracks:
                    g = flat_tracks[k].get("grade_smooth")
                    flat_tracks[k]["grade_bucket"] = grade_bucket(g)
                min_g, max_g = grade_stats(flat_tracks)
                print("grade stats: ", min_g, max_g)

                data_dict["Activities"]["Track"] = flat_tracks
                data_dict["Activities"]["grade_min"] = min_g
                data_dict["Activities"]["grade_max"] = max_g

            except Exception as error:
                print(error)
        else:

            try:
                prev_point = None
                grade_window = []
                WINDOW_SIZE = 5

                for trackpoint in messages["record_mesgs"]:
                    track = {}
                    for field_name in trackpoint:
                        field_value = trackpoint[field_name]

                        try:
                            if (
                                not re.search("unknown", field_name)
                                and field_value != None
                            ):
                                if isinstance(field_value, datetime):
                                    field_value = field_value.strftime(
                                        "%Y-%m-%dT%H:%M:%S.%fZ"
                                    )
                                if "lat" in field_name or "long" in field_name:
                                    field_value = field_value / ((2**32) / 360)
                                track[field_name] = field_value
                        except:
                            continue
                    if prev_point:
                        try:
                            lat1 = prev_point.get("position_lat")
                            lon1 = prev_point.get("position_long")
                            ele1 = prev_point.get("enhanced_altitude")

                            lat2 = track.get("position_lat")
                            lon2 = track.get("position_long")
                            ele2 = track.get("enhanced_altitude")

                            if None not in (lat1, lon1, lat2, lon2, ele1, ele2):
                                dist = haversine(lat1, lon1, lat2, lon2)

                                if dist > 0:
                                    grade = ((ele2 - ele1) / dist) * 100
                                    track["grade"] = round(grade, 2)

                                    # ✅ smoothing
                                    grade_window.append(grade)
                                    if len(grade_window) > WINDOW_SIZE:
                                        grade_window.pop(0)

                                    track["grade_smooth"] = round(
                                        sum(grade_window) / len(grade_window), 2
                                    )
                        except:
                            pass
                    prev_point = track
                    tracks[ct] = track
                    ct += 1

                for k in tracks:
                    g = tracks[k].get("grade_smooth")
                    tracks[k]["grade_bucket"] = grade_bucket(g)
                min_g, max_g = grade_stats(tracks)
                print("grade stats: ", min_g, max_g)

                data_dict["Activities"]["Track"] = tracks
                data_dict["Activities"]["grade_min"] = min_g
                data_dict["Activities"]["grade_max"] = max_g

            except Exception as error:
                print(error)

        # Process sets and add them as a child dict to the activity dict

        try:
            for sets in messages["set_mesgs"]:
                set_rec = {}

                for field_name in sets:
                    field_value = sets[field_name]

                    try:
                        if not re.search("unknown", field_name) and field_value != None:
                            if isinstance(field_value, datetime):
                                field_value = field_value.strftime(
                                    "%Y-%m-%dT%H:%M:%S.%fZ"
                                )
                            if "lat" in field_name or "long" in field_name:
                                field_value = field_value / ((2**32) / 360)
                            set_rec[field_name] = field_value
                    except Exception as error:
                        print(error)
                        continue

                set_list[st] = set_rec
                st += 1

            if st:
                data_dict["Activities"]["Sets"] = set_list

        except Exception as error:
            print(error)

        # Process time in zones
        try:
            data_dict["Activities"] |= {"Zones": {}}
            for record in messages["time_in_zone_mesgs"]:
                zone = {}
                for field_name in record:
                    if isinstance(field_name, int):
                        continue
                    field_value = record[field_name]
                    try:
                        if math.isnan(field_value):
                            continue
                    except:
                        a = 1
                    if (
                        not re.search("unknown", field_name)
                        and field_value != None
                        and field_value != (None, None)
                        and field_value != (None, None, None, None)
                    ):
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                            starttime = field_value
                        zone[field_name] = field_value
            data_dict["Activities"]["Zones"] |= zone
        except:
            has_laps = False

        # Read the device name from the file ID
        end_time = time.perf_counter()
        elapsed_time = end_time - start_time
        print(f"Execution took: {elapsed_time:.4f} seconds (Wall clock time)")

        datapoint.clear()
        for file_id_step in messages["file_id_mesgs"]:
            for field_name in file_id_step:
                field_value = file_id_step[field_name]
                if field_name == "product":
                    if field_value == 4315:
                        field_value = "Forerunner 965"
                    elif field_value == 3121:
                        field_value = "Edge 530"
                    datapoint = {"device": field_value}

        data_dict["Activities"].update(datapoint)

        # Read user profile data

        try:
            datapoint.clear()
            for profile_step in messages["user_profile_mesgs"]:
                for field_name in profile_step:
                    field_value = profile_step[field_name]
                    if field_name == "wake_time":
                        datapoint = {field_name: field_value}
                        data_dict["Activities"].update(datapoint)
                    elif field_name == "sleep_time":
                        datapoint = {field_name: field_value}
                        data_dict["Activities"].update(datapoint)
                    elif field_name == "weight":
                        datapoint = {field_name: field_value}
                        data_dict["Activities"].update(datapoint)
                    elif field_name == "resting_heart_rate":
                        datapoint = {field_name: field_value}
                        data_dict["Activities"].update(datapoint)
        except Exception as error:
            print(error)

        # Read workout name

        try:
            datapoint.clear()
            for workout_step in messages["workout_mesgs"]:
                for field_name in workout_step:
                    field_value = workout_step[field_name]
                    if field_name == "wkt_name":
                        datapoint = {"workout_name": field_value}

            data_dict["Activities"].update(datapoint)
        except Exception as error:
            print(error)

        res = jsonify(data_dict)
        res.status_code = 200
        return res
    else:
        res = {}
        # res.status_code = 404
        return res


def isoformat(ts):
    if not ts:
        return None
    return datetime.fromisoformat(ts.replace("Z", "+00:00")).isoformat()


def safe_float(val):
    try:
        return float(val)
    except:
        return None


def safe_int(val):
    try:
        return int(float(val))
    except:
        return None


def tcx_to_fit_like(tcx):
    activity = tcx["TrainingCenterDatabase"]["Activities"]["Activity"]

    laps = activity.get("Lap", [])
    if not isinstance(laps, list):
        laps = [laps]

    total_distance = 0.0
    total_time = 0.0
    total_calories = 0
    max_speed = 0.0

    track_index = 1
    lap_index = 0

    track_out = {}
    lap_out = {}

    first_point = None
    last_point = None
    prev_point = None

    for lap in laps:
        lap_distance = safe_float(lap.get("DistanceMeters"))
        lap_time = safe_float(lap.get("TotalTimeSeconds"))
        lap_calories = safe_int(lap.get("Calories"))
        lap_max_speed = safe_float(lap.get("MaximumSpeed"))

        total_distance += lap_distance or 0
        total_time += lap_time or 0
        total_calories += lap_calories or 0
        max_speed = max(max_speed, lap_max_speed or 0)

        lap_out[lap_index] = {
            "start_time": isoformat(lap.get("@StartTime")),
            "total_distance": lap_distance,
            "total_timer_time": lap_time,
            "total_calories": lap_calories,
            "max_speed": lap_max_speed,
        }
        lap_index += 1

        track = lap.get("Track", {})
        points = track.get("Trackpoint", [])

        if not isinstance(points, list):
            points = [points]

        max_hr = 195  # configurable later

        hr_values = []
        zone_time = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}
        total_ascent = 0
        total_descent = 0

        for p in points:
            lat = safe_float(p.get("Position", {}).get("LatitudeDegrees"))
            lon = safe_float(p.get("Position", {}).get("LongitudeDegrees"))
            ts = isoformat(p.get("Time"))
            dist = safe_float(p.get("DistanceMeters"))
            alt = safe_float(p.get("AltitudeMeters"))

            hr = extract_hr(p)

            if hr is not None:
                hr_values.append(hr)

            if prev_point and hr is not None:
                dt = (
                    datetime.fromisoformat(ts)
                    - datetime.fromisoformat(prev_point["timestamp"])
                ).total_seconds()

                zone = get_hr_zone(hr, max_hr)
                if zone:
                    zone_time[zone] += dt

            speed = None
            if prev_point and ts and prev_point["timestamp"]:
                dt = (
                    datetime.fromisoformat(ts)
                    - datetime.fromisoformat(prev_point["timestamp"])
                ).total_seconds()

                if dt > 0 and dist is not None and prev_point["distance"] is not None:
                    speed = (dist - prev_point["distance"]) / dt

            if (
                prev_point
                and alt is not None
                and prev_point["enhanced_altitude"] is not None
            ):
                delta = alt - prev_point["enhanced_altitude"]

                if delta > 0:
                    total_ascent += delta
                else:
                    total_descent += abs(delta)

            point = {
                "timestamp": ts,
                "position_lat": lat,
                "position_long": lon,
                "distance": dist,
                "enhanced_altitude": alt,
                "enhanced_speed": speed,
                "heart_rate": hr,
                "total_ascent": total_ascent,
                "total_descent": total_descent,
            }

            #point["grade"] = compute_grade(prev_point, point)

            if not first_point:
                first_point = point
            last_point = point

            track_out[track_index] = point
            track_index += 1

            prev_point = point

    avg_hr = sum(hr_values) / len(hr_values) if hr_values else None
    max_hr_observed = max(hr_values) if hr_values else None

    # 1. Smooth elevation first
    smooth_elevation(track_out)

    # 2. Compute distance-based grades
    keys = sorted(track_out.keys())

    for i, k in enumerate(keys):
        point = track_out[k]

        if not is_moving(point):
            point["grade"] = None
            continue

        grade = compute_grade_distance_based(track_out, i, min_distance=10)
        point["grade"] = grade

    # 3. Smooth grades (use your improved weighted version)
    smooth_grades(track_out)
    for k in track_out:
        g = track_out[k].get("grade_smooth")
        track_out[k]["grade_bucket"] = grade_bucket(g)
        
    min_g, max_g = grade_stats(track_out)

    zones = {
        "hr_calc_type": "percent_max_hr",
        "max_heart_rate": max_hr,
        "zones": {
            "z1": zone_time[1],
            "z2": zone_time[2],
            "z3": zone_time[3],
            "z4": zone_time[4],
            "z5": zone_time[5],
        },
    }

    avg_speed = total_distance / total_time if total_time > 0 else None

    activity_out = {
        "device": activity.get("Creator", {}).get("Name"),
        "sport": map_sport(activity.get("@Sport")),
        "start_time": isoformat(activity.get("Id")),
        "timestamp": isoformat(activity.get("Id")),
        "total_distance": total_distance,
        "total_timer_time": total_time,
        "total_calories": total_calories,
        "enhanced_avg_speed": avg_speed,
        "enhanced_max_speed": max_speed,
        "avg_heart_rate": avg_hr,
        "max_heart_rate": max_hr_observed,
        "Zones": zones,
        "start_position_lat": first_point["position_lat"] if first_point else None,
        "start_position_long": first_point["position_long"] if first_point else None,
        "end_position_lat": last_point["position_lat"] if last_point else None,
        "end_position_long": last_point["position_long"] if last_point else None,
        "Lap": lap_out,
        "Track": track_out,
        # Missing in TCX
        "Zones": zones,
        "training_load_peak": None,
        "total_training_effect": None,
        "total_anaerobic_training_effect": None,
        "grade_min": min_g,
        "grade_max": max_g,
    }

    return {"Activities": activity_out}


def map_sport(tcx_sport):
    SPORT_MAP = {
        "Running": "running",
        "Biking": "cycling",
        "Cycling": "cycling",
        "Other": "generic",
        "Hiking": "hiking",
        "Walking": "walking",
    }
    return SPORT_MAP.get(tcx_sport, tcx_sport.lower())


def extract_hr(p):
    return safe_int(p.get("HeartRateBpm", {}).get("Value"))


def get_hr_zone(hr, max_hr):
    if hr is None:
        return None

    pct = hr / max_hr

    if pct < 0.6:
        return 1
    elif pct < 0.7:
        return 2
    elif pct < 0.8:
        return 3
    elif pct < 0.9:
        return 4
    else:
        return 5


def haversine(lat1, lon1, lat2, lon2):
    R = 6371000  # metres

    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)

    dphi = math.radians(lat2 - lat1)
    dlambda = math.radians(lon2 - lon1)

    a = (
        math.sin(dphi / 2) ** 2
        + math.cos(phi1) * math.cos(phi2) * math.sin(dlambda / 2) ** 2
    )

    return 2 * R * math.atan2(math.sqrt(a), math.sqrt(1 - a))


def compute_grade_distance_based(track, i, min_distance=10):
    """
    Compute grade using accumulated distance (metres)
    instead of adjacent points
    """

    keys = sorted(track.keys())
    curr = track[keys[i]]

    lat2 = curr.get("position_lat")
    lon2 = curr.get("position_long")
    alt2 = curr.get("altitude_smooth")

    if None in (lat2, lon2, alt2):
        return None

    distance_accum = 0

    # Walk backwards until we hit min_distance
    for j in range(i - 1, -1, -1):
        prev = track[keys[j]]

        lat1 = prev.get("position_lat")
        lon1 = prev.get("position_long")
        alt1 = prev.get("altitude_smooth")

        if None in (lat1, lon1, alt1):
            continue

        d = haversine(lat1, lon1, lat2, lon2)
        distance_accum += d

        if distance_accum >= min_distance:
            elevation_delta = alt2 - alt1

            if distance_accum == 0:
                return None

            grade = (elevation_delta / distance_accum) * 100

            # Hard clamp to realistic values
            return max(min(grade, 30), -30)

    return None

def smooth_grades(track, window=5):
    keys = sorted(track.keys())

    for i, k in enumerate(keys):
        weighted_sum = 0
        weight_total = 0

        for j in range(max(0, i - window), min(len(keys), i + window + 1)):
            g = track[keys[j]].get("grade")
            if g is None:
                continue

            # Weight closer points higher
            distance = abs(i - j) + 1
            weight = 1 / distance

            weighted_sum += g * weight
            weight_total += weight

        if weight_total > 0:
            track[k]["grade_smooth"] = round(weighted_sum / weight_total, 2)
        else:
            track[k]["grade_smooth"] = None
            
def grade_bucket(g):
    if g is None:
        return None
    if g < -10:
        return "<-10%"
    elif g < -5:
        return "-10% to -5%"
    elif g < 0:
        return "-5% to 0%"
    elif g < 5:
        return "0% to 5%"
    elif g < 10:
        return "5% to 10%"
    elif g < 15:
        return "10% to 15%"
    else:
        return ">15%"
    
def grade_stats(track):
    values = sorted([
        p.get("grade_smooth")
        for p in track.values()
        if p.get("grade_smooth") is not None
    ])

    if not values:
        return None, None

    n = len(values)
    low = values[int(n * 0.02)]   # 2nd percentile
    high = values[int(n * 0.98)]  # 98th percentile

    return round(low, 2), round(high, 2)

def smooth_elevation(track, window=5):
    keys = sorted(track.keys())
    alts = [track[k].get("enhanced_altitude") for k in keys]

    smoothed = []

    for i in range(len(alts)):
        vals = [
            a for a in alts[max(0, i-window):i+window+1]
            if a is not None
        ]

        if vals:
            smoothed.append(sum(vals) / len(vals))
        else:
            smoothed.append(None)

    for k, alt in zip(keys, smoothed):
        track[k]["altitude_smooth"] = alt
        
def is_moving(point, min_speed=1.0):
    """
    min_speed in m/s (~3.6 km/h)
    """
    speed = point.get("enhanced_speed")
    if speed is None:
        return True  # fallback if speed missing
    return speed >= min_speed