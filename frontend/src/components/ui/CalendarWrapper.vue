<template>
  <BContainer fluid class="activity-view h-100 d-flex flex-column p-3">
    <BRow class="flex-fill overflow-hidden mt-3">
      <BCol lg="8" class="d-flex overflow-hidden">
      <div class="card flex-fill overflow-hidden">
        <div class="card-body">
          <!-- FullCalendar with options -->
          <FullCalendar :options="calendarOptions" />
        </div>
      </div>
    </BCol>
    <!-- ATL Training Load Card -->
      <BCol lg="4" class="d-flex flex-column p-3 overflow-auto gap-3">
      <TrainingLoadCard :activities="activities2" :month="currentCalendarDate" />
      <WeeklyTrainingCard 
      :activities="activities2" 
      :month="currentCalendarDate"
      :sportNames="sportNames" 
      :sportColours="sportColours" 
    />
              <TrainingStatusCard/>
    
    </BCol>
    </BRow>
  </BContainer>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import bootstrapPlugin from '@fullcalendar/bootstrap'
import TrainingLoadCard from '@/components/ui/TrainingLoadCard.vue'
import WeeklyTrainingCard from '@/components/ui/WeeklyTrainingCard.vue'
import TrainingStatusCard from '@/components/ui/TrainingStatusCard.vue'
import { useRouter } from 'vue-router'
import { BContainer, BRow, BCol } from 'bootstrap-vue-next'

// --- State Management ---
const router = useRouter()
const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

const activities2 = ref([])
const calendarEvents = ref([]); // Create a separate ref for events
const currentCalendarDate = ref(new Date())
const sportsLoaded = ref(false)
const sportIcons = ref<Record<number, string>>({})
const pendingRange = ref<{ start: Date; end: Date } | null>(null)
const sportNames = ref<Record<number, string>>({})
const sportColours = ref<Record<number, string>>({})

// --- Logic: Fetch Sports Meta ---
const loadSports = async () => {
  try {
    const res = await fetch(`${apiBaseUrl}sports`)
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const sports = await res.json()
    
    sportIcons.value = sports.reduce((map: any, s: any) => {
      map[s.id] = s.icon || ''
      return map
    }, {})

    sportColours.value = sports.reduce((map: any, s: any) => {
  // Map API "colour" (or "color") to our proper "sportColours" variable
  map[s.id] = s.colour || s.color || '#cccccc'; 
  return map;
}, {});
    
    sportNames.value = sports.reduce((map: any, s: any) => {
      map[s.id] = s.name
      return map
    }, {})
    
    sportsLoaded.value = true
    
    // Process any range that was requested while sports were loading
    if (pendingRange.value) {
      const { start, end } = pendingRange.value
      pendingRange.value = null
      fetchActivities(start, end)
    }

    
    

  } catch (err) {
    console.error('Failed to load sports', err)
  }
}

// --- Logic: Fetch Activities (Current Month + 30 Day Buffer) ---
const fetchActivities = async (start, end) => {
  // 1. Identify the focal month for the TrainingLoadCard
  const mid = new Date(start.getTime() + (end.getTime() - start.getTime()) / 2)
  currentCalendarDate.value = new Date(mid.getFullYear(), mid.getMonth(), 1)

  // 2. Create the 30-day "Buffer" for ATL calculation
   const bufferStart = new Date(start)
  bufferStart.setDate(bufferStart.getDate() - 30)
  
  const startStr = bufferStart.toISOString().split('T')[0]
  const endStr = end.toISOString().split('T')[0]

  try {
    const res = await fetch(`${apiBaseUrl}activities?start=${startStr}&end=${endStr}`);
    const allActivities = await res.json();

    // 1. Update activities2 for the ATL Card
    // We normalize the dates here so the ATL card doesn't have to
    activities2.value = allActivities.map(a => ({
      ...a,
      normalizedDate: formatToISO(a.date)
    }));

    // 2. Update Calendar Events
    const calendarStartStr = start.toISOString().split('T')[0];
    calendarEvents.value = allActivities
      .filter((a: any) => {
        const isoDate = new Date(a.date).toISOString().split('T')[0];
        return isoDate >= start.toISOString().split('T')[0];
      })
      .map((a: any) => {
        // Standardize to YYYY-MM-DD
        const cleanDate = new Date(a.date).toISOString().split('T')[0];
        const iconName = sportIcons.value[a.sport] || '';
        // Public assets are served from the root '/'
        const iconUrl = iconName ? `/icons/${iconName}` : ''; 
    
    return {
      title: a.name || 'Activity',
      start: cleanDate, // Must be exactly 'YYYY-MM-DD'
      allDay: true,
      extendedProps: { iconUrl, activity: a }
    };
  });

  } catch (err) {
    console.error('Failed to load activities', err);
  }
};


