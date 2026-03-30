<template>
  <MetricCard 
    title="Heart Rate" 
    :value1="value1" 
    unit1="avg bpm" 
    :value2="value2"
    unit2="max bpm"
    icon="i-bi-heart-fill" 
    icon-color="text-danger"
  >
    <Line :data="chartData" :options="chartOptions" ref="chartRef" />
  </MetricCard>
</template>

<script setup lang="ts">
import { ref, computed, toRaw, watch } from 'vue'
import { Line } from 'vue-chartjs';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import MetricCard from './MetricCard.vue';


ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

// Vertical hover line plugin: draws a dashed vertical line at a given pixel x
const verticalLinePlugin = {
  id: 'verticalLine',
  afterDraw: (chart, args, options) => {
    if (!options || !options.show || typeof options.x !== 'number') return
    const ctx = chart.ctx
    ctx.save()
    ctx.strokeStyle = options.color || 'rgba(0,0,0,0.35)'
    ctx.setLineDash(options.dash || [4, 4])
    ctx.lineWidth = options.lineWidth || 1
    const top = chart.chartArea.top
    const bottom = chart.chartArea.bottom
    ctx.beginPath()
    ctx.moveTo(options.x, top)
    ctx.lineTo(options.x, bottom)
    ctx.stroke()
    ctx.restore()
  }
}
ChartJS.register(verticalLinePlugin)

const props = defineProps({
  activity: {
    type: Object,
    required: true,
  },
  hrmData: {type: Array, required: true},
  hoveredPoint: { type: Object, default: null }
});

const emit = defineEmits(['point-hover','point-leave'])

import { findNearestPoint } from '@/composables/useHoverMatch'

const chartRef = ref(null)

const value1 = ref(
  props.activity?.heartrate != null
    ? Number(props.activity.heartrate).toFixed(0)
    : 'N/A'
);
const value2 = ref(props.hrmData?.[0]?.Activities?.max_heart_rate?.toFixed(0)  || 'N/A');

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
        label: 'Heart Rate',
        data: trackData.map(d => d.heart_rate),
        borderColor: '#dc3545',
        backgroundColor: 'rgba(220, 53, 69, 0.1)',
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
  onHover: (evt, elements) => {
    // elements is an array of active points
    try{
      if (elements && elements.length){
        const el = elements[0]
        const idx = el.index
        const trackData = props.hrmData?.[0]?.Activities?.Track ? Object.values(props.hrmData[0].Activities.Track) : []
        const ts = trackData[idx]?.timestamp || null
        emit('point-hover', { index: idx, timestamp: ts, source: 'HeartRateCard' })
      } else {
        emit('point-leave')
      }
    }catch(e){/* ignore */}
  },
  plugins: {
    legend: {
      display: false,
    },
    // Vertical hover line plugin options (toggled by watcher)
    verticalLine: {
      show: false,
      x: undefined,
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
      min: 80,
    },
  },
};

// Watch parent's hoveredPoint and move chart tooltip / highlight
watch(() => props.hoveredPoint, (hp) => {
  const chartComp = chartRef
  let chart = null
  if (chartComp?.value) {
    chart = typeof chartComp.value.getChart === 'function' ? chartComp.value.getChart() : (chartComp.value.chart || chartComp.value.chartInstance || null)
  }
  if (!chart) return
  if (!hp){
    try{
      chart.setActiveElements([])
      chart.tooltip.setActiveElements([], { x:0, y:0 })
      if (chart.options && chart.options.plugins && chart.options.plugins.verticalLine) {
        chart.options.plugins.verticalLine.show = false
      }
      chart.update()
    }catch(e){}
    return
  }

  const trackData = props.hrmData?.[0]?.Activities?.Track ? Object.values(props.hrmData[0].Activities.Track) : []
  const match = findNearestPoint(trackData, hp, { toleranceMs: 1000 })
  if (match){
    const idx = match.index
    try{
      chart.setActiveElements([{ datasetIndex: 0, index: idx }])
      chart.tooltip.setActiveElements([{ datasetIndex: 0, index: idx }], { x: 0, y: 0 })
      // compute pixel x from the chart element and enable vertical line
      const meta = chart.getDatasetMeta(0)
      const el = meta?.data?.[idx]
      const px = el?.x
      if (chart.options && chart.options.plugins) {
        chart.options.plugins.verticalLine = Object.assign({}, chart.options.plugins.verticalLine || {}, { show: true, x: px })
      }
      try{ chart.update('none') }catch(e){ try{ chart.update() }catch(_){} }
    }catch(e){/* ignore if Chart API differs */}
  } else {
    try{ chart.setActiveElements([]); chart.tooltip.setActiveElements([], { x:0, y:0 }); chart.update(); }catch(e){}
  
  }
}, { immediate: false })

</script>
