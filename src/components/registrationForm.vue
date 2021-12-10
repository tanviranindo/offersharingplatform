<template>
  <div class="card no-border-rad mid-shadow">
    <h5 class="card-header">Registration</h5>
    <div class="card-body">
      <h6 class="card-title">Please fill out the form.</h6>
      <div class="row mb-3 mt-4">
        <div class="col input-group">
          <div class="input-group-text">Name</div>
          <input type="text" v-model="user.name" class="form-control" />
        </div>
        <div class="col input-group">
          <div class="input-group-text">UserName</div>
          <input type="text" v-model="user.username" class="form-control" />
        </div>
      </div>
      <div class="input-group mb-3">
        <div class="input-group-text">Password</div>
        <input type="password" v-model="user.password" class="form-control" />
      </div>
      <div class="input-group mb-3">
        <div class="input-group-text">Date Of Birth</div>
        <input type="date" v-model="user.dob" class="form-control" />
      </div>
      <div class="mb-3 input-group">
        <div class="input-group-text">Gender</div>
        <select
          class="form-select"
          aria-label="Default select"
          v-model="user.gender"
        >
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>
      <div class="input-group mb-3">
        <div class="input-group-text">Location</div>
        <select
          class="form-select"
          aria-label="Default select"
          v-model="user.location"
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
      <div class="form-check mb-4 d-flex justify-content-center align-center">
        <input
          class="form-check-input mx-2"
          type="checkbox"
          v-model="user.tos"
          id="flexCheckDefault"
        />
        <label class="form-check-label" for="flexCheckDefault">
          I have read and agreed to the Terms of Services
        </label>
      </div>
      <div class="my-4">
        <button
          class="btn btn-outline-primary btn-lg w-50"
          @click="register(user)"
        >
          Sign Up
        </button>
        <span class="ms-4"
          >Already have an account?
          <router-link to="/">Login</router-link></span
        >
      </div>
    </div>
  </div>
</template>

<script>
import { toRefs, reactive } from "vue";
import { useRouter } from "vue-router";

export default {
  setup() {
    const router = useRouter();

    const state = reactive({
      locations: [],
      user: {
        name: "",
        username: "",
        password: "",
        joining_date: new Date().toISOString().substr(0, 10),
        dob: "",
        gender: "",
        location: "",
        tos: false,
      },
    });

    fetch("/api/get-all-locations")
      .then((res) => res.json())
      .then((data) => (state.locations = data));

    function register(userObject) {
      if (
        userObject.name &&
        userObject.username &&
        userObject.password &&
        userObject.joining_date &&
        userObject.dob &&
        userObject.gender &&
        userObject.location &&
        userObject.tos
      ) {
        fetch("/api/register", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ ...userObject }),
        })
          .then((res) => res.json())
          .then((data) => {
            if (data.success) {
              alert(
                "Registration Successfull! You can now login with your new credentials."
              );
              router.push("/");
            } else {
              alert("Unknown error occured! Please try afer some time.");
            }
          });
      } else
        alert("PLEASE FILLUP ALL THE INFO AND DONT FORGET TO ACCEPT THE ToS.");
    }

    return {
      ...toRefs(state),
      register,
    };
  },
};
</script>

<style>
</style>