<template>
  <div class="header">
    <h1 class="title">教务管理系统</h1>
    <div class="operation">
      <span>欢迎你</span>
      <span>|</span>
      <span>{{ this.$cookies.get("name") }}</span>
      <a-tooltip title="注销">
        <a-button type="primary" @click="handleLogout"
          ><a-icon type="logout"
        /></a-button>
      </a-tooltip>
    </div>
  </div>
</template>

<script>
import { logout } from "@/services/login";
export default {
  name: "Header",
  methods: {
    handleLogout() {
      logout().then((res) => res);
      this.$cookies.remove("name");
      this.$router.push("/vue/login");
    },
  },
};
</script>

<style scoped>
.header {
  width: 95%;
  height: 60px;
  line-height: 60px;
  margin: 0 auto;
}

.title {
  float: left;
  font-size: 1.5em;
  color: #fff;
  font-weight: 600;
}

.operation {
  float: right;
  color: #fff;
}

.operation span {
  margin-right: 15px;
}
</style>