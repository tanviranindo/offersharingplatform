import { reactive, toRefs } from 'vue'

const state = reactive({
  isLogin: false,
  unreadCount: 9,
  userProfile: {},
  router: {}
})

function login(username, password, router) {
  if (username && password) {
    state.router = router
    fetch('/api/login', {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username, password })
    }).then(res => res.json()).then(data => {
      if (data.isLoggedIn) {
        state.isLogin = data.isLoggedIn
        state.userProfile = data.user
        router.push('/feeds')
      } else {
        alert('INVALID USERNAME OR PASSWORD! PLEASE TRY AGAIN WITH CORRECT CREDENTIAL.')
      }
    })
  } else {
    alert("PLEASE ENTER YOUR USERNAME AND PASSWORD.")
  }
}

function logout() {
  state.isLogin = false;
  state.userProfile = {}
  state.router.push('/')
  state.router = {}
}

function useUser() {
  return {
    ...toRefs(state),
    logout,
    login,
    getTags,
    getPrefs
  }
}

function getTags() {
  fetch('/api/get-user-tags?uid=' + state.userProfile.uid).then(res => res.json()).then(data => { state.userProfile.tags = data })
}

function getPrefs() {
  fetch('/api/get-user-prefs?uid=' + state.userProfile.uid).then(res => res.json()).then(data => { state.userProfile.prefs = data })
}

export default useUser