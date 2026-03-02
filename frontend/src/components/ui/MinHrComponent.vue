<script setup>
import { onMounted, ref, computed } from 'vue';
import * as Chartist from 'chartist';
import 'chartist/dist/index.css';

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

// 1. reactive state for min heart rate data
const currentHr = ref(0);
const goalHr = ref(60);
const hrHistory = ref([]);
const days = ref([]);
const records = ref([]);

function formatDate(d) {
  const yyyy = d.getFullYear();
  const mm = String(d.getMonth() + 1).padStart(2, '0');
  const dd = String(d.getDate()).padStart(2, '0');
  return `${yyyy}-${mm}-${dd}`;
}

function makeApiUrl(start, end) {
  return apiBaseUrl + `health?start=${start}&end=${end}`;
}

const initialHr = computed(() => {
  for (const r of records.value) {
    if (r.resting_HR != null) {
      return r.resting_HR;
    }
  }
  return goalHr.value;
});

const progressHr = computed(() => (currentHr.value - goalHr.value).toFixed(1));
const progressPercent = computed(() => {
  const total = initialHr.value - goalHr.value;
  const lost = currentHr.value - goalHr.value;
  return total > 0 ? Math.round((lost / total) * 100) : 0;
});

const donutChart = ref(null);
const lineChart = ref(null);

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
    series: [hrHistory.value]
  }, {
    fullWidth: true,
    chartPadding: { right: 40 },
    low: 40,
    axisY: { onlyInteger: true, offset: 30 },
    lineSmooth: false
  });
}

async function loadData(start, end) {
  try {
    const res = await fetch(makeApiUrl(start, end));
    const json = await res.json();
    records.value = Array.isArray(json) ? json : [];

    const weights = [];
    const labels = [];
    let lastReal = null;

    records.value.forEach(r => {
      const d = new Date(r.date);
      labels.push(new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric', timeZone: 'UTC' }).format(d));
      const v = r.resting_HR_HR;
      if (v != null) {
        lastReal = v;
        weights.push(v);
      } else {
        weights.push(null);
      }
    });

    for (let i = 1; i < weights.length; i++) {
      if (weights[i] == null && weights[i - 1] != null) {
        weights[i] = weights[i - 1];
      }
    }

    if (lastReal != null) {
      currentHr.value = lastReal;
    }

    hrHistory.value = weights;
    days.value = labels;
  } catch (e) {
    console.error('failed hr load', e);
  } finally {
    renderCharts();
  }
}

onMounted(() => {
  const endDate = new Date();
  const startDate = new Date();
  startDate.setDate(endDate.getDate() - 6);
  loadData(formatDate(startDate), formatDate(endDate));
});
</script>

<template>
  <div class="hr-widget card">
    <div class="top-section">
      <div class="donut-container">
        <div ref="donutChart" class="ct-donut-chart"></div>
        <div class="donut-center">
          <div class="current-hr">{{ currentHr.toFixed(1) }}</div>
          <div class="goal-hr">Goal: {{ goalHr }}</div>
        </div>
      </div>

      <div class="info-panel">
        <div class="current-big">{{ currentHr.toFixed(1) }} <span class="unit">bpm</span></div>
        <div class="status-pill">Above goal: +{{ progressHr }} bpm</div>
        <p class="summary-text">You've reached <strong>{{ progressPercent }}%</strong> of your target difference!</p>
      </div>
    </div>

    <div class="bottom-section">
      <div ref="lineChart" class="ct-chart"></div>
    </div>
  </div>
</template>

<style scoped>
.hr-widget {
  /* Bootstrap card styles used instead of custom background and shadow */
  padding: 20px;
  width: 700px;
}
.top-section { display: flex; align-items: center; justify-content: space-between; }
.donut-container { position: relative; width: 162px; height: 162px; }
.donut-center { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; }
.current-hr { font-size: 30px; font-weight: 600; color: #ff4f4f; }
.goal-hr { font-size: 14px; color: #888; }
.info-panel { margin-left: 40px; }
.current-big { font-size: 34px; font-weight: bold; color: #ff4f4f; }
.unit { font-size: 18px; color: #888; }
.status-pill { margin-top: 12px; padding: 6px 16px; border-radius: 999px; display: inline-block; font-size: 12px; background: rgba(255,79,79,0.1); color: #ff4f4f; }
.summary-text { margin-top: 10px; color: #666; font-size: 14px; }
.bottom-section { margin-top: 40px; }
.ct-chart { height: 160px; }

:deep(.ct-series-a .ct-line) { stroke: #ff4f4f; stroke-width: 3px; }
:deep(.ct-series-a .ct-point) { stroke: #ff4f4f; stroke-width: 6px; }
:deep(.ct-series-a .ct-slice-donut) { stroke: #ff4f4f; }
:deep(.ct-series-b .ct-slice-donut) { stroke: #f0f0f0; }
</style>
