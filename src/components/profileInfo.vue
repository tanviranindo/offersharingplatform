<template>
  <img
    :src="user.picture"
    alt="profile"
    class="img-thumbnail"
    height="300px"
    width="300px"
  />
  <div class="px-3">
    <h6 class="fs-4 fw-bold my-3">{{ user.name }}</h6>
    <div class="row">
      <span class="col-1">
        <i class="fa fa-star-half-o" aria-hidden="true"></i>
      </span>
      <span class="col">
        <p class="text-secondary"><b>Rating : </b> {{ user.rating }}/5</p>
      </span>
    </div>
    <div class="row">
      <span class="col-1">
        <i class="fa fa-male" aria-hidden="true"></i>
      </span>
      <span class="col">
        <p class="text-secondary"><b>Gender : </b> {{ user.gender }}</p>
      </span>
    </div>
    <div class="row">
      <span class="col-1">
        <i class="fa fa-clock-o" aria-hidden="true"></i>
      </span>
      <span class="col">
        <p class="text-secondary">
          <b>Member Since : </b>
          {{ user.joining_date}}
        </p>
      </span>
    </div>
    <button class="btn btn-secondary w-100">
      <i class="fa fa-comments mx-2" aria-hidden="true"></i>Start Conversation
    </button>
  </div>
</template>

<script>
export default {
  props: ["user"],
};
</script>

<style>
.img-thumbnail {
  height: 300px;
  width: 300px;
  box-shadow: 0px 0px 16px rgba(0, 0, 0, 0.3);
}
</style>