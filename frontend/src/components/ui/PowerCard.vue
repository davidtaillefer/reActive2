<template>
  <MetricCard 
    title="Power" 
    :value1="value1" 
    unit1="watts" 
    :value2="value2"
    unit2="max watts"
    icon="heart-fill" 
    icon-color="text-danger"
  >
    <Line :data="chartData" :options="chartOptions" />
  </MetricCard>
</template>

<script setup lang="ts">
import { ref, computed} from 'vue'
import { Line } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, Filler } from 'chart.js';
import MetricCard from './MetricCard.vue';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, Filler);

const props = defineProps({
  activity: {
    type: Object,
    required: true,
  },
  hrmData: {  type: Array, required: true},
});
const value1 = ref(props.activity?.avgpower?.toFixed(0) || 'N/A');
const value2 = ref(props.hrmData?.[0]?.Activities?.max_power?.toFixed(0)  || 'N/A');

const chartData = computed(() => {
  const trackData = props.hrmData?.[0]?.Activities?.Track 
    ? Object.values(props.hrmData[0].Activities.Track) 
    : [];

  const startTime = new Date(props.activity?.date).getTime();
  return {
    labels: trackData.map(d => {
      const currentTime = new Date(d.timestamp).getTime();
      return (currentTime - startTime) / 60000; // Convert ms to minutes
    }),
    datasets: [
      {
        label: 'Power',
        data: trackData.map(d => d.power || null),
        borderColor: 'purple',
        backgroundColor: 'rgba(128, 0, 128, 0.1)',
        tension: 0.4,
        pointRadius: 0,
        fill: true,
      },
    ],
  };
});

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
      type: 'linear', // Treat labels as numbers
      beginAtZero: true,
      ticks: {
        stepSize: 10, // Force intervals of 10
        callback: (value) => `${value}` // Append "min" to the label
      },
      title: {
        display: true,
        text: 'Duration (Minutes)'
      }
    },
    y: {
      display: true,
    },
  },
};

</script>