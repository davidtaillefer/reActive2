<template>
  <MetricCard 
    title="Weekly Training" 
    icon="i-bi-bar-chart-steps" 
    icon-color="text-success"
  >
    <!-- Use a key to force re-render when data length changes -->
    <Bar 
      v-if="chartData.datasets.length > 0" 
      :data="chartData" 
      :options="chartOptions" 
      :key="chartData.datasets.length"
    />
    <div v-else class="text-center p-5 text-muted">
      No training data for this month.
    </div>
  </MetricCard>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
import MetricCard from './MetricCard.vue'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const props = defineProps({
  activities: { type: Array, required: true },
  month: { type: Date, required: true },
  sportNames: { type: Object, default: () => ({}) },
  sportColours: { type: Object, default: () => ({}) }
})

// Helper: Get 'MMM DD' of the Monday of the week
const getWeekLabel = (date: Date) => {
  const d = new Date(date);
  const day = d.getDay(); // 0 is Sunday, 1 is Monday...
  // Subtract the current day number to get back to the most recent Sunday
  const diff = d.getDate() - day; 
  const sunday = new Date(d.setDate(diff));
  return sunday.toLocaleDateString('en-CA', { month: 'short', day: 'numeric' });
}

const chartData = computed(() => {
  const currentMonth = props.month.getMonth();
  const currentYear = props.month.getFullYear();
  
  // 1. Filter: Only activities belonging to the visible month
  const monthlyActivities = props.activities.filter((act: any) => {
    const d = new Date(act.date);
    return d.getMonth() === currentMonth && d.getFullYear() === currentYear;
  });

  const weeklyData: Record<string, Record<number, number>> = {};
  const uniqueSports = new Set<number>();

  // 2. Group by Week (Monday start) and Sport ID
  monthlyActivities.forEach((act: any) => {
    const label = getWeekLabel(new Date(act.date));
    const sportId = act.sport;
    const hours = (act.duration || 0) / 3600;

    if (!weeklyData[label]) weeklyData[label] = {};
    weeklyData[label][sportId] = (weeklyData[label][sportId] || 0) + hours;
    uniqueSports.add(sportId);
  });

  // 3. Sort labels chronologically
  const sortedLabels = Object.keys(weeklyData).sort((a, b) => 
    new Date(a + ' ' + currentYear).getTime() - new Date(b + ' ' + currentYear).getTime()
  );

  // 4. Map to Datasets using sportColours
  const datasets = Array.from(uniqueSports).map(sportId => ({
    label: props.sportNames[sportId] || `Sport ${sportId}`,
    data: sortedLabels.map(label => weeklyData[label][sportId] || 0),
    backgroundColor: props.sportColours[sportId] || '#cccccc', // ✅ Use proper spelling
    stack: 'Stack 0',
  }));

  return { labels: sortedLabels, datasets };
})

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  scales: {
    x: { stacked: true },
    y: { 
      stacked: true, 
      beginAtZero: true,
      title: { display: true, text: 'Hours' }
    }
  }
}
</script>
