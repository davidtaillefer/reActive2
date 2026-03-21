<template>
  <BContainer fluid class="h-100 p-0 overflow-hidden">
    <div class="d-flex h-100">
      
      <!-- Left Sidebar: Report Types -->
  <div class="bg-dark text-white p-3" style="width: 240px; flex-shrink: 0;">
    <h5 class="mb-4 text-purple fw-bold">Analysis</h5>
    <BNav vertical pills>
      <BNavItem 
        v-for="report in reports" 
        :key="report.id"
        :active="activeReport === report.id"
        @click="activeReport = report.id"
        class="mb-2"
      >
        <i :class="`bi bi-${report.icon} me-2`"></i>{{ report.label }}
      </BNavItem>
    </BNav>
  </div>

      <!-- Main Content Area -->
      <div class="flex-grow-1 d-flex flex-column bg-light overflow-auto">
        
        <!-- Top Filter Bar -->
        <header class="bg-white border-bottom p-3 shadow-sm">
          <BRow class="align-items-center g-3">
            <BCol cols="auto">
              <label class="small fw-bold text-muted d-block">Time Range</label>
              <BFormSelect v-model="filters.range" :options="rangeOptions" size="sm" style="width: 150px" />
            </BCol>
            <BCol cols="auto">
              <label class="small fw-bold text-muted d-block">Sport</label>
              <BFormSelect v-model="filters.sport" :options="sportOptions" size="sm" style="width: 150px" />
            </BCol>
            <BCol v-if="filters.range !== 'all'" cols="auto">
              <label class="small fw-bold text-muted d-block">Specific Date</label>
              <BFormInput v-model="filters.date" type="date" size="sm" />
            </BCol>
          </BRow>
        </header>

        <!-- Chart Window -->
<main class="flex-grow-1 p-4">
  <BCard class="h-100 shadow-sm border-0">
    <template #header>
      <div class="fw-bold">
        {{ activeReport === 'atl' ? 'Acute Training Load' : 
           activeReport === 'intensity' ? 'Intensity Minutes' : 'Activity Volume' }}
      </div>
    </template>

    <div class="chart-container" style="height: 500px;">
      <!-- 1. Volume: Uses 'chartData' (Stacked by Sport) -->
      <Bar 
        v-if="activeReport === 'volume'" 
        :data="chartData" 
        :options="chartOptions" 
      />
      
      <!-- 2. ATL: Uses 'loadChartData' (Line Trend) -->
      <Line 
        v-else-if="activeReport === 'atl'" 
        :data="loadChartData" 
        :options="lineOptions" 
      />
      
      <!-- 3. Intensity: Uses 'intensityChartData' (Stacked by Level) -->
      <Bar 
        v-else-if="activeReport === 'intensity'" 
        :data="intensityChartData" 
        :options="chartOptions" 
      />
    </div>
  </BCard>
</main>


      </div>
    </div>
  </BContainer>
</template>
<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import { Bar, Line } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement, LineElement, Filler } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement ,LineElement, Filler  )

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const activities = ref([])
const statsData = ref([])
const globalBounds = ref({ start: '', end: '' })
const sportNames = ref<Record<number, string>>({})
const sportColours = ref<Record<number, string>>({})
const sportOptions = ref([{ value: 'all', text: 'All Sports' }])

const loadSportsMeta = async () => {
  try {
    const res = await fetch(`${apiBaseUrl}sports`)
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const sports = await res.json()

    // Create the mapping for names and colours
    sportNames.value = sports.reduce((map: any, s: any) => {
      map[s.id] = s.name
      return map
    }, {})

    sportColours.value = sports.reduce((map: any, s: any) => {
      map[s.id] = s.colour || s.color || '#cccccc'
      return map
    }, {})

    // Populate the dropdown options
    const options = sports.map((s: any) => ({ value: s.id.toString(), text: s.name }))
    sportOptions.value = [{ value: 'all', text: 'All Sports' }, ...options]
    
  } catch (err) {
    console.error('Failed to load sports metadata:', err)
  }
}

