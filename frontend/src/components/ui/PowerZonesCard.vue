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

const zones = computed(() => (props.hrmData?.power_zones?.zones || [])
  .slice()
  .sort((a, b) => a.zone - b.zone)
)
const ftpValue = computed(() => props.hrmData?.power_zones?.ftp || 'N/A')

const hasData = computed(() =>
  Array.isArray(zones.value) && zones.value.length > 0
)

// Colour Mapping: Z1-Z5 as requested, Z6: Dark Red, Z7: Purple
const pwrColours = ['#add8e6', '#00008b', '#28a745', '#ffc107', '#fd7e14', '#8b0000', '#800080'];

const chartData = computed(() => {
  if (!zones.value.length) return { labels: [], datasets: [] }
  //const timeData = zones.value.time_in_power_zone || []
  //const boundaries = zones.value.power_zone_high_boundary || []
  
  const labels = zones.value.map(z => {
    console.log('Zone data:', z)
    if (z.min == null && z.max != null) {
      return `Zone ${z.zone} (< ${Math.round(z.max)})`
    }
    if (z.max == null && z.min != null) {
      return `Zone ${z.zone} (> ${Math.round(z.min)})`
    }
    return `Zone ${z.zone} (${Math.round(z.min)}–${Math.round(z.max)} bpm)`
  })

  return {
    labels,
    datasets: [{
      label: 'Minutes',
      data: zones.value.map(z => Number((z.time / 60).toFixed(1))),
      backgroundColor: pwrColours.slice(0, zones.value.length),
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


