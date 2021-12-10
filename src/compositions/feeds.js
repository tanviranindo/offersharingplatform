import { toRefs, reactive, watchEffect } from 'vue'
import useUser from './user'



const { userProfile } = useUser()

const state = reactive({
  feeds: [],
  location: "",
  date: ""
})
function getFeeds() {

  // console.log(userProfile.value.lid)
  // console.log(userProfile.value.getFeeds)
  // console.log("/api/viewPost?location=" + state.location + "&event_date=" + state.event_date)

  state.feeds = []

  // console.log(new Date().toISOString().substr(0, 10))
  fetch("/api/viewPost?location=" + state.location + "&event_date=" + state.date)
    .then((res) => res.json())
    .then((data) => {
      state.feeds = data
    });
}

watchEffect(getFeeds)

function setProperties() {
  state.location = userProfile.value.lid
  state.date = new Date(Date()).toISOString().substr(0, 10)
}

export default function useFeeds() {
  return ({
    ...toRefs(state),
    getFeeds,
    setProperties
  })
}