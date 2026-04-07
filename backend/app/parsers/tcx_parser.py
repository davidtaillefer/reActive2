import time
from datetime import datetime, timedelta

import xmltodict
from ..models import Record, Lap, Activity
from ..utils import safe_float, safe_int, ensure_datetime, get_timezone, to_local_iso, isoformat
from ..processors import build_unified_hr_zones

def parse_tcx(file_path) -> Activity:
    with open(file_path) as f:
        tcx = xmltodict.parse(f.read())


    # normalize lists
    # build laps
    # build records
    
    activity = tcx["TrainingCenterDatabase"]["Activities"]["Activity"]

    raw_laps = activity.get("Lap", [])
    if not isinstance(raw_laps, list):
        raw_laps = [raw_laps]

    total_distance = 0.0
    total_time = 0.0
    total_calories = 0
    max_speed = 0.0

    track_index = 1
    lap_index = 0

    records = []
    laps = []
    # lap_out = {}

    first_point = None
    last_point = None
    prev_point = None

    for i, raw_lap in enumerate(raw_laps):
        lap_distance = safe_float(raw_lap.get("DistanceMeters"))
        lap_time = safe_float(raw_lap.get("TotalTimeSeconds")) or 0
        lap_calories = safe_int(raw_lap.get("Calories"))
        lap_max_speed = safe_float(raw_lap.get("MaximumSpeed"))
        
        start = ensure_datetime(
            raw_lap.get("@StartTime") or raw_lap.get("StartTime")
        )
        end = start + timedelta(seconds=lap_time) if start else None
        total_distance += lap_distance or 0
        total_time += lap_time or 0
        total_calories += lap_calories or 0
        max_speed = max(max_speed, lap_max_speed or 0)

        laps.append(
            Lap(
                lap_id=lap_index,
                start_time=start,
                end_time=end,
                total_distance=lap_distance,
            )
        )
        lap_index += 1

        track = raw_lap.get("Track", {})
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
            #ts = isoformat(p.get("Time"))
            ts = ensure_datetime(p.get("Time"))
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
                    ensure_datetime(ts)
                    - ensure_datetime(prev_point["timestamp"])
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
                "timestamp": ensure_datetime(ts),
                "position_lat": lat,
                "position_long": lon,
                "distance": dist,
                "enhanced_altitude": alt,
                "enhanced_speed": speed,
                "heart_rate": hr,
                "total_ascent": total_ascent,
                "total_descent": total_descent,
            }

            if not first_point:
                first_point = point
            last_point = point

            record = Record(
                timestamp=ensure_datetime(ts),
                position_lat=lat,
                position_long=lon,
                distance=dist,
                enhanced_altitude=alt,
                enhanced_speed=speed,
                heart_rate=hr,
            )
            records.append(record)
            track_index += 1

            prev_point = point

    avg_hr = sum(hr_values) / len(hr_values) if hr_values else None
    max_hr_observed = max(hr_values) if hr_values else None
    
    tz_name = get_timezone(
        first_point["position_lat"],
        first_point["position_long"]
    )
    local_ts = to_local_iso(ts, tz_name)


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

    activity_out = Activity()
    activity_out.device = activity.get("Creator", {}).get("Name")
    activity_out.sport = map_sport(activity.get("@Sport"))
    activity_out.sub_sport = None
    activity_out.start_time = isoformat(activity.get("Id"))
    activity_out.end_time = ensure_datetime(last_point["timestamp"]) if last_point else None
    activity_out.timestamp = ensure_datetime(activity.get("Id"))
    activity_out.total_distance = total_distance
    activity_out.total_time = total_time
    activity_out.total_timer_time = total_time
    activity_out.total_elapsed_time = total_time
    activity_out.total_calories = total_calories
    activity_out.avg_speed = avg_speed
    activity_out.max_speed = max_speed
    activity_out.total_ascent = total_ascent
    activity_out.total_descent = total_descent  
    activity_out.avg_heart_rate = avg_hr
    activity_out.max_heart_rate = max_hr_observed
    activity_out.start_position_lat = first_point["position_lat"] if first_point else None
    activity_out.start_position_long = first_point["position_long"] if first_point else None
    activity_out.end_position_lat = last_point["position_lat"] if last_point else None
    activity_out.end_position_long = last_point["position_long"] if last_point else None
    activity_out.laps = laps
    activity_out.track = records
    activity_out.timezone = tz_name
    activity_out.grade_min = min((r.grade for r in records if r.grade is not None), default=None)
    activity_out.grade_max = max((r.grade for r in records if r.grade is not None), default=None)
    activity_out.hr_zones = build_unified_hr_zones(zones, records, max_hr) 
    activity_out.training_load_peak = None
    activity_out.total_training_effect = None
    activity_out.total_anaerobic_training_effect = None
    activity_out.workout_feel = None
    activity_out.workout_rpe = None

    return activity_out

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