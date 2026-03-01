<script setup>
import AppNavbar from '../components/navigation/AppNavbar.vue'
</script>

<template>
  <div class="app-wrapper d-flex flex-column">
    <AppNavbar />

    <BContainer fluid class="flex-grow-1 p-0">
      <BRow class="h-100 g-0">
        <BCol cols="12" class="h-100">
          <router-view />
        </BCol>
      </BRow>
    </BContainer>
  </div>
</template>