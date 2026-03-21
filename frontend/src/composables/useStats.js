import { ref } from 'vue'

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL


// Shared state (singleton)
const stats = ref(null)
const loading = ref(false)
const error = ref(null)

// Track last request to avoid duplicate calls
let lastParams = null

// Helper: format date YYYY-MM-DD (local time)
const formatDate = (date) => {
  const d = new Date(date)
  const year = d.getFullYear()
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

export function useStats() {
  const fetchStats = async ({ startDate, endDate, force = false } = {}) => {
    const start = formatDate(startDate || new Date())
    const end = formatDate(endDate || new Date())

    const paramsKey = `${start}_${end}`

    // avoid duplicate calls
    if (!force && stats.value && lastParams === paramsKey) {
      return
    }

    try {
      loading.value = true
      error.value = null

      const response = await fetch(`${apiBaseUrl}stats?start=${start}&end=${end}`)
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`)
      }

      const data = await response.json()

      // Always normalize to array
      stats.value = Array.isArray(data) ? data : [data]

      lastParams = paramsKey
    } catch (err) {
      console.error(err)
      error.value = 'Failed to load stats'
    } finally {
      loading.value = false
    }
  }

  // Convenience: get today's stats (single object)
  const getTodayStats = () => {
    if (!stats.value || !stats.value.length) return null
    return stats.value[0]
  }

  return {
    stats,
    loading,
    error,
    fetchStats,
    getTodayStats
  }
}