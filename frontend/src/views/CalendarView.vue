<script setup>
import { BContainer, BRow, BCol } from 'bootstrap-vue-next'
import CalendarWrapper from '@/components/ui/CalendarWrapper.vue'
// import WeightComponent from '@/components/WeightComponent.vue'
</script>

<template>
  <BContainer fluid class="p-3">
    <BRow>
      <BCol cols="12">
        <CalendarWrapper />
      </BCol>
    </BRow>
  </BContainer>
</template>
