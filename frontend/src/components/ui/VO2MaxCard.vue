<template>
    <BCard class="dashboard-card h-100 shadow-sm">
        <BCardBody>
            <div class="card-header-row">
                <div class="card-title">
                    <IBiWind />
                    VO2Max
                </div>
            </div>
            <div class="card-top">
                <div class="donut-container">
                    <Doughnut :data="donutData" :options="donutOptions" />
                    <div class="donut-center">
                        <div class="current-value">{{ currentVo2.toFixed(1) }}</div>
                    </div>
                </div>
                <div class="card-visual"></div>
                <div class="card-metrics">
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <div class="current-big">{{ currentVo2.toFixed(1) }} <span class="unit"> ml/kg/min</span></div>
                        <div class="status-pill">{{ fitnessLevel }}</div>
                    </div>
                </div>
                <div v-if="trend !== null" class="small mt-2">
                    <span :class="trend >= 0 ? 'text-success' : 'text-danger'">
                        {{ trend >= 0 ? '▲' : '▼' }} {{ Math.abs(trend).toFixed(1) }}
                    </span>
                    <span class="text-muted"> last 30 days</span>
                </div>
            </div>

            <div class="card-bottom">
                <Line v-if="history.length > 0" :data="chartData" :options="chartOptions" :key="history.length" />
                <div v-else class="text-center p-5 text-muted">No VO2 Max data found</div>
            </div>
        </BCardBody>
    </BCard>
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

const vo2Goal = 55

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

// Fitness label - TODO read in from database table vased on user's age
const fitnessLevel = computed(() => {
    const val = currentVo2.value
    if (val >= 48.9) return 'Superior fitness'
    if (val >= 43.4) return 'Excellent fitness'
    if (val >= 39.2) return 'Good fitness'
    if (val >= 35.6) return 'Fair fitness'
    return 'Fair fitness'
})

const vo2Colour = computed(() => {
    const val = currentVo2.value

    if (val >= 48.9) return '#800080' 
    if (val >= 43.4) return '#0d6efd'
    if (val >= 39.2) return '198754' 
    if (val >= 35.6) return '#ffc107' 
    return '#dc3545'
})

const donutData = computed(() => {
    const val = Math.min(currentVo2.value, vo2Goal)

    return {
        datasets: [
            {
                data: [val, vo2Goal - val],
                backgroundColor: [vo2Colour.value, '#e9ecef'],
                borderWidth: 0,
                cutout: '70%',
                borderRadius: 6 // 👈 rounded ends (nice touch)
            }
        ]
    }
})

const donutOptions = {
    responsive: true,
    maintainAspectRatio: false,
    rotation: -90,
    circumference: 180,
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
    start.setDate(end.getDate() - 26*7)

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
    width: 120px;
    height: 80px;
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
    margin-top: 0px;
}

.info-panel {
    flex: 1;
}

.current-big {
    font-size: 1.2rem;
    font-weight: 600;
}

.unit {
    font-size: 18px;
    color: #888;
}

.status-pill {
    display: inline-block;
    padding: 4px 10px;
    border-radius: 999px;
    font-size: 0.8rem;
    margin: 6px 0;
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
