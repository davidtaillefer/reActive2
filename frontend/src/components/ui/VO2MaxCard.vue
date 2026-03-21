<template>
    <div class="weight-widget card shadow-sm">
        <div class="top-section">
            <div class="donut-container">
                <!-- Chart.js Doughnut -->
                <Doughnut :data="donutData" :options="donutOptions" />
                <div class="donut-center">
                    <div class="current-weight">{{ currentVo2.toFixed(1) }}</div>
                </div>
            </div>

            <div class="info-panel">
                <div class="current-big">{{ currentVo2.toFixed(1) }} <span class="unit">ml/kg/min</span></div>
                <div class="status-pill">{{ fitnessLevel }}</div>
                <p class="summary-text">
                    You've reached <strong>{{ vo2Percent.toFixed(0) }}%</strong> of your goal
                </p>
            </div>
            <div v-if="trend !== null" class="small mt-2">
                <span :class="trend >= 0 ? 'text-success' : 'text-danger'">
                    {{ trend >= 0 ? '▲' : '▼' }} {{ Math.abs(trend).toFixed(1) }}
                </span>
                <span class="text-muted"> last 30 days</span>
            </div>
        </div>

        <div class="bottom-section">
            <!-- Chart.js Line -->
            <div style="height: 180px">
                <Line v-if="history.length > 0" :data="chartData" :options="chartOptions" :key="history.length" />
                <div v-else class="text-center p-5 text-muted">No VO2 Max data found</div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { Line, Doughnut } from 'vue-chartjs'
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    ArcElement,
    Title,
    Tooltip,
    Legend
} from 'chart.js'
import { useStats } from '@/composables/useStats'

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, ArcElement, Title, Tooltip, Legend)

const vo2Goal = computed(() => {
    const base = currentVo2.value || 40

    // Simple progressive goal: +10%
    return Math.round(base * 1.1)
})

const vo2Percent = computed(() => {
    return Math.min(100, (currentVo2.value / vo2Goal) * 100)
})
// Use composable
const { stats, loading, error, fetchStats } = useStats()

// Local derived state
const history = computed(() => {
    if (!stats.value) return []

    return stats.value.map(r => {
        return r.cycling_vo2_max || r.running_vo2_max || null
    })
})

const days = computed(() => {
    if (!stats.value) return []

    return stats.value.map(r => {
        const d = new Date(r.date)
        return new Intl.DateTimeFormat('en-CA', {
            month: 'short',
            day: 'numeric'
        }).format(d)
    })
})

const trend = computed(() => {
    const vals = history.value.filter(v => v !== null)
    if (vals.length < 2) return null

    const diff = vals[vals.length - 1] - vals[0]
    return diff
})

const currentVo2 = computed(() => {
    const values = history.value
    const lastValid = [...values].reverse().find(v => v !== null)
    return lastValid || 0
})

// Fitness label
const fitnessLevel = computed(() => {
    const val = currentVo2.value
    if (val >= 52) return 'Superior fitness level'
    if (val >= 48) return 'Excellent fitness level'
    if (val >= 44) return 'Good fitness level'
    return 'Fair fitness level'
})

const vo2Colour = computed(() => {
    const val = currentVo2.value

    if (val >= 52) return '#198754' // green (elite)
    if (val >= 48) return '#20c997' // teal
    if (val >= 44) return '#0d6efd' // blue
    if (val >= 40) return '#ffc107' // yellow
    return '#dc3545' // red
})

const donutData = computed(() => {
    const val = Math.min(currentVo2.value, vo2Goal)

    return {
        datasets: [
            {
                data: [val, vo2Goal - val],
                backgroundColor: [vo2Colour.value, '#e9ecef'],
                borderWidth: 0,
                cutout: '82%',
                borderRadius: 6 // 👈 rounded ends (nice touch)
            }
        ]
    }
})

const donutOptions = {
    responsive: true,
    maintainAspectRatio: false,
    rotation: -90, // start at top
    circumference: 180, // 👈 semi-circle (Garmin style)
    plugins: {
        legend: { display: false },
        tooltip: { enabled: false }
    }
}

// Chart
const chartData = computed(() => ({
    labels: days.value,
    datasets: [
        {
            label: 'VO2 Max',
            data: history.value,
            borderColor: '#0d6efd',
            backgroundColor: 'rgba(13, 110, 253, 0.1)',
            tension: 0.0,
            pointRadius: 0,
            fill: true,
            spanGaps: true
        }
    ]
}))

const chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: { legend: { display: false } },
    scales: {
        y: {
            min: 35,
            ticks: { stepSize: 2 }
        },
        x: {
            grid: { display: false },
            ticks: { autoSkip: true, maxTicksLimit: 5 }
        }
    }
}

// Fetch last 30 days
onMounted(() => {
    const end = new Date()
    const start = new Date()
    start.setDate(end.getDate() - 30)

    fetchStats({
        startDate: start,
        endDate: end
    })
})
</script>

<style scoped>
.weight-widget {
    padding: 20px;
    width: 100%;
    max-width: 700px;
    border: none;
}

.top-section {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.donut-container {
    position: relative;
    width: 160px;
    height: 100px;
    /* smaller for semi-circle */
    margin: 0 auto;
}

.donut-center {
    position: absolute;
    inset: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    pointer-events: none;
}

.current-weight {
    font-size: 1.6rem;
    font-weight: 700;
}

.status-pill {
    display: inline-block;
    padding: 4px 10px;
    border-radius: 999px;
    font-size: 0.8rem;
    font-weight: 500;
    background: #f1f3f5;
    margin-top: 6px;
}

.goal-weight {
    font-size: 14px;
    color: #888;
    margin-top: 4px;
}

.info-panel {
    margin-left: 40px;
}

.current-big {
    font-size: 34px;
    font-weight: bold;
}

.unit {
    font-size: 18px;
    color: #888;
}

.status-pill {
    margin-top: 12px;
    padding: 6px 16px;
    border-radius: 999px;
    display: inline-block;
    font-size: 12px;
    background: rgba(79, 172, 254, 0.1);
    color: #4FACFE;
    font-weight: 600;
}

.summary-text {
    margin-top: 10px;
    color: #666;
    font-size: 14px;
}

.bottom-section {
    margin-top: 40px;
}

.ct-chart {
    height: 160px;
    width: 100%;
}
</style>
