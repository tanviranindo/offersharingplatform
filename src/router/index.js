import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'

const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path: '/registration',
    name: 'Registration',
    component: () => import('../views/Registration.vue')
  },
  {
    path: '/feeds',
    name: 'Feeds',
    component: () => import('../views/Feeds.vue')
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('../views/Profile.vue')
  },
  {
    path: '/post-details/:post_id',
    name: 'PostDetails',
    component: () => import('../views/PostDetails.vue')
  },
  {
    path: '/conversations/:to_id',
    name: 'Conversations-ID',
    component: () => import('../views/Conversations.vue')
  },
  {
    path: '/conversations',
    name: 'Conversations',
    component: () => import('../views/Conversations.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
