<template>
  <div class="h-100 bg-light overflow-auto">
    <BContainer fluid class="py-4 px-4 h-100">
      <BCard class="shadow-sm h-100 d-flex flex-column">
        <BCardBody class="p-4 d-flex flex-column overflow-hidden">
          <!-- Header -->
          <div class="d-flex align-items-center justify-content-between mb-4">
            <div class="d-flex align-items-center gap-3">
              <IBiTree />
              <h2 class="mb-0">Seasonal Activity</h2>
            </div>
            <div class="small text-muted">
              <BFormSelect v-model="selectedYear" :options="yearOptions" size="sm" class="bg-white"></BFormSelect>
            </div>
          </div>

          <!-- Main Content - Sidebar + Map -->
          <BRow class="g-3 flex-fill overflow-hidden">
            <!-- Left Sidebar - Season Cards -->
            <BCol cols="12" md="4" lg="3">
              <div class="d-flex flex-column gap-3 h-100 overflow-auto">
                <BCard v-for="season in seasonalStats" :key="season.season" :style="{
                  backgroundColor: seasonColors[season.color].bg,
                  borderColor: seasonColors[season.color].border,
                  color: seasonColors[season.color].text,
                }">
                  <BCardBody>
                    <div class="d-flex align-items-center gap-2 mb-3">
                      <div class="fs-4">
                        <IBiSnow v-if="season.icon === 'IBiSnow'" />
                        <IBiFlower1 v-if="season.icon === 'IBiFlower1'" />
                        <IBiBrightnessHigh v-else-if="season.icon === 'IBiSun'" />
                        <IBiTree v-else-if="season.icon === 'IBiTree'" />
                      </div>
                      <h5 class="mb-0 fw-bold">{{ season.season }}</h5>
                    </div>
                    <div class="small">
                      <div class="d-flex justify-content-between mb-1">
                        <span>Activities:</span>
                        <span class="fw-semibold">{{ season.activities }}</span>
                      </div>
                      <div class="d-flex justify-content-between mb-1">
                        <span>Total Distance:</span> <!-- Label Updated -->
                        <span class="fw-semibold">{{ season.totalDistance }}</span>
                      </div>
                      <div class="d-flex justify-content-between">
                        <span>Total Time:</span>
                        <span class="fw-semibold">{{ season.totalTime }}</span>
                      </div>
                    </div>
                  </BCardBody>
                </BCard>
              </div>

            </BCol>

            <!-- Right Side - Map -->
            <BCol cols="12" md="8" lg="9" class="d-flex flex-column">
              <BCardBody class="p-0 position-relative flex-fill d-flex flex-column">
                <RouteMap v-if="hrmData" :key="mapKey" :hrmData="hrmData"
                  style="height: 100%; width: 100%; min-height: 400px;" class="flex-fill" />
              </BCardBody>
            </BCol>
          </BRow>
        </BCardBody>
      </BCard>
    </BContainer>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted, computed } from 'vue'
import { BContainer, BCard, BCardBody, BRow, BCol, BFormSelect } from 'bootstrap-vue-next';
import RouteMap from '@/components/ui/RouteMap.vue'

const activities = ref([])
const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const hrmData = ref([])
const startDate = ref('2025-12-01')
const endDate = ref('2026-08-31')

const formatDuration = (totalSeconds: number) => {
  const h = Math.floor(totalSeconds / 3600);
  const m = Math.floor((totalSeconds % 3600) / 60);
  return `${h}h ${m}m`;
};

const sumField = (arr: any[], field: string): number => {
  const total = arr.reduce((acc, obj, index) => {
    const value = parseFloat(obj[field]) || 0;
    const newTotal = acc + value;
    return newTotal;
  }, 0);
  return total;
};

const seasonalStats = computed(() => {
  const winterDistMeters = sumField(activities.value, 'distance');
  const winterTimeSeconds = sumField(activities.value, 'duration');

  const winterData = {
    season: 'Winter',
    icon: 'IBiSnow',
    color: 'blue' as const,
    activities: activities.value.length,
    totalDistance: `${(winterDistMeters).toFixed(1)} km`,
    totalTime: formatDuration(winterTimeSeconds),
  };

  return [winterData, ...otherSeasons.value];
});

