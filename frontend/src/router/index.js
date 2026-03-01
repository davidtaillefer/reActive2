import { createRouter, createWebHistory } from 'vue-router'

import CalendarView from '../views/CalendarView.vue'
import MapView from '../views/MapView.vue'
import ColumnsView from '../views/ColumnsView.vue'
import MainLayout from '../layouts/MainLayout.vue'

const routes = [
  {
    path: '/',
    component: MainLayout,
    children: [
      { path: '', name: 'Calendar', component: CalendarView },
      { path: 'map', name: 'Map', component: MapView },
      { path: 'columns', name: 'Columns', component: ColumnsView }
    ]
  }
]

export default createRouter({
  history: createWebHistory(),
  routes
})