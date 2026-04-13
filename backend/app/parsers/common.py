from typing import Optional, List, Dict
from datetime import datetime, timedelta
from collections import deque
import math
import xmltodict

from ..models import Record, Lap, Session, Activity, Length, Set
from ..utils import get_timezone, to_local_iso, to_utc_iso, ensure_datetime, is_valid_number, semicircle_to_degrees

def parse_session(msg) -> Optional[Session]:
    try:
        start = msg.get("start_time")
        end = msg.get("timestamp")

        return Session(
            start_time=start,
            end_time=end,

            sport=msg.get("sport"),
            sub_sport=msg.get("sport_profile_name"),

            total_distance=msg.get("total_distance"),
            total_time=msg.get("total_timer_time"),
            total_elapsed_time=msg.get("total_elapsed_time"),
            total_timer_time=msg.get("total_timer_time"),
            
            start_position_lat=msg.get("start_position_lat"),
            start_position_long=msg.get("start_position_long"),
            end_position_lat=msg.get("end_position_lat"),
            end_position_long=msg.get("end_position_long"),

            avg_speed=msg.get("enhanced_avg_speed"),
            max_speed=msg.get("enhanced_max_speed"),

            avg_heart_rate=msg.get("avg_heart_rate"),
            max_heart_rate=msg.get("max_heart_rate"),

            total_ascent=msg.get("total_ascent"),
            total_descent=msg.get("total_descent"),

            total_calories=msg.get("total_calories"),
            
            training_load_peak=msg.get("training_load_peak"),
            total_training_effect=msg.get("total_training_effect"),
            total_anaerobic_training_effect=msg.get("total_anaerobic_training_effect"),
            workout_feel=msg.get("workout_feel"),
            workout_rpe=msg.get("workout_rpe")
        )
    except Exception as e:
        print("Session parse error:", e)
        return None   

def parse_record(msg) -> Optional[Record]:
    try:
        ts = ensure_datetime(msg.get("timestamp"))

        lat = msg.get("position_lat")
        if is_valid_number(lat):
            lat = semicircle_to_degrees(lat)

        lon = msg.get("position_long")
        if is_valid_number(lon):
            lon = semicircle_to_degrees(lon)

        return Record(
            timestamp=ts,
            position_lat=lat,
            position_long=lon,
            enhanced_altitude=msg.get("enhanced_altitude"),
            enhanced_speed=msg.get("enhanced_speed"),
            heart_rate=msg.get("heart_rate"),
            distance=msg.get("distance"),
            cadence=msg.get("cadence"),
            power=msg.get("power"),
        )
    except:
        return None
    
def parse_lap(lap_id, msg) -> Optional[Lap]:
    try:
        start = ensure_datetime(msg.get("start_time"))
        duration = msg.get("total_elapsed_time", 0)
        end = start + timedelta(seconds=duration) if start else None
        return Lap(
            lap_id=lap_id,
            start_time=start,
            end_time=end,
            total_distance=msg.get("total_distance"),
            avg_heart_rate=msg.get("avg_heart_rate"),
        )
    except Exception as e:
        print("Lap parse error:", e)
        return None
    
def parse_length(msg) -> Optional[Length]:
    try:
        return Length(
            timestamp=msg.get("timestamp"),
            total_time=msg.get("total_timer_time"),
            total_strokes=msg.get("total_strokes"),
            avg_speed=msg.get("avg_speed"),
            avg_swimming_cadence=msg.get("avg_swimming_cadence"),
            stroke_type=msg.get("swim_stroke"),
        )
    except Exception as e:
        print("Length parse error:", e)
        return None
    
def parse_set(msg) -> Optional[Set]:
    try:
        return Set(
            timestamp=msg.get("timestamp"),
            reps=msg.get("repetitions"),
            weight=msg.get("weight"),
            duration=msg.get("duration"),
            exercise_name=msg.get("category")[0],
        )
    except Exception as e:
        print("Set parse error:", e)
        return None