import pymysql
from app.utils import get_timezone

exdb = {
    "host": "192.168.1.128",
    "user": "reactive",
    "password": "meach1",
    "database": "exercise",
    "cursorclass": pymysql.cursors.DictCursor
}

conn = pymysql.connect(**exdb)
cursor = conn.cursor()

# Process activities
cursor.execute("""
    SELECT id, date, latitude, longitude, sport, subsport
    FROM activities
""")

for row in cursor.fetchall():

    if row["sport"] == 1 and row["subsport"] == 4:
        tz = "America/Toronto"
    if row["latitude"] is None or row["longitude"] is None:
        tz = "America/Toronto"
    if row["latitude"] == 0 or row["longitude"] == 0:
        tz = "America/Toronto"
    else:
        tz = get_timezone(row["latitude"], row["longitude"])
        
    print(f"Updating activity {row['id']} with timezone {tz}")

    cursor.execute("""
        UPDATE activities
        SET timezone=%s
        WHERE id=%s
    """, (tz, row["id"]))

conn.commit()