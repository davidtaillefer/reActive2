<template>
  <BCard v-if="sets.length > 0" title="Workout Sets" class="mt-4 shadow-sm">
    <div class="table-responsive">
      <table class="table table-sm table-hover mb-0">
        <thead class="table-light">
          <tr>
            <th>Set</th>
            <th>Exercise</th>
            <th>Reps</th>
            <th>Weight</th>
            <th>Duration</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(set, index) in sets" :key="index">
            <td>{{ index + 1 }}</td>
            <td class="text-capitalize">{{ set.category || 'Strength' }}</td>
            <td>{{ set.repetitions || 0 }}</td>
            <td>{{ set.weight || 0 }} kg</td>
            <td>{{ formatSeconds(set.duration) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </BCard>
</template>

<script setup lang="ts">
import { computed } from 'vue';

const props = defineProps({
  hrmData: { type: Object, required: true }
});

const sets = computed(() => {
  const data = Array.isArray(props.hrmData) ? props.hrmData[0] : props.hrmData;
  const rawSets = data?.Activities?.Sets;
  
  return rawSets ? Object.values(rawSets) : [];
});


const formatSeconds = (s: number) => {
  if (!s) return '0s';
  if (s < 60) return `${Math.floor(s)}s`;
  const mins = Math.floor(s / 60);
  const secs = Math.floor(s % 60).toString().padStart(2, '0');
  return `${mins}:${secs}`;
};
</script>
