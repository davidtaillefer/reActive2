<script setup>
import { onMounted, ref, computed } from 'vue';
import * as Chartist from 'chartist';
import 'chartist/dist/index.css';

// 1. Define reactive data
const currentWeight = ref(78.5);      // will be overwritten by API result
const goalWeight = ref(80.0);
const weightHistory = ref([]);         // filled from API
const days = ref([]);                 // labels from API dates
const records = ref([]);              // raw records from server

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

// helper to format a Date object as YYYY-MM-DD
function formatDate(d) {
  const yyyy = d.getFullYear();
  const mm = String(d.getMonth() + 1).padStart(2, '0');
  const dd = String(d.getDate()).padStart(2, '0');
  return `${yyyy}-${mm}-${dd}`;
}

// build URL given start/end strings
function makeApiUrl(start, end) {
  return apiBaseUrl + `health?start=${start}&end=${end}`;
}

// 2. Computed values for calculations
// base the calculations on the first recorded weight (fallback 82.7)
const initialWeight = computed(() => {
  // find first non-null weight in records
  for (const r of records.value) {
    if (r.weight != null) {
      return r.weight;
    }
  }
  return 82.7;
});

const progressKg = computed(() => (initialWeight.value - currentWeight.value).toFixed(1));
const progressPercent = computed(() => {
  const totalToLose = initialWeight.value - goalWeight.value;
  const lost = initialWeight.value - currentWeight.value;
  return totalToLose > 0 ? Math.round((lost / totalToLose) * 100) : 0;
});

// 3. Template Refs for Chartist
const donutChart = ref(null);
const lineChart = ref(null);

// helper that (re)builds both charts; call after data load or when values change
function renderCharts() {
  if (!donutChart.value || !lineChart.value) return;

  new Chartist.PieChart(donutChart.value, {
    series: [progressPercent.value, 100 - progressPercent.value]
  }, {
    donut: true,
    donutWidth: 15,
    showLabel: false
  });

  new Chartist.LineChart(lineChart.value, {
    labels: days.value,
    series: [weightHistory.value]
  }, {
    fullWidth: true,
    chartPadding: { right: 40 },
    low: 70,
    axisY: { onlyInteger: false, offset: 30 },
    lineSmooth: false // prevent interpolation across nulls
  });
}

// fetch data and populate state
async function loadData(start, end) {
  try {
    const res = await fetch(makeApiUrl(start, end));
    const json = await res.json();
    records.value = Array.isArray(json) ? json : [];

    // extract weights and labels, preserving nulls so the chart shows gaps
    const weights = [];
    const labels = [];
    let lastReal = null;

    records.value.forEach(r => {
      const d = new Date(r.date);
      labels.push(new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric', timeZone: 'UTC' }).format(d));

      const w = r.weight;
      if (w != null) {
        lastReal = w;
        weights.push(w / 1000); // convert to kg if needed
      } else {
        weights.push(null);
      }
    });

    // fill any null value that sits after a real weight
    for (let i = 1; i < weights.length; i++) {
      if (weights[i] == null && weights[i - 1] != null) {
        weights[i] = weights[i - 1];
      }
    }

    // set currentWeight to most recent real measurement
    if (lastReal != null) {
      currentWeight.value = lastReal / 1000;
    }

    weightHistory.value = weights;
    days.value = labels;
    if (weights.length) {
      currentWeight.value = weights[weights.length - 1];
    }
  } catch (err) {
    console.error('Failed to load health data', err);
  } finally {
    renderCharts();
  }
}

onMounted(() => {
  const endDate = new Date();
  const startDate = new Date();
  startDate.setDate(endDate.getDate() - 6); // previous six days plus today = 7-day span
  console.log('Loading data for', formatDate(startDate), 'to', formatDate(endDate));
  loadData(formatDate(startDate), formatDate(endDate));
});
</script>

<template>
  <div class="weight-widget card">
    <div class="top-section">
      <div class="donut-container">
        <!-- Use ref instead of ID for Vue best practices -->
        <div ref="donutChart" class="ct-donut-chart"></div>
        <div class="donut-center">
          <div class="current-weight">{{ currentWeight.toFixed(1) }}</div>
          <div class="goal-weight">Goal: {{ goalWeight }}</div>
        </div>
      </div>

      <div class="info-panel">
        <div class="current-big">{{ currentWeight.toFixed(1) }} <span class="unit">kg</span></div>
        <div class="status-pill">Progress: -{{ progressKg }} kg</div>
        <p class="summary-text">You've reached <strong>{{ progressPercent }}%</strong> of your goal!</p>
      </div>
    </div>

    <div class="bottom-section">
      <div ref="lineChart" class="ct-chart"></div>
    </div>
  </div>
</template>

<style scoped>
/* Scoped styles ensure they don't leak to other components */
.weight-widget {
  /* bootstrap card provides default white background, border-radius, and shadow */
  padding: 20px; /* retain internal padding */
  width: 700px;
}
.top-section { display: flex; align-items: center; justify-content: space-between; }
.donut-container { position: relative; width: 162px; height: 162px; /* 10% smaller diameter */ }
.donut-center { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; }
.current-weight { font-size: 30px; font-weight: 600; }
.goal-weight { font-size: 14px; color: #888; }
.info-panel { margin-left: 40px; }
.current-big { font-size: 34px; font-weight: bold; }
.unit { font-size: 18px; color: #888; }
.status-pill { margin-top: 12px; padding: 6px 16px; border-radius: 999px; display: inline-block; font-size: 12px; background: rgba(79,172,254,0.1); color: #4FACFE; }
.summary-text { margin-top: 10px; color: #666; font-size: 14px; }
.bottom-section { margin-top: 40px; }
.history-title { margin: 0 0 15px 0; color: #333; }
.ct-chart { height: 160px; /* approximately 10% shorter history chart */ }

/* Deep selectors to target Chartist generated SVG classes */
:deep(.ct-series-a .ct-line) { stroke: #4FACFE; stroke-width: 3px; }
:deep(.ct-series-a .ct-point) { stroke: #4FACFE; stroke-width: 6px; }
:deep(.ct-series-a .ct-slice-donut) { stroke: #4FACFE; }
:deep(.ct-series-b .ct-slice-donut) { stroke: #f0f0f0; }
</style>
