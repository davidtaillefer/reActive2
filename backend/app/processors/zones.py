def get_hr_zone(hr, max_hr):
    if not hr or not max_hr:
        return None

    pct = hr / max_hr

    if pct < 0.6: return 1
    elif pct < 0.7: return 2
    elif pct < 0.8: return 3
    elif pct < 0.9: return 4
    else: return 5
    
def get_power_zone(power, ftp):
    if not power or not ftp:
        return None

    pct = power / ftp

    if pct < 0.55: return 1
    elif pct < 0.75: return 2
    elif pct < 0.9: return 3
    elif pct < 1.05: return 4
    elif pct < 1.2: return 5
    else: return 6
    
def parse_hr_zones_target(messages):
    for msg in messages.get("time_in_zone_mesgs", []):
        return {
            "hr_zone_high_boundary": msg.get("hr_zone_high_boundary"),
            "max_heart_rate": msg.get("max_heart_rate"),
            "threshold_heart_rate": msg.get("threshold_heart_rate"),
        }
    return {}

def parse_hr_zone_summary(messages):
    for msg in messages.get("time_in_zone_mesgs", []):
        return {
            "time_in_hr_zone": msg.get("time_in_hr_zone"),
            "timestamp": msg.get("timestamp"),
            "reference_index": msg.get("reference_index"),
            "reference_mesg": msg.get("reference_mesg"),
        }
    return {}

def parse_user_profile(messages):
    for msg in messages.get("user_profile_mesgs", []):
        return {
            "resting_heart_rate": msg.get("resting_heart_rate"),
            "max_heart_rate": msg.get("max_heart_rate"),
        }
    return {}
    
def normalize_fit_hr_zones(messages):
    zones_target = parse_hr_zones_target(messages)
    zone_summary = parse_hr_zone_summary(messages)
    user_profile = parse_user_profile(messages)

    boundaries = zones_target.get("hr_zone_high_boundary") or []
    times = zone_summary.get("time_in_hr_zone") or []
    
    if not boundaries or not times:
        return None

    zones = []
    total_time = sum(times)

    for i, t in enumerate(times):
        z_min = 0 if i == 0 else boundaries[i - 1]
        z_max = boundaries[i] if i < len(boundaries) else None

        zones.append({
            "zone": i + 1,
            "min": z_min,
            "max": z_max,
            "time": t,
            "percent": (t / total_time * 100) if total_time > 0 else 0
        })

    return {
        "type": "heart_rate",
        "source": "device",
        "calc_method": "percent_max_hr",

        "max_hr": (
            zones_target.get("max_heart_rate")
            or user_profile.get("max_heart_rate")
        ),
        "resting_hr": user_profile.get("resting_heart_rate"),

        "zones": zones,
        "total_time": total_time
    }
    
def normalize_tcx_hr_zones(zone_time, max_hr):
    if not zone_time:
        return None

    total_time = sum(zone_time.values())

    # Standard 5-zone model
    bounds = [0.6, 0.7, 0.8, 0.9, 1.0]

    zones = []

    prev = 0
    for i, pct in enumerate(bounds):
        zones.append({
            "zone": i + 1,
            "min": prev * max_hr,
            "max": pct * max_hr,
            "time": zone_time.get(i + 1, 0),
            "percent": (
                zone_time.get(i + 1, 0) / total_time * 100
                if total_time > 0 else 0
            )
        })
        prev = pct

    return {
        "type": "heart_rate",
        "source": "computed",
        "calc_method": "percent_max_hr",

        "max_hr": max_hr,
        "resting_hr": None,

        "zones": zones,
        "total_time": total_time
    }

def build_unified_hr_zones(messages, records, max_hr):
    # 1. Try FIT device zones
    fit_zones = normalize_fit_hr_zones(messages)
    if fit_zones:
        return fit_zones

    # 2. Try TCX/precomputed
    if hasattr(messages, "zone_time"):
        return normalize_tcx_hr_zones(messages.zone_time, max_hr)

    # 3. Fallback to records
    return compute_zones_from_records(records, max_hr)

def compute_zones_from_records(records, max_hr):
    zone_time = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}
    prev = None

    for r in records:
        if prev and r.timestamp and prev.timestamp:
            dt = (r.timestamp - prev.timestamp).total_seconds()

            zone = get_hr_zone(r.heart_rate, max_hr)
            if zone:
                zone_time[zone] += dt

        prev = r

    return normalize_tcx_hr_zones(zone_time, max_hr)
    

