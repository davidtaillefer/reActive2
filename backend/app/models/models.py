from dataclasses import dataclass, field
from datetime import datetime
from typing import List, Optional, Dict

@dataclass
class Session:
    start_time: datetime
    end_time: datetime

    sport: Optional[str] = None
    sub_sport: Optional[str] = None

    total_distance: Optional[float] = None
    total_time: Optional[float] = None
    total_elapsed_time: Optional[float] = None
    total_timer_time: Optional[float] = None
    
    start_position_lat: Optional[float] = None
    start_position_long: Optional[float] = None
    end_position_lat: Optional[float] = None
    end_position_long: Optional[float] = None

    avg_speed: Optional[float] = None
    max_speed: Optional[float] = None

    avg_heart_rate: Optional[int] = None
    max_heart_rate: Optional[int] = None

    total_ascent: Optional[float] = None
    total_descent: Optional[float] = None

    total_calories: Optional[int] = None
    
    training_load_peak: Optional[float] = None
    total_training_effect: Optional[float] = None
    total_anaerobic_training_effect: Optional[float] = None
    workout_feel: Optional[int] = None
    workout_rpe: Optional[int] = None
    

@dataclass
class Record:
    timestamp: datetime
    position_lat: Optional[float] = None
    position_long: Optional[float] = None
    enhanced_altitude: Optional[float] = None
    enhanced_speed: Optional[float] = None
    heart_rate: Optional[int] = None
    distance: Optional[float] = None
    cadence: Optional[int] = None
    power: Optional[float] = None

    # computed fields
    grade: Optional[float] = None
    grade_smooth: Optional[float] = None
    grade_bucket: Optional[str] = None
        
        
@dataclass
class Lap:
    lap_id: int
    start_time: datetime
    end_time: datetime
    total_distance: Optional[float] = None
    avg_heart_rate: Optional[int] = None
    track: List[Record] = field(default_factory=list)

@dataclass
class Length:
    timestamp: datetime
    total_time: Optional[float] = None
    total_strokes: Optional[int] = None
    avg_speed: Optional[float] = None
    avg_swimming_cadence: Optional[int] = None
    stroke_type: Optional[str] = None
    
@dataclass
class Set:
    timestamp: datetime
    reps: Optional[int] = None
    weight: Optional[float] = None
    duration: Optional[float] = None
    exercise_name: Optional[str] = None

@dataclass
class Activity:
    sessions: List[Session] = field(default_factory=list)
    laps: List[Lap] = field(default_factory=list)
    lengths: List[Length] = field(default_factory=list)
    track: List[Record] = field(default_factory=list)
    sets: List[Set] = field(default_factory=list)
    
    hr_zones: Optional[Dict] = None
    power_zones: Optional[Dict] = None

    # summary fields
    start_time: Optional[datetime] = None
    end_time: Optional[datetime] = None
    sport: Optional[str] = None
    sub_sport: Optional[str] = None

    total_distance: Optional[float] = None
    total_time: Optional[float] = None
    total_elapsed_time: Optional[float] = None
    total_timer_time: Optional[float] = None
    
    start_position_lat: Optional[float] = None
    start_position_long: Optional[float] = None
    end_position_lat: Optional[float] = None
    end_position_long: Optional[float] = None

    avg_heart_rate: Optional[int] = None
    max_heart_rate: Optional[int] = None
    total_calories: Optional[int] = None
    
    total_ascent: Optional[float] = None
    total_descent: Optional[float] = None
    
    training_load_peak: Optional[float] = None
    total_training_effect: Optional[float] = None
    total_anaerobic_training_effect: Optional[float] = None
    workout_feel: Optional[int] = None
    workout_rpe: Optional[int] = None 

    timezone: Optional[str] = None

    grade_min: Optional[float] = None
    grade_max: Optional[float] = None     
    
    device: Optional[str] = None
