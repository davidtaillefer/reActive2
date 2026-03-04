<template>
  <div class="card mb-4 col-sm-8">
    <div class="card-body">
      <div ref="mapContainer" class="map"></div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { onMounted, ref } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

const mapContainer = ref(null)

const props = defineProps({
  hrmData: {
    type: Object,
    required: true,
  },
})

onMounted(() => {
  if (!mapContainer.value) return

  // Process HRM data to extract GPS points
 const hrmData = props.hrmData || {};
const trackpoints = hrmData?.Activities?.Track || {};
hrmData.routeCoordinates = [];

Object.keys(trackpoints).forEach(function(key, j) {
  const trackpoint = trackpoints[key];

  if (trackpoint.position_lat && trackpoint.position_long) {
    hrmData.routeCoordinates.push([
      parseFloat(trackpoint.position_lat),
      parseFloat(trackpoint.position_long)
    ]);
  }
  else if (j === 0 && hrmData.start_position_lat && hrmData.start_position_long) {
    hrmData.routeCoordinates.push([
      parseFloat(hrmData.start_position_lat),
      parseFloat(hrmData.start_position_long)
    ]);
  }
});

if (Array.isArray(hrmData.routeCoordinates) && hrmData.routeCoordinates.length > 0) {

  const map = L.map(mapContainer.value).setView([45.4, -75.7], 13)

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; OpenStreetMap contributors',
    maxZoom: 19,
  }).addTo(map)

  var polyline = L.polyline(hrmData.routeCoordinates, {color: 'red'});
  polyline.addTo(map);
	map.fitBounds(polyline.getBounds());
}
})
</script>

<style>
.map {
  height: 500px;
  width: 100%;
}
</style>
