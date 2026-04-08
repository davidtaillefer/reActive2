<template>
  <div class="map-wrapper">
    <div ref="mapContainer" class="map-container" :style="{ height }"></div>
    <div class="map-legend">
        <select v-model="colourMode">
          <option value="none">Solid</option>
          <option value="grade">Grade</option>
          <option :disabled="!available.hr" value="hr">Heart Rate</option>
          <option :disabled="!available.speed" value="speed">Speed</option>
          <option :disabled="!available.power" value="power">Power</option>
        </select>

        <div v-if="colourMode === 'grade'" class="legend-bar">
          <span>-10%</span>
          <div class="gradient"></div>
          <span>+10%</span>
        </div>

        <div v-else-if="colourMode !== 'none'" class="legend-bar">
          <span class="legend-min">{{ legendMinLabel }}</span>
          <div :style="legendGradientStyle" class="gradient"></div>
          <span class="legend-max">{{ legendMaxLabel }}</span>
        </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch, nextTick, onUnmounted, toRaw, computed } from 'vue'
import { findNearestPoint } from '@/composables/useHoverMatch'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

const colourMode = ref('none')
const metricBounds = ref({ min: null, max: null })
const available = ref({ hr: false, speed: false, power: false })

const props = defineProps({
  hrmData: [Object, Array], // Support both single object or array
  height: { type: String, default: '100%' },
  hoveredPoint: { type: Object, default: null }
});

const emit = defineEmits(['point-hover','point-leave'])

const mapContainer = ref(null);
let map = null;
let polylineGroup = L.featureGroup(); // Use a Group to manage multiple routes
let fullTrack = []
let hoverMarker = null
let pendingPolylines = []
let tileLayer = null

const addOrQueue = (pl) => {
  try {
    if (map && map._loaded) {
      pl.addTo(polylineGroup)
    } else {
      pendingPolylines.push(pl)
    }
  } catch (e) {
    console.error('RouteMap: addOrQueue failed', e)
  }
}

const initMap = () => {
  if (!mapContainer.value || map) return;
  map = L.map(mapContainer.value, {
    zoomControl: true,
    attributionControl: false,
    preferCanvas: true
  });
  // ensure a sensible initial view so tileLayer knows what to load
  try { map.setView([0,0], 2) } catch(e) {}
  tileLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
  tileLayer.addTo(map);
  polylineGroup.addTo(map);
  // (debug probes removed)
  // flush pending polylines when map is ready
  try {
    if (map && typeof map.whenReady === 'function') {
      map.whenReady(() => {
        try {
          try { map.invalidateSize() } catch(e){}
          pendingPolylines.forEach(p => { try { p.addTo(polylineGroup) } catch(e){} })
          pendingPolylines = []
        } catch (e) { /* ignore */ }
      })
    }

    // Flush queued polylines when tiles finish loading
    try {
      if (tileLayer && tileLayer.on) {
        tileLayer.on('load', () => {
          try {
            setTimeout(() => { try { map.invalidateSize() } catch(e){} }, 50)
            pendingPolylines.forEach(p => { try { p.addTo(polylineGroup) } catch(e){} })
            pendingPolylines = []
          } catch (e) { /* ignore */ }
        })
      }
    } catch (e) {}

    // (removed periodic debug probe)
  } catch (e) {}
  // Ensure routes are added even if tile load event doesn't fire
  setTimeout(() => {
    try { pendingPolylines.forEach(p => { try { p.addTo(polylineGroup) } catch(e){} }); pendingPolylines = [] } catch(e){}
  }, 500)
  // Ensure the map has a sensible initial view so tiles start loading.
  try {
    if (!map.getCenter || !map.getZoom) {
      map.setView([0, 0], 2)
    } else {
      // if map at 0/0, leave it; otherwise keep existing
      const c = map.getCenter()
      if (!c || (c.lat === 0 && c.lng === 0)) map.setView([0,0], 2)
    }
  } catch (e) { /* ignore */ }

  // trigger a resize/invalidation in case container sizes changed
  setTimeout(() => { try { map.invalidateSize() } catch(e){/*ignore*/} }, 300)

  // (removed verbose debug logs)

  // create a single hover marker we can move around
  hoverMarker = L.circleMarker([0,0], { radius: 6, color: '#000', weight: 2, fillColor: '#fff', fillOpacity: 0.9 })
  hoverMarker.addTo(map)
  hoverMarker.setStyle({ opacity: 0, fillOpacity: 0 })

  // map mouse handlers to emit hover events
  map.on('mousemove', (ev) => {
    if (!fullTrack || fullTrack.length === 0) return
    // find nearest point by lat/lng (linear scan - acceptable for moderate sizes)
    let bestIdx = -1
    let bestDist = Infinity
    const mouseLatLng = ev.latlng
    for (let i = 0; i < fullTrack.length; i++){
      const p = fullTrack[i]
      if (p.position_lat == null || p.position_long == null) continue
      const d = mouseLatLng.distanceTo(L.latLng(p.position_lat, p.position_long))
      if (d < bestDist){ bestDist = d; bestIdx = i }
    }
    if (bestIdx >= 0){
      const pt = fullTrack[bestIdx]
      emit('point-hover', { index: bestIdx, timestamp: pt.timestamp, source: 'RouteMap' })
    }
  })

  map.on('mouseout', () => {
    emit('point-leave')
  })
};

