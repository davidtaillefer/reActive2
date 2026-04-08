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

const zones = computed(() =>
  (props.hrmData?.hr_zones?.zones || [])
    .slice()
    .sort((a, b) => a.zone - b.zone)
)
const maxHr = computed(() => props.hrmData?.hr_zones?.max_hr || 'N/A')

const hasData = computed(() =>
  Array.isArray(zones.value) && zones.value.length > 0
)

// Colour Mapping: Z1: Light Blue, Z2: Dark Blue, Z3: Green, Z4: Yellow, Z5: Orange, Z6+: Red
const hrColours = ['#add8e6', '#00008b', '#28a745', '#ffc107', '#fd7e14', '#dc3545'];

const chartData = computed(() => {
  if (!zones.value.length) return { labels: [], datasets: [] }

  const labels = zones.value.map(z => {
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
      backgroundColor: hrColours.slice(0, zones.value.length),
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

