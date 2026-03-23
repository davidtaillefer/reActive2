<template>
  <BCard class="dashboard-card h-100 shadow-sm">
    <BCardBody>
      <div class="card-header-row">
        <div class="card-title">
          <IBiGraphDown />
          Weight
        </div>
      </div>
      <div class="card-top">
        <div class="donut-container">
          <Doughnut :data="donutData" :options="donutOptions" />
          <div class="donut-center">
            <div class="current-value">{{ currentWeight.toFixed(1) }}</div>
          </div>
        </div>
        <div class="card-visual"></div>
        <div class="card-metrics">
          <div class="d-flex align-items-center gap-2 flex-wrap">
            <div class="current-big">{{ currentWeight.toFixed(1) }} / {{ goalWeight }}<span class="unit"> kg</span></div>
            <div class="status-pill">Progress: -{{ progressKg }} kg</div>
          </div>
          <p class="summary-text">You've reached <strong>{{ progressPercent }}%</strong> of your goal!</p>
        </div>
      </div>
      <div class="card-bottom">
        <Line :data="lineData" :options="lineOptions" :key="weightHistory.length" />
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
const currentWeight = ref(78.5);
const goalWeight = ref(80.0); //TODO Replace these with values from user preferences
const startWeight = ref(86.0);
const weightHistory = ref([]);
const days = ref([]);
const records = ref([]);

// --- Logic Helpers ---
const initialWeight = computed(() => {
  const first = records.value.find(r => r.weight != null);
  return first ? first.weight / 1000 : 82.7;
});

const progressKg = computed(() => (startWeight.value - currentWeight.value).toFixed(1));
const progressPercent = computed(() => {
  const totalToLose = startWeight.value - goalWeight.value;
  const lost = startWeight.value - currentWeight.value;
  return totalToLose > 0 ? Math.round((lost / totalToLose) * 100) : 0;
});

const donutData = computed(() => ({
  datasets: [{
    data: [progressPercent.value, Math.max(0, 100 - progressPercent.value)],
    backgroundColor: ['#4FACFE', '#f0f0f0'],
    borderWidth: 0,
    cutout: '70%',
    borderRadius: 6
  }]
}));

const donutOptions = {
  responsive: true,
  maintainAspectRatio: false,
  rotation: -90,
  circumference: 180,
  plugins: {
    legend: { display: false },
    tooltip: { enabled: false }
  }
}

const lineData = computed(() => ({
  labels: days.value,
  datasets: [{
    label: 'Weight',
    data: weightHistory.value,
    borderColor: '#4FACFE',
    backgroundColor: 'rgba(79, 172, 254, 0.1)',
    borderWidth: 2,
    pointRadius: 0,
    pointHitRadius: 10,
    tension: 0.4,
    fill: true,
    spanGaps: true
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
  width: 120px;
  height: 80px;
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

.goal-weight {
  font-size: 14px;
  color: #888;
  margin-top: 0px;
}

.info-panel {
  flex: 1;
}

.current-big {
  font-size: 1.2rem;
  font-weight: 600;
}

.unit {
  font-size: 18px;
  color: #888;
}

.status-pill {
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  font-size: 0.8rem;
  margin: 6px 0;
  background: rgba(79, 172, 254, 0.1);
  color: #4FACFE;
  font-weight: 600;
}

.summary-text {
  margin-top: 10px;
  color: #666;
  font-size: 14px;
}

.ct-chart {
  height: 160px;
  width: 100%;
}
</style>
