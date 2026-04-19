import pandas as pd

EXCEL_FILE = "../fit_sdk/Profile.xlsx"
SHEET_NAME = "Types"
OUTPUT_SQL = "../scripts/update_garmin_ids.sql"

df = pd.read_excel(EXCEL_FILE, sheet_name=SHEET_NAME)

# === VERIFY COLUMNS ===
required_cols = ["Type Name", "Value Name", "Value"]
for col in required_cols:
    if col not in df.columns:
        raise Exception(f"Missing column: {col}. Found: {df.columns.tolist()}")

def clean(s):
    return str(s).strip().lower().replace(" ", "_")

mapping = {}
current_category = None

for _, row in df.iterrows():
    type_name = str(row["Type Name"]).strip()
    value_name = str(row["Value Name"]).strip()
    value = row["Value"]

    # Category row
    if type_name.endswith("_exercise_name"):
        current_category = clean(type_name.replace("_exercise_name", ""))
        continue

    # Exercise row
    if current_category and value_name and str(value_name).lower() != "nan":
        if pd.notna(value):
            mapping[clean(value_name)] = int(value)

print(f"Mappings found: {len(mapping)}")

# === WRITE SQL ===
with open(OUTPUT_SQL, "w") as f:

    for name, gid in mapping.items():
        name = name.replace("'", "''")

        f.write(
            f"UPDATE exercises\n"
            f"SET garmin_exercise_id = {gid}\n"
            f"WHERE name = '{name}';\n\n"
        )

print(f"SQL file written to: {OUTPUT_SQL}")