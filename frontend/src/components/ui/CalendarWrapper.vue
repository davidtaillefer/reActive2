<template>
  <div class="card">
    <div class="card-body">  
      <FullCalendar :options="calendarOptions" />
    </div>
  </div>
</template>

<script>
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import bootstrapPlugin from '@fullcalendar/bootstrap'
//import { ref } from 'vue'
//import '@fullcalendar/bootstrap/main.css'

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL

export default {
  components: {
    FullCalendar, // register the component
  },
  data() {
    return {
      calendarOptions: {
        plugins: [dayGridPlugin, interactionPlugin, bootstrapPlugin],
        themeSystem: 'bootstrap',
        initialView: 'dayGridMonth',
        headerToolbar: {
          left: 'prev,next today prevYear,nextYear',
          center: 'title',
          right: 'dayGridMonth,dayGridYear',
        },
        initialDate: new Date().toISOString().split('T')[0],
        datesSet: this.handleDatesSet,
        dayCellClassNames: 'fc-grid-line',
        dayHeaderClassNames: 'fc-grid-line',
        eventClick: this.handleEventClick,
        buttonText: {
          prev: '‹',
          next: '›',
          prevYear: '«',
          nextYear: '»',
        },
        eventContent: this.renderEvent,
        events: [],
      },
      sportColors: {},
      sportIcons: {},
      sportsLoaded: false,
      pendingRange: null,
    }
  },
  async mounted() {
    // make sure we load sports info before anything else
    await this.loadSports()
    // if a datesSet event fired earlier and was queued, handle it now
    if (this.pendingRange) {
      const { start, end } = this.pendingRange
      this.pendingRange = null
      this.fetchActivities(start, end)
    }
  },
  methods: {
    async loadSports() {
      try {
        const res = await fetch(apiBaseUrl + 'sports')

        if (!res.ok) throw new Error(`HTTP ${res.status}`)
        const sports = await res.json()
        this.sportColors = sports.reduce((map, s) => {
          map[s.id] = s.colour || ''
          return map
        }, {})
        this.sportIcons = sports.reduce((map, s) => {
          map[s.id] = s.icon || ''
          return map
        }, {})
        this.sportsLoaded = true
      } catch (err) {
        console.error('failed to load sports', err)
      }
    },
    async fetchActivities(start, end) {
      // start/end are JS Date objects; convert to YYYY-MM-DD
      const startStr = start.toISOString().split('T')[0]
      const endStr = end.toISOString().split('T')[0]
      const url = `${apiBaseUrl}activities?start=${startStr}&end=${endStr}`
      try {
        const res = await fetch(url)
        if (!res.ok) throw new Error(`HTTP ${res.status}`)
        const activities = await res.json()
        const events = activities.map((a) => {
          const iso = new Date(a.date).toISOString().split('T')[0]
          //const colour = this.sportColors[a.sport] || ''
          // compute icon URL using Vite import.meta.url helper
          const iconName = this.sportIcons[a.sport] || ''
          let iconUrl = ''
          if (iconName) {
            try {
              iconUrl = new URL(`../../assets/icons/${iconName}`, import.meta.url).href
            } catch {
              iconUrl = ''
            }
          }

          // build title and append distance if present
          let title = a.name || 'activity'
          if (a.distance && a.distance > 0) {
            const dist = parseFloat(a.distance).toFixed(1)
            title += ` (${dist} km)`
          }

          return {
            title,
            date: iso,
            //backgroundColor: colour,
            extendedProps: { iconUrl, activity: a },
          }
        })
        this.calendarOptions.events = events
      } catch (err) {
        console.error('failed to load activities', err)
      }
    },
    handleDatesSet(arg) {
      // arg.start & arg.end are the visible range
      if (!this.sportsLoaded) {
        // queue the range; will be handled after sports finish loading
        this.pendingRange = arg
        return
      }
      this.fetchActivities(arg.start, arg.end)
    },
    handleEventClick(clickInfo) {
      const activity = clickInfo.event.extendedProps.activity
      if (activity) {
        this.$router.push({
          name: 'activity',
          params: { id: activity.id },
          state: { activity },
        })
      }
    },
    renderEvent(arg) {
      // arg.event.extendedProps.iconUrl may contain the URL
      const icon = arg.event.extendedProps.iconUrl
      const text = arg.event.title
      if (icon) {
        return {
          html: `<img src="${icon}" style="width:16px;height:16px;vertical-align:middle;margin-right:4px;"/>${text}`,
        }
      }
      return { html: text }
    },
  },
}
</script>

<style scoped>
.calendar-widget {
  /* make calendar larger and centred */
  width: 40vw;
  max-width: 1200px; /* optional cap */
  margin: 0 auto; /* centre horizontally */
}

/* ensure grid lines via option-added class */
:deep(.fc-grid-line) {
  border: 1px solid #dee2e6;
}

/* full calendar outline */
:deep(.fc) {
  border: 1px solid #dee2e6;
}

/* maintain earlier day-cell styling if necessary */
:deep(.fc-daygrid-day-frame) {
  height: 100%;
}
</style>
