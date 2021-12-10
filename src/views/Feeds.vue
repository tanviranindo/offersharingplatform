<template>
  <div class="container-fluid custom-feed-page-container">
    <div class="row">
      <div class="col-3">
        <create-new-post-card />
      </div>
      <div class="col-6 custom-feed-section">
        <div v-for="feed in feeds" :key="feed.name">
          <feeds-card :feed="feed" />
        </div>
      </div>
      <div class="col-3">
        <filter-card />
      </div>
    </div>
  </div>
</template>

<script>
import createNewPostCard from "../components/createNewPostCard.vue";
import FeedsCard from "../components/feedsCard.vue";
import FilterCard from "../components/filterCard.vue";
import useFeeds from "../compositions/feeds";

export default {
  components: { createNewPostCard, FeedsCard, FilterCard },
  setup() {
    const { feeds, setProperties } = useFeeds();

    setProperties()

    return {
      feeds,
    };
  },
};
</script>

<style>
</style>