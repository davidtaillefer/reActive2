from collections import defaultdict
import pymysql
import difflib
import json
from datetime import datetime, timezone

from ..db import exdb
from ..utils.user_utils import get_user_uuid


BODYWEIGHT_FACTORS = {
    "push_up": 0.65,
    "pull_up": 1.0,
    "chin_up": 1.0,
    "dip": 0.9,
    "sit_up": 0.4,
    "crunch": 0.35,
    "plank": 0.3,   # per second later
    "lunge": 0.75,
    "squat": 0.8
}

def estimate_bodyweight_load(exercise_name, reps, duration, user_weight):
    name = (exercise_name or "").lower().replace(" ", "_")

    factor = BODYWEIGHT_FACTORS.get(name, 0.5)  # fallback

    # Static holds (plank etc.)
    if duration:
        return duration * factor * user_weight * 0.1

    if reps:
        return reps * factor * user_weight

    return 0


def compute_set_load(set_data, user_weight=None):
    weight = set_data.get("weight")
    reps = set_data.get("reps")
    duration = set_data.get("duration")
    exercise = set_data.get("exercise_name")

    # Weighted exercise
    if weight and weight > 0:
        return weight * (reps or 1)

    # Bodyweight fallback
    if user_weight:
        return estimate_bodyweight_load(exercise, reps, duration, user_weight)

    return 0


def load_exercise_map():
    conn = exdb.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    cursor.execute("""
        SELECT e.name AS exercise, m.name AS muscle, em.role
        FROM exercise_muscles em
        JOIN exercises e ON em.exercise_id = e.id
        JOIN muscle_groups m ON em.muscle_id = m.id
    """)

    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    exercise_map = defaultdict(list)

    for r in rows:
        exercise_map[r["exercise"].lower()].append({
            "muscle": r["muscle"],
            "role": r["role"]
        })
    print(f"Loaded exercise map with {len(exercise_map)} exercises: {json.dumps(exercise_map)}")
    return dict(exercise_map)

def compute_muscle_load(sets, exercise_map):
    muscle_load = {}

    for s in sets:
        raw_name = s.exercise_name or ""
        match = match_exercise(raw_name, exercise_map)

        if not match:
            print("No match found for exercise:", raw_name)
            continue
        
        user_weight = 82

        set_data = {
            "weight": s.weight,
            "reps": s.reps,
            "duration": getattr(s, "duration", None),
            "exercise_name": raw_name
        }

        volume = compute_set_load(set_data, user_weight)

        for m in exercise_map[match]:
            multiplier = 1.0 if m["role"] == "primary" else 0.5

            muscle = m["muscle"]
            muscle_load[muscle] = muscle_load.get(muscle, 0) + volume * multiplier

    return muscle_load

def normalise_name(name: str) -> str:
    return name.lower().strip()


def match_exercise(name, exercise_map):
    name = normalise_name(name)

    if name in exercise_map:
        return name

    # fuzzy match
    matches = difflib.get_close_matches(
        name,
        exercise_map.keys(),
        n=1,
        cutoff=0.7
    )

    return matches[0] if matches else None

def get_muscle_activation(exercise_names):
    query = """
        SELECT m.name, em.role
        FROM exercises e
        JOIN exercise_muscles em ON e.id = em.exercise_id
        JOIN muscles m ON m.id = em.muscle_id
        WHERE e.name IN %s
    """
    
DECAY_RATE = 0.85  # daily recovery


def apply_decay(fatigue, days=1):
    return fatigue * (DECAY_RATE ** days)


def update_muscle_fatigue(user_id, muscle_loads):
    """
    muscle_loads = { "chest": 1200, "triceps": 800 }
    """

    updated = {}

    for muscle, load in muscle_loads.items():
        existing = get_previous_fatigue(user_id, muscle)
        print("Previous Fatigue: ", muscle, existing)
        
        if existing:

            prev_fatigue = existing.get("fatigue", 0) if existing else 0
            last_updated = existing.get("last_updated") if existing else None

            days = compute_days_since(last_updated)

            recovered = apply_decay(prev_fatigue, days)
            new_fatigue = recovered + load

            updated[muscle] = new_fatigue

    save_fatigue(user_id, updated)

    return updated

def get_previous_fatigue(user_id, muscle):
    conn = exdb.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    cursor.execute(
        "SELECT * FROM muscle_fatigue WHERE user_id=%s AND muscle=%s",
        (user_id, muscle)
    )
    
    rows = cursor.fetchone()
    cursor.close()
    conn.close()
    
    print("Existing DB entry:", rows)
    return rows

def save_fatigue(user_uuid, fatigue_dict):
    conn = exdb.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    for muscle, value in fatigue_dict.items():
        cursor.execute("""
            INSERT INTO muscle_fatigue (user_id, muscle, fatigue, last_updated)
            VALUES (%s, %s, %s, CURDATE())
            ON DUPLICATE KEY UPDATE
                fatigue = VALUES(fatigue),
                last_updated = CURDATE()
        """, (user_uuid, muscle, value))

    conn.commit()

def compute_days_since(last_updated):
    """
    Returns number of days (float) since last_updated timestamp.
    Handles None safely.
    """
    if not last_updated:
        return 0

    if isinstance(last_updated, str):
        # handle ISO strings from DB
        last_updated = datetime.fromisoformat(last_updated)

    now = datetime.now(timezone.utc)

    # Ensure both are timezone-aware or naive consistently
    if last_updated.tzinfo is None:
        last_updated = last_updated.replace(tzinfo=timezone.utc)

    delta = now - last_updated
    return delta.total_seconds() / 86400  # days as float