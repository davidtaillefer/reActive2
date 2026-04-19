import pandas as pd

EXCEL_FILE = "../fit_sdk/Profile.xlsx"
SHEET_NAME = "Types"
OUTPUT_SQL = "../scripts/exercises_join.sql"

df = pd.read_excel(EXCEL_FILE, sheet_name=SHEET_NAME)

# === VERIFY COLUMNS ===
required_cols = ["Type Name", "Value Name"]
for col in required_cols:
    if col not in df.columns:
        raise Exception(f"Missing column: {col}. Found: {df.columns.tolist()}")

def clean(s):
    return str(s).strip().lower().replace(" ", "_")

# === PARSE HIERARCHY ===
categories = set()
exercises = []

current_category = None

for _, row in df.iterrows():
    type_name = str(row["Type Name"]).strip()
    value_name = str(row["Value Name"]).strip()

    # === CATEGORY ROW ===
    if type_name.endswith("_exercise_name"):
        current_category = clean(type_name.replace("_exercise_name", ""))
        categories.add(current_category)
        continue

    # === EXERCISE ROW ===
    if current_category and value_name and value_name.lower() != "nan":
        exercises.append((clean(value_name), current_category))

# Remove duplicates
exercises = list(set(exercises))
categories = sorted(list(categories))

print(f"Categories found: {len(categories)}")
print(f"Exercises found: {len(exercises)}")

# === WRITE SQL ===
with open(OUTPUT_SQL, "w") as f:

    f.write("-- =========================\n")
    f.write("-- INSERT CATEGORIES\n")
    f.write("-- =========================\n\n")

    for cat in categories:
        f.write(
            "INSERT INTO exercise_categories (category_name)\n"
            f"SELECT '{cat}'\n"
            f"WHERE NOT EXISTS (\n"
            f"    SELECT 1 FROM exercise_categories WHERE category_name = '{cat}'\n"
            ");\n\n"
        )

    f.write("\n-- =========================\n")
    f.write("-- INSERT EXERCISES (JOINED)\n")
    f.write("-- =========================\n\n")

    for exercise_name, category in exercises:
        exercise_name = exercise_name.replace("'", "''")

        f.write(
            "INSERT INTO exercises (name, category_id)\n"
            f"SELECT '{exercise_name}', ec.id\n"
            f"FROM exercise_categories ec\n"
            f"WHERE ec.category_name = '{category}'\n"
            f"LIMIT 1;\n\n"
        )

print(f"\nSQL file written to: {OUTPUT_SQL}")