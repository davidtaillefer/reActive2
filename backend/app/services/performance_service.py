from datetime import date, timedelta
from ..db import exdb
from ..processors.performance import compute_load_metrics, compute_injury_risk, compute_recovery

def get_training_load_history(user_id, days=60):
    conn = exdb.connect()
    cursor = conn.cursor()

    start_date = date.today() - timedelta(days=days)

    cursor.execute("""
    SELECT 
        date,
        training_load
    FROM activities
    WHERE date >= %s
    ORDER BY date
""", (start_date))
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    return rows

def get_current_fatigue(user_id):
    conn = exdb.connect()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT muscle, fatigue
        FROM muscle_fatigue
        WHERE user_id=%s
    """, (user_id,))

    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    return {r[0]: r[1] for r in rows}

def get_performance_summary(user_id):
    history = get_training_load_history(user_id)

    atl, ctl = compute_load_metrics(history)
    fatigue = get_current_fatigue(user_id)

    form = ctl - atl
    injury_risk = compute_injury_risk(atl, ctl)
    recovery = compute_recovery(fatigue)

    return {
        "fatigue": fatigue,
        "atl": atl,
        "ctl": ctl,
        "form": form,
        "injury_risk": injury_risk,
        "recovery": recovery
    }