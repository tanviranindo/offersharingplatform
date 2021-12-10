<template>
  <div
    class="card no-border-rad mb-2 bg-light"
    v-for="people in list"
    :key="people"
  >
    <div class="card-body d-flex align-items-center">
      <img
        src="https://source.unsplash.com/random"
        alt=""
        class="cust-avatar me-3"
      />
      <span>{{ people.name }}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: ["list"],
};
</script>

<style>
.cust-avatar {
  height: 34px;
  width: 34px;
  border-radius: 50%;
  border: 1px solid #eee;
}
</style>