<template>
  <BCard class="h-100 shadow-sm">
    <BCardBody>
      <div class="card-header-row">
        <div class="card-title">
          <IBiFire />
          Steps
        </div>
      </div>
      <div class="card-top">
        <div class="donut-container">
          <Doughnut v-if="today.steps > 0" :data="donutData" :options="donutOptions" />
          <div class="donut-center">
            <div class="current-value">{{ today.steps }}</div>
          </div>
        </div>
      <div class="card-visual"></div>
      <div class="card-metrics">
          <div class="d-flex align-items-center gap-2 flex-wrap">
            <div class="current-big">{{ today.steps }} / {{ GOAL_STEPS }}</div>
            <div class="status-pill" :class="statusClass">{{ statusText }}</div>
          </div>
          <div class="d-flex align-items-center gap-2 flex-wrap mt-1">
            <div class="summary-text text-muted">
              {{ percent.toFixed(0) }}% of daily goal
            </div>
            <div v-if="streak > 0" class="text-success small">
              🔥 {{ streak }} day streak
            </div>
          </div>
        </div>
      </div>
    <div class="card-bottom">
<Bar :data="stepsData" :options="barChartOptions" :plugins="[goalLinePlugin]" />
        </div>
    

    </BCardBody>
  </BCard>
</template>

<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { Bar, Doughnut } from 'vue-chartjs'
import 'chartjs-adapter-date-fns'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  ArcElement,
  Tooltip,
  Legend, 
  TimeScale
} from 'chart.js'
import { useStats } from '@/composables/useStats'

ChartJS.register(CategoryScale, LinearScale, BarElement, ArcElement, Tooltip, Legend, TimeScale)

const { stats, loading, error, fetchStats } = useStats()

const GOAL_STEPS = 7500
const DAYS = 26*31

onMounted(() => {
  const end = new Date()
  const start = new Date()
  start.setDate(end.getDate() - DAYS * 7)

  fetchStats({ startDate: start, endDate: end })
})

const dailyData = computed(() => {
  if (!stats.value) return []

  return stats.value
    .map(r => ({
      date: new Date(r.date),
      steps: r.total_steps || 0
    }))
    .sort((a, b) => a.date.getTime() - b.date.getTime())
    .slice(-DAYS)
})

const today = computed(() => {
  return dailyData.value.at(-1) || { steps: 0 }
})

/**
 * % progress
 */
const percent = computed(() =>
  Math.min(100, (today.value.steps / GOAL_STEPS) * 100)
)

const statusText = computed(() => {
  if (percent.value >= 100) return 'Goal Achieved'
  if (percent.value >= 75) return 'On Track'
  return 'Needs Improvement'
})

const statusClass = computed(() => {
  if (percent.value >= 100) return 'bg-success text-white'
  if (percent.value >= 75) return 'bg-warning text-dark'
  return 'bg-danger text-white'
})

const streak = computed(() => {
  let count = 0

  for (let i = dailyData.value.length - 1; i >= 0; i--) {
    if (dailyData.value[i].steps >= GOAL_STEPS) count++
    else break
  }

  return count
})

const donutData = computed(() => ({
  datasets: [
    {
      data: [
        Math.min(today.value.steps, GOAL_STEPS),
        Math.max(0, GOAL_STEPS - today.value.steps)
      ],
      backgroundColor: [
        percent.value >= 100 ? '#198754' :
        percent.value >= 75 ? '#ffc107' :
        '#dc3545',
        '#e9ecef'
      ],
      borderWidth: 0,
      cutout: '70%',
      borderRadius: 6
    }
  ]
}))

const donutOptions = {
  responsive: true,
  maintainAspectRatio: false,
  rotation: -90,
  circumference: 180,
  plugins: {
    legend: { display: false },
    tooltip: { enabled: false },
  }
}

const stepsData = computed(() => ({
  datasets: [
    {
      label: 'Steps',
      data: dailyData.value.map(d => ({
        x: d.date,
        y: d.steps
      })),

      backgroundColor: dailyData.value.map(d => {
        if (d.steps >= GOAL_STEPS) return '#198754'
        if (d.steps >= GOAL_STEPS * 0.75) return '#ffc107'
        return '#0d6efd'
      }),

      borderRadius: 6
    }
  ]
}))

const goalLinePlugin = {
  id: 'goalLine',
  afterDraw(chart: any) {
    const { ctx, chartArea, scales } = chart
    if (!chartArea) return

    const y = scales.y.getPixelForValue(GOAL_STEPS)

    ctx.save()
    ctx.strokeStyle = '#198754'
    ctx.setLineDash([5, 5])
    ctx.beginPath()
    ctx.moveTo(chartArea.left, y)
    ctx.lineTo(chartArea.right, y)
    ctx.stroke()
    ctx.restore()
  }
}

const barChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { display: false }
  },
  scales: {
    x: {
      type: 'time',
      bounds: 'data',
      min: dailyData.value[0]?.date, 
      max: dailyData.value.at(-1)?.date,

      time: {
        unit: 'month',
        tooltipFormat: 'MMM d',
        displayFormats: {
          month: 'MMM'
        }
      },

      grid: { display: false }
    },
    y: {
      beginAtZero: true
    }
  }
}

hoverBackgroundColor: dailyData.value.map(d => {
  if (d.steps >= GOAL_STEPS) return '#157347'
  if (d.steps >= GOAL_STEPS * 0.75) return '#e0a800'
  return '#0b5ed7'
})
</script>

<style scoped>

.donut-container {
  position: relative;
  width: 120px;
  height: 80px;
}

.donut-container canvas {
  width: 100% !important;
  height: 100% !important;
}

.donut-center {
  position: absolute;
  left: 50%;
  top: 65%;
  transform: translate(-50%, -50%);
  display: flex;
  align-items: center;
  justify-content: center;
}

.current-value {
  font-size: 1.4rem;
  font-weight: 700;
  line-height: 1;
}

.info-panel {
  flex: 1;
}

.current-big {
  font-size: 1.2rem;
  font-weight: 600;
}

.status-pill {
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  font-size: 0.8rem;
  margin: 6px 0;
}

.summary-text {
  font-size: 0.85rem;
}
</style>