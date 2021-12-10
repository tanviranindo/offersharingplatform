<template>
  <div class="card">
    <div class="card-header">{{ post.restaurant_name }}</div>
    <div class="card-body post-details-body">
      <div class="card-title">
        <h5>{{ post.offer_name }}</h5>
      </div>
      <br />
      <div class="card-text">
        <b>Event Date : </b> {{ post.event_date }} <br /><br />
        <b>Post Date : </b> {{ post.create_date }} <br /><br />
        <b>Price : </b> {{ post.price }} <br /><br />
        <b>Location : </b> {{ post.location }} <br /><br />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["post"],
};
</script>

<style>
.post-details-body {
  height: calc(100vh - 320px);
  overflow-y: scroll;
}
</style>