const activeReport = ref('volume')
const reports = [
  { id: 'volume', label: 'Activity Volume', icon: 'bar-chart-steps' },
  { id: 'atl', label: 'Acute Training Load', icon: 'graph-up-arrow' },
  { id: 'intensity', label: 'Intensity Minutes', icon: 'lightning-fill' }
]

const filters = ref({
  range: 'year', // 'all', 'year', 'month', 'week'
  sport: 'all',
  date: new Date().toISOString().split('T')[0]
})

const rangeOptions = [
  { value: 'all', text: 'All Time (by Year)' },
  { value: 'year_week', text: 'Year (by Week)' },
  { value: 'year', text: 'Year (by Month)' },
  { value: 'month', text: 'Month (by Week)' },
  { value: 'week', text: 'Week (by Day)' }
]

const getRangeLabel = (dateVal: string | Date) => {
  const d = new Date(dateVal);
  if (filters.value.range === 'all') return d.getFullYear().toString();
  if (filters.value.range === 'year') return d.toLocaleString('en-CA', { month: 'short' });
  if (filters.value.range === 'year_week') {return `W${getWeekNumber(d)}`;}
  if (filters.value.range === 'month') return `Week ${getWeekNumber(d)}`;
  return d.toLocaleString('en-CA', { weekday: 'short' });
};


// Grouping Logic
const chartData = computed(() => {
  const filtered = activities.value.filter(a => 
    filters.value.sport === 'all' || a.sport === Number(filters.value.sport)
  )

  const buckets: Record<string, Record<number, number>> = {}
  const sportsFound = new Set<number>()

  filtered.forEach(act => {
    const d = new Date(act.date)
    let label = ''

    // logic for grouping
    if (filters.value.range === 'all') label = d.getFullYear().toString()
    else if (filters.value.range === 'year') label = d.toLocaleString('default', { month: 'short' })
    else if (filters.value.range === 'month') label = `Week ${getWeekNumber(d)}`
    else label = d.toLocaleString('default', { weekday: 'short' })

    if (!buckets[label]) buckets[label] = {}
    buckets[label][act.sport] = (buckets[label][act.sport] || 0) + (act.duration / 3600)
    sportsFound.add(act.sport)
  })


  const labels = Object.keys(buckets) // You would sort these chronologically
  const datasets = Array.from(sportsFound).map(sId => ({
    label: sportNames.value[sId] || `Sport ${sId}`,
    backgroundColor: sportColours.value[sId] || '#ccc',
    data: labels.map(l => buckets[l][sId] || 0),
    stack: 'total'
  }))

  return { labels, datasets }
})


const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  scales: { x: { stacked: true, ticks: {
        autoSkip: true,
        maxTicksLimit: 13 // Shows about one label per month
      } }, y: { stacked: true, title: { display: true, text: 'Hours' } } }
}

const getWeekNumber = (d: Date) => {
  const date = new Date(d.getTime())
  date.setHours(0, 0, 0, 0)
  // Thursday in current week decides the year.
  date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7)
  const week1 = new Date(date.getFullYear(), 0, 4)
  return 1 + Math.round(((date.getTime() - week1.getTime()) / 86400000 - 3 + (week1.getDay() + 6) % 7) / 7)
}

const loadChartData = computed(() => {
  const dailyData: Record<string, number> = {}
  
  activities.value.forEach(act => {
    const d = new Date(act.date).toISOString().split('T')[0]
    // Sum training load if multiple activities happen on one day
    dailyData[d] = (dailyData[d] || 0) + (Number(act.training_load) || 0)
  })

  // Sort dates chronologically so the line doesn't zig-zag
  const sortedDates = Object.keys(dailyData).sort()

  return {
    labels: sortedDates,
    datasets: [{
      label: 'Daily Training Load',
      data: sortedDates.map(d => dailyData[d]),
      borderColor: '#8e44ad',
      backgroundColor: 'rgba(142, 68, 173, 0.1)',
      tension: 0.4,
      fill: true,
      pointRadius: 2
    }]
  }
})


