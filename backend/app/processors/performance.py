def ewma(values, tau):
    alpha = 2 / (tau + 1)
    result = []

    prev = values[0] if values else 0
    for v in values:
        prev = alpha * v + (1 - alpha) * prev
        result.append(prev)

    return result

def compute_load_metrics(loads):
    """Accepts `loads` as a list of DB rows (tuples) or dicts.

    If the rows already contain `atl`/`ctl`, return those from the
    most-recent row. Otherwise compute EWMA on a per-day `load` value
    (tries `load`, `training_load`, or `strength_load+cardio_load`).
    Returns a tuple `(atl, ctl)`.
    """
    if not loads:
        return 0, 0

    # check most-recent row for precomputed ATL/CTL
    last = loads[-1]
    if isinstance(last, dict):
        atl = last.get("atl") or last.get("ATL")
        ctl = last.get("ctl") or last.get("CTL")
        if atl is not None and ctl is not None:
            return atl, ctl
    else:
        # tuple layout from service SELECT: date, strength_load, cardio_load, atl, ctl
        if len(last) >= 5 and (last[3] is not None or last[4] is not None):
            return last[3] or 0, last[4] or 0

    # fall back to computing from per-row load values
    values = []
    for l in loads:
        if isinstance(l, dict):
            v = l.get("load") or l.get("training_load") or (
                (l.get("strength_load") or 0) + (l.get("cardio_load") or 0)
            )
        else:
            # tuple: (date, strength_load, cardio_load, ...)
            strength = l[1] if len(l) > 1 and l[1] is not None else 0
            cardio = l[2] if len(l) > 2 and l[2] is not None else 0
            v = strength + cardio
        values.append(v)

    if not values:
        return 0, 0

    atl = ewma(values, 7)[-1]
    ctl = ewma(values, 42)[-1]

    return atl, ctl
    
def compute_injury_risk(atl, ctl):
    if ctl == 0:
        return 0

    ratio = atl / ctl

    # simple but effective model
    if ratio < 0.8:
        return 0.2
    elif ratio < 1.3:
        return 0.5
    else:
        return min(1.0, 0.5 + (ratio - 1.3))
    
def compute_recovery(fatigue_map):
    if not fatigue_map:
        return {"overall": 1, "strength": 1, "cardio": 1}

    max_fatigue = max(fatigue_map.values())

    strength_recovery = max(0, 1 - (max_fatigue / 10000))

    # simple assumption for now
    cardio_recovery = 0.7 + (0.3 * strength_recovery)

    overall = (strength_recovery + cardio_recovery) / 2

    return {
        "overall": overall,
        "strength": strength_recovery,
        "cardio": cardio_recovery
    }
