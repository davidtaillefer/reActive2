import pandas as pd
import json
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent


PROFILE_PATH = BASE_DIR / "fit_sdk" / "Profile.xlsx"
OUTPUT_PATH = BASE_DIR / "data" / "garmin_products.json"

def normalize(val):
    if pd.isna(val):
        return None
    return str(val).strip().lower()

def parse_int(val):
    try:
        return int(str(val).strip(), 0)
    except (ValueError, TypeError):
        return None

def generate():
    df = pd.read_excel(PROFILE_PATH, sheet_name="Types")

    mapping = {}
    current_type = None

    for _, row in df.iterrows():
        type_name = row.get("Type Name")
        value = row.get("Value")
        name = row.get("Value Name")

        # Step 1: Update current type when a new one appears
        if pd.notna(type_name):
            current_type = normalize(type_name)

        # Accept BOTH formats (old + new SDKs)
        if current_type not in ("garmin_product", "product"):
            continue

        product_id = parse_int(value)
        if product_id is None or pd.isna(name):
            continue

        key = f"1:{product_id}"

        clean_name = str(name).replace("_", " ").title()
        clean_name = clean_name.replace("Fr", "Forerunner ")
        clean_name = clean_name.replace("fenix", "Fenix ")
        clean_name = clean_name.replace("vivoactive", "Vivoactive ")
        clean_name = clean_name.replace("instinct", "Instinct ")
        clean_name = clean_name.replace("edge", "Edge ").strip()

        mapping[key] = f"Garmin {clean_name}"

    # Save JSON
    with open(OUTPUT_PATH, "w") as f:
        json.dump(mapping, f, indent=2)

    print(f"Generated {len(mapping)} Garmin product entries.")

if __name__ == "__main__":
    generate()