<template>
  <div class="hr-widget card shadow-sm">
    <div class="top-section">
      <div class="donut-container">
        <!-- Chart.js Doughnut -->
        <Doughnut :data="donutData" :options="donutOptions" />
        <div class="donut-center">
          <div class="current-hr">{{ currentHr.toFixed(0) }}</div>
          <div class="goal-hr">Goal: {{ goalHr }}</div>
        </div>
      </div>

      <div class="info-panel">
        <div class="current-big">{{ currentHr.toFixed(0) }} <span class="unit">bpm</span></div>
        <div class="status-pill">Above goal: +{{ progressHr }} bpm</div>
        <p class="summary-text">You've reached <strong>{{ progressPercent }}%</strong> of your target!</p>
      </div>
    </div>

    <div class="bottom-section">
      <!-- Chart.js Line -->
      <div class="ct-chart">
  <Line 
    :data="lineData" 
    :options="lineOptions" 
    :key="hrHistory.length" 
  />
</div>
    </div>
  </div>
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
const goalHr = ref(60);
const hrHistory = ref([]);
const days = ref([]);
const records = ref([]);

// --- Logic Helpers ---
const initialHr = computed(() => {
  const first = records.value.find(r => r.resting_HR != null);
  return first ? first.resting_HR : goalHr.value + 10;
});

const progressHr = computed(() => (currentHr.value - goalHr.value).toFixed(1));

const progressPercent = computed(() => {
  const totalDifference = initialHr.value - goalHr.value;
  const improvement = initialHr.value - currentHr.value;
  // If we've reached or passed the goal, return 100%
  if (currentHr.value <= goalHr.value) return 100;
  return totalDifference > 0 ? Math.round((improvement / totalDifference) * 100) : 0;
});

// --- Chart Configurations ---
const donutData = computed(() => ({
  datasets: [{
    data: [Math.max(0, progressPercent.value), Math.max(0, 100 - progressPercent.value)],
    backgroundColor: ['#ff4f4f', '#f0f0f0'],
    borderWidth: 0,
    cutout: '85%'
  }]
}));

const donutOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: { legend: { display: false }, tooltip: { enabled: false } }
};

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
.hr-widget { padding: 20px; width: 100%; max-width: 700px; border: none; }
.top-section { display: flex; align-items: center; justify-content: flex-start; }
.donut-container { position: relative; width: 162px; height: 162px; flex-shrink: 0; }
.donut-center { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; width: 100%; }
.current-hr { font-size: 30px; font-weight: 600; color: #ff4f4f; line-height: 1; }
.goal-hr { font-size: 14px; color: #888; margin-top: 4px; }
.info-panel { margin-left: 40px; }
.current-big { font-size: 34px; font-weight: bold; color: #ff4f4f; }
.unit { font-size: 18px; color: #888; }
.status-pill { margin-top: 12px; padding: 6px 16px; border-radius: 999px; display: inline-block; font-size: 12px; background: rgba(255,79,79,0.1); color: #ff4f4f; font-weight: 600; }
.summary-text { margin-top: 10px; color: #666; font-size: 14px; }
.bottom-section { margin-top: 40px; }
.ct-chart { height: 160px; width: 100%; }
</style>
