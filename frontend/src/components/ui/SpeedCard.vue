<template>
  <MetricCard 
    title="Speed" 
    value="20.4" 
    unit="avg km/h" 
    icon="speedometer" 
    icon-color="text-primary"
  >
    <Line :data="chartData" :options="chartOptions" />
  </MetricCard>
</template>

<script setup lang="ts">
import { Line } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, Filler } from 'chart.js';
import MetricCard from './MetricCard.vue';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, Filler);

const speedData = [
  { time: 0, speed: 15.2 },
  { time: 5, speed: 18.5 },
  { time: 10, speed: 21.3 },
  { time: 15, speed: 23.8 },
  { time: 20, speed: 25.2 },
  { time: 25, speed: 24.5 },
  { time: 30, speed: 22.1 },
  { time: 35, speed: 19.8 },
  { time: 40, speed: 18.5 },
  { time: 45, speed: 20.3 },
  { time: 50, speed: 22.7 },
  { time: 55, speed: 24.8 },
  { time: 60, speed: 23.5 },
  { time: 65, speed: 21.2 },
  { time: 70, speed: 17.5 },
];

const chartData = {
  labels: speedData.map(d => `${d.time} min`),
  datasets: [
    {
      label: 'Speed',
      data: speedData.map(d => d.speed),
      borderColor: '#0d6efd',
      backgroundColor: 'rgba(13, 110, 253, 0.3)',
      tension: 0.4,
      pointRadius: 0,
      fill: true,
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
        label: (context: any) => `${context.parsed.y} km/h`,
      },
    },
  },
  scales: {
    x: {
      display: false,
    },
    y: {
      display: false,
      min: 0,
      max: 30,
    },
  },
};
</script>
