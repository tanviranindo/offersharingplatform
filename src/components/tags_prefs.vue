<template>
  <div class="card mb-4 no-border-rad mid-shadow">
    <h6 class="card-header">Tags</h6>
    <div class="card-body">
      <!-- <div class="mb-3 input-group">
        <div class="input-group-text">Add Tags</div>
        <select
          class="form-select"
          aria-label="Default select"
        >
          <option v-for="tag in allTags" :key="tag.tag_id" :value="tag.tag_id">{{ tag.tag_name }}</option>
        </select>
      </div> -->
      <div class="div">
        <ul>
          <li v-for="tag in user.tags" :key="tag.tag_id">{{ tag.tag_name }}</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="card no-border-rad mid-shadow">
    <h6 class="card-header">Preferences</h6>
    <div class="card-body">
      <!-- <div class="mb-3 input-group">
        <div class="input-group-text">Add Preferences</div>
        <select
          class="form-select"
          aria-label="Default select"
        >
          <option value="Male">Male</option>
        </select>
      </div> -->
      <div class="div">
        <ul>
          <li v-for="pref in user.prefs" :key="pref.pref_id">
            {{ pref.preference_name }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { toRefs, reactive } from "vue";

export default {
  props: ["user"],
};
</script>

<style>
</style>