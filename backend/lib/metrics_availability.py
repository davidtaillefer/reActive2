def compute_metrics_availability(track_list, muscles_obj=None):
    def has_numeric(field):
        for p in track_list:
            v = p.get(field)
            if isinstance(v, (int, float)) and v > 0:
                return True
        return False

    def has_position():
        for p in track_list:
            if p.get("position_lat") is not None and p.get("position_long") is not None:
                return True
        return False

    return {
        "heartRate": has_numeric("heart_rate"),
        "power": has_numeric("power"),
        "cadence": has_numeric("cadence"),
        "speed": has_numeric("enhanced_speed"),
        "elevation": has_numeric("enhanced_altitude"),
        "distance": has_numeric("distance"),
        "position": has_position(),
        "muscles": bool(muscles_obj),
    }
