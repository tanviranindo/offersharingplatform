<template>
  <div class="card no-border-rad mid-shadow">
    <h6 class="card-header">Create New Post</h6>
    <div class="card-body">
      <div class="mb-3">
        <label for="" class="form-label">Restaurant Name</label>
        <input
          type="text"
          placeholder="Chillox"
          v-model="restaurantName"
          class="form-control"
        />
      </div>
      <div class="mb-3">
        <label for="" class="form-label">Offer Title</label>
        <input
          type="text"
          placeholder="Buy 1 Get 1"
          v-model="offerTitle"
          class="form-control"
        />
      </div>
      <div class="mb-3">
        <label for="" class="form-label">Event Date</label>
        <div class="row">
          <div class="col-6">
            <input
              type="date"
              placeholder="Date"
              v-model="eventDate"
              class="form-control"
            />
          </div>
          <div class="col-6">
            <input type="time" v-model="eventTime" class="form-control" />
          </div>
        </div>
      </div>
      <div class="mb-3">
        <div class="row">
          <div class="col">
            <label for="" class="form-label">Price</label>
            <input
              type="number"
              placeholder="100$"
              v-model="price"
              class="form-control"
            />
          </div>
          <div class="col">
            <label for="" class="form-label">Persons</label>
            <input
              type="number"
              placeholder="5"
              v-model="persons"
              class="form-control"
            />
          </div>
        </div>
      </div>
      <div class="input-group mb-3">
        <div class="input-group-text">Location</div>
        <select
          class="form-select"
          aria-label="Default select"
          v-model="postlocation"
        >
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
        <button class="btn btn-outline-primary w-100" @click="create">
          CREATE POST
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { toRefs, reactive } from "vue";
import useUser from "../compositions/user";
import { useRouter } from "vue-router";

export default {
  setup() {
    const { userProfile, isLogin } = useUser();
    if (!isLogin.value) {
      useRouter().push("/");
    }

    const state = reactive({
      restaurantName: "",
      offerTitle: "",
      eventDate: "",
      eventTime: "",
      price: "",
      persons: "",
      locations: [],
      postlocation: "",
    });
    fetch("/api/get-all-locations")
      .then((res) => res.json())
      .then((data) => (state.locations = data));

    function create() {
      fetch("/api/newpost", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          restaurantName: state.restaurantName,
          offerTitle: state.offerTitle,
          eventDate: state.eventDate,
          price: state.price,
          persons: state.persons,
          u_id: userProfile.value.uid,
          location_id: state.postlocation,
        }),
      })
        .then((res) => res.status)
        .then((data) => {
          if (data == 200) {
            alert("Success");
          } else alert("Failed");
        });
    }

    return {
      ...toRefs(state),
      create,
    };
  },
};
</script>

<style>
</style>
