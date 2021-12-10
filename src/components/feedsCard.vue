<template>
  <div class="card mb-4">
    <div class="card-header">{{ feed.name }}</div>
    <div class="card-body">
      <div class="card-text">
        Hello foodies, I am going to visit {{ feed.restaurant_name }} for having
        {{ feed.offer_name }} offer on
        {{ new Date(feed.event_date).toISOString().substr(0, 10) }}.
      </div>
      <div class="d-flex justify-content-end">
        <button class="btn btn-outline-success btn-sm w-25 mt-4 me-3">
          I am Interested
        </button>
        <router-link
          to="/post-details/1"
          class="btn btn-outline-primary btn-sm mt-4 w-25"
        >
          View Details
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["feed"],
};
</script>

<style>
</style>