<template>
  <BContainer fluid class="h-100 p-4 overflow-auto">
    <BRow class="h-100 g-3">
      <BCol cols="12" lg="8" class="overflow-auto" style="max-height: calc(100vh - 150px)">
        <div class="d-flex flex-column gap-3">
          <BCard class="h-100 shadow-sm">
            <BCardBody>
              <!-- FullCalendar with options -->
              <FullCalendar ref="calendarRef" :options="calendarOptions" />
            </BCardBody>
          </BCard>
        </div>
      </BCol>
      <BCol cols="12" lg="4" class="d-flex flex-column overflow-auto gap-3">
        <TrainingLoadCard :activities="activities2" :month="currentCalendarDate" />
        <WeeklyTrainingCard :activities="activities2" :month="currentCalendarDate" :sportNames="sportNames"
          :sportColours="sportColours" />
        <TrainingStatusCard />
      </BCol>
    </BRow>
  </BContainer>
</template>

<script setup lang="ts">
import { ref, onMounted, computed, watch, nextTick } from 'vue'
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
// Try to restore previously-selected calendar month from localStorage
const STORAGE_KEY = 'calendar.currentDate'
const loadSavedDate = () => {
  try {
    const v = localStorage.getItem(STORAGE_KEY)
    if (v) {
      // v expected as 'YYYY-MM-DD' or full ISO; Date can parse both
      const d = new Date(v)
      if (!isNaN(d.getTime())) return new Date(d.getFullYear(), d.getMonth(), 1)
    }
  } catch (e) {}
  return new Date()
}
const currentCalendarDate = ref(loadSavedDate())
const calendarRef = ref(null)
const programmaticNavigation = ref(false)
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
  try { localStorage.setItem(STORAGE_KEY, currentCalendarDate.value.toISOString().split('T')[0]) } catch(e){}

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
  // Ignore datesSet events triggered by our own programmatic navigation
  if (programmaticNavigation.value) return;
  if (!sportsLoaded.value) {
    pendingRange.value = { start: arg.start, end: arg.end };
    return;
  }
  // Persist the current visible range's focal month so returning to calendar restores it
  try { localStorage.setItem(STORAGE_KEY, new Date(arg.start).toISOString().split('T')[0]) } catch(e){}
  await fetchActivities(arg.start, arg.end);
};

const handleEventClick = (clickInfo: any) => {
  const activity = clickInfo.event.extendedProps.activity
  if (activity) {
    router.push({
      name: 'activity',
      params: { id: activity.id },
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
  // Ensure FullCalendar starts at the persisted month (or today's month)
  initialDate: currentCalendarDate.value.toISOString().split('T')[0],
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

// Ensure the FullCalendar view follows the persisted month when available.
// `initialDate` is only used on first render; use the calendar API to navigate
// when `currentCalendarDate` changes or once on mount.
onMounted(async () => {
  await nextTick()
  try {
    if (calendarRef.value && typeof calendarRef.value.getApi === 'function') {
      programmaticNavigation.value = true
      calendarRef.value.getApi().gotoDate(currentCalendarDate.value)
      // clear flag after a tick so any datesSet handler knows this was programmatic
      await nextTick()
      programmaticNavigation.value = false
    }
  } catch (e) {
    programmaticNavigation.value = false
  }
})

watch(currentCalendarDate, async (d) => {
  try {
    if (calendarRef.value && typeof calendarRef.value.getApi === 'function') {
      programmaticNavigation.value = true
      calendarRef.value.getApi().gotoDate(d)
      await nextTick()
      programmaticNavigation.value = false
    }
  } catch (e) { programmaticNavigation.value = false }
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
  max-width: 1200px;
  /* optional cap */
  margin: 0 auto;
  /* centre horizontally */
}


/* Fix Calendar Borders and Grid Lines */
:deep(.fc-theme-bootstrap) {
  border: 1px solid #dee2e6 !important;
  /* Adds the missing outer borders */
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
