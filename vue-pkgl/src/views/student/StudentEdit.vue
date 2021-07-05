<template>
  <div>
    <a-button type="primary">
      <router-link to="/vue/student">返回管理主页</router-link>
    </a-button>
    <a-form-model
      ref="ruleForm"
      :model="ruleForm"
      :rules="rules"
      v-bind="layout"
    >
      <a-form-model-item has-feedback label="姓名" prop="name">
        <a-input v-model="ruleForm.name" type="text" autocomplete="off" />
      </a-form-model-item>
      <a-form-model-item has-feedback label="性别" prop="sex">
        <a-radio-group v-model="ruleForm.sex">
          <a-radio value="男">男</a-radio>
          <a-radio value="女"
            ><span style="margin-right: 10px">女</span></a-radio
          >
        </a-radio-group>
      </a-form-model-item>
      <a-form-model-item label="出生日期" required prop="birthday">
        <a-date-picker
          v-model="ruleForm.birthday"
          type="date"
          style="width: 100%"
        />
      </a-form-model-item>
      <a-form-model-item label="班级" prop="className">
        <a-select v-model="ruleForm.classID">
          <a-select-option
            v-for="classObj in classList"
            :value="classObj.classID"
            :key="classObj.classID"
          >
            {{ classObj.className }}
          </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
        <a-button type="primary" @click="submitForm('ruleForm')">
          提交
        </a-button>
        <a-button style="margin-left: 10px" @click="resetForm('ruleForm')">
          重置
        </a-button>
      </a-form-model-item>
    </a-form-model>
  </div>
</template>
<script>
import { updateStudent, findById } from "@/services/student";
import { findAllClass } from "@/services/class";
export default {
  data() {
    let validateName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入姓名"));
      } else {
        if (this.ruleForm.name !== "") {
          this.$refs.ruleForm.validateField("name");
        }
        callback();
      }
    };
    let validateSex = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请选择性别"));
      } else {
        if (this.ruleForm.sex !== "") {
          this.$refs.ruleForm.validateField("sex");
        }
        callback();
      }
    };
    return {
      ruleForm: {
        name: "",
        sex: "",
        birthday: "",
        classID: "",
      },
      classList: [],
      rules: {
        name: [{ validator: validateName, trigger: "change" }],
        sex: [{ validator: validateSex, trigger: "change" }],
        birthday: [
          { required: true, message: "请选择出生日期", trigger: "change" },
        ],
        classID: [
          { required: true, message: "请选择班级名称", trigger: "change" },
        ],
      },
      layout: {
        labelCol: { span: 4 },
        wrapperCol: { span: 14 },
      },
    };
  },
  created() {
    findAllClass().then((res) => (this.classList = res.data));
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          if (typeof this.ruleForm.birthday !== "string") {
            this.ruleForm.birthday = new Date(this.ruleForm.birthday._d)
              .toLocaleDateString()
              .replace(/\//g, "-");
            console.log(this.ruleForm.birthday);
          }
          //   console.log(this.ruleForm.birthday._d);
          const result = await updateStudent(this.ruleForm);
          if (result.status === 200) {
            this.$message.success("修改成功!", 2);
            this.$router.push("/vue/student");
          } else {
            this.$message.error(result.msg, 2);
            return false;
          }
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
  mounted() {
    findById(this.$route.params.id).then((res) => {
      this.ruleForm = res.data;
    });
  },
};
</script>
