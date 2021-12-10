<template>
  <div class="container-fluid post-details-container">
    <div class="row justify-content-center">
      <div class="col-7">
        <interested-filter-card />
        <post-details-card :post="post" />
      </div>
      <div class="col-4">
        <interested-people-list :list="interested" />
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, toRefs } from "vue";
import { useRoute } from "vue-router";
import InterestedFilterCard from "../components/InterestedFilterCard.vue";
import InterestedPeopleList from "../components/interestedPeopleList.vue";
import postDetailsCard from "../components/postDetailsCard";

export default {
  components: { InterestedFilterCard, postDetailsCard, InterestedPeopleList },
  setup() {
    const route = useRoute();
    const post_id = route.params.post_id;

    const state = reactive({
      post: {},
      interested: [],
    });

    fetch("/api/get-post-details?pid=" + post_id)
      .then((res) => res.json())
      .then((data) => {
        state.post = data.post;
        state.interested = data.interested;
      });

    return {
      post_id,
      ...toRefs(state),
    };
  },
};
</script>

<style>
.post-details-container {
  height: calc(100vh - 100px);
  overflow: hidden;
}
</style>