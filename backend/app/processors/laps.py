
def assign_records_to_laps(records, laps):
    lap_idx = 0

    for r in records:
        while lap_idx < len(laps) and r.timestamp >= laps[lap_idx].end_time:
            lap_idx += 1

        if lap_idx < len(laps):
            lap = laps[lap_idx]
            if lap.start_time <= r.timestamp < lap.end_time:
                lap.track.append(r)