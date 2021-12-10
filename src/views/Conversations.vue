<template>
  <div class="container">
    <div class="row">
      <div class="col-4 side-bar">
        <div class="card no-border-rad mid-shadow">
          <div class="card-header">Search</div>
          <div class="card-body">
            <input
              type="text"
              placeholder="Search By Name"
              class="form-control"
            />
          </div>
        </div>
        <div class="card no-border-rad mid-shadow">
          <div class="card-header">People</div>
          <div class="card-body people">
            <conversation-list :list="list" />
          </div>
        </div>
      </div>
      <div class="col-8 main">
        <div class="card no-border-rad mid-shadow">
          <div class="card-header">Conversation with Name</div>
          <div class="card-body convo-box">
            <conversation-bubble />
            <conversation-bubble />
            <conversation-bubble />
            <conversation-bubble />
          </div>
        </div>
        <div class="card no-border-rad mid-shadow">
          <div class="card-body bg-light">
            <div class="input-group">
              <div class="input-group-text">Message</div>
              <input
                type="text"
                placeholder="Type your text here..."
                class="form-control"
              />
              <button class="btn btn-primary">Send</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, toRefs } from "vue";
import ConversationBubble from "../components/conversationBubble.vue";
import conversationList from "../components/conversationList.vue";
export default {
  components: { conversationList, ConversationBubble },
  setup() {
    const state = reactive({
      list: [],
    });

    fetch("/api/get-convo?uid=1")
      .then((res) => res.json())
      .then((data) => {
        state.list = data;
      });

    return {
      ...toRefs(state),
    };
  },
};
</script>

<style>
.side-bar {
  height: calc(100vh - 100px);
  overflow: hidden;
}
.main {
  height: calc(100vh - 100px);
}
.people {
  overflow-y: scroll;
  height: calc(100vh - 260px);
}
.convo-box {
  height: calc(100vh - 220px);
  overflow-y: scroll;
}
</style>