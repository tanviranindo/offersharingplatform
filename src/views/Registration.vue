<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col">
        <terms />
      </div>
      <div class="col">
        <registration-form />
      </div>
    </div>
  </div>
</template>

<script>
import registrationForm from "../components/registrationForm.vue";
import terms from "../components/terms.vue";

export default {
  components: { registrationForm, terms },
};
</script>

<style>
</style>