// --- Calendar Event Handlers ---
const handleDatesSet = async (arg) => {
  // Wait for sports if they are still loading to prevent icon URL errors
  if (!sportsLoaded.value) {
    pendingRange.value = { start: arg.start, end: arg.end };
    return;
  }
  await fetchActivities(arg.start, arg.end);
};

const handleEventClick = (clickInfo: any) => {
  const activity = clickInfo.event.extendedProps.activity
  if (activity) {
    router.push({
      name: 'activity',
      params: { id: activity.id },
      state: { activity },
    })
  }
}

const renderEvent = (arg: any) => {
  const icon = arg.event.extendedProps.iconUrl
  const text = arg.event.title
  if (icon) {
    return {
      html: `<img src="${icon}" style="width:16px;height:16px;vertical-align:middle;margin-right:4px;"/>${text}`,
    }
  }
  return { html: text }
}

// --- Calendar Configuration ---
const calendarOptions = computed(() => ({
  plugins: [dayGridPlugin, interactionPlugin, bootstrapPlugin],
  themeSystem: 'bootstrap',
  initialView: 'dayGridMonth',
  showNonCurrentDates: false,
  fixedWeekCount: false,
  //height: 'auto',
  headerToolbar: {
    left: 'prev,next today prevYear,nextYear',
    center: 'title',
    right: 'dayGridMonth,dayGridYear',
  },
  // FullCalendar will now reactively update when calendarEvents changes
  events: calendarEvents.value, 
  datesSet: handleDatesSet,
  eventClick: handleEventClick,
  eventContent: renderEvent,
  buttonText: { prev: '‹', next: '›', prevYear: '«', nextYear: '»' },
}));

onMounted(() => {
  loadSports()
})

const formatToISO = (dateStr: string) => {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  // Returns 'YYYY-MM-DD'
  return d.toISOString().split('T')[0];
};
</script>

<style scoped>
.calendar-widget {
  /* make calendar larger and centred */
  width: 40vw;
  max-width: 1200px; /* optional cap */
  margin: 0 auto; /* centre horizontally */
}

/*ensure grid lines via option-added class
:deep(.fc-grid-line) {
  border: 1px solid #dee2e6;
}

/* full calendar outline
:deep(.fc) {
  border: 1px solid #dee2e6;
}

/* maintain earlier day-cell styling if necessary
:deep(.fc-daygrid-day-frame) {
  height: 100%;
}*/

/* Fix Calendar Borders and Grid Lines */
:deep(.fc-theme-bootstrap) {
  border: 1px solid #dee2e6 !important; /* Adds the missing outer borders */
}

:deep(.fc-scrollgrid) {
  border: 1px solid #dee2e6 !important;
}
:deep(.fc-scroller) {
  overflow: visible !important;
  height: auto !important;
}
:deep(.fc-col-header) {
  margin-right: 0 !important;
  width: 100% !important;
}
/* Ensure vertical and horizontal grid lines are visible */
:deep(.fc-td), 
:deep(.fc-th),
:deep(.fc-scrollgrid-sync-table td),
:deep(.fc-col-header-cell) {
  border: 1px solid #dee2e6 !important;
}

/* Fix the header (Day names) borders */
:deep(.fc-col-header) {
  border-bottom: 2px solid #dee2e6 !important;
}

/* Remove any stray double-borders on the right */
:deep(.fc-scrollgrid-section-sticky > td) {
  border-right: none !important;
}

</style>
