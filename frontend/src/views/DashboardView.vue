<template>
  <BContainer fluid class="h-100 p-4 overflow-auto">
    <BRow class="h-100 g-3">
      <!-- Left side - Recent Workouts -->
      <BCol cols="12" lg="4">
        <h4 class="mb-3">
          <IBiActivity />
          Recent Workouts
        </h4>
        <div class="overflow-auto" style="max-height: calc(100vh - 150px)">
          <div class="d-flex flex-column gap-3">
            <BCard v-for="workout in recentWorkouts" :key="workout.id" class="mb-3 shadow-sm border-0 workout-card"
              @click="openWorkout(workout.id)" style="cursor: pointer;">
              <BCardBody>
                <BCardTitle class="h6 fw-bold mb-1">{{ workout.name }}</BCardTitle>
                <p class="text-muted small mb-3">{{ workout.date }}</p>

                <BRow class="g-2 mb-3 text-center">
                  <BCol cols="4">
                    <div class="text-muted" style="font-size: 0.7rem; text-transform: uppercase;">Distance</div>
                    <div class="fw-bold small">{{ workout.distance }}</div>
                  </BCol>
                  <BCol cols="4">
                    <div class="text-muted" style="font-size: 0.7rem; text-transform: uppercase;">Time</div>
                    <div class="fw-bold small">{{ workout.duration }}</div>
                  </BCol>
                  <BCol cols="4">
                    <div class="text-muted" style="font-size: 0.7rem; text-transform: uppercase;">Calories</div>
                    <div class="fw-bold small">{{ workout.calories }}</div>
                  </BCol>
                </BRow>

                <!-- Inside the recentWorkouts v-for loop -->
                <div
                  style="height: 150px; border-radius: 0.375rem; overflow: hidden; background-color: #e9ecef; position: relative">

                  <!-- 1. Check for both hrmData AND the presence of GPS points -->
                  <RouteMap v-if="workout.hrmData && workout.hrmData.metricsAvailability.position"
                    :hrmData="[workout.hrmData]" :showLegend="false" class="h-100 w-100" />

                  <!-- Muscle Map -->
                  <MuscleMap v-else-if="workout.hrmData && workout.hrmData.metricsAvailability.muscles"
                    :muscleData="workout.hrmData.muscles" :showLegend="false" class="flex-grow-1 shadow-sm" />

                  <!-- 2. Display a specific placeholder for non-GPS activities (e.g., Strength/Swimming) -->
                  <div v-else-if="workout.hrmData"
                    class="d-flex h-100 flex-column align-items-center justify-content-center text-muted">
                    <IBiPinMapFill />
                    <p class="mb-0">
                      {{ workout.hrmData.sport === 'training'
                        ? 'No muscle data available.'
                        : 'No route data available.' }}
                    </p>
                  </div>

                  <!-- 3. Show loading spinner while fetching hrmData -->
                  <div v-else class="d-flex h-100 align-items-center justify-content-center">
                    <BSpinner small variant="secondary" />
                  </div>
                </div>
              </BCardBody>
            </BCard>
          </div>
        </div>
      </BCol>

      <!-- Right side - Health Metrics -->
      <BCol cols="12" lg="8">
        <h4 class="mb-3">
          <IBiHeartPulse />
          Health & Fitness Metrics
        </h4>
        <div class="overflow-auto" style="max-height: calc(100vh - 150px)">
          <BRow class="g-3">
            <!-- Training Status -->
            <BCol cols="12" md="6">
              <WeightCard />
            </BCol>
            <!-- Weekly Intensity Minutes -->
            <BCol cols="12" md="6">
              <IntensityMinutesCard />
            </BCol>
            <!-- New Minimum Heart Rate Card -->
            <BCol cols="12" md="6">
              <MinHrCard />
            </BCol>

            <!-- VO2max -->
            <BCol cols="12" md="6">
              <VO2MaxCard />
            </BCol>

            <BCol cols="12" md="6">
              <StepsCard />
            </BCol>
            <BCol cols="12" md="6">
              <StairsCard />
            </BCol>

            <!-- Sleep Stages -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <IBiMoonStarsFill />
                    Nightly Sleep Stages
                  </BCardTitle>
                  <div class="mb-3">
                    <div class="fw-bold fs-5">7h 32m</div>
                    <p class="text-muted small mb-0">Total sleep time</p>
                  </div>
                  <div class="mb-2">
                    <div class="d-flex justify-content-between small mb-1">
                      <span>Deep Sleep</span>
                      <span class="fw-bold">1h 45m (23%)</span>
                    </div>
                    <BProgress :max="100" height="20px">
                      <BProgressBar :value="23" variant="primary"></BProgressBar>
                    </BProgress>
                  </div>
                  <div class="mb-2">
                    <div class="d-flex justify-content-between small mb-1">
                      <span>REM Sleep</span>
                      <span class="fw-bold">1h 30m (20%)</span>
                    </div>
                    <BProgress :max="100" height="20px">
                      <BProgressBar :value="20" variant="info"></BProgressBar>
                    </BProgress>
                  </div>
                  <div class="mb-2">
                    <div class="d-flex justify-content-between small mb-1">
                      <span>Light Sleep</span>
                      <span class="fw-bold">4h 02m (53%)</span>
                    </div>
                    <BProgress :max="100" height="20px">
                      <BProgressBar :value="53" variant="success"></BProgressBar>
                    </BProgress>
                  </div>
                  <div class="mb-2">
                    <div class="d-flex justify-content-between small mb-1">
                      <span>Awake</span>
                      <span class="fw-bold">15m (4%)</span>
                    </div>
                    <BProgress :max="100" height="20px">
                      <BProgressBar :value="4" variant="warning"></BProgressBar>
                    </BProgress>
                  </div>
                </BCardBody>
              </BCard>
            </BCol>
          </BRow>
        </div>
      </BCol>
    </BRow>
  </BContainer>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick, watch } from 'vue'
