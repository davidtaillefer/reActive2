<template>
  <BCard class="mb-4 w-100">
    <BCardBody>
      <BRow class="align-items-center text-center text-lg-start">

        <!-- Activity Icon -->
        <BCol cols="auto" class="d-flex align-items-center justify-content-center mb-2 mb-lg-0">
          <div class="activity-category">
            <img v-if="iconUrl" :src="iconUrl" alt="sport icon" />
          </div>
        </BCol>

        <!-- Sport Name & Date -->
        <BCol cols="auto" class="text-lg-start mb-2 mb-lg-0">
          <div class="sport-name">{{ sportName }} - {{ activity.name }}</div>
          <div class="date-text">{{ formattedDate }}</div>
        </BCol>

        <!-- Distance -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ formattedDistance }}</div>
          <div class="label">Distance</div>
        </BCol>

        <!-- Duration -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ formattedDuration }}</div>
          <div class="label">Duration</div>
        </BCol>

        <!-- Calories -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ activity.calories || '-' }}</div>
          <div class="label">Calories</div>
        </BCol>

        <!-- Training Load -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ activity.training_load || '-' }}</div>
          <div class="label">Training Load</div>
        </BCol>

        <!-- RPE -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ activity.workout_rpe || '-' }}</div>
          <div class="label">RPE</div>
        </BCol>

        <!-- Workout Feel -->
        <BCol cols="auto" class="mb-2 mb-lg-0">
          <div class="value">{{ activity.workout_feel || '-' }}</div>
          <div class="label">Workout Feel</div>
        </BCol>

        

        <!-- Edit Button -->
        <BCol cols="auto" class="ms-auto d-flex align-items-center gap-2">
          <router-link :to="`/activity/${activity.id}/edit`">
            <BButton variant="primary">Edit</BButton>
          </router-link>
        </BCol>

      </BRow>
    </BCardBody>
  </BCard>
</template>

<script setup>
import { computed } from 'vue'
import { BCard, BCardBody, BRow, BCol, BButton } from 'bootstrap-vue-next'

const props = defineProps({
  activity: { type: Object, required: true },
  iconUrl: { type: String, default: '' },
  sportName: { type: String, default: '' }
})

const formattedDate = computed(() => {
  if (props.activity.date) {
    return new Date(props.activity.date).toLocaleString()
  }
  return ''
})

const formattedDistance = computed(() => {
  if (props.activity.distance && props.activity.distance > 0) {
    return parseFloat(props.activity.distance).toFixed(1) + ' km'
  }
  return '-'
})

const formattedDuration = computed(() => {
  const secs = props.activity.duration || 0
  const h = Math.floor(secs / 3600)
  const m = Math.floor((secs % 3600) / 60)
  const s = secs % 60
  return [h, m, s].map(v => String(v).padStart(2, '0')).join(':')
})
</script>

<style scoped>
.activity-category img {
  width: 48px;
  display: block;
  margin: 0 auto;
}

.sport-name {
  font-size: 1.5rem;
  font-weight: 600;
}

.date-text {
  font-size: 0.9rem;
  color: #555;
}

.value {
  font-size: 1.5rem;
  font-weight: normal;
}

.label {
  font-size: 0.9rem;
  color: #666;
}
</style>
