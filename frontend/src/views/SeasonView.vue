<script setup lang="ts">
import { computed } from 'vue';
import { BContainer, BRow, BCol, BCard, BCardBody } from 'bootstrap-vue-next';

const seasonData = [
  { season: 'Winter', icon: 'snow', color: 'blue', activities: 28, avgDistance: '18.5 km', totalTime: '42h 15m' },
  { season: 'Spring', icon: 'flower1', color: 'green', activities: 45, avgDistance: '22.3 km', totalTime: '68h 30m' },
  { season: 'Summer', icon: 'brightness-high', color: 'orange', activities: 52, avgDistance: '26.8 km', totalTime: '82h 45m' },
  { season: 'Fall', icon: 'tree', color: 'amber', activities: 38, avgDistance: '20.1 km', totalTime: '55h 20m' },
];

const monthlyData = [
  { month: 'Jan', activities: 12 }, { month: 'Feb', activities: 10 }, { month: 'Mar', activities: 15 },
  { month: 'Apr', activities: 18 }, { month: 'May', activities: 16 }, { month: 'Jun', activities: 20 },
  { month: 'Jul', activities: 22 }, { month: 'Aug', activities: 18 }, { month: 'Sep', activities: 14 },
  { month: 'Oct', activities: 12 }, { month: 'Nov', activities: 8 }, { month: 'Dec', activities: 6 },
];

const maxActivities = computed(() => Math.max(...monthlyData.map(m => m.activities)));
</script>

<template>
  <BContainer fluid class="h-100 bg-light overflow-auto py-4">
    <!-- Main card -->
    <BCard class="shadow-sm mx-auto" style="max-width: 1200px;">
      <BCardBody class="p-4">
        
        <!-- Header -->
        <BRow class="align-items-center justify-content-between mb-4">
          <BCol cols="auto" class="d-flex align-items-center gap-3">
            <i class="bi bi-tree text-success fs-4"></i>
            <h2 class="mb-0">Seasonal Activity</h2>
          </BCol>
          <BCol cols="auto" class="small text-muted">Year 2025-2026</BCol>
        </BRow>

        <!-- Season Cards -->
        <BRow class="g-3 mb-4">
          <BCol
            v-for="season in seasonData"
            :key="season.season"
            cols="12" md="6" lg="3"
          >
            <BCard :class="['h-100', `season-${season.color}`]">
              <BCardBody>
                <div class="d-flex align-items-center gap-2 mb-3">
                  <i :class="`bi bi-${season.icon} fs-5`"></i>
                  <h5 class="mb-0 fw-bold">{{ season.season }}</h5>
                </div>
                <div class="small">
                  <div class="d-flex justify-content-between mb-1">
                    <span class="opacity-75">Activities:</span>
                    <span class="fw-semibold">{{ season.activities }}</span>
                  </div>
                  <div class="d-flex justify-content-between mb-1">
                    <span class="opacity-75">Avg Distance:</span>
                    <span class="fw-semibold">{{ season.avgDistance }}</span>
                  </div>
                  <div class="d-flex justify-content-between">
                    <span class="opacity-75">Total Time:</span>
                    <span class="fw-semibold">{{ season.totalTime }}</span>
                  </div>
                </div>
              </BCardBody>
            </BCard>
          </BCol>
        </BRow>

        <!-- Monthly Bar Chart -->
        <BCard bg="light">
          <BCardBody class="p-4">
            <h5 class="mb-4">Monthly Activity Distribution</h5>
            <div class="d-flex align-items-end justify-content-between gap-2" style="height: 256px;">
              <div
                v-for="data in monthlyData"
                :key="data.month"
                class="flex-fill d-flex flex-column align-items-center gap-2"
              >
                <div class="flex-fill d-flex flex-column align-items-center justify-content-end w-100">
                  <small class="fw-semibold mb-1">{{ data.activities }}</small>
                  <div
                    class="w-100 bg-primary rounded-top bar-item"
                    :style="{ height: `${(data.activities / maxActivities) * 100}%` }"
                    :title="`${data.month}: ${data.activities} activities`"
                  ></div>
                </div>
                <small class="fw-medium text-muted">{{ data.month }}</small>
              </div>
            </div>
          </BCardBody>
        </BCard>

      </BCardBody>
    </BCard>
  </BContainer>
</template>

<style scoped>
.season-blue { background-color: #e7f1ff; border-color: #b6d4fe; color: #084298; }
.season-green { background-color: #d1f4e0; border-color: #9ee2b0; color: #0f5132; }
.season-orange { background-color: #ffe5d0; border-color: #ffc9a6; color: #984c0c; }
.season-amber { background-color: #fff3cd; border-color: #ffe69c; color: #997404; }

.bar-item {
  transition: background-color 0.2s;
  cursor: pointer;
}

.bar-item:hover {
  background-color: #0a58ca;
}
</style>