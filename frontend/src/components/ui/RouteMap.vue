<template>
  <div class="map-wrapper">
    <div ref="mapContainer" class="map-container" ></div>
    <div class="map-legend">
      <select v-model="colourMode">
        <option value="none">Solid</option>
        <option value="grade">Grade</option>
      </select>

      <div v-if="colourMode === 'grade'" class="legend-bar">
        <span>-10%</span>
        <div class="gradient"></div>
        <span>+10%</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch, nextTick, onUnmounted, toRaw } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

const colourMode = ref('none')

const props = defineProps({
  hrmData: [Object, Array], // Support both single object or array
  height: { type: String, default: '150px' }
});

const mapContainer = ref(null);
let map = null;
let polylineGroup = L.featureGroup(); // Use a Group to manage multiple routes

const initMap = () => {
  if (!mapContainer.value || map) return;
  map = L.map(mapContainer.value, {
    zoomControl: true,
    attributionControl: false,
    preferCanvas: true
  });
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
  polylineGroup.addTo(map);
};

const drawRoute = () => {
  if (!map || !props.hrmData) return;

  // 1. Clear existing routes before redrawing
  polylineGroup.clearLayers();

  // 2. Normalize data to an array
  const activitiesToDraw = Array.isArray(props.hrmData) ? props.hrmData : [props.hrmData];

  activitiesToDraw.forEach(activity => {
    const rawTrack = activity?.Activities?.Track || activity?.Track
    if (!rawTrack) return

    const trackArray = downsample(Object.values(toRaw(rawTrack)), 5)
      .filter(p => p.position_lat != null && p.position_long != null)

    if (trackArray.length < 2) return

    if (colourMode.value === 'none') {
      const latlngs = trackArray.map(p => [p.position_lat, p.position_long])
      L.polyline(latlngs, {
        color: 'red',
        weight: 3,
        opacity: 0.7
      }).addTo(polylineGroup)
    } else {
      // 🔥 Segment-based colouring
      for (let i = 1; i < trackArray.length; i++) {
        const p1 = trackArray[i - 1]
        const p2 = trackArray[i]

        const latlngs = [
          [p1.position_lat, p1.position_long],
          [p2.position_lat, p2.position_long]
        ]

        let color = '#999'

        if (colourMode.value === 'grade') {
          color = getGradeColour(p2.grade_smooth ?? p2.grade)
        }

        L.polyline(latlngs, {
          color,
          weight: 4,
          opacity: 0.9
        }).addTo(polylineGroup)
      }
    }
  })

  // 3. Fit the map to show ALL routes in the group
  if (polylineGroup.getLayers().length > 0) {
    map.fitBounds(polylineGroup.getBounds(), { padding: [20, 20] });
    nextTick(() => map.invalidateSize());
  }
};

const getGradeColour = (grade) => {
  if (grade == null) return '#999'

  // Clamp
  const g = Math.max(-10, Math.min(10, grade))

  // Gradient:
  // downhill = blue, flat = yellow, uphill = red
  if (g < 0) {
    const t = Math.abs(g) / 10
    return `rgb(${0}, ${Math.round(150 * (1 - t))}, ${255})`
  } else {
    const t = g / 10
    return `rgb(${255}, ${Math.round(200 * (1 - t))}, ${0})`
  }
}

onMounted(() => {
  initMap();
  drawRoute();
  // Final safeguard for tiles
  setTimeout(() => map?.invalidateSize(), 500);
});

// Watch for data changes (e.g. when the API fetch finishes)
watch(
  () => props.hrmData?.length,
  () => {
    if (!map) initMap();
    drawRoute();
  }
);

watch(colourMode, () => {
  drawRoute()
})

onUnmounted(() => {
  if (map) map.remove();
});

const downsample = (arr, step = 5) => {
  return arr.filter((_, i) => i % step === 0);
};
</script>

<style scoped>
.map-container {

  width: 100%;
  background: #f8f9fa;
}

.map-wrapper {
  position: relative;
  height: 100%;
  width: 100%;
}

.map-container {
  width: 100%;
  height: 100%;
}

/* 🔥 KEY FIXES */
.map-legend {
  position: absolute;
  bottom: 10px;
  left: 10px;
  z-index: 1000;            /* ensure above tiles */
  pointer-events: auto;

  background: rgba(255,255,255,0.95);
  padding: 6px 10px;
  border-radius: 6px;
  font-size: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.25);
}


.legend-bar {
  display: flex;
  align-items: center;
  gap: 6px;
  margin-top: 4px;
}

.gradient {
  width: 100px;
  height: 8px;
  background: linear-gradient(to right, blue, yellow, red);
  border-radius: 4px;
}
</style>
