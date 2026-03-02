<template>
  <div class="h-100 bg-light overflow-auto">
    <BContainer fluid class="py-4 px-4 h-100">
      <BCard class="shadow-sm h-100 d-flex flex-column">
        <BCardBody class="p-4 d-flex flex-column overflow-hidden">
          <!-- Header -->
          <div class="d-flex align-items-center justify-content-between mb-4">
            <div class="d-flex align-items-center gap-3">
              <i class="bi bi-tree text-success fs-4"></i>
              <h2 class="mb-0">Seasonal Activity</h2>
            </div>
            <div class="small text-muted">
              <BFormSelect
                v-model="selectedYear"
                :options="yearOptions"
                size="sm"
              ></BFormSelect>
            </div>
          </div>

          <!-- Main Content - Sidebar + Map -->
          <BRow class="g-3 flex-fill overflow-hidden">
            <!-- Left Sidebar - Season Cards -->
            <BCol cols="12" md="4" lg="3">
              <div class="d-flex flex-column gap-3 h-100 overflow-auto">
                <BCard
                  v-for="season in seasonData"
                  :key="season.season"
                  :style="{
                    backgroundColor: seasonColors[season.color].bg,
                    borderColor: seasonColors[season.color].border,
                    borderWidth: '2px',
                    color: seasonColors[season.color].text,
                  }"
                >
                  <BCardBody>
                    <div class="d-flex align-items-center gap-2 mb-3">
                      <i :class="`bi bi-${season.icon} fs-5`"></i>
                      <h5 class="mb-0 fw-bold">{{ season.season }}</h5>
                    </div>
                    <div class="small">
                      <div class="d-flex justify-content-between mb-1">
                        <span style="opacity: 0.75">Activities:</span>
                        <span class="fw-semibold">{{ season.activities }}</span>
                      </div>
                      <div class="d-flex justify-content-between mb-1">
                        <span style="opacity: 0.75">Avg Distance:</span>
                        <span class="fw-semibold">{{ season.avgDistance }}</span>
                      </div>
                      <div class="d-flex justify-content-between">
                        <span style="opacity: 0.75">Total Time:</span>
                        <span class="fw-semibold">{{ season.totalTime }}</span>
                      </div>
                    </div>
                  </BCardBody>
                </BCard>
              </div>
            </BCol>

            <!-- Right Side - Map -->
            <BCol cols="12" md="8" lg="9">
              <BCard class="h-100">
                <BCardBody class="p-0 position-relative">
                  <!-- Map Placeholder -->
                  <div 
                    class="w-100 h-100 d-flex align-items-center justify-content-center position-relative"
                    style="min-height: 500px; background: linear-gradient(135deg, #e7f1ff 0%, #d1f4e0 100%)"
                  >
                    <!-- Grid overlay -->
                    <div 
                      class="position-absolute top-0 start-0 w-100 h-100"
                      :style="gridStyle"
                    ></div>

                    <!-- Map content -->
                    <svg viewBox="0 0 800 600" class="w-100 h-100" style="max-height: 100%">
                      <!-- Road lines -->
                      <path
                        d="M 0 300 Q 200 280, 400 300 T 800 300"
                        stroke="#94a3b8"
                        stroke-width="3"
                        fill="none"
                        opacity="0.4"
                      />
                      <path
                        d="M 0 200 Q 200 180, 400 200 T 800 200"
                        stroke="#94a3b8"
                        stroke-width="3"
                        fill="none"
                        opacity="0.4"
                      />
                      <path
                        d="M 0 400 Q 200 420, 400 400 T 800 400"
                        stroke="#94a3b8"
                        stroke-width="3"
                        fill="none"
                        opacity="0.4"
                      />

                      <!-- Season markers -->
                      <g v-for="(location, index) in mapLocations" :key="location.season">
                        <circle
                          :cx="150 + index * 160"
                          :cy="200 + (index % 2) * 150"
                          r="30"
                          :fill="getSeasonColors(location.season).bg"
                          opacity="0.5"
                        />
                        <circle
                          :cx="150 + index * 160"
                          :cy="200 + (index % 2) * 150"
                          r="18"
                          :fill="getSeasonColors(location.season).border"
                          opacity="0.8"
                        />
                        <circle
                          :cx="150 + index * 160"
                          :cy="200 + (index % 2) * 150"
                          r="10"
                          :fill="getSeasonColors(location.season).text"
                        />
                        <text
                          :x="150 + index * 160"
                          :y="200 + (index % 2) * 150 - 40"
                          text-anchor="middle"
                          font-size="14"
                          font-weight="600"
                          :fill="getSeasonColors(location.season).text"
                        >
                          {{ location.season }}
                        </text>
                      </g>
                    </svg>

                    <!-- Map legend -->
                    <div class="position-absolute bottom-0 start-0 m-3 bg-white rounded shadow-sm p-3">
                      <div class="small fw-semibold mb-2">Seasonal Activity Locations</div>
                      <div v-for="season in seasonData" :key="season.season" class="d-flex align-items-center gap-2 mb-1">
                        <div 
                          :style="{
                            width: '16px',
                            height: '16px',
                            borderRadius: '50%',
                            backgroundColor: seasonColors[season.color].text,
                          }"
                        ></div>
                        <span class="small">{{ season.season }}</span>
                      </div>
                    </div>

                    <!-- Coordinates display -->
                    <div class="position-absolute top-0 end-0 m-3 bg-white rounded shadow-sm p-2">
                      <small class="text-muted">San Francisco Bay Area</small>
                    </div>
                  </div>
                </BCardBody>
              </BCard>
            </BCol>
          </BRow>
        </BCardBody>
      </BCard>
    </BContainer>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { BContainer, BCard, BCardBody, BRow, BCol, BFormSelect } from 'bootstrap-vue-next';

