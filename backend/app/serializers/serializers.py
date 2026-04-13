from datetime import datetime
from ..models import Activity, Session, Lap, Length, Set
from ..utils import to_utc_iso


def session_to_dict(s: Session):
    d = s.__dict__.copy()

    if isinstance(d["start_time"], datetime):
        d["start_time"] = to_utc_iso(d["start_time"])
    if isinstance(d["end_time"], datetime):
        d["end_time"] = to_utc_iso(d["end_time"])

    return d

def activity_to_dict(a: Activity):
    return {
        "start_time": to_utc_iso(a.start_time) if a.start_time else None,
        "end_time": to_utc_iso(a.end_time) if a.end_time else None,
        "sport": a.sport,
        "sub_sport": a.sub_sport,

        "total_distance": a.total_distance,
        "total_time": a.total_time,
        "total_elapsed_time": a.total_elapsed_time,
        "total_timer_time": a.total_timer_time,
        
        "start_position_lat": a.start_position_lat,
        "start_position_long": a.start_position_long,
        "end_position_lat": a.end_position_lat,
        "end_position_long": a.end_position_long,

        "avg_heart_rate": a.avg_heart_rate,
        "max_heart_rate": a.max_heart_rate,
        
        "avg_speed": a.avg_speed,
        "max_speed": a.max_speed,
        
        "total_calories": a.total_calories,
        
        "total_ascent": a.total_ascent,
        "total_descent": a.total_descent,
        
        "training_load_peak": a.training_load_peak,
        "total_training_effect": a.total_training_effect,
        "total_anaerobic_training_effect": a.total_anaerobic_training_effect,
        "workout_feel": a.workout_feel,
        "workout_rpe": a.workout_rpe,

        "sessions": [session_to_dict(s) for s in a.sessions],
        "laps": [lap_to_dict(l) for l in a.laps],
        "lengths": [length_to_dict(l) for l in a.lengths],
        "track": [record_to_dict(r) for r in a.track],
        "sets": [set_to_dict(s) for s in a.sets],
        "hr_zones": a.hr_zones,
        "power_zones": a.power_zones,

        "timezone": a.timezone,
        "grade_min": a.grade_min,
        "grade_max": a.grade_max,
        
        "device": a.device,
        "workout_name": a.workout_name,
        
        "muscles": a.muscles
    }
    
def record_to_dict(r):
    if isinstance(r, list):
        return [record_to_dict(x) for x in r]
    return {
        **r.__dict__,
        "timestamp": to_utc_iso(r.timestamp)
    }


def lap_to_dict(l: Lap):
    return {
        "lap_id": l.lap_id,
        "start_time": to_utc_iso(l.start_time) if l.start_time else None,
        "end_time": to_utc_iso(l.end_time) if l.end_time else None,
        "total_distance": l.total_distance,
        "avg_heart_rate": l.avg_heart_rate,
        "track": [record_to_dict(r) for r in l.track]
    }
    
def length_to_dict(l: Length):
    return {
        "timestamp": to_utc_iso(l.timestamp) if l.timestamp else None,
        "total_time": l.total_time,
        "total_strokes": l.total_strokes,
        "avg_speed": l.avg_speed,
        "avg_swimming_cadence": l.avg_swimming_cadence,
        "stroke_type": l.stroke_type
    }
    
def set_to_dict(s: Set):
    return {
        "timestamp": to_utc_iso(s.timestamp) if s.timestamp else None,
        "reps": s.reps,
        "weight": s.weight,
        "duration": s.duration,
        "exercise_name": s.exercise_name
    }
