<template>
  <MetricCard 
    title="Heart Rate" 
    value="147" 
    unit="avg bpm" 
    icon="heart-fill" 
    icon-color="text-danger"
  >
    <Line :data="chartData" :options="chartOptions" />
  </MetricCard>
</template>

<script setup lang="ts">
import { Line } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import MetricCard from './MetricCard.vue';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const heartRateData = [
  { time: 0, bpm: 95 },
  { time: 5, bpm: 110 },
  { time: 10, bpm: 125 },
  { time: 15, bpm: 135 },
  { time: 20, bpm: 142 },
  { time: 25, bpm: 148 },
  { time: 30, bpm: 152 },
  { time: 35, bpm: 155 },
  { time: 40, bpm: 158 },
  { time: 45, bpm: 156 },
  { time: 50, bpm: 153 },
  { time: 55, bpm: 145 },
  { time: 60, bpm: 138 },
  { time: 65, bpm: 130 },
  { time: 70, bpm: 115 },
];

const chartData = {
  labels: heartRateData.map(d => `${d.time} min`),
  datasets: [
    {
      label: 'Heart Rate',
      data: heartRateData.map(d => d.bpm),
      borderColor: '#dc3545',
      backgroundColor: 'rgba(220, 53, 69, 0.1)',
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
        label: (context: any) => `${context.parsed.y} bpm`,
      },
    },
  },
  scales: {
    x: {
      display: false,
    },
    y: {
      display: false,
      min: 80,
      max: 170,
    },
  },
};
</script>
