<template>
  <!-- Force values to strings to fix the Prop Type warning -->
  <MetricCard 
    title="Acute Training Load" 
    :value1="currentATL.toString()" 
    unit1="Current ATL" 
    :value2="peakATL.toString()"
    unit2="Peak ATL"
    icon="i-bi-graph-up-arrow" 
    icon-color="text-primary"
  >
    <!-- Use a key to force chart refresh when data arrives -->
    <Line 
      v-if="chartData.datasets[0].data.length > 0"
      :data="chartData" 
      :options="chartOptions" 
      :key="chartData.datasets[0].data.length"
    />
  </MetricCard>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Line } from 'vue-chartjs'
import { 
  Chart as ChartJS, 
  CategoryScale, 
  LinearScale, 
  PointElement, 
  LineElement, 
  Title, 
  Tooltip, 
  Legend, 
  Filler 
} from 'chart.js'
import MetricCard from './MetricCard.vue'

// REGISTER ChartJS modules
ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, Filler)

const props = defineProps({
  activities: { type: Array, required: true },
  month: { type: Date, required: true }
})

const daysInMonth = computed(() => {
  const year = props.month.getFullYear()
  const month = props.month.getMonth()
  const days = []
  const date = new Date(year, month, 1)
  while (date.getMonth() === month) {
    days.push(date.toISOString().split('T')[0])
    date.setDate(date.getDate() + 1)
  }
  return days
})

const atlData = computed(() => {
  const dailyLoads: Record<string, number> = {};
  
  props.activities.forEach((act: any) => {
  // Use the pre-normalized date from our new parent logic
  const d = act.normalizedDate; 
  dailyLoads[d] = (dailyLoads[d] || 0) + (parseFloat(act.training_load) || 0);
});S

  // Start 30 days before current month
  const startDate = new Date(props.month.getFullYear(), props.month.getMonth(), 1);
  startDate.setDate(startDate.getDate() - 30);
  
  let rollingATL = 0;
  const history: Record<string, number> = {};
  
  // Calculate for 30 buffer days + days in current month
  const daysInView = new Date(props.month.getFullYear(), props.month.getMonth() + 1, 0).getDate();
  const totalDays = 30 + daysInView;

  const tempDate = new Date(startDate);
  for (let i = 0; i < totalDays; i++) {
    const dStr = tempDate.toISOString().split('T')[0]; // YYYY-MM-DD
    const load = dailyLoads[dStr] || 0;
    
    rollingATL = (load * 1.025) + (0.836 * rollingATL);
    history[dStr] = Number(rollingATL.toFixed(1));
    
    tempDate.setDate(tempDate.getDate() + 1);
  }
  return history;
});

const chartPoints = computed(() => daysInMonth.value.map(day => atlData.value[day] || 0))
const currentATL = computed(() => chartPoints.value[chartPoints.value.length - 1] || 0)
const peakATL = computed(() => Math.max(...chartPoints.value, 0))

const chartData = computed(() => ({
  labels: daysInMonth.value.map(d => d.split('-')[2]), // Show just the day DD
  datasets: [{
    label: 'ATL',
    data: chartPoints.value,
    borderColor: '#0d6efd',
    backgroundColor: 'rgba(13, 110, 253, 0.1)',
    fill: true,
    tension: 0.3,
    pointRadius: 0
  }]
}))

// DEFINE chartOptions so the template can see it
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: { legend: { display: false } },
  scales: {
    y: { beginAtZero: true }
  }
}
</script>
