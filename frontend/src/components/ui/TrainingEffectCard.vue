<template>
  <MetricCard 
    :title="title" 
    :icon="icon" 
    :icon-color="iconColor"
    :value2="benefit"
    unit2=""
  >
    <div class="gauge-container">
      <Doughnut :data="chartData" :options="chartOptions" />
      <div class="gauge-center">
        <div class="gauge-value" :style="{ color: activeColour }">{{ score.toFixed(1) }}</div>
        <div class="gauge-label">TE</div>
      </div>
    </div>
  </MetricCard>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Doughnut } from 'vue-chartjs'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'
import MetricCard from './MetricCard.vue'

ChartJS.register(ArcElement, Tooltip, Legend)

const props = defineProps({
  title: String,
  score: { type: Number, default: 0 },
  benefit: { type: String, default: '' },
  icon: String,
  iconColor: String
})

// Colour mapping based on the 1-5 scale
const activeColour = computed(() => {
  const val = props.score;
  if (val < 1.0) return '#e9ecef'; // Grey
  if (val < 2.0) return '#add8e6'; // Light Blue
  if (val < 3.0) return '#00008b'; // Dark Blue
  if (val < 4.0) return '#28a745'; // Green
  if (val < 5.0) return '#ffc107'; // Yellow
  return '#fd7e14'; // Orange
})

const chartData = computed(() => ({
  datasets: [{
    data: [props.score, Math.max(0, 5 - props.score)],
    backgroundColor: [activeColour.value, '#f0f0f0'],
    borderWidth: 0,
    circumference: 180, // Half circle
    rotation: 270,      // Start at the bottom left
    cutout: '80%'
  }]
}))

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { display: false },
    tooltip: { enabled: false }
  }
}
</script>

<style scoped>
.gauge-container {
  position: relative;
  height: 120px;
  width: 100%;
  margin-top: 10px;
}
.gauge-center {
  position: absolute;
  bottom: 5px;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
}
.gauge-value {
  font-size: 24px;
  font-weight: bold;
  line-height: 1;
}
.gauge-label {
  font-size: 12px;
  color: #6c757d;
  text-transform: uppercase;
}
</style>
