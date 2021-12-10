<template>
  <navBar />
  <router-view />
</template>

<script>
import navBar from "./components/navBar";

export default {
  components: {
    navBar,
  },
};
</script>

<style>
.no-border-rad {
  border-radius: 0px;
}
.mid-shadow {
  box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
}

.custom-feed-page-container,
.custom-feed-section {
  height: calc(100vh - 100px);
  overflow: hidden;
}

.custom-feed-section {
  overflow-y: scroll;
}
</style>