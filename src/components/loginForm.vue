<template>
  <div class="card w-75 no-border-rad mid-shadow">
    <div class="card-header fw-bold">Login</div>
    <div class="card-body">
      <div class="mb-3">
        <label for="" class="form-label">Username</label>
        <div class="input-group">
          <div class="input-group-text">
            <i class="fa fa-user" aria-hidden="true"></i>
          </div>
          <input
            type="text"
            class="form-control"
            v-model="username"
            placeholder="example@domain.com"
          />
        </div>
      </div>
      <div class="mb-3">
        <label for="" class="form-label">Password</label>
        <div class="input-group">
          <div class="input-group-text">
            <i class="fa fa-lock" aria-hidden="true"></i>
          </div>
          <input
            type="password"
            class="form-control"
            v-model="password"
            placeholder="Your Password"
          />
        </div>
      </div>
      <div class="my-4">
        <button
          class="btn btn-primary w-25"
          @click="login(username, password, router)"
        >
          LOGIN
        </button>
        <span class="ms-4"
          >Don't have an account yet?
          <router-link to="/registration">Register</router-link></span
        >
      </div>
    </div>
  </div>
</template>

<script>
import { toRefs, reactive } from "vue";
import { useRouter } from "vue-router";
import useUser from "../compositions/user";

export default {
  setup() {
    const { login } = useUser();
    const router = useRouter();

    const state = reactive({
      username: "",
      password: "",
    });

    return {
      ...toRefs(state),
      login,
      router,
    };
  },
};
</script>

<style>
</style>