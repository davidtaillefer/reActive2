import time
from datetime import datetime
from collections import deque
from app.services.muscle_service import compute_muscle_load, load_exercise_map, update_muscle_fatigue
from garmin_fit_sdk import Decoder, Stream
from ..models import Activity
from ..parsers.common import (
    parse_lap,
    parse_length,
    parse_set,
    parse_session,
    parse_record)
from ..processors import assign_records_to_laps, compute_grades, smooth_grades, build_unified_hr_zones, grade_stats, build_unified_power_zones
from ..utils import to_local_iso, ensure_datetime
from ..utils import get_timezone, get_device_name
from ..utils.user_utils import get_user_uuid


def parse_fit(file_path) -> Activity:
    stream = Stream.from_file(file_path)
    decoder = Decoder(stream)
    messages, errors = decoder.read()
    
    start_time = time.perf_counter()

    records = []
    laps = []

    # --- Build lap models ---
    for i, lap_msg in enumerate(messages.get("lap_mesgs", [])):
        lap = parse_lap(i, lap_msg)
        if lap:
            laps.append(lap)

    laps.sort(key=lambda l: l.start_time or datetime.min)

    num_laps = len(laps)

    prev = None
    grade_window = deque(maxlen=5)
    grade_sum = 0
    
    activity = Activity()
    lengths = []
    sets = []
    
    for msg in messages.get("length_mesgs", []):
        length = parse_length(msg)
        if length:
            lengths.append(length)  
            
    for msg in messages.get("set_mesgs", []):
        s = parse_set(msg)
        if s:
            sets.append(s)
            

    # --- Add sessions ---
    for msg in messages.get("session_mesgs", []):
        session = parse_session(msg)
        if session:
            activity.sessions.append(session)
            
    # --- Add session data to Activity
    
    if activity.sessions:
        s = activity.sessions[0]  # usually only one

        activity.start_time = s.start_time
        activity.end_time = s.end_time
        activity.sport = s.sport
        activity.sub_sport = s.sub_sport

        activity.total_distance = s.total_distance
        activity.total_time = s.total_time
        activity.total_elapsed_time = s.total_elapsed_time
        activity.total_timer_time = s.total_timer_time
        
        activity.start_position_lat = s.start_position_lat
        activity.start_position_long = s.start_position_long
        activity.end_position_lat = s.end_position_lat
        activity.end_position_long = s.end_position_long

        activity.avg_heart_rate = s.avg_heart_rate
        activity.max_heart_rate = s.max_heart_rate
        
        activity.avg_speed = s.avg_speed
        activity.max_speed = s.max_speed

        activity.total_calories = s.total_calories
        
        activity.total_ascent = s.total_ascent
        activity.total_descent = s.total_descent
        
        activity.training_load_peak = s.training_load_peak
        activity.total_training_effect = s.total_training_effect
        activity.total_anaerobic_training_effect = s.total_anaerobic_training_effect
        activity.workout_feel = s.workout_feel
        activity.workout_rpe = s.workout_rpe

    # --- Add laps ---
    activity.laps = laps  # from earlier processing
    activity.lengths = lengths
    activity.sets = sets
    
    user_id = get_user_uuid()
    print("User id:", user_id)
    
    exercise_map = load_exercise_map()
    muscle_loads = compute_muscle_load(activity.sets, exercise_map)
    activity.muscles = {"load": muscle_loads,
                        "fatigue": update_muscle_fatigue(user_id, muscle_loads)}

    first_point = None
    last_point = None

    # --- Process records ---
    for msg in messages["record_mesgs"]:
        record = parse_record(msg)
        if not record:
            continue

        prev = record
        
        if not first_point:
            first_point = record
            last_point = record
        
        records.append(record)

    # --- Add flat track ---
    activity.track = records
    activity.start_position_lat = first_point.position_lat
    activity.start_position_long = first_point.position_long
    activity.end_position_lat = last_point.position_lat
    activity.end_position_long = last_point.position_long
    
    assign_records_to_laps(activity.track, activity.laps)

    compute_grades(activity.track)
    smooth_grades(activity.track)
    
    activity.hr_zones = build_unified_hr_zones(
        messages,
        activity.track,
        activity.max_heart_rate or 190
    )
    
    activity.power_zones = build_unified_power_zones(
        messages,
        activity.track,
        203
    )
    
    for i, workout_step in enumerate(messages.get("workout_mesgs", [])):
        for field_name in workout_step:
                field_value = workout_step[field_name]
                if field_name == "wkt_name":
                    activity.workout_name = field_value

    activity.grade_min, activity.grade_max = grade_stats(activity.track)

    # timezone from first valid point
    if records:
        tz_name = get_timezone(activity.start_position_lat, activity.start_position_long)
        activity.timezone = tz_name
        
    device_number = None
    manufacturer = None
    device_name = None
        
    for msg in messages["file_id_mesgs"]:
        for field_name in msg:
            if field_name == "product":
                device_number = msg[field_name]
            if field_name == "manufacturer":
                manufacturer = msg[field_name]
                
    device_name = get_device_name(manufacturer, device_number)
    activity.device = device_name     
    
    # Print benchmark
    end_time = time.perf_counter()
    elapsed_time = end_time - start_time
    print(f"Execution took: {elapsed_time:.4f} seconds (Wall clock time)")

    
    return activity