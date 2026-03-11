<script setup>
import { BContainer, BRow, BCol } from 'bootstrap-vue-next'
import CalendarWrapper from '@/components/ui/CalendarWrapper.vue'
import HeartRateCard from '@/components/ui/HeartRateCard.vue'
</script>

<template>
  <BContainer fluid class="p-3">
    <BRow>
      <BCol cols="9">
        <CalendarWrapper />
      </BCol>
      <BCol cols="3">
        <HeartRateCard />
      </BCol>
    </BRow>
  </BContainer>
</template>