const seasonData = [
  {
    season: 'Winter',
    icon: 'snow',
    color: 'blue' as const,
    activities: 28,
    avgDistance: '18.5 km',
    totalTime: '42h 15m',
  },
  {
    season: 'Spring',
    icon: 'flower1',
    color: 'green' as const,
    activities: 45,
    avgDistance: '22.3 km',
    totalTime: '68h 30m',
  },
  {
    season: 'Summer',
    icon: 'brightness-high',
    color: 'orange' as const,
    activities: 52,
    avgDistance: '26.8 km',
    totalTime: '82h 45m',
  },
  {
    season: 'Fall',
    icon: 'tree',
    color: 'amber' as const,
    activities: 38,
    avgDistance: '20.1 km',
    totalTime: '55h 20m',
  },
];

const seasonColors = {
  blue: { bg: '#e7f1ff', border: '#b6d4fe', text: '#084298' },
  green: { bg: '#d1f4e0', border: '#9ee2b0', text: '#0f5132' },
  orange: { bg: '#ffe5d0', border: '#ffc9a6', text: '#984c0c' },
  amber: { bg: '#fff3cd', border: '#ffe69c', text: '#997404' },
};

const mapLocations = [
  { lat: 37.7749, lng: -122.4194, season: 'Winter' },
  { lat: 37.8044, lng: -122.2712, season: 'Spring' },
  { lat: 37.7280, lng: -122.4865, season: 'Summer' },
  { lat: 37.8716, lng: -122.2727, season: 'Fall' },
];

const gridStyle = {
  backgroundImage: `
    linear-gradient(rgba(0, 0, 0, 0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(0, 0, 0, 0.03) 1px, transparent 1px)
  `,
  backgroundSize: '40px 40px',
  pointerEvents: 'none',
};

const getSeasonColors = (seasonName: string) => {
  const season = seasonData.find(s => s.season === seasonName);
  return season ? seasonColors[season.color] : seasonColors.blue;
};

const selectedYear = ref('2025-2026');
const yearOptions = [
  { value: '2025-2026', text: 'Year 2025-2026' },
  { value: '2024-2025', text: 'Year 2024-2025' },
  { value: '2023-2024', text: 'Year 2023-2024' },
];
</script>