<script setup>
import { BContainer, BRow, BCol } from 'bootstrap-vue-next'
import CalendarWrapper from '@/components/ui/CalendarWrapper.vue'
</script>

<template>
  <BContainer fluid class="p-3">
    <BRow>
      <BCol>
        <CalendarWrapper />
      </BCol>
    </BRow>
  </BContainer>
</template>
