<script setup>
import FullCalendar from '@fullcalendar/vue3'
import dayGridPlugin from '@fullcalendar/daygrid'

const calendarOptions = {
  plugins: [dayGridPlugin],
  initialView: 'dayGridMonth',
  height: 'auto',
  contentHeight: 'auto',
  expandRows: true
}
</script>

<template>
  <BContainer fluid class="p-3">
    <BRow>
      <BCol cols="12">
        <FullCalendar :options="calendarOptions" />
      </BCol>
    </BRow>
  </BContainer>
</template>
