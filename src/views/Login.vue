<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col">
        <brand-info />
      </div>
      <div class="col d-flex justify-content-center">
        <login-form />
      </div>
    </div>
  </div>
  <footbar />
</template>

<script>
import loginForm from "../components/loginForm";
import footbar from "../components/footbar";
import brandInfo from "../components/brandInfo";

export default {
  components: {
    loginForm,
    footbar,
    brandInfo,
  },
};
</script>

<style>
</style>