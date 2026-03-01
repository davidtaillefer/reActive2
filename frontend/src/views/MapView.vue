<script setup>
import { onMounted } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

onMounted(() => {
  const map = L.map('map').setView([20, 0], 2)

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; OpenStreetMap contributors'
  }).addTo(map)
})
</script>

<template>
  <BContainer fluid class="h-100 p-0">
    <BRow class="h-100 g-0">
      <BCol cols="12" class="h-100">
        <div id="map" class="h-100 w-100"></div>
      </BCol>
    </BRow>
  </BContainer>
</template>