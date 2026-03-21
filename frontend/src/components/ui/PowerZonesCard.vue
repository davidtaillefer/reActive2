<template>
  <MetricCard 
    title="Time in Power Zones" 
    icon="i-bi-lightning-charge" 
    icon-color="text-warning"
    :value2="ftpValue.toString()"
    unit2="FTP Watts"
  >
    <Bar v-if="hasData" :data="chartData" :options="chartOptions" />
    <div v-else class="text-center p-5 text-muted">No Power Zone data available</div>
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
const ftpValue = computed(() => zones.value.functional_threshold_power || 'N/A')
const hasData = computed(() => zones.value.time_in_power_zone?.length > 0)

// Colour Mapping: Z1-Z5 as requested, Z6: Dark Red, Z7: Purple
const pwrColours = ['#add8e6', '#00008b', '#28a745', '#ffc107', '#fd7e14', '#8b0000', '#800080'];

const chartData = computed(() => {
  const timeData = zones.value.time_in_power_zone || []
  const boundaries = zones.value.power_zone_high_boundary || []
  
  const labels = timeData.map((_, i) => {
    if (i === 0) return `Z1 (Active Recovery)`
    if (i >= boundaries.length - 1) return `Z${i+1} (Neuromuscular)`
    return `Z${i+1} (${boundaries[i]}-${boundaries[i+1]} W)`
  })

  return {
    labels,
    datasets: [{
      label: 'Minutes',
      data: timeData.map(s => (s / 60).toFixed(1)),
      backgroundColor: pwrColours,
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


