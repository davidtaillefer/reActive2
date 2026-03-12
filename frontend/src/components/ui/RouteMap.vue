<template>
  <div class="card">
    <div class="card-body">
      <div ref="mapContainer" class="map"></div>
    </div>
  </div>
</template>

<script setup>
//import { computed } from 'vue'
import { onMounted, ref, watch } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
//import { watch, watchEffect } from 'vue'

const props = defineProps(['hrmData']);
const mapContainer = ref(null);
let map = null;
let polylineLayer = null;
let polylineLayers = []
let allBounds = L.latLngBounds();

onMounted(() => {
  map = L.map(mapContainer.value);
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; OpenStreetMap'
  }).addTo(map);
});

  watch(() => props.hrmData, (newVal) => {

    const trackData = newVal
    const heartRateArray = Object.values(trackData).map(point => ({
      timestamp: point.timestamp, // Ensure the exact key name matches your object
      heart_rate: point.heart_rate // Adjust if the key is 'heartRate' or similar
    }));
    const rawTrack = newVal?.[newVal.length - 1]?.Activities?.Track;

    if (rawTrack) {
      const trackArray = Array.isArray(rawTrack) 
        ? rawTrack 
        : Object.values(rawTrack);

      const validPoints = trackArray.filter(p => 
        p && 
        p.position_lat != null && 
        p.position_long != null
      );

      const latlngs = validPoints.map(p => [
        Number(p.position_lat), 
        Number(p.position_long)
      ]);

      if (map && latlngs.length >= 2) {
        
        polylineLayer = L.polyline(latlngs, { color: 'red', weight: 3 }).addTo(map);

        polylineLayers.push(polylineLayer);
      
        allBounds.extend(polylineLayer.getBounds());
      }
    }
    if (polylineLayers.length > 0) {
    map.fitBounds(allBounds, { padding: [20, 20] });
    }
  }, { immediate: true, deep: true });
  
</script>

<style scoped>
.leaflet-container {
  height: 100% !important;
  width: 100% !important;
  min-height: 100%;
}

/* If you have a custom wrapper ID, ensure it's also 100% */
#map {
  height: 100%;
  min-height: 400px; /* Provides a fallback */
}
</style>