import { useRouter } from 'vue-router'
import { BContainer, BRow, BCol, BCard, BCardBody, BCardTitle, BProgress, BProgressBar } from 'bootstrap-vue-next';
import { Line, Bar } from 'vue-chartjs';
import 'leaflet/dist/leaflet.css';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
  Filler
} from 'chart.js';

import WeightCard from '@/components/ui/WeightCard.vue'
import MinHrCard from '@/components/ui/MinHrCard.vue'
import IntensityMinutesCard from '@/components/ui/IntensityMinutesCard.vue'
import StepsCard from '../components/ui/StepsCard.vue';
import StairsCard from '../components/ui/StairsCard.vue';

// Register Chart.js components
ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
  Filler
);

const router = useRouter()

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const recentWorkouts = ref([])

// Helper to format seconds to HH:MM:SS
const formatDuration = (seconds: number) => {
  const h = Math.floor(seconds / 3600).toString().padStart(2, '0')
  const m = Math.floor((seconds % 3600) / 60).toString().padStart(2, '0')
  const s = Math.floor(seconds % 60).toString().padStart(2, '0')
  return `${h}:${m}:${s}`
}

const props = defineProps({
  hrmData: Array
});

watch(() => props.hrmData, async (newData) => {
  if (newData && mapInstance.value) {
    await nextTick();
    // Forces Leaflet to detect the actual container size
    mapInstance.value.invalidateSize();
    // Re-draw the polyline
    drawRoute(newData);
  }
}, { deep: true });


const fetchRecentWorkouts = async (count: number = 10) => {
  try {
    const res = await fetch(`${apiBaseUrl}activities/recent/${count}`);
    const summaryData = await res.json();

    // 1. Initialise the list with summary data
    recentWorkouts.value = summaryData.map((workout: any) => ({
      ...workout,
      hrmData: null, // Placeholder for the map data
      distance: `${(workout.distance / 1000).toFixed(2)} km`,
      duration: formatDuration(workout.duration),
      date: new Date(workout.date).toLocaleDateString('en-CA', {
        weekday: 'short', month: 'short', day: 'numeric'
      })
    }));

    // 2. Fetch HRM data for each workout in parallel for the maps
    recentWorkouts.value.forEach(async (workout, index) => {
      if (workout.hrmfile) {
        try {
          const hrmRes = await fetch(`${apiBaseUrl}hrm/${workout.hrmfile}`);
          if (hrmRes.ok) {
            const hrmJson = await hrmRes.json();
            // Update the specific workout to trigger the map render
            recentWorkouts.value[index].hrmData = hrmJson;
          }
        } catch (err) {
          console.error(`Failed to load map for ${workout.id}`, err);
        }
      }
    });
  } catch (err) {
    console.error('Error loading dashboard workouts:', err);
  }
};


onMounted(() => {
  fetchRecentWorkouts(10)
})

const openWorkout = (id: number) => {
  router.push({
    name: 'activity',
    params: { id }
  })
}

const hasGpsData = (hrmData: any) => {
  if (!hrmData) return false

  // Prefer server-provided metadata when available
  if (hrmData.metricsAvailability && typeof hrmData.metricsAvailability.position !== 'undefined') {
    return !!hrmData.metricsAvailability.position
  }

  // Fallback: inspect track points
  const track = hrmData?.track
  if (!track) return false

  return Object.values(track).some((point: any) =>
    point.position_lat !== null && point.position_long !== null
  )
}


// VO2max data
const vo2maxData = {
  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
  datasets: [
    {
      label: 'VO2max',
      data: [48, 49, 50, 51, 52, 53],
      borderColor: '#0d6efd',
      backgroundColor: 'rgba(13, 110, 253, 0.1)',
      tension: 0.4,
      fill: true,
    },
  ],
};

// Weight data
const weightData = {
  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
  datasets: [
    {
      label: 'Weight (kg)',
      data: [78, 77.5, 77, 76.8, 76.5, 76.2],
      borderColor: '#198754',
      backgroundColor: 'rgba(25, 135, 84, 0.1)',
      tension: 0.4,
      fill: true,
    },
  ],
};

// Weekly intensity minutes
const intensityData = {
  labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5', 'Week 6', 'Week 7', 'Week 8'],
  datasets: [
    {
      label: 'Vigorous',
      data: [45, 60, 55, 70, 65, 80, 75, 85],
      backgroundColor: '#dc3545',
    },
    {
      label: 'Moderate',
      data: [120, 135, 140, 130, 145, 150, 155, 160],
      backgroundColor: '#ffc107',
    },
  ],
};

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: true,
      position: 'top' as const,
    },
  },
  scales: {
    y: {
      beginAtZero: false,
    },
  },
};

const barChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: true,
      position: 'top' as const,
    },
  },
  scales: {
    x: {
      stacked: true,
    },
    y: {
      stacked: true,
      beginAtZero: true,
    },
  },
};
</script>

<style scoped>
.workout-card {
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.workout-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
}
</style>