<template>
  <div class="card no-border-rad mid-shadow post-details-container">
    <h6 class="card-header">
      Interested People<span class="badge bg-danger mx-1">94</span>
    </h6>
    <div class="card-body scroll-y">
      <div class="card mb-2" v-for="people in list" :key="people.i_uid">
        <div class="card-header">
          <div class="row">
            <h6 class="col">{{ people.name }}</h6>
            <div class="col d-flex justify-content-end">
              <button class="btn btn-outline-dark btn-sm">
                <i class="fa fa-comments mx-2" aria-hidden="true"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col">Rating: 4.9/5.0</div>
            <div class="col">Location: Natore</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["list"],
  setup(props) {
    console.log(props);
  },
};
</script>

<style>
.scroll-y {
  overflow-y: scroll;
}
</style>