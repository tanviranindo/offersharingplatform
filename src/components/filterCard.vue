<template>
  <div class="card no-border-rad mid-shadow">
    <h6 class="card-header">Filters</h6>
    <div class="card-body">
      <div class="input-group mb-3">
        <div class="input-group-text">Location</div>
        <select class="form-select" v-model="location">
          <option
            v-for="location in locations"
            :key="location.lid"
            :value="location.lid"
          >
            {{ location.name }}
          </option>
        </select>
      </div>
      <div class="mb-3">
        <label for="" class="form-label fw-bolder">Date</label>
        <input type="date" class="form-control" v-model="date" />
      </div>
      <div class="mb-3">
        <label for="" class="form-label fw-bolder">Type</label>
        <div class="form-check">
          <input
            class="form-check-input"
            type="radio"
            name="flexRadioDefault"
            id="flexRadioDefault1"
            checked
          />
          <label class="form-check-label" for="flexRadioDefault1"> All </label>
        </div>
        <div class="form-check">
          <input
            class="form-check-input"
            type="radio"
            name="flexRadioDefault"
            id="flexRadioDefault2"
          />
          <label class="form-check-label" for="flexRadioDefault2">
            Interested
          </label>
        </div>
        <div class="form-check">
          <input
            class="form-check-input"
            type="radio"
            name="flexRadioDefault"
            id="flexRadioDefault2"
          />
          <label class="form-check-label" for="flexRadioDefault2">
            Not Interested
          </label>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { toRefs, reactive } from "vue";
import useFeed from "../compositions/feeds";

export default {
  setup() {
    const state = reactive({
      locations: [],
    });
    const { location, date } = useFeed();

    fetch(
      "/api/get-all-locations?date=" +
        state.date +
        "&location=" +
        state.location
    )
      .then((res) => res.json())
      .then((data) => (state.locations = data));
    return {
      ...toRefs(state),
      location,
      date,
    };
  },
};
</script>

<style>
</style>