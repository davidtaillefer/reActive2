<template>
  <BNavbar class="navbar-dark bg-dark" expand="lg">
    <BContainer fluid class="d-flex align-items-center">

      <!-- Brand -->
      <BNavbarBrand
        class="me-3"
        style="color: #8e44ad; font-weight: bold; font-size: 1.2rem;"
      >
        reActive
      </BNavbarBrand>

      <!-- Nav items -->
      <BCollapse id="nav-collapse" is-nav>
        <BNavbarNav class="align-items-center">
          <BNavItem to="/dashboard" tag="router-link">Dashboard</BNavItem>
          <BNavItem to="/" tag="router-link">Calendar</BNavItem>
          <BNavItem to="/map" tag="router-link">Map</BNavItem>
          <BNavItem to="/season" tag="router-link">Season</BNavItem>
          <BNavItem to="/analysis" tag="router-link">Analysis</BNavItem>
          <BNavItem to="/upload" tag="router-link">Upload</BNavItem>
        </BNavbarNav>
      </BCollapse>

      <!-- Sync Button (Far Right) -->
      <div class="ms-auto d-flex align-items-center gap-2">
        <BButton 
          variant="outline-info" 
          size="sm" 
          @click="handleSync" 
          :disabled="isSyncing"
          class="d-flex align-items-center gap-2"
        >
          <BSpinner v-if="isSyncing" small />
          <i v-else class="bi bi-arrow-repeat"></i>
          {{ isSyncing ? 'Syncing...' : 'Sync' }}
        </BButton>

        <!-- Keep the toggler to the right of the button on mobile if desired -->
        <BNavbarToggle target="nav-collapse" class="ms-2" />
      </div>

    </BContainer>
  </BNavbar>
</template>


<script setup>
import { ref } from 'vue'

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const isSyncing = ref(false)

const handleSync = async () => {
  isSyncing.value = true
  try {
    const response = await fetch(`${apiBaseUrl}sync/days/7`, {
      method: 'GET'
    })
    
    if (!response.ok) throw new Error('Sync failed')
    
    const data = await response.json()
    // sync complete
    // Optional: add a success toast or alert here
  } catch (err) {
    console.error('Error during sync:', err)
    alert('Failed to synchronize data.')
  } finally {
    isSyncing.value = false
  }
}
</script>
