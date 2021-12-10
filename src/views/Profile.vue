<template>
  <div class="container custom-feed-page-container">
    <div class="row justify-content-center">
      <div class="col-3">
        <profile-info :user="userProfile" />
      </div>
      <div class="col-6 custom-feed-section">
        <div v-for="feed in feeds" :key="feed.name">
          <feeds-card :feed="feed" />
        </div>
      </div>
      <div class="col-3">
        <tags_prefs :user="userProfile" />
      </div>
    </div>
  </div>
</template>

<script>
import { useRouter } from "vue-router";
import useUser from "../compositions/user";
import useFeed from "../compositions/feeds";

import profileInfo from "../components/profileInfo.vue";
import tags_prefs from "../components/tags_prefs.vue";
import FeedsCard from "../components/feedsCard";

export default {
  components: { profileInfo, tags_prefs, FeedsCard },
  setup() {
    const router = useRouter();
    const { userProfile, isLogin, getTags, getPrefs } = useUser();

    const { feeds, getFeeds } = useFeed();

    if (!isLogin.value) router.push("/");

    getTags();
    getPrefs();
    // getFeeds();

    return {
      userProfile,
      feeds,
    };
  },
};
</script>

<style>
</style>