<template>
  <MetricCard 
    title="Time in HR Zones" 
    icon="i-bi-heart-pulse" 
    icon-color="text-danger"
    :value2="maxHr.toString()"
    unit2="Max BPM"
  >
    <Bar v-if="hasData" :data="chartData" :options="chartOptions" />
    <div v-else class="text-center p-5 text-muted">No HR Zone data available</div>
  </MetricCard>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
import MetricCard from './MetricCard.vue'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const props = defineProps({
  hrmData: { type: Object, required: true }
})

const zones = computed(() => props.hrmData?.Activities?.Zones || {})
const maxHr = computed(() => zones.value.max_heart_rate || 'N/A')
const hasData = computed(() => zones.value.time_in_hr_zone?.length > 0)

// Colour Mapping: Z1: Light Blue, Z2: Dark Blue, Z3: Green, Z4: Yellow, Z5: Orange, Z6+: Red
const hrColours = ['#add8e6', '#00008b', '#28a745', '#ffc107', '#fd7e14', '#dc3545'];

const chartData = computed(() => {
  const timeData = zones.value.time_in_hr_zone || []
  const boundaries = zones.value.hr_zone_high_boundary || []
  
  const labels = timeData.map((_, i) => {
    if (i === 0) return `Zone 1 (< ${boundaries[0]})`
    if (i >= boundaries.length) return `Zone ${i+1} (> ${boundaries[boundaries.length - 1]})`
    return `Zone ${i+1} (${boundaries[i-1]}-${boundaries[i]})`
  })

  return {
    labels,
    datasets: [{
      label: 'Minutes',
      data: timeData.map(s => (s / 60).toFixed(1)),
      backgroundColor: hrColours,
      borderRadius: 4
    }]
  }
})

const chartOptions = {
  indexAxis: 'y',
  responsive: true,
  maintainAspectRatio: false,
  plugins: { legend: { display: false } },
  scales: { x: { beginAtZero: true, title: { display: true, text: 'Minutes' } } }
}
</script>

