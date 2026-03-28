<!-- Field.vue -->
<template>
  <div style="width: 140px; flex-shrink: 0;">
    <label class="small fw-bold">{{ label }}</label>
    <slot />
  </div>
</template>

<script setup>
defineProps({
  label: String
})
</script>