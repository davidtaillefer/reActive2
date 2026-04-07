import math

def compute_grades(records):
    prev = None

    for r in records:
        if prev and all([
            prev.position_lat, prev.position_long,
            r.position_lat, r.position_long,
            prev.enhanced_altitude, r.enhanced_altitude
        ]):
            dist = haversine(
                prev.position_lat, prev.position_long,
                r.position_lat, r.position_long
            )

            if dist > 0:
                r.grade = ((r.enhanced_altitude - prev.enhanced_altitude) / dist) * 100

        prev = r
        

def smooth_grades(records, window=5):
    for i in range(len(records)):
        vals = [
            records[j].grade
            for j in range(max(0, i-window), min(len(records), i+window+1))
            if records[j].grade is not None
        ]

        records[i].grade_smooth = sum(vals)/len(vals) if vals else None
            
def grade_stats(track):
    if isinstance(track, dict): 
        iterable = track.values()
    else:
        iterable = track

    values = []

    for p in iterable:
        if not isinstance(p, dict):
            continue

        g = p.get("grade_smooth", None)
        if isinstance(g, (int, float)):
            values.append(g)

    if not values:
        return None, None

    values.sort()

    n = len(values)
    low = values[int(n * 0.02)]
    high = values[int(n * 0.98)]

    return round(low, 2), round(high, 2)



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
