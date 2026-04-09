import pymysql

from ..db import exdb

def get_preferences(db, user_uuid):
    
    conn = exdb.connect() 
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    row = cursor.execute(
        "SELECT * FROM user_preferences WHERE user_uuid=%s",
        (user_uuid,)
    )

    if not row:
        return {
            "units": "metric",
            "default_colour_mode": "none",
            "max_hr": None,
            "resting_hr": None,
            "ftp": None,
            "hr_zone_model": "hr_zone_model",
            "power_zone_model": "power_zone_model",
        }

    return dict(row)


def save_preferences(db, user_uuid, data):
    conn = exdb.connect() 
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("""
        INSERT INTO user_preferences (
            user_uuid, units, default_colour_mode,
            max_hr, resting_hr, ftp,
            hr_zone_model, power_zone_model
        )
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            units=%s,
            default_colour_mode=%s,
            max_hr=%s,
            resting_hr=%s,
            ftp=%s,
            hr_zone_model=%s,
            power_zone_model=%s
    """, (
        user_uuid,
        data.get("units"),
        data.get("default_colour_mode"),
        data.get("max_hr"),
        data.get("resting_hr"),
        data.get("ftp"),
        data.get("hr_zone_model"),
        data.get("power_zone_model"),

        # update values
        data.get("units"),
        data.get("default_colour_mode"),
        data.get("max_hr"),
        data.get("resting_hr"),
        data.get("ftp"),
        data.get("hr_zone_model"),
        data.get("power_zone_model"),
    ))