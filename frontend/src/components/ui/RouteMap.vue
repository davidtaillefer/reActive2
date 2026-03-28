<template>
  <div ref="mapContainer" class="map-container"></div>
</template>

<script setup>
import { onMounted, ref, watch, nextTick, onUnmounted, toRaw } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

const props = defineProps({
  hrmData: [Object, Array], // Support both single object or array
  height: { type: String, default: '150px' }
});

const mapContainer = ref(null);
let map = null;
let polylineGroup = L.featureGroup(); // Use a Group to manage multiple routes

const initMap = () => {
  if (!mapContainer.value || map) return;
  map = L.map(mapContainer.value, { zoomControl: true,
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
    // Check both potential paths for the track data
    const rawTrack = activity?.Activities?.Track || activity?.Track;
    if (!rawTrack) return;

    const trackArray = downsample(Object.values(toRaw(rawTrack)), 5);
    const latlngs = trackArray
      .filter(p => p.position_lat != null && p.position_long != null)
      .map(p => [Number(p.position_lat), Number(p.position_long)]);

    if (latlngs.length >= 2) {
      L.polyline(latlngs, { color: 'red', weight: 3, opacity: 0.7 }).addTo(polylineGroup);
    }
  });

  // 3. Fit the map to show ALL routes in the group
  if (polylineGroup.getLayers().length > 0) {
    map.fitBounds(polylineGroup.getBounds(), { padding: [20, 20] });
    nextTick(() => map.invalidateSize());
  }
};

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
</style>
