<template>
  <nav class="navbar cust-navbar bg-light mb-4">
    <div class="container-fluid px-5">
      <div class="navbar-brand">
        <img
          src="../assets/images/brand.svg"
          alt=""
          class="pe-3 cust-brand-img"
        />
        <b class="fw-bold">share</b>
      </div>
      <div v-if="isLogin">
        <router-link
          to="/conversations"
          class="btn btn-outline-dark me-2 cust-nav-btn"
        >
          <i class="fa fa-comments mx-2" aria-hidden="true"></i>
          Conversations
          <span class="badge bg-danger mx-1">{{ unreadCount }}</span>
        </router-link>
        <span class="dropdown">
          <button
            class="btn btn-dark dropdown-toggle cust-nav-btn"
            type="button"
            id="dropdownMenuButton1"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <img
              :src="userProfile.picture"
              alt="profile-picture"
              class="me-2 cust-navbar-avatar"
            />
            {{ userProfile.name }}
          </button>
          <ul
            class="dropdown-menu cust-dropdown-menu"
            aria-labelledby="dropdownMenuButton1"
          >
            <li>
              <router-link to="/profile" class="dropdown-item"
                >View Profile</router-link
              >
            </li>
            <li>
              <router-link to="/feeds" class="dropdown-item"
                >Offer Feeds</router-link
              >
            </li>
            <li>
              <button class="dropdown-item" @click="logout">Logout</button>
            </li>
          </ul>
        </span>
      </div>
      <div v-else>
        <router-link to="/contact-us" class="btn btn-outline-dark cust-nav-btn"
          >About Us</router-link
        >
      </div>
    </div>
  </nav>
</template>

<script>
import useUser from "../compositions/user";

export default {
  setup() {
    const { isLogin, unreadCount, userProfile, logout } = useUser();

    return {
      isLogin,
      unreadCount,
      userProfile,
      logout,
    };
  },
};
</script>

<style>
.cust-navbar {
  height: 64px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
}
.cust-brand-img {
  height: 24px;
}
.cust-nav-btn {
  font-size: 12px;
}
.cust-dropdown-menu {
  transform: translateY(16px);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.2);
}
.cust-navbar-avatar {
  height: 18px;
  width: 18px;
  border-radius: 9px;
  border: 1px solid white;
}
</style>