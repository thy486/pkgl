<template>
  <div id="login">
    <a-form
      layout="vertical"
      :form="form"
      @submit="handleSubmit"
      id="loginForm"
    >
      <h1>Login</h1>
      <a-form-item
        :validate-status="userNameError() ? 'error' : ''"
        :help="userNameError() || ''"
      >
        <a-input
          v-decorator="[
            'name',
            {
              rules: [{ required: true, message: '请输入你的账号!' }],
            },
          ]"
          placeholder="Username"
        >
          <a-icon
            slot="prefix"
            type="user"
            style="color: rgba(0, 0, 0, 0.25)"
          />
        </a-input>
      </a-form-item>
      <a-form-item
        :validate-status="passwordError() ? 'error' : ''"
        :help="passwordError() || ''"
      >
        <a-input
          v-decorator="[
            'pwd',
            {
              rules: [{ required: true, message: '请输入你的密码!' }],
            },
          ]"
          type="password"
          placeholder="Password"
        >
          <a-icon
            slot="prefix"
            type="lock"
            style="color: rgba(0, 0, 0, 0.25)"
          />
        </a-input>
      </a-form-item>
      <a-form-item>
        <a-button
          type="primary"
          html-type="submit"
          style="width: 130px; margin-right: 10px"
          :disabled="hasErrors(form.getFieldsError())"
        >
          登录
        </a-button>
        <a-button html-type="reset" style="width: 130px"> 重置 </a-button>
      </a-form-item>
    </a-form>
  </div>
</template>

<script>
import { login } from "@/services/login";
function hasErrors(fieldsError) {
  return Object.keys(fieldsError).some((field) => fieldsError[field]);
}
export default {
  data() {
    return {
      hasErrors,
      form: this.$form.createForm(this, { name: "vertical_login" }),
    };
  },
  mounted() {
    this.$nextTick(() => {
      // To disabled submit button at the beginning.
      this.form.validateFields();
    });
  },
  methods: {
    // Only show error after a field is touched.
    userNameError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("name") && getFieldError("name");
    },
    // Only show error after a field is touched.
    passwordError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched("pwd") && getFieldError("pwd");
    },
    handleSubmit(e) {
      e.preventDefault();
      this.form.validateFields(async (err, values) => {
        if (!err) {
          const res = await login({ ...values });
          if (res.status === 200) {
            this.$message.success("登录成功!", 1);
            this.$cookies.set("name", res.data);
            this.$router.push("/vue");
          } else {
            this.$message.error("请重新输入账号和密码!", 2);
            return false;
          }
        }
      });
    },
  },
};
</script>

<style scoped>
#login {
  width: 100vw;
  height: 100vh;
  background-image: url("../../assets/img/1.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
}

#loginForm {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width: 450px;
  height: 280px;
  margin: auto;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  box-shadow: 3px 3px 6px 3px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-size: 18px;
}
#loginForm::before {
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  filter: blur(20px);
  z-index: -1;
  margin: -30px;
  background-image: url("../../assets/img/1.jpg");
  background-position: center center;
  background-repeat: no-repeat;
  background-size: 100vw 100vh;
}
</style>