const drawRoute = () => {
  try {
    if (!map || !props.hrmData) return;

    // If the Leaflet map hasn't finished initializing its internal bounds/state,
    // defer drawing until it's ready to avoid Bounds-related runtime errors.
    

    // RouteMap.drawRoute starting

    // 1. Clear existing routes before redrawing
    polylineGroup.clearLayers();

  // 2. Normalize data to an array
  const activitiesToDraw = Array.isArray(props.hrmData) ? props.hrmData : [props.hrmData];

  activitiesToDraw.forEach((activity, ai) => {
    const rawTrack = activity?.track
    if (!rawTrack) return

    // keep full unsampled track for matching
    fullTrack = Object.values(toRaw(rawTrack))

    const trackArray = downsample(fullTrack, 5)
      .filter(p => p.position_lat != null && p.position_long != null)

    // detect available metrics for this track so selector can be enabled
    detectAvailableMetrics(trackArray)

    // RouteMap: activity index and track lengths

    if (trackArray.length < 2) return

    if (colourMode.value === 'none') {
      const latlngs = trackArray
        .map(p => [Number(p.position_lat), Number(p.position_long)])
        .filter(([lat, lon]) => Number.isFinite(lat) && Number.isFinite(lon))

      if (latlngs.length >= 2) {
        try {
          const poly = L.polyline(latlngs, {
            color: 'red',
            weight: 3,
            opacity: 0.7
          })

          // validate resolved latlngs from Leaflet before adding
          const pts = (poly.getLatLngs && typeof poly.getLatLngs === 'function') ? poly.getLatLngs() : []
          const flat = (arr) => arr.flat ? arr.flat(Infinity) : arr.reduce((acc, a) => acc.concat(a), [])
          const validated = flat(pts || []).filter(l => l && Number.isFinite(l.lat) && Number.isFinite(l.lng))
            if (validated.length >= 2) {
            addOrQueue(poly)
            // polyline added
          } else {
            console.error('RouteMap: skipping polyline with invalid resolved latlngs', { latlngs, resolved: pts })
          }
        } catch (e) {
          console.error('RouteMap: failed to create/add polyline', e, { latlngs })
        }
      }
    } else {
      // Draw coloured segments for the chosen metric (hr/speed/power/grade).
      computeMetricBounds(trackArray, colourMode.value)

      const pts = trackArray
        .map(p => ({
          lat: Number(p.position_lat),
          lon: Number(p.position_long),
          elev: p.elevation != null ? Number(p.elevation) : (p.altitude || null),
          raw: p
        }))
        .filter(p => Number.isFinite(p.lat) && Number.isFinite(p.lon))

      if (pts.length >= 2) {
        try {
          // Build segments and group contiguous segments with the same colour
          const groups = []
          let currentGroup = null

          for (let i = 0; i < pts.length - 1; i++) {
            const a = pts[i]
            const b = pts[i + 1]
            // skip degenerate segments
            if (a.lat === b.lat && a.lon === b.lon) continue

            // compute metric value for this segment
            let metricVal = null
            if (colourMode.value === 'grade') {
              // approximate grade = (delta_elev / horizontal_distance) * 100
              if (a.elev != null && b.elev != null) {
                const d = L.latLng(a.lat, a.lon).distanceTo(L.latLng(b.lat, b.lon))
                if (d > 0) metricVal = ((b.elev - a.elev) / d) * 100
              }
            } else {
              const v1 = getMetricValue(a.raw, colourMode.value)
              const v2 = getMetricValue(b.raw, colourMode.value)
              if (v1 != null && v2 != null) metricVal = (v1 + v2) / 2
              else metricVal = v1 != null ? v1 : v2
            }

            const colour = getMetricColour(colourMode.value, metricVal, metricBounds.value.min, metricBounds.value.max)

            // if currentGroup exists and colour matches, extend it
            if (currentGroup && currentGroup.colour === colour) {
              currentGroup.latlngs.push([b.lat, b.lon])
            } else {
              // finish previous
              if (currentGroup) groups.push(currentGroup)
              currentGroup = { colour, latlngs: [[a.lat, a.lon], [b.lat, b.lon]] }
            }
          }

          if (currentGroup) groups.push(currentGroup)

          // Add grouped polylines to layer group
          for (const g of groups) {
            const pl = L.polyline(g.latlngs, { color: g.colour, weight: 4, opacity: 0.95 })
            addOrQueue(pl)
          }

          // segmented polylines added
        } catch (e) {
          console.error('RouteMap: failed to create segmented polylines', e)
        }
      }
    }
  })

  // 3. Attempt to center/zoom map on route using fitBounds. Use a short
  // timeout and invalidateSize first so Leaflet has correct pane sizes.
  try {
    const layers = polylineGroup.getLayers()
    if (layers.length > 0) {
      setTimeout(() => {
        try {
          try { map.invalidateSize() } catch(e){}
          const bounds = polylineGroup.getBounds && typeof polylineGroup.getBounds === 'function' ? polylineGroup.getBounds() : null
          if (bounds && bounds.isValid && bounds.isValid()) {
            map.fitBounds(bounds, { padding: [20, 20], maxZoom: 16 })
          }
        } catch (e) {
          console.error('RouteMap: fitBounds failed', e)
        }
      }, 80)
    }
  } catch (e) { console.error('RouteMap: center/fitBounds wrapper failed', e) }
  } catch (err) {
    console.error('RouteMap.drawRoute error', err)
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

// Return a numeric value for the chosen metric from a track point
const getMetricValue = (pt, metric) => {
  if (!pt) return null

  const tryKeys = (keys) => {
    for (const k of keys) {
      if (pt[k] != null) return pt[k]
    }
    return null
  }

  if (metric === 'hr') {
    return tryKeys(['heart_rate', 'heart_rate_bpm', 'hr', 'heartrate', 'heartRate', 'avg_heart_rate'])
  }

  if (metric === 'power') {
    return tryKeys(['power', 'power_smooth', 'watts', 'avg_power'])
  }

  if (metric === 'speed') {
    // Convert m/s -> km/h for display and mapping if likely in m/s
    const v = tryKeys(['enhanced_speed', 'speed', 'speed_smooth', 'velocity_smooth', 'velocity'])
    if (v == null) return null
    // If the value looks like m/s (small number), convert
    if (Math.abs(v) < 30) return v * 3.6
    return v
  }

  return null
}

const computeMetricBounds = (trackArray, metric) => {
  const vals = trackArray.map(p => getMetricValue(p, metric)).filter(v => v != null && !isNaN(v))
  if (vals.length === 0) {
    metricBounds.value = { min: null, max: null }
  } else {
    const min = Math.min(...vals)
    const max = Math.max(...vals)
    // If min == max provide a small buffer so gradient still shows
    metricBounds.value = { min: min === max ? min - 1 : min, max: min === max ? max + 1 : max }
  }
}

const detectAvailableMetrics = (trackArray) => {
  const hr = trackArray.some(p => getMetricValue(p, 'hr') != null)
  const speed = trackArray.some(p => getMetricValue(p, 'speed') != null)
  const power = trackArray.some(p => getMetricValue(p, 'power') != null)
  available.value = { hr, speed, power }
}

const clamp = (v, a, b) => Math.max(a, Math.min(b, v))

const interp = (a, b, t) => a + (b - a) * t

const rgb = (r, g, b) => `rgb(${Math.round(r)}, ${Math.round(g)}, ${Math.round(b)})`

// Map metric value into a blue->yellow->red gradient
const getMetricColour = (metric, val, min, max) => {
  if (val == null || min == null || max == null || min === max) return '#999'
  const t = clamp((val - min) / (max - min), 0, 1)
  if (t < 0.5) {
    const tt = t / 0.5
    // blue -> yellow
    return rgb(interp(0, 255, tt), interp(150, 255, tt), interp(255, 0, tt))
  } else {
    const tt = (t - 0.5) / 0.5
    // yellow -> red
    return rgb(interp(255, 255, tt), interp(255, 200, tt), interp(0, 0, tt))
  }
}

const formatMetric = (metric, v) => {
  if (v == null) return '-'
  if (metric === 'hr') return `${Math.round(v)} bpm`
  if (metric === 'power') return `${Math.round(v)} W`
  if (metric === 'speed') return `${(Math.round(v * 10) / 10).toFixed(1)} km/h`
  return String(v)
}

const legendGradientStyle = computed(() => ({
  background: 'linear-gradient(to right, blue, yellow, red)'
}))

const legendMinLabel = computed(() => formatMetric(colourMode.value, metricBounds.value.min))
const legendMaxLabel = computed(() => formatMetric(colourMode.value, metricBounds.value.max))

onMounted(() => {
  initMap();
  console.log('RouteMap: drawRoute called with hrmData', props.hrmData)

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

// Respond to hoveredPoint updates from parent
watch(() => props.hoveredPoint, (hp) => {
  if (!map || !hp) {
    // hide marker
    hoverMarker?.setStyle({ opacity: 0, fillOpacity: 0 })
    return
  }

  // match against fullTrack (unsampled)
  const match = findNearestPoint(fullTrack, hp, { toleranceMs: 1000 })
  if (match && match.point && match.point.position_lat != null && match.point.position_long != null) {
    const lat = match.point.position_lat
    const lon = match.point.position_long
    hoverMarker.setLatLng([lat, lon])
    hoverMarker.setStyle({ opacity: 1, fillOpacity: 0.9 })
  } else {
    hoverMarker.setStyle({ opacity: 0, fillOpacity: 0 })
  }

}, { immediate: false })

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
