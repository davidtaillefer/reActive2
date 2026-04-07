def is_valid_number(v):
    return isinstance(v, (int, float)) and not (isinstance(v, float) and math.isnan(v))

def semicircle_to_degrees(v):
    return v * (360 / (2**32))


def safe_float(val):
    try:
        return float(val)
    except:
        return None

def safe_int(val):
    try:
        return int(float(val))
    except:
        return None
    
