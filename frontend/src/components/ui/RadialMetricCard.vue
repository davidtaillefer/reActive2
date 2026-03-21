<template>
  <div class="card shadow-sm h-100">
    <div class="card-body text-center">

      <div class="radial-container">
        <Doughnut :data="chartData" :options="chartOptions" />

        <div class="radial-center">
          <div class="value">{{ value.toFixed(1) }}</div>
          <div class="unit">{{ unit }}</div>
        </div>
      </div>

      <div class="mt-2 fw-semibold">{{ label }}</div>

      <div class="status-pill mt-1">{{ status }}</div>

      <div class="text-muted small mt-1">
        {{ percent.toFixed(0) }}% of goal
      </div>

      <slot /> <!-- allows extra content like trends -->

    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { Doughnut } from 'vue-chartjs'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'

ChartJS.register(ArcElement, Tooltip, Legend)

const props = defineProps({
  value: { type: Number, required: true },
  goal: { type: Number, required: true },
  label: { type: String, required: true },
  unit: { type: String, default: '' },
  status: { type: String, default: '' },
  colour: { type: String, default: '#0d6efd' } // note spelling
})

const percent = computed(() =>
  Math.min(100, (props.value / props.goal) * 100)
)

const chartData = computed(() => ({
  datasets: [
    {
      data: [props.value, Math.max(0, props.goal - props.value)],
      backgroundColor: [props.colour, '#e9ecef'],
      borderWidth: 0,
      cutout: '82%',
      borderRadius: 6
    }
  ]
}))

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  rotation: -90,
  circumference: 180,
  animation: {
    animateRotate: true,
    duration: 800
  },
  plugins: {
    legend: { display: false },
    tooltip: { enabled: false }
  }
}
</script>


<style scoped>
.radial-container {
  position: relative;
  width: 160px;
  height: 100px;
  margin: 0 auto;
}

.radial-center {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.value {
  font-size: 1.4rem;
  font-weight: 700;
}

.unit {
  font-size: 0.75rem;
  colour: #6c757d;
}

.status-pill {
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  background: #f1f3f5;
  font-size: 0.8rem;
}
</style>