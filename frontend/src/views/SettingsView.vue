<template>
  <div class="settings">
    <h2>User Preferences</h2>

    <label>Units</label>
    <select v-model="prefs.units">
      <option value="metric">Metric</option>
      <option value="imperial">Imperial</option>
    </select>

    <label>Default Map Mode</label>
    <select v-model="prefs.defaultColourMode">
      <option value="none">Solid</option>
      <option value="grade">Grade</option>
      <option value="hr">Heart Rate</option>
      <option value="speed">Speed</option>
      <option value="power">Power</option>
    </select>

    <label>Max Heart Rate</label>
    <input type="number" v-model="prefs.maxHr" />

    <label>Resting Heart Rate</label>
    <input type="number" v-model="prefs.restingHr" />

    <label>FTP</label>
    <input type="number" v-model="prefs.ftp" />

    <button @click="save">Save</button>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { usePreferencesStore } from '@/stores/preferences'

const prefs = usePreferencesStore()

onMounted(() => {
  if (!prefs.loaded) prefs.load()
})

const save = () => {
  prefs.save()
}
</script>