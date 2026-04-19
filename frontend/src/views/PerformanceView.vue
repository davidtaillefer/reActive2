<template>
    <BContainer fluid class="p-3">
        <BRow class="g-3">

            <!-- LEFT: Muscle Fatigue Map -->
            <BCol cols="12" lg="8" class="d-flex flex-column">
                <BCard class="shadow-sm flex-grow-1">
                    <BCardBody class="d-flex flex-column">
                        <h5 class="mb-3">Muscle Fatigue</h5>

                        <MuscleMap v-if="hasFatigue" :muscleData="{ load: performance.fatigue }" mode="fatigue" class="flex-grow-1" />

                        <div v-else class="text-center text-muted">
                            No muscle fatigue data available
                        </div>
                    </BCardBody>
                </BCard>
            </BCol>

            <!-- RIGHT: Performance Metrics -->
            <BCol cols="12" lg="4" class="d-flex flex-column gap-3">

                <!-- Recovery -->
                <BCard class="shadow-sm text-center">
                    <BCardBody>
                        <h6>Recovery</h6>

                        <h2 :class="recoveryColour">
                            {{ recoveryPercent }}%
                        </h2>

                        <div class="small text-muted">
                            Cardio: {{ cardioPercent }}% |
                            Strength: {{ strengthPercent }}%
                        </div>
                    </BCardBody>
                </BCard>

                <!-- Injury Risk -->
                <BCard class="shadow-sm text-center">
                    <BCardBody>
                        <h6>Injury Risk</h6>
                        <h3 :class="riskColour">{{ riskLabel }}</h3>
                    </BCardBody>
                </BCard>

                <!-- Training Load -->
                <BCard class="shadow-sm">
                    <BCardBody>
                        <h6>Training Load</h6>
                        <div>ATL: {{ performance.atl }}</div>
                        <div>CTL: {{ performance.ctl }}</div>
                        <div>Form: {{ performance.form }}</div>
                    </BCardBody>
                </BCard>

            </BCol>

        </BRow>
    </BContainer>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { BContainer, BRow, BCol, BCard, BCardBody } from 'bootstrap-vue-next'
import MuscleMap from '@/components/ui/MuscleMap.vue'

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

const performance = ref({
    fatigue: {},
    atl: 0,
    ctl: 0,
    form: 0,
    injury_risk: 0,
    recovery: {
        cardio: 0,
        strength: 0,
        overall: 0
    }
})

// Load data
onMounted(async () => {
    try {
        const res = await fetch(`${apiBaseUrl}performance`)
        if (!res.ok) throw new Error('Failed to fetch performance')

        const data = await res.json()
        performance.value = data

        console.log("Performance data:", performance.value)
    } catch (err) {
        console.error('Error loading performance data:', err)
    }
})

const hasFatigue = computed(() =>
    performance.value.fatigue &&
    Object.keys(performance.value.fatigue).length > 0
)

const recoveryPercent = computed(() =>
    Math.round((performance.value.recovery.overall || 0) * 100)
)

const cardioPercent = computed(() =>
    Math.round((performance.value.recovery.cardio || 0) * 100)
)

const strengthPercent = computed(() =>
    Math.round((performance.value.recovery.strength || 0) * 100)
)

// ✅ Colour logic
const recoveryColour = computed(() => {
    const r = performance.value.recovery.overall || 0

    if (r > 0.75) return 'text-success'
    if (r > 0.5) return 'text-warning'
    return 'text-danger'
})

const riskLabel = computed(() => {
    const r = performance.value.injury_risk || 0

    if (r < 0.3) return 'Low'
    if (r < 0.7) return 'Moderate'
    return 'High'
})

const riskColour = computed(() => {
    const r = performance.value.injury_risk || 0

    if (r < 0.3) return 'text-success'
    if (r < 0.7) return 'text-warning'
    return 'text-danger'
})
</script>

<style scoped>
/* Ensure MuscleMap fills card nicely */
:deep(svg) {
    width: 100%;
    height: 100%;
}
</style>