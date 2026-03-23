<template>
  <BCard class="h-100 shadow-sm">
    <BCardBody>
      <div class="card-header-row">
        <div class="card-title">
          <IBiHeart />
          Resting Heart Rate
        </div>
      </div>
      <div class="card-top">
        <div class="donut-container">
          <Doughnut :data="donutData" :options="donutOptions" />
          <div class="donut-center">
            <div class="current-value">{{ currentHr.toFixed(0) }}</div>
          </div>
        </div>
        <div class="card-visual"></div>
        <div class="card-metrics">
          <div class="d-flex align-items-center gap-2 flex-wrap">
            <div class="current-big">{{ currentHr.toFixed(0) }} <span class="unit">bpm</span></div>
            <div class="status-pill">{{ statusText }} bpm</div>
          </div>
          <p class="summary-text">{{ summaryText }}</p>
        </div>
      </div>

      <div class="card-bottom">
        <Line :data="lineData" :options="lineOptions" :key="hrHistory.length" />
      </div>
    </BCardBody>
  </BCard>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue';
import { Line, Doughnut } from 'vue-chartjs';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  ArcElement,
  Title,
  Tooltip,
  Legend
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, ArcElement, Title, Tooltip, Legend);

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL;
const currentHr = ref(0);
const minHrRange = ref(48);
const maxHrRange = ref(52);
const hrHistory = ref([]);
const days = ref([]);
const records = ref([]);

const statusText = computed(() => {
  if (currentHr.value >= maxHrRange.value) return 'Above Target'
  if (currentHr.value >= minHrRange.value) return 'On Target'
  return 'Below Target'
})

const summaryText = computed(() => {
  if (currentHr.value >= maxHrRange.value) return 'Your Body is Stressed'
  if (currentHr.value >= minHrRange.value) return 'Within Normal Range'
  return 'Below Normal Range'
})

const progressPercent = computed(() => {
  const min = minHrRange.value - 5
  const max = maxHrRange.value + 5
  const range = max - min

  if (range <= 0) return 0

  const raw = ((currentHr.value - min) / range) * 100

  return Math.max(0, Math.min(100, Math.round(raw)))
})

const donutData = computed(() => ({
  datasets: [{
    data: [
      progressPercent.value,
      100 - progressPercent.value
    ],
    backgroundColor: [
        currentHr.value >= maxHrRange.value ? '#800080' :
          currentHr.value >= minHrRange.value ? '#dc3545' :
            '#ffc107',
        '#e9ecef'
      ],
    borderWidth: 0,
    cutout: '70%',
    borderRadius: 6
  }]
}))

const donutOptions = {
  responsive: true,
  maintainAspectRatio: false,
  rotation: -90,
  circumference: 180,
  plugins: {
    legend: { display: false },
    tooltip: { enabled: false },
  }
}

const lineData = computed(() => ({
  labels: days.value,
  datasets: [{
    label: 'Resting HR',
    data: hrHistory.value,
    borderColor: '#ff4f4f',
    backgroundColor: 'rgba(255, 79, 79, 0.1)',
    borderWidth: 3,
    pointRadius: 4,
    pointBackgroundColor: '#ff4f4f',
    tension: 0, // Sharp lines
    spanGaps: false
  }]
}));

const lineOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: { legend: { display: false } },
  scales: {
    y: {
      min: 40,
      ticks: { stepSize: 5 }
    },
    x: { grid: { display: false } }
  }
};

async function loadData(start, end) {
  try {
    const res = await fetch(`${apiBaseUrl}health?start=${start}&end=${end}`);
    const json = await res.json();
    records.value = Array.isArray(json) ? json : [];

    const hrValues = [];
    const labels = [];
    let lastReal = null;

    records.value.forEach(r => {
      const d = new Date(r.date);
      labels.push(new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric', timeZone: 'UTC' }).format(d));

      // Note: Using the field name from your original loop 'resting_HR_HR' 
      // but provided a fallback for 'resting_HR' common in your logic
      const v = r.resting_HR_HR || r.resting_HR;
      if (v != null) {
        lastReal = v;
        hrValues.push(v);
      } else {
        hrValues.push(null);
      }
    });

    // Fill gaps (carry-forward)
    for (let i = 1; i < hrValues.length; i++) {
      if (hrValues[i] == null && hrValues[i - 1] != null) {
        hrValues[i] = hrValues[i - 1];
      }
    }

    if (lastReal != null) currentHr.value = lastReal;
    hrHistory.value = hrValues;
    days.value = labels;
  } catch (e) {
    console.error('Failed HR load', e);
  }
}

onMounted(() => {
  const end = new Date();
  const start = new Date();
  start.setDate(end.getDate() - 6);
  const format = (d) => d.toISOString().split('T')[0];
  loadData(format(start), format(end));
});
</script>

<style scoped>
.donut-container {
  position: relative;
  width: 120px;
  height: 80px;
}

.donut-container canvas {
  width: 100% !important;
  height: 100% !important;
}

.donut-center {
  position: absolute;
  left: 50%;
  top: 65%;
  transform: translate(-50%, -50%);
  display: flex;
  align-items: center;
  justify-content: center;
}

.current-value {
  font-size: 1.4rem;
  font-weight: 700;
  line-height: 1;
}

.info-panel {
  flex: 1;
}

.current-big {
  font-size: 1.2rem;
  font-weight: 600;
}

.status-pill {
  margin-top: 12px;
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  font-size: 0.8rem;
  margin: 6px 0;
  background: rgba(255, 79, 79, 0.1);
  color: #ff4f4f;
  font-weight: 600;
}

.summary-text {
  font-size: 0.85rem;
}
</style>
