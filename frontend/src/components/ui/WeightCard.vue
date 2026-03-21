<template>
  <div class="weight-widget card shadow-sm">
    <div class="top-section">
      <div class="donut-container">
        <!-- Chart.js Doughnut -->
        <Doughnut :data="donutData" :options="donutOptions" />
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
      <!-- Chart.js Line -->
      <div class="ct-chart">
        <Line :data="lineData" :options="lineOptions" :key="weightHistory.length" />
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
const currentWeight = ref(78.5);
const goalWeight = ref(80.0);
const weightHistory = ref([]);
const days = ref([]);
const records = ref([]);

// --- Logic Helpers ---
const initialWeight = computed(() => {
  const first = records.value.find(r => r.weight != null);
  return first ? first.weight / 1000 : 82.7;
});

const progressKg = computed(() => (initialWeight.value - currentWeight.value).toFixed(1));
const progressPercent = computed(() => {
  const totalToLose = initialWeight.value - goalWeight.value;
  const lost = initialWeight.value - currentWeight.value;
  return totalToLose > 0 ? Math.round((lost / totalToLose) * 100) : 0;
});

// --- Chart Configurations ---
const donutData = computed(() => ({
  datasets: [{
    data: [progressPercent.value, Math.max(0, 100 - progressPercent.value)],
    backgroundColor: ['#4FACFE', '#f0f0f0'],
    borderWidth: 0,
    cutout: '85%' // Matches your donutWidth: 15
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
    label: 'Weight',
    data: weightHistory.value,
    borderColor: '#4FACFE',
    backgroundColor: 'rgba(79, 172, 254, 0.1)',
    borderWidth: 2,
    // ✅ Remove the dots
    pointRadius: 0,
    pointHitRadius: 10, // Keeps the tooltip functional when hovering near the line
    // ✅ Smooth the line (0.4 is usually the "sweet spot" for a natural curve)
    tension: 0.4,
    fill: true,
    spanGaps: true // Ensures the line stays connected over any missing data points
  }]
}));

const minWeightInRange = computed(() => {
  const validWeights = weightHistory.value.filter(w => w !== null);
  return validWeights.length ? Math.min(...validWeights) - 2 : 75;
});

const maxWeightInRange = computed(() => {
  const validWeights = weightHistory.value.filter(w => w !== null);
  return validWeights.length ? Math.max(...validWeights) + 2 : 85;
});


const lineOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: { legend: { display: false } },
  scales: {
    y: {
      // ✅ Use the dynamic bounds
      min: Math.floor(minWeightInRange.value),
      max: Math.ceil(maxWeightInRange.value),
      ticks: {
        stepSize: 2, // Smaller steps make the progress look more significant
        callback: (value) => `${value}kg` // Optional: add unit to axis
      },
      grid: {
        color: 'rgba(0, 0, 0, 0.05)' // Subtle horizontal lines
      }
    },
    x: {
      grid: { display: false },
      ticks: {
        autoSkip: true,
        maxTicksLimit: 6
      }
    }
  }
};




// WeightCard.vue - Inside <script setup>

async function loadData(start, end) {
  try {
    const res = await fetch(`${apiBaseUrl}health?start=${start}&end=${end}`);
    const json = await res.json();
    records.value = Array.isArray(json) ? json : [];

    const weights = [];
    const labels = [];
    let lastReal = null;

    records.value.forEach(r => {
      const d = new Date(r.date);
      // ✅ Change: Format to show only Month Name (e.g., "Jan")
      labels.push(new Intl.DateTimeFormat('en-US', { month: 'short', timeZone: 'UTC' }).format(d));

      const w = r.weight;
      if (w != null) {
        lastReal = w / 1000;
        weights.push(lastReal);
      } else {
        // Carry forward the last known weight to keep the line continuous
        weights.push(lastReal);
      }
    });

    if (lastReal != null) currentWeight.value = lastReal;
    weightHistory.value = weights;
    days.value = labels;
  } catch (err) {
    console.error('Failed to load weight data', err);
  }
}

onMounted(() => {
  const end = new Date();
  const start = new Date();
  // ✅ Change: Go back 6 months (approx 180 days)
  start.setDate(end.getDate() - 180);

  const format = (d) => d.toISOString().split('T')[0];
  loadData(format(start), format(end));
});



</script>

<style scoped>
.weight-widget {
  padding: 20px;
  width: 100%;
  max-width: 700px;
  border: none;
}

.top-section {
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.donut-container {
  position: relative;
  width: 162px;
  height: 162px;
  flex-shrink: 0;
}

.donut-center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  width: 100%;
}

.current-weight {
  font-size: 30px;
  font-weight: 600;
  line-height: 1;
}

.goal-weight {
  font-size: 14px;
  color: #888;
  margin-top: 4px;
}

.info-panel {
  margin-left: 40px;
}

.current-big {
  font-size: 34px;
  font-weight: bold;
}

.unit {
  font-size: 18px;
  color: #888;
}

.status-pill {
  margin-top: 12px;
  padding: 6px 16px;
  border-radius: 999px;
  display: inline-block;
  font-size: 12px;
  background: rgba(79, 172, 254, 0.1);
  color: #4FACFE;
  font-weight: 600;
}

.summary-text {
  margin-top: 10px;
  color: #666;
  font-size: 14px;
}

.bottom-section {
  margin-top: 40px;
}

.ct-chart {
  height: 160px;
  width: 100%;
}
</style>
