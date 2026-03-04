<template>
  <div class="h-100 bg-light overflow-auto">
    <BContainer fluid class="py-4 px-4 h-100">
      <BCard class="shadow-sm h-100 d-flex flex-column">
        <BCardBody class="p-4 d-flex flex-column overflow-hidden">
          <!-- Header -->
          <div class="d-flex align-items-center justify-content-between mb-4">
            <div class="d-flex align-items-center gap-3">
              <i class="bi bi-tree text-success fs-4"></i>
              <h2 class="mb-0">Seasonal Activity</h2>
            </div>
            <div class="small text-muted">
              <BFormSelect
                v-model="selectedYear"
                :options="yearOptions"
                size="sm"
              ></BFormSelect>
            </div>
          </div>

          <!-- Main Content - Sidebar + Map -->
          <BRow class="g-3 flex-fill overflow-hidden">
            <!-- Left Sidebar - Season Cards -->
            <BCol cols="12" md="4" lg="3">
              <div class="d-flex flex-column gap-3 h-100 overflow-auto">
                <BCard
                  v-for="season in seasonData"
                  :key="season.season"
                  :style="{
                    backgroundColor: seasonColors[season.color].bg,
                    borderColor: seasonColors[season.color].border,
                    borderWidth: '2px',
                    color: seasonColors[season.color].text,
                  }"
                >
                  <BCardBody>
                    <div class="d-flex align-items-center gap-2 mb-3">
                      <i :class="`bi bi-${season.icon} fs-5`"></i>
                      <h5 class="mb-0 fw-bold">{{ season.season }}</h5>
                    </div>
                    <div class="small">
                      <div class="d-flex justify-content-between mb-1">
                        <span style="opacity: 0.75">Activities:</span>
                        <span class="fw-semibold">{{ season.activities }}</span>
                      </div>
                      <div class="d-flex justify-content-between mb-1">
                        <span style="opacity: 0.75">Avg Distance:</span>
                        <span class="fw-semibold">{{ season.avgDistance }}</span>
                      </div>
                      <div class="d-flex justify-content-between">
                        <span style="opacity: 0.75">Total Time:</span>
                        <span class="fw-semibold">{{ season.totalTime }}</span>
                      </div>
                    </div>
                  </BCardBody>
                </BCard>
              </div>
            </BCol>

            <!-- Right Side - Map -->
            <BCol cols="12" md="8" lg="9">
                <BCardBody class="p-0 position-relative">
                  <RouteMap
                    v-if="hrmData"
                    :hrmData="hrmData"
                    class="flex-fill"
                  />
                </BCardBody>
            </BCol>
          </BRow>
        </BCardBody>
      </BCard>
    </BContainer>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { BContainer, BCard, BCardBody, BRow, BCol, BFormSelect } from 'bootstrap-vue-next';
import RouteMap from '@/components/ui/RouteMap.vue'

const activities = ref([])
const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const hrmData = ref([])
const startDate = ref('2025-12-01')
const endDate = ref('2026-08-31')
const hrmfile = ref('') 

const seasonData = [
  {
    season: 'Winter',
    icon: 'snow',
    color: 'blue' as const,
    activities: 28,
    avgDistance: '18.5 km',
    totalTime: '42h 15m',
  },
  {
    season: 'Spring',
    icon: 'flower1',
    color: 'green' as const,
    activities: 45,
    avgDistance: '22.3 km',
    totalTime: '68h 30m',
  },
  {
    season: 'Summer',
    icon: 'brightness-high',
    color: 'orange' as const,
    activities: 52,
    avgDistance: '26.8 km',
    totalTime: '82h 45m',
  },
  {
    season: 'Fall',
    icon: 'tree',
    color: 'amber' as const,
    activities: 38,
    avgDistance: '20.1 km',
    totalTime: '55h 20m',
  },
];

const seasonColors = {
  blue: { bg: '#e7f1ff', border: '#b6d4fe', text: '#084298' },
  green: { bg: '#d1f4e0', border: '#9ee2b0', text: '#0f5132' },
  orange: { bg: '#ffe5d0', border: '#ffc9a6', text: '#984c0c' },
  amber: { bg: '#fff3cd', border: '#ffe69c', text: '#997404' },
};


const selectedYear = ref('2025-2026');
const yearOptions = [
  { value: '2025-2026', text: 'Year 2025-2026' },
  { value: '2024-2025', text: 'Year 2024-2025' },
  { value: '2023-2024', text: 'Year 2023-2024' },
];

// Load activities
async function loadActivities() {
  const res = await fetch(
    `${apiBaseUrl}activities?sport=5&start=${startDate.value}&end=${endDate.value}`
  )
  activities.value = await res.json()
}

onMounted(async () => {
  
  await loadActivities()
  console.log('Loaded activities:', activities.value) 

for (const activity of activities.value) {
    hrmfile.value = activity.hrmfile || ''
    if (!hrmfile.value) {
      console.warn('No HRM file for activity:', activity)
      continue
    }
    try {
      const res = await fetch(apiBaseUrl + `hrm3/${hrmfile.value}`)
      if (res.ok) {
        const data = await res.json()
        //hrmData.value.push(data)
        hrmData.value = [...hrmData.value, data];
      } else {
        console.error('failed to fetch HRM data', res.status)
      }
    } catch (err) {
      console.error('error fetching HRM data', err)
    }
  }
})
</script>