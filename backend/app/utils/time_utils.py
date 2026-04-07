from timezonefinder import TimezoneFinder
from datetime import datetime
import pytz

tf = TimezoneFinder()

def get_timezone(lat, lon):
    """
    Returns tz string like 'Europe/London'
    """
    if lat is None or lon is None:
        return "UTC"

    try:
        tz = tf.timezone_at(lat=lat, lng=lon)
        return tz or "UTC"
    except:
        return "UTC"


def to_local_iso(utc_dt, tz_name):
    """
    Convert UTC datetime -> local ISO8601 string with offset
    """
    if not utc_dt:
        return None

    if isinstance(utc_dt, str):
        utc_dt = datetime.fromisoformat(utc_dt.replace("Z", "+00:00"))

    utc_dt = utc_dt.replace(tzinfo=pytz.UTC)
    local_tz = pytz.timezone(tz_name)

    return utc_dt.astimezone(local_tz).isoformat()


def to_utc_iso(dt):
    """
    Ensure clean UTC ISO string
    """
    if not dt:
        return None

    if isinstance(dt, str):
        dt = datetime.fromisoformat(dt.replace("Z", "+00:00"))

    return dt.astimezone(pytz.UTC).isoformat()

def isoformat(ts):
    if not ts:
        return None
    return datetime.fromisoformat(ts.replace("Z", "+00:00")).isoformat()

def ensure_datetime(ts):
    if isinstance(ts, datetime):
        return ts
    if isinstance(ts, str):
        return datetime.fromisoformat(ts.replace("Z", "+00:00"))
    return None