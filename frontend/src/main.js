import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'

import './assets/styles/main.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-vue-next/dist/bootstrap-vue-next.css'
import './chartjs-setup'

import {
  BContainer,
  BRow,
  BCol,
  BNavbar,
  BNavbarBrand,
  BNavbarToggle,
  BNavbarNav,
  BNavItem,
  BCollapse
} from 'bootstrap-vue-next'

const app = createApp(App)

app.use(router)
app.use(createPinia())

// Manually register components
app.component('BContainer', BContainer)
app.component('BRow', BRow)
app.component('BCol', BCol)
app.component('BNavbar', BNavbar)
app.component('BNavbarBrand', BNavbarBrand)
app.component('BNavbarToggle', BNavbarToggle)
app.component('BNavbarNav', BNavbarNav)
app.component('BNavItem', BNavItem)
app.component('BCollapse', BCollapse)

app.mount('#app')
