import pandas as pd

# === CONFIG ===
EXCEL_FILE = "../fit_sdk/Profile.xlsx"
SHEET_NAME = "Types"  # adjust if needed

# === LOAD DATA ===
df = pd.read_excel(EXCEL_FILE, sheet_name=SHEET_NAME)

# Normalize column names just in case
df.columns = [col.strip().lower().replace(" ", "_") for col in df.columns]

# Expecting columns like:
# type_name, type_value
if "type_name" not in df.columns or "type_value" not in df.columns:
    raise ValueError("Expected columns 'Type Name' and 'Type Value' not found.")

# === STEP 1: EXTRACT CATEGORIES ===
categories = set()

for _, row in df.iterrows():
    type_name = str(row["type_name"])

    if type_name.endswith("_exercise_name"):
        category = type_name.replace("_exercise_name", "").strip()
        categories.add(category)

# Sort for consistency
categories = sorted(categories)

# Assign IDs (simulate DB IDs)
category_id_map = {name: idx + 1 for idx, name in enumerate(categories)}

# === STEP 2: EXTRACT EXERCISES ===
exercises = []

for _, row in df.iterrows():
    type_name = str(row["type_name"])
    type_value = str(row["type_value"]).strip()

    if type_name.endswith("_exercise_name") and type_value:
        category = type_name.replace("_exercise_name", "").strip()

        if category not in category_id_map:
            continue  # safety check

        exercises.append({
            "exercise_name": type_value,
            "category_id": category_id_map[category]
        })

# Optional: remove duplicates
seen = set()
unique_exercises = []

for ex in exercises:
    key = (ex["exercise_name"], ex["category_id"])
    if key not in seen:
        seen.add(key)
        unique_exercises.append(ex)

# === STEP 3: OUTPUT SQL ===

print("-- Insert exercise categories")
for name, cid in category_id_map.items():
    print(f"INSERT INTO exercise_categories (id, category_name) VALUES ({cid}, '{name}');")

print("\n-- Insert exercises")
for ex in unique_exercises:
    name = ex["exercise_name"].replace("'", "''")  # escape quotes
    cid = ex["category_id"]
    print(f"INSERT INTO exercises (exercise_name, category_id) VALUES ('{name}', {cid});")