// 1. Function to fetch data based on CURRENT filter state
const loadFilteredData = async () => {
  const { start, end } = getDateRange();
  
  if (!start || !end) return;

  try {
    // Fetch Activities for Volume and ATL
    const actRes = await fetch(`${apiBaseUrl}activities?start=${start}&end=${end}`);
    activities.value = await actRes.json();

    // Fetch Health Stats for Intensity Minutes
    const statsRes = await fetch(`${apiBaseUrl}stats?start=${start}&end=${end}`);
    statsData.value = await statsRes.json();
  } catch (err) {
    console.error('Error loading analysis data:', err);
  }
};


// Intensity Minutes Chart Data
const intensityChartData = computed(() => {
  const buckets: Record<string, { moderate: number; vigorous: number }> = {};
  
  // 1. Process data into buckets
  statsData.value.forEach(stat => {
    const label = getRangeLabel(stat.date);
    if (!buckets[label]) buckets[label] = { moderate: 0, vigorous: 0 };
    
    buckets[label].moderate += (Number(stat.moderate_intensity) || 0);
    buckets[label].vigorous += (Number(stat.vigorous_intensity) || 0);
  });

  // 2. Chronological Sorting for Labels
  // We sort the labels based on the first occurrence of that date in statsData
  const sortedLabels = Object.keys(buckets).sort((a, b) => {
    const dateA = statsData.value.find(s => getRangeLabel(s.date) === a);
    const dateB = statsData.value.find(s => getRangeLabel(s.date) === b);
    return new Date(dateA?.date).getTime() - new Date(dateB?.date).getTime();
  });

  // 3. Map Datasets to the SORTED labels
  return {
    labels: sortedLabels,
    datasets: [
      {
        label: 'Moderate',
        backgroundColor: '#ffc107',
        data: sortedLabels.map(l => buckets[l].moderate),
        stack: 'intensity'
      },
      {
        label: 'Vigorous',
        backgroundColor: '#dc3545',
        data: sortedLabels.map(l => buckets[l].vigorous),
        stack: 'intensity'
      }
    ]
  };
});



// 2. Watch for filter changes to re-fetch
watch(filters, () => {
  loadFilteredData()
}, { deep: true })

onMounted(async () => {
  // First, get the sports metadata (names/colours)
  await loadSportsMeta() 
  
  // Second, get the global bounds to know the "All Time" range
  const boundsRes = await fetch(`${apiBaseUrl}activities/bounds`)
  globalBounds.value = await boundsRes.json()
  
  // Finally, trigger the first data load
  await loadFilteredData()
})

const getDateRange = () => {
  const d = new Date(filters.value.date);
  let start = '';
  let end = '';

  if (filters.value.range === 'all') {
    // Uses the global bounds we fetched on mount
    start = toSimpleDate(globalBounds.value.start);
    end = toSimpleDate(globalBounds.value.end);
  } 
  else if (filters.value.range === 'year' || filters.value.range === 'year_week') {
    start = `${d.getFullYear()}-01-01`;
    end = `${d.getFullYear()}-12-31`;
  }  
  else if (filters.value.range === 'month') {
    // First day of selected month
    const firstDay = new Date(d.getFullYear(), d.getMonth(), 1);
    // Last day of selected month
    const lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
    start = toSimpleDate(firstDay);
    end = toSimpleDate(lastDay);
  } 
  else if (filters.value.range === 'week') {
    // Calculate Sunday (0) as the start of the week
    const day = d.getDay();
    const sunday = new Date(d);
    sunday.setDate(d.getDate() - day);
    
    const saturday = new Date(sunday);
    saturday.setDate(sunday.getDate() + 6);
    
    start = toSimpleDate(sunday);
    end = toSimpleDate(saturday);
  }

  return { start, end };
};

// Helper to ensure YYYY-MM-DD format
const toSimpleDate = (dateVal) => {
  if (!dateVal) return '';
  const dateObj = new Date(dateVal);
  return dateObj.toISOString().split('T')[0];
};





</script>