const otherSeasons = ref([
  { season: 'Spring', icon: 'IBiFlower1', color: 'green', activities: 0, totalDistance: '0 km', totalTime: '0h 0m' },
  { season: 'Summer', icon: 'IBiSun', color: 'orange', activities: 0, totalDistance: '0 km', totalTime: '0h 0m' },
  { season: 'Fall', icon: 'IBiTree', color: 'amber', activities: 0, totalDistance: '0 km', totalTime: '0h 0m' },
]);

async function loadOtherSeasons() {
  const [startYear] = selectedYear.value.split('-');
  const year = parseInt(startYear);

  // Define the periods for Cycling
  const periods = [
    { name: 'Spring', start: `${year + 1}-05-01`, end: `${year + 1}-06-30`, icon: 'IBiFlower1', color: 'green' },
    { name: 'Summer', start: `${year + 1}-07-01`, end: `${year + 1}-08-31`, icon: 'IBiSun', color: 'orange' },
    { name: 'Fall', start: `${year + 1}-09-01`, end: `${year + 1}-10-31`, icon: 'IBiTree', color: 'amber' },
  ];

  const results = [];

  for (const p of periods) {
    try {
      const res = await fetch(`${apiBaseUrl}activities?sport=1&start=${p.start}&end=${p.end}`);
      const data = await res.json();

      const distKm = sumField(data, 'distance');
      const timeSec = sumField(data, 'duration');

      results.push({
        season: p.name,
        icon: p.icon,
        color: p.color,
        activities: data.length,
        totalDistance: `${distKm.toFixed(1)} km`,
        totalTime: formatDuration(timeSec)
      });
    } catch (err) {
      console.error(`Error loading ${p.name}:`, err);
    }
  }
  otherSeasons.value = results;
}


const seasonColors = {
  blue: { bg: '#e7f1ff', border: '#b6d4fe', text: '#084298' },
  green: { bg: '#d1f4e0', border: '#9ee2b0', text: '#0f5132' },
  orange: { bg: '#ffe5d0', border: '#ffc9a6', text: '#984c0c' },
  amber: { bg: '#fff3cd', border: '#ffe69c', text: '#997404' },
};

const generateSkiSeasons = () => {
  const now = new Date();
  const currentMonth = now.getMonth();
  const currentYear = now.getFullYear();

  const latestSeasonStart = currentMonth < 10 ? currentYear - 1 : currentYear;

  const options = [];
  for (let i = 0; i < 20; i++) {
    const start = latestSeasonStart - i;
    const end = start + 1;
    options.push({
      value: `${start}-${end}`,
      text: `Season ${start}-${end}`
    });
  }
  return options;
};

const yearOptions = generateSkiSeasons();
const selectedYear = ref(yearOptions[0].value);

// Load activities
async function loadActivities() {
  try {
    const url = `${apiBaseUrl}activities?sport=5&start=${startDate.value}&end=${endDate.value}`;
    const res = await fetch(url);
    if (!res.ok) throw new Error('Failed to fetch');

    const data = await res.json();
    activities.value = data;

    // Ensure hrmData is updated for the RouteMap component
    hrmData.value = data;

  } catch (err) {
    console.error("Error loading seasonal activities:", err);
  }
}

onMounted(() => {
});

async function fetchRouteData() {
  hrmData.value = []; // Clear existing map routes

  for (const activity of activities.value) {
    const filename = activity.hrmfile || '';
    if (!filename) continue;

    try {
      const res = await fetch(`${apiBaseUrl}hrm/${filename}`);
      if (res.ok) {
        const data = await res.json();
        // Use spread to trigger Vue reactivity properly
        hrmData.value = [...hrmData.value, data];
      }
    } catch (err) {
      console.error('Error fetching HRM route:', err);
    }
  }
}

const mapKey = ref(0);

watch(selectedYear, async (newYear) => {
  hrmData.value = [];
  activities.value = [];

  mapKey.value++; // Increment the key to force a re-render of the RouteMap component

  const [startYear, endYear] = newYear.split('-');
  startDate.value = `${startYear}-11-01`;
  endDate.value = `${endYear}-04-30`;

  await loadActivities(); // Gets the list
  await fetchRouteData();  // Gets the map routes
  await loadOtherSeasons();
}, { immediate: true });
</script>