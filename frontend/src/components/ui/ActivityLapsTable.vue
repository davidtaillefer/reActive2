<template>
  <BCard v-if="laps.length > 0" title="Laps & Lengths" class="mt-4 shadow-sm">
    <div class="table-responsive">
      <table class="table table-sm mb-0">
        <thead class="table-light">
          <tr>
            <th style="width: 40px"></th> <!-- For the arrow -->
            <th>Lap</th>
            <th>Time</th>
            <th>Distance</th>
            <th>Avg HR</th>
            <th>Avg Pace</th>
            <th>Stroke</th>
          </tr>
        </thead>
        <tbody v-for="(lap, index) in laps" :key="index">
          <!-- Main Lap Row -->
          <tr class="align-middle" @click="toggleLap(index)" style="cursor: pointer">
            <td>
              <IBiChevronDown v-if="expandedLaps.has(index)" class="text-primary" />
              <IBiChevronRight v-else-if="hasLengths(lap)" class="text-primary" />
            </td>
            <td class="fw-bold">{{ index + 1 }}</td>
            <td>{{ formatSeconds(lap.total_elapsed_time) }}</td>
            <td>{{ (lap.total_distance).toFixed(0) }} m</td>
            <td>{{ lap.avg_heart_rate || '-' }}</td>
            <td>{{ calculatePace(lap.total_elapsed_time, lap.total_distance) }}</td>
            <td class="text-capitalize">{{ lap.swim_stroke || '-' }}</td>
          </tr>

          <!-- Nested Lengths Row -->
          <tr v-if="expandedLaps.has(index) && hasLengths(lap)">
            <td colspan="7" class="bg-light p-0">
              <div class="px-5 py-2">
                <table class="table table-sm table-borderless mb-0 small">
                  <thead>
                    <tr class="text-muted border-bottom">
                      <th>Length</th>
                      <th>Time</th>
                      <th>Strokes</th>
                      <th>Cadence</th>
                      <th>Stroke Type</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(len, lIndex) in getLengths(lap)" :key="lIndex">
                      <td>{{ lIndex + 1 }}</td>
                      <td>{{ len.total_timer_time?.toFixed(1) }}s</td>
                      <td>{{ len.total_strokes || 0 }}</td>
                      <td>{{ len.avg_swimming_cadence || 0 }} spm</td>
                      <td class="text-capitalize text-info">{{ len.swim_stroke }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </BCard>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';

const props = defineProps({
  hrmData: { type: Object, required: true }
});

const expandedLaps = ref(new Set());

const laps = computed(() => {
  const data = Array.isArray(props.hrmData) ? props.hrmData[0] : props.hrmData;
  const rawLaps = data?.Activities?.Lap;
  return rawLaps ? Object.values(rawLaps) : [];
});

const hasLengths = (lap: any) => lap.Length && Object.keys(lap.Length).length > 0;

const getLengths = (lap: any) => Object.values(lap.Length);

const toggleLap = (index: number) => {
  if (expandedLaps.value.has(index)) {
    expandedLaps.value.delete(index);
  } else {
    expandedLaps.value.add(index);
  }
};

const formatSeconds = (s: number) => {
  if (!s) return '0:00';
  const mins = Math.floor(s / 60);
  const secs = Math.floor(s % 60).toString().padStart(2, '0');
  return `${mins}:${secs}`;
};

const calculatePace = (time: number, dist: number) => {
  if (!dist || dist === 0) return '-';
  // Pace per 100m
  const paceSeconds = (time / dist) * 100;
  return formatSeconds(paceSeconds) + '/100m';
};
</script>

<style scoped>
.table-hover tbody tr:hover {
  background-color: rgba(0,0,0,.02);
}
.text-purple { color: #8e44ad; }
</style>
