<template>
  <div class="card">
    <div class="card-body">
      <div class="d-flex align-items-center justify-content-between mb-3">
        <div class="d-flex align-items-center gap-2">
          <i :class="`bi bi-${icon} ${iconColor}`"></i>
          <h6 class="card-title mb-0 fw-semibold">{{ title }}</h6>
        </div>
        <div class="text-end">
          <p class="h4 mb-0 fw-bold">{{ value }}</p>
          <p class="text-muted mb-0" style="font-size: 0.75rem;">{{ unit }}</p>
        </div>
      </div>
      <div style="height: 128px;">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  title: string;
  value: string;
  unit: string;
  icon: string;
  iconColor: string;
}>();
</script>
