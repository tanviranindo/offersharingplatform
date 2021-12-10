<template>
  <div class="card no-border-rad mid-shadow mb-3">
    <div class="card-header">Sort Interested People by,</div>
    <div class="card-body">
      <div class="row">
        <div class="col">
          <label for="" class="form-label">Ratings</label>
          <select class="form-select" aria-label="Default select">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
        </div>
        <div class="col">
          <label for="" class="form-label">Tags</label>
          <input type="text" class="form-control" />
        </div>
        <div class="col">
          <label for="" class="form-label">Location</label>
          <input type="text" class="form-control" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
</style>