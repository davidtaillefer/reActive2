<template>
  <BContainer fluid class="activity-view h-100 d-flex flex-column p-3">

    <!-- Activity Details Section -->
    <BRow>
      <BCol>
        <ActivityDetails
          v-if="activity && Object.keys(activity).length"
          :activity="activity"
          :icon-url="iconUrl"
          :sport-name="sportName"
        />
        <div v-else class="p-3 bg-white rounded shadow-sm">
          <p class="mb-0">No activity data provided.</p>
        </div>
      </BCol>
    </BRow>

    <!-- Main Content Section -->
    <BRow class="flex-fill overflow-hidden mt-3">

      <!-- Route Map (2/3 width on lg+) -->
      <BCol lg="8" class="d-flex overflow-hidden">
        <RouteMap
          v-if="hrmData"
          :hrmData="hrmData"
          class="flex-fill"
        />
        <div v-else class="p-3 bg-white rounded shadow-sm flex-fill d-flex align-items-center justify-content-center">
          <p class="mb-0">No HRM file data available.</p>
        </div>
      </BCol>

      <!-- Metrics Section (1/3 width on lg+) -->
      <BCol lg="4" class="d-flex flex-column p-3 overflow-auto gap-3">
        <HeartRateCard
          v-if="activity && Object.keys(activity).length && hrmData"
          :activity="activity"
          :hrmData="hrmData"
        />        
        <SpeedCard 
          v-if="activity && Object.keys(activity).length && hrmData"
          :activity="activity"
          :hrmData="hrmData"
        />
        <ElevationCard
          v-if="activity && Object.keys(activity).length && hrmData"
          :activity="activity"
          :hrmData="hrmData"
        />   
        <CadenceCard 
          v-if="activity && Object.keys(activity).length && hrmData"
          :activity="activity"
          :hrmData="hrmData"
        />
        <PowerCard
          v-if="activity && Object.keys(activity).length && hrmData"
          :activity="activity"
          :hrmData="hrmData"
        />
      </BCol>

    </BRow>
  </BContainer>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

import { BContainer, BRow, BCol } from 'bootstrap-vue-next'

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
          iconUrl.value = new URL(`../assets/icons/${sport.icon}`, import.meta.url).href
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
</script>

<style scoped>
.activity-view {
  /* Full-height container padding */
  height: 100%;
  padding: 1rem;
}

/* Optional: make metrics section scroll nicely */
</style>