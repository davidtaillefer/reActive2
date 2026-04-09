# 🏃‍♂️ reActive

A self hosted fitness tracking and visualization app that reads **FIT, TCX (and future GPX)** files and transforms them into a **unified, normalized data model** for analysis and visualization.

This app was begun may years ago as I was unhappy with the original desktop Garmin app that came with my Forerunner 305 (ie. there was no Linux version available). Over the years I tried a few desktop alternatives, and about 2015 I built my own using php for the api and javasctipt and Backbone for the browser-based user interface. I evenually migrated the backend to a python/Flask architecture. Recently, I had some changes I wanted to make and decided to move away from Backbone, settling on Vue 3.

The app was originally meant to move away from storing personal fitness data on Garmin's cloud service. It can still do so, but I have recently implemented reading of data from the Garmin api as well.

---

## 🚀 Features

## 🎥 Screenshots & Demo

### 🗺️ Route Map with Metric Coloring

Visualize activities with dynamic coloring based on grade, heart rate, speed, or power.

![Route Map Demo](./docs/gifs/route-map.gif)

---

### ❤️ Heart Rate Zones

Time-in-zone visualization with automatically computed or device-provided zones.

![HR Zones](./docs/images/hr-zones.png)

---

### ⚡ Power Zones

Coggan-based power zones with fallback computation from activity records.

![Power Zones](./docs/images/power-zones.png)

---

### 📊 Interactive Hover Sync

Hover over charts or map to highlight corresponding points across all views.

![Hover Sync](./docs/gifs/hover-sync.gif)

---

### 🧭 Multi-Activity Support

Overlay multiple activities and compare metrics visually.

![Multi Activity](./docs/images/multi-activity.png)


### 📥 Multi-Format Parsing

* ✅ FIT (Garmin / device-native)
* ✅ TCX (Training Center XML)
* 🔜 GPX support (planned)

---

### 🔄 Unified Data Pipeline

All input formats are normalized into a single schema:

```json
{
  "sessions": [],
  "laps": [],
  "records": [],
  "zones": {
    "heart_rate": {},
    "power": {}
  }
}
```

This ensures:

* Consistent frontend behavior
* Format-agnostic analytics
* Easier extensibility

---

### 🧠 Smart Zone Computation

Supports:

* ✅ Device-provided zones (FIT)
* ✅ Precomputed zones (TCX)
* ✅ Fallback computation from records

#### Heart Rate Zones

* Based on % of max HR
* Automatically inferred if not present

#### Power Zones

* Based on % of FTP (Coggan model)
* Fully computed when missing

---

### 🗺️ Interactive Map (Vue + Leaflet)

* Route visualization with:

  * Gradient coloring by:

    * Grade
    * Heart rate
    * Speed
    * Power
* Hover sync across components
* Downsampling for performance
* Multi-activity support

---

### 📊 Data Visualizations

* Time in zone charts (HR + Power)
* Metric cards (HR, speed, etc.)
* Clean reusable components

---

## 🏗️ Project Structure

```bash
backend/
│
├── app/
│   ├── parsers/        # FIT, TCX parsing logic
│   ├── models/         # Typed data models (Record, Lap, Session, etc.)
│   ├── utils/          # Time, validation, helpers
│   ├── services/       # Zone computation, normalization
│   └── hrm4.py         # Main API route
│
├── wsgi.py

frontend/
│
├── components/
│   ├── RouteMap.vue
│   ├── HRZoneCard.vue
│   └── MetricCard.vue
│
├── composables/
├── views/
└── main.js
```

---

## 🔧 Backend Architecture

### Data Flow

```
FIT / TCX File
      ↓
Parser (format-specific)
      ↓
Normalized Models (Record, Lap, Session)
      ↓
Zone Computation (HR + Power)
      ↓
Unified JSON API
```

---

### Core Models

* `Record` → individual trackpoint
* `Lap` → grouped records
* `Session` → full activity
* `Zones` → HR / Power distributions

---

### Key Concepts

#### ✔ Typed Data Models

* Replaces raw dict iteration
* Centralizes validation
* Improves maintainability

#### ✔ Validation Layer

* Field-level validation
* Handles NaN, missing values, type coercion

#### ✔ Graceful Fallbacks

* Missing data is computed where possible
* Prevents frontend breakage

---

## 🎨 Frontend Architecture

### Vue 3 + Composition API

* Reactive data handling
* Modular components
* Clean separation of concerns

---

### RouteMap Component

Handles:

* Track normalization
* Multi-lap merging
* Metric-based coloring
* Hover interaction

---

### Zone Components

* Unified schema supports:

  * HR zones
  * Power zones
* Easily extendable to other metrics

---

## ⚡ Performance Optimizations

* Track downsampling for map rendering
* Lazy map initialization
* Deferred polyline rendering
* Minimal reactivity overhead

---

## 🧪 Example API Response

```json
{
  "sessions": [...],
  "laps": [...],
  "records": [...],
  "zones": {
    "heart_rate": {
      "type": "heart_rate",
      "source": "computed",
      "zones": [...]
    },
    "power": {
      "type": "power",
      "source": "computed",
      "zones": [...]
    }
  }
}
```

---

## 🛠️ Setup

### Backend

```bash
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
flask run
```

---

### Frontend

```bash
cd frontend
npm install
npm run dev
```

---

## ⚠️ Known Challenges

* FIT files vary widely by device/vendor
* TCX lacks many advanced metrics
* Timezone normalization can be tricky
* Large files require careful performance handling

---

## 🔮 Future Improvements

* GPX parser
* Cadence & advanced metrics
* Training load / TSS
* Segment detection
* Caching layer for large files
* Web worker offloading for parsing

---

## 🤝 Contributing

Contributions welcome! Suggested areas:

* Additional file format support
* Visualization improvements
* Performance tuning
* Test coverage

---

## 📄 License

MIT License

---

## 🙌 Acknowledgements

* Garmin FIT SDK concepts
* Leaflet for mapping
* Chart.js for visualizations

---

## 💡 Philosophy

> Normalize everything early, and the rest of the system becomes simple.

This project is built around the idea that **data consistency beats format-specific complexity**.

---
