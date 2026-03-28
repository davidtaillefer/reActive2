<!-- FormatCard.vue -->
<template>
  <div class="col-md-4">
    <div class="card bg-light text-center">
      <div class="card-body">
        <IBiFileEarmarkText :class="`text-${colour} fs-3`" />
        <h6 class="mt-2 mb-1">{{ title }}</h6>
        <small class="text-muted">{{ text }}</small>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  title: String,
  text: String,
  colour: String
})
</script>