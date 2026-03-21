<template>
  <BCard class="h-100">
    <BCardBody>
      <BCardTitle>
                  <IBiSpeedometer2 class="text-success fs-3" />
        Training Status
      </BCardTitle>

      <div class="text-center py-4">
        <!-- Loading -->
        <div v-if="loading">
          <BSpinner />
          <div class="mt-2 text-muted">Loading...</div>
        </div>

        <!-- Error -->
        <div v-else-if="error">
          <div class="text-danger">{{ error }}</div>
        </div>

        <!-- Data -->
        <div v-else-if="status">
          <div :class="`display-4 text-${status.color} mb-2`">
            {{ status.label }}
          </div>

          <p class="text-muted">
            {{ status.description }}
          </p>

          <!-- Placeholder metrics (for now) -->
          <BRow class="mt-3">
            <BCol cols="6">
              <div class="small text-muted">Load Ratio</div>
              <div class="fw-bold fs-5">1.2</div>
            </BCol>
            <BCol cols="6">
              <div class="small text-muted">Recovery Time</div>
              <div class="fw-bold fs-5">18h</div>
            </BCol>
          </BRow>
        </div>
      </div>
    </BCardBody>
  </BCard>
</template>

<script setup>
import { computed, onMounted } from 'vue'
import { useStats } from '@/composables/useStats'

const { stats, loading, error, fetchStats, getTodayStats } = useStats()

onMounted(() => {
  fetchStats() // defaults to today
})

// Mapping
const statusMap = {
  0: { label: 'Detraining', color: 'secondary', description: 'Your fitness is declining. Consider increasing activity.' },
  5: { label: 'Recovery', color: 'info', description: 'Your body is recovering—this is a good time to rest.' },
  4: { label: 'Maintaining', color: 'primary', description: 'You are maintaining your current fitness level.' },
  7: { label: 'Productive', color: 'success', description: 'Your fitness is improving—keep it up!' },
  2: { label: 'Overreaching', color: 'warning', description: 'You may be pushing too hard—consider recovery.' },
  1: { label: 'Unproductive', color: 'danger', description: 'Your training is not producing expected gains.' }
}

const status = computed(() => {
  const today = getTodayStats()
  if (!today) return null

  return statusMap[today.training_status] || {
    label: 'Unknown',
    color: 'dark',
    description: 'No description available.'
  }
})
</script>