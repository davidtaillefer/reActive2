## 🧠 Developer Architecture

This project is designed around a **format-agnostic data pipeline** that transforms raw activity files into a consistent internal representation.

---

### 🔄 End-to-End Flow

```text
Upload File (FIT / TCX / GPX)
        ↓
Format-Specific Parser
        ↓
Typed Data Models (Record / Lap / Session)
        ↓
Normalization Layer
        ↓
Zone Computation (HR / Power)
        ↓
Unified API Response
        ↓
Frontend Visualization (Map + Charts)
```

---

## 🧩 Core Layers

### 1. Parsers (`/parsers`)

Each format has its own parser:

* `fit_parser.py`
* `tcx_parser.py`
* (future) `gpx_parser.py`

Responsibilities:

* Extract raw message data
* Map fields into internal models

---

### 2. Models (`/models`)

Typed data classes:

* `Record` → single trackpoint
* `Lap` → grouped records
* `Session` → full activity
* `Zones` → HR / Power distributions

Why this matters:

* Eliminates repetitive field validation
* Ensures consistent structure across formats
* Makes downstream logic predictable

---

### 3. Normalization Layer

Bridges differences between formats:

| Concept     | FIT     | TCX     | Unified    |
| ----------- | ------- | ------- | ---------- |
| Trackpoints | dict    | list    | list       |
| Laps        | indexed | nested  | array      |
| Zones       | native  | missing | normalized |

---

### 4. Zone Engine (`/services/zones.py`)

Handles:

#### Priority order:

1. Device-provided zones (FIT)
2. Precomputed zones (TCX)
3. Computed from records (fallback)

Supports:

* Heart Rate (based on max HR)
* Power (based on FTP)

---

### 5. API Layer

Flask endpoint:

* Accepts uploaded file
* Runs full pipeline
* Returns unified JSON

---

### 6. Frontend Adapter Layer

Instead of tightly coupling to backend format, components use:

```js
normalizeToTrackArray(activity)
```

This ensures:

* Backend changes don’t break UI
* Multiple formats behave identically

---

## ⚠️ Key Design Decisions

### ✔ Normalize Early

All complexity is handled in the backend so the frontend stays simple.

---

### ✔ Prefer Computation Over Missing Data

If something isn’t provided:

* Compute it
* Don’t drop it

---

### ✔ Schema Stability > Source Accuracy

A consistent schema is more valuable than perfectly mirroring device quirks.

---

### ✔ Defensive Data Handling

* Handles NaN values
* Missing timestamps
* Partial records
* Mixed units

---

## 🧱 Avoiding Circular Dependencies

Project structure enforces:

* `models` → no dependencies
* `utils` → no dependencies
* `parsers` → depend on models + utils
* `services` → depend on models
* `routes` → orchestrate everything

---

## 🚀 Extending the System

### Add a new file format:

1. Create parser in `/parsers`
2. Map to existing models
3. Plug into pipeline

---

### Add a new metric (e.g. cadence):

1. Extend `Record`
2. Update parser mappings
3. Add visualization

---

### Add a new zone type:

1. Create zone function
2. Normalize to standard schema
3. Reuse frontend component

---

## 🧪 Debugging Tips

* Log raw parser output before normalization
* Validate model creation step-by-step
* Check timestamp consistency first (common issue)
* Inspect trackpoint counts between stages

---

## 💡 Guiding Principle

> The frontend should never care whether the data came from FIT, TCX, or GPX.

---
