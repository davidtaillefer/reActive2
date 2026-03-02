<template>
  <MetricCard 
    title="Power" 
    value="198" 
    unit="avg watts" 
    icon="lightning-fill" 
    icon-color="text-warning"
  >
    <Line :data="chartData" :options="chartOptions" />
  </MetricCard>
</template>

<script setup lang="ts">
import { Line } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import MetricCard from './MetricCard.vue';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const powerData = [
  { time: 0, watts: 145 },
  { time: 5, watts: 165 },
  { time: 10, watts: 185 },
  { time: 15, watts: 205 },
  { time: 20, watts: 225 },
  { time: 25, watts: 235 },
  { time: 30, watts: 220 },
  { time: 35, watts: 210 },
  { time: 40, watts: 195 },
  { time: 45, watts: 185 },
  { time: 50, watts: 200 },
  { time: 55, watts: 215 },
  { time: 60, watts: 205 },
  { time: 65, watts: 180 },
  { time: 70, watts: 155 },
];

const chartData = {
  labels: powerData.map(d => `${d.time} min`),
  datasets: [
    {
      label: 'Power',
      data: powerData.map(d => d.watts),
      borderColor: '#ffc107',
      backgroundColor: 'rgba(255, 193, 7, 0.1)',
      tension: 0.4,
      pointRadius: 0,
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
        label: (context: any) => `${context.parsed.y} W`,
      },
    },
  },
  scales: {
    x: {
      display: false,
    },
    y: {
      display: false,
      min: 100,
      max: 250,
    },
  },
};
</script>
