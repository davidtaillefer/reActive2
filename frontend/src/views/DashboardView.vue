<template>
  <BContainer fluid class="h-100 p-4 overflow-auto">
    <BRow class="h-100 g-3">
      <!-- Left side - Recent Workouts -->
      <BCol cols="12" lg="4">
        <h4 class="mb-3">
          <i class="bi bi-activity me-2"></i>
          Recent Workouts
        </h4>
        <div class="overflow-auto" style="max-height: calc(100vh - 150px)">
          <div class="d-flex flex-column gap-3">
            <BCard v-for="workout in recentWorkouts" :key="workout.id">
              <BCardBody>
                <BCardTitle>{{ workout.name }}</BCardTitle>
                <p class="text-muted small mb-2">{{ workout.date }}</p>

                <BRow class="g-2 mb-3">
                  <BCol cols="4">
                    <div class="text-muted small">Distance</div>
                    <div class="fw-bold">{{ workout.distance }}</div>
                  </BCol>
                  <BCol cols="4">
                    <div class="text-muted small">Duration</div>
                    <div class="fw-bold">{{ workout.duration }}</div>
                  </BCol>
                  <BCol cols="4">
                    <div class="text-muted small">Calories</div>
                    <div class="fw-bold">{{ workout.calories }}</div>
                  </BCol>
                </BRow>

                <div style="height: 150px; border-radius: 0.375rem; overflow: hidden; background-color: #e9ecef; display: flex; align-items: center; justify-content: center; position: relative">
                  <div class="text-center">
                    <i class="bi bi-geo-alt-fill" style="font-size: 2rem; color: #6c757d"></i>
                    <div class="small text-muted mt-2">Route Map</div>
                  </div>
                  <div style="position: absolute; bottom: 8px; left: 8px; font-size: 0.7rem; color: #6c757d">
                    {{ workout.route[0][0].toFixed(4) }}, {{ workout.route[0][1].toFixed(4) }}
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
          <i class="bi bi-heart-pulse-fill me-2"></i>
          Health & Fitness Metrics
        </h4>
        <div class="overflow-auto" style="max-height: calc(100vh - 150px)">
          <BRow class="g-3">
            <!-- Training Status -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-speedometer2 me-2"></i>
                    Training Status
                  </BCardTitle>
                  <div class="text-center py-4">
                    <div class="display-4 text-success mb-2">Productive</div>
                    <p class="text-muted">
                      Your training load is increasing at an optimal rate. Keep up the good work!
                    </p>
                    <BRow class="mt-3">
                      <BCol cols="6">
                        <div class="small text-muted">Load Ratio</div>
                        <div class="fw-bold fs-5">1.2</div>
                      </BCol>
                      <BCol cols="6">
                        <div class="small text-muted">Recovery Time</div>
                        <div class="fw-bold fs-5">18h</div>
                      </BCol>
                    </BRow>
                  </div>
                </BCardBody>
              </BCard>
            </BCol>

            <!-- VO2max -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-heart-fill me-2"></i>
                    VO2 Max
                  </BCardTitle>
                  <div class="display-6 text-primary mb-2">53 ml/kg/min</div>
                  <p class="text-muted small mb-3">Superior fitness level</p>
                  <div style="height: 180px">
                    <Line :data="vo2maxData" :options="chartOptions" />
                  </div>
                </BCardBody>
              </BCard>
            </BCol>

            <!-- Training Load -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-graph-up-arrow me-2"></i>
                    Training Load (Last Month)
                  </BCardTitle>
                  <BRow class="text-center py-3">
                    <BCol cols="4">
                      <div class="small text-muted">Current</div>
                      <div class="fw-bold fs-4 text-primary">425</div>
                    </BCol>
                    <BCol cols="4">
                      <div class="small text-muted">Average</div>
                      <div class="fw-bold fs-4">380</div>
                    </BCol>
                    <BCol cols="4">
                      <div class="small text-muted">Peak</div>
                      <div class="fw-bold fs-4">465</div>
                    </BCol>
                  </BRow>
                  <BProgress :max="100" height="30px">
                    <BProgressBar :value="35" variant="success">Low</BProgressBar>
                    <BProgressBar :value="45" variant="warning">Optimal</BProgressBar>
                    <BProgressBar :value="20" variant="danger">High</BProgressBar>
                  </BProgress>
                  <div class="text-center mt-2">
                    <i class="bi bi-caret-down-fill text-warning"></i>
                    <span class="ms-1 small">Current Load</span>
                  </div>
                </BCardBody>
              </BCard>
            </BCol>

            <!-- Weight -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-speedometer me-2"></i>
                    Weight
                  </BCardTitle>
                  <div class="display-6 text-success mb-2">76.2 kg</div>
                  <p class="text-muted small mb-3">
                    <i class="bi bi-arrow-down text-success me-1"></i>
                    -1.8 kg from January
                  </p>
                  <div style="height: 180px">
                    <Line :data="weightData" :options="chartOptions" />
                  </div>
                </BCardBody>
              </BCard>
            </BCol>

            <!-- Sleep Stages -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-moon-stars-fill me-2"></i>
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

            <!-- Weekly Intensity Minutes -->
            <BCol cols="12" md="6">
              <BCard class="h-100">
                <BCardBody>
                  <BCardTitle>
                    <i class="bi bi-fire me-2"></i>
                    Weekly Intensity Minutes
                  </BCardTitle>
                  <div class="mb-3">
                    <div class="fw-bold fs-5">245 minutes</div>
                    <p class="text-muted small mb-0">This week (85 vigorous + 160 moderate)</p>
                  </div>
                  <div style="height: 200px">
                    <Bar :data="intensityData" :options="barChartOptions" />
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
import { BContainer, BRow, BCol, BCard, BCardBody, BCardTitle, BProgress, BProgressBar } from 'bootstrap-vue-next';
import { Line, Bar } from 'vue-chartjs';
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

// Mock workout data
const recentWorkouts = [
  {
    id: 1,
    name: 'Morning Run',
    date: '2026-02-26',
    distance: '8.2 km',
    duration: '42:15',
    calories: '452',
    route: [
      [37.7749, -122.4194],
      [37.7779, -122.4162],
      [37.7809, -122.4130],
      [37.7839, -122.4098],
    ],
  },
  {
    id: 2,
    name: 'Evening Ride',
    date: '2026-02-25',
    distance: '24.5 km',
    duration: '1:18:32',
    calories: '687',
    route: [
      [37.7649, -122.4294],
      [37.7679, -122.4262],
      [37.7709, -122.4230],
      [37.7739, -122.4198],
    ],
  },
  {
    id: 3,
    name: 'Trail Run',
    date: '2026-02-24',
    distance: '12.3 km',
    duration: '1:05:22',
    calories: '589',
    route: [
      [37.7549, -122.4394],
      [37.7579, -122.4362],
      [37.7609, -122.4330],
      [37.7639, -122.4298],
    ],
  },
  {
    id: 4,
    name: 'Recovery Ride',
    date: '2026-02-23',
    distance: '15.8 km',
    duration: '52:18',
    calories: '412',
    route: [
      [37.7449, -122.4494],
      [37.7479, -122.4462],
      [37.7509, -122.4430],
      [37.7539, -122.4398],
    ],
  },
  {
    id: 5,
    name: 'Tempo Run',
    date: '2026-02-22',
    distance: '10.5 km',
    duration: '48:35',
    calories: '521',
    route: [
      [37.7349, -122.4594],
      [37.7379, -122.4562],
      [37.7409, -122.4530],
      [37.7439, -122.4498],
    ],
  },
];

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
