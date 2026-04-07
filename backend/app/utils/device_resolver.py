import json
from functools import lru_cache
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[2]
PROFILE_PATH = BASE_DIR / "data" / "garmin_products.json"

@lru_cache(maxsize=1)
def load_device_map():
    with open(PROFILE_PATH) as f:
        return json.load(f)

def get_device_name(manufacturer, product):
    if manufacturer == "garmin":
        manufacturer = 1
    mapping = load_device_map()
    key = f"{manufacturer}:{product}"
    return mapping.get(key, f"Garmin ({product})")
