<template>
  <BContainer fluid class="p-3">
    <BRow class="g-3">
      <BCol>
        <ActivityDetails v-if="activity && Object.keys(activity).length" :activity="activity" :icon-url="iconUrl"
          :sport-name="sportName" />
        <div v-else class="p-3 bg-white rounded shadow-sm">
          <p class="mb-0">No activity data provided.</p>
        </div>
      </BCol>
    </BRow>

    <!-- Main Content Section -->
    <BRow class="g-3" style="height: calc(100vh - 300px);">
      <!-- Route Map (2/3 width on lg+) -->

      <BCol cols="12" lg="8" class="d-flex flex-column h-100">
        <RouteMap v-if="metricsAvailability.position" :hrmData="hrmData" class="flex-grow-1 shadow-sm" />
        <div v-else class="p-3 bg-white rounded shadow-sm flex-fill d-flex align-items-center justify-content-center">
          <p class="mb-0">No HRM file data available.</p>
        </div>
      </BCol>

      <!-- Metrics Section (1/3 width on lg+) -->
      <BCol lg="4" class="d-flex flex-column h-100">
        <div class="flex-grow-1 overflow-auto d-flex flex-column gap-3 pe-2">
          <HeartRateCard v-if="metricsAvailability.heartRate" :activity="activity"
            :hrmData="hrmData" />
          <SpeedCard v-if="metricsAvailability.speed" :activity="activity"
            :hrmData="hrmData" />
          <ElevationCard v-if="metricsAvailability.elevation" :activity="activity"
            :hrmData="hrmData" />
          <CadenceCard v-if="metricsAvailability.cadence" :activity="activity"
            :hrmData="hrmData" />
          <PowerCard v-if="metricsAvailability.power" :activity="activity"
            :hrmData="hrmData" />
          <HRZonesCard :hrmData="hrmData[0]" />
          <PowerZonesCard v-if="metricsAvailability.power" :hrmData="hrmData[0]" />
          <BRow class="mt-3">
            <!-- Aerobic (ATE) -->
            <BCol md="6">
              <TrainingEffectCard title="Aerobic TE" :score="Number(activity.ate)" :benefit="activity.intensity"
                icon="i-bi-wind" icon-color="text-info" />
            </BCol>

            <!-- Anaerobic (ANTE) -->
            <BCol md="6">
              <TrainingEffectCard title="Anaerobic TE" :score="Number(activity.ante)" icon="i-bi-lightning-fill"
                icon-color="text-warning" />
            </BCol>
          </BRow>
        </div>
      </BCol>





    </BRow>
    <BRow class="mt-3">
      <BCol cols="12">
        <ActivityLapsTable :hrmData="hrmData" />
        <ActivitySetsTable :hrmData="hrmData" />
      </BCol>
    </BRow>

    <!-- Footer -->
    <BRow>
      <BCol>
        <BCard class="mb-4 mt-3 w-100">
          <BCardBody>
            <!-- HRM File -->
            <BCol cols="auto" class="mb-2 mb-lg-0">
              <div class="label">HRM File:</div>
              <div class="value">{{ activity.hrmfile || '-' }}</div>
              <p>{{metricsAvailability}}</p>
            </BCol>
          </BCardBody>
        </BCard>
      </BCol>
    </BRow>
  </BContainer>"
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute } from 'vue-router'

import { BContainer, BRow, BCol, BCard, BCardBody } from 'bootstrap-vue-next'

import ActivityDetails from '@/components/ui/ActivityDetails.vue'
import RouteMap from '@/components/ui/RouteMap.vue'
import HeartRateCard from '@/components/ui/HeartRateCard.vue'
import SpeedCard from '@/components/ui/SpeedCard.vue'
import ElevationCard from '@/components/ui/ElevationCard.vue'
import CadenceCard from '@/components/ui/CadenceCard.vue'
import PowerCard from '@/components/ui/PowerCard.vue'

const route = useRoute()
const id = route.params.id
const activity = ref(route.state?.activity || {})
const iconUrl = ref('')
const sportName = ref('')
const hrmData = ref([]) // Initialize as an array to hold multiple HRM datasets if needed
const hrmfile = ref(activity.value.hrmfile || '')

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

async function loadSports() {
  try {
    const res = await fetch(apiBaseUrl + 'sports')
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const sports = await res.json()
    const sport = sports.find((s) => s.id === activity.value.sport)
    if (sport) {
      sportName.value = sport.name || ''
      if (sport.icon) {
        try {
          iconUrl.value = `/icons/${sport.icon}`;
        } catch {
          iconUrl.value = ''
        }
      }
    }
  } catch (err) {
    console.error('failed to load sports', err)
  }
}

onMounted(async () => {
  if (!activity.value || Object.keys(activity.value).length === 0) {
    try {
      const res = await fetch(apiBaseUrl + `activities/${id}`)
      if (res.ok) {
        activity.value = await res.json()
        hrmfile.value = activity.value.hrmfile || ''
      } else {
        console.error('failed to fetch activity', res.status)
      }
    } catch (err) {
      console.error('error fetching activity', err)
    }
  }

  if (hrmfile.value) {
    try {
      const res = await fetch(apiBaseUrl + `hrm/${hrmfile.value}`)
      if (res.ok) {
        const data = await res.json()
        hrmData.value.push(data)
      } else {
        console.error('failed to fetch HRM data', res.status)
      }
    } catch (err) {
      console.error('error fetching HRM data', err)
    }
  }

  await loadSports()
})

const getFieldSeries = (field: string) => {
  if (!hrmData?.value?.length) return []

  return hrmData.value.flatMap(activity =>
    Object.values(activity.Activities?.Track || {})
      .map((point: any) => point[field])
      .filter(v => v != null)
  )
}

const hasMeaningfulData = (field: string) => {
  const series = getFieldSeries(field)

  if (!series.length) return false

  return series.some(v => typeof v === 'number' && v > 0)
}

const metricsAvailability = computed(() => ({
  heartRate: hasMeaningfulData('heart_rate'),
  power: hasMeaningfulData('power'),
  cadence: hasMeaningfulData('cadence'),
  speed: hasMeaningfulData('enhanced_speed'),
  elevation: hasMeaningfulData('enhanced_altitude'),
  distance: hasMeaningfulData('distance'),
  position: hasMeaningfulData('position_lat')
}))

</script>

<style scoped>
.activity-view {
  /* Full-height container padding */
  height: 100%;
  padding: 1rem;
}

.leaflet-container {
  height: 100%;
  width: 100%;
}

/* Optional: make metrics section scroll nicely */
</style>