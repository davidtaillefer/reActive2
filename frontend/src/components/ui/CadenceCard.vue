<template>
  <MetricCard
    title="Cadence"
    value="85"
    unit="avg rpm"
    icon="arrow-repeat"
    icon-color="text-purple"
  >
    <Bar :data="chartData" :options="chartOptions" />
  </MetricCard>
</template>

<script setup lang="ts">
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend } from 'chart.js';
import MetricCard from './MetricCard.vue';

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const cadenceData = [
  { time: 0, rpm: 75 },
  { time: 5, rpm: 78 },
  { time: 10, rpm: 82 },
  { time: 15, rpm: 85 },
  { time: 20, rpm: 88 },
  { time: 25, rpm: 90 },
  { time: 30, rpm: 92 },
  { time: 35, rpm: 91 },
  { time: 40, rpm: 89 },
  { time: 45, rpm: 87 },
  { time: 50, rpm: 85 },
  { time: 55, rpm: 83 },
  { time: 60, rpm: 81 },
  { time: 65, rpm: 78 },
  { time: 70, rpm: 72 },
];

const chartData = {
  labels: cadenceData.map(d => `${d.time} min`),
  datasets: [
    {
      label: 'Cadence',
      data: cadenceData.map(d => d.rpm),
      backgroundColor: '#a855f7',
    },
  ],
};

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: false,
    },
    tooltip: {
      callbacks: {
        label: (context: any) => `${context.parsed.y} rpm`,
      },
    },
  },
  scales: {
    x: {
      display: true,
    },
    y: {
      display: true,
      min: 60,
      max: 100,
    },
  },
};
</script>

<style scoped>
.text-purple {
  color: #a855f7;
}
</style>
