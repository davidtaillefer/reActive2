<template>
  <BContainer fluid class="py-3">
    <BRow>

      <!-- Sidebar -->
      <BCol cols="12" md="2" lg="2" class="mb-3 mb-md-0">
        <BCard>
          <BCardBody>
            <h5 class="mb-3">Filters</h5>

            <!-- Date Range -->
            <div class="mb-3">
              <label class="form-label">Start Date</label>
              <BFormInput type="date" v-model="startDate" />
            </div>

            <div class="mb-3">
              <label class="form-label">End Date</label>
              <BFormInput type="date" v-model="endDate" />
            </div>

            <!-- Sport Toggles -->
            <div>
              <label class="form-label">Sports</label>
              <div class="d-flex flex-column gap-2">
                <BFormCheckbox
                  v-for="sport in sports"
                  :key="sport.id"
                  v-model="selectedSports"
                  :value="sport.id"
                >
                  {{ sport.name }}
                </BFormCheckbox>
              </div>
            </div>
            <BFormCheckbox
              v-model="useClustering"
              switch
              class="mt-3"
            >
              Enable Clustering
            </BFormCheckbox>

          </BCardBody>
        </BCard>
      </BCol>

      <!-- Map Area -->
      <BCol cols="12" md="10" lg="10">
        <BCard>
          <BCardBody>
            <div ref="mapContainer" class="map-canvas"></div>
          </BCardBody>
        </BCard>
      </BCol>

    </BRow>
  </BContainer>
</template>

<script setup>
import { ref, onMounted, watch, computed } from 'vue'
import {
  BContainer, BRow, BCol,
  BCard, BCardBody,
  BFormInput, BFormCheckbox
} from 'bootstrap-vue-next'

import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import 'leaflet.markercluster'
import 'leaflet.markercluster/dist/MarkerCluster.css'
import 'leaflet.markercluster/dist/MarkerCluster.Default.css'

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const mapContainer = ref(null)

const sports = ref([])
const activities = ref([])
const selectedSports = ref([])
const startDate = ref('2001-01-01')
const endDate = ref(new Date().toISOString().split('T')[0])
const useClustering = ref(false)

let map = null
let markersLayer = null

// Load sports
async function loadSports() {
  const res = await fetch(apiBaseUrl + 'sports')
  sports.value = await res.json()
  selectedSports.value = sports.value.map(s => s.id)
}

// Load activities
async function loadActivities() {
  const res = await fetch(
    `${apiBaseUrl}activities?start=${startDate.value}&end=${endDate.value}`
  )
  activities.value = await res.json()
}

// Filter activities
const filteredActivities = computed(() => {
  return activities.value.filter(a =>
    selectedSports.value.includes(parseInt(a.sport))
  )
})

// Build sport icon
function getSportIcon(sportId) {
  const sport = sports.value.find(s => s.id === parseInt(sportId))
  if (!sport?.icon) return null

  try {
    const iconUrl = new URL(
      `../assets/icons/${sport.icon}`,
      import.meta.url
    ).href

    return L.icon({
      iconUrl,
      iconSize: [24, 24],
      iconAnchor: [12, 12]
    })
  } catch {
    return null
  }
}

function renderMarkers() {
  if (markersLayer) {
    map.removeLayer(markersLayer)
  }

  markersLayer = useClustering.value
    ? L.markerClusterGroup()
    : L.layerGroup()

  const bounds = []

  filteredActivities.value.forEach(activity => {
    if (typeof activity.latitude === 'number') {

      const lat = parseFloat(activity.latitude)
      const lng = parseFloat(activity.longitude)
      const icon = getSportIcon(activity.sport)

      const marker = L.marker(
        [lat, lng],
        icon ? { icon } : undefined
      )

      marker.bindPopup(`
        <strong>${activity.date}</strong><br/>
        Distance: ${activity.distance ?? '-'} km<br/>
        Duration: ${formatDuration(activity.duration)}<br/>
        <a href="/activity/${activity.id}" target="_blank">
          View Activity
        </a>
      `)

      markersLayer.addLayer(marker)
      bounds.push([lat, lng])
    }
  })

  map.addLayer(markersLayer)

  if (bounds.length) {
    map.fitBounds(bounds, { padding: [40, 40] })
  }
}

function formatDuration(secs = 0) {
  const h = Math.floor(secs / 3600)
  const m = Math.floor((secs % 3600) / 60)
  const s = secs % 60
  return [h, m, s].map(v => String(v).padStart(2, '0')).join(':')
}

// Watch filters
watch([selectedSports, startDate, endDate, useClustering], async () => {
  await loadActivities()
  renderMarkers()
})

onMounted(async () => {
  await loadSports()
  await loadActivities()

  map = L.map(mapContainer.value).setView([45, -75], 2)

  const bounds = L.latLngBounds(
    L.latLng(-85, -180),
    L.latLng(85, 180)
  )
  map.setMaxBounds(bounds)

  L.tileLayer(
    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    {
      maxZoom: 18,
      noWrap: true,
      attribution: '&copy; OpenStreetMap contributors'
    }
  ).addTo(map)

  renderMarkers()
})
</script>

<style scoped>
.map-canvas {
  width: 100%;
  height: 75vh;
  min-height: 550px;
}
</style>