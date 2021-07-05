<template>
  <div>
    <div>
      <a-button type="primary">
        <router-link to="/vue/studentAdd">添加</router-link>
      </a-button>
    </div>
    <br />
    <a-form-model
      layout="inline"
      :model="query"
      @submit="handleSubmit"
      @submit.native.prevent
    >
      <a-form-model-item label="学号">
        <a-input v-model="query.studentID" />
      </a-form-model-item>
      <a-form-model-item label="姓名">
        <a-input v-model="query.name" />
      </a-form-model-item>
      <a-form-model-item label="性别">
        <a-radio-group v-model="query.sex">
          <a-radio value="男">男</a-radio>
          <a-radio value="女">女</a-radio>
        </a-radio-group>
      </a-form-model-item>
      <a-form-model-item label="班级">
        <a-select v-model="query.classID" style="width: 150px">
          <a-select-option
            v-for="classObj in classList"
            :value="classObj.classID"
            :key="classObj.classID"
          >
            {{ classObj.className }}
          </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item>
        <a-button type="primary" html-type="submit"> 查询 </a-button>
      </a-form-model-item>
    </a-form-model>
    <br />
    <a-table
      size="small"
      :columns="columns"
      :data-source="data"
      bordered
      :pagination="true"
    >
      <template slot="action" slot-scope="text, record">
        <a-button type="primary">
          <router-link :to="`/vue/studentEdit/${record.studentID}`"
            >编辑</router-link
          > </a-button
        >&nbsp;
        <a-popconfirm
          v-if="data.length"
          title="你确定要删除吗？"
          ok-text="确定"
          cancel-text="取消"
          @confirm="() => onDelete(record)"
        >
          <a-button type="danger">删除</a-button>
        </a-popconfirm>
      </template>
    </a-table>
  </div>
</template>

<script>
import { deleteStudent, findAllStudent, findStudent } from "@/services/student";
import { findAllClass } from "@/services/class";
const columns = [
  {
    title: "学号",
    dataIndex: "studentID",
    align: "center",
  },
  {
    title: "姓名",
    dataIndex: "name",
    align: "center",
  },
  {
    title: "性别",
    dataIndex: "sex",
    align: "center",
  },
  {
    title: "出生日期",
    dataIndex: "birthday",
    align: "center",
  },
  {
    title: "班级",
    dataIndex: "className",
    align: "center",
  },
  {
    title: "操作",
    dataIndex: "action",
    align: "center",
    scopedSlots: { customRender: "action" },
  },
];
export default {
  data() {
    return {
      data: [],
      columns,
      query: {
        studentID: "",
        name: "",
        sex: "",
        classID: "",
      },
      classList: [],
    };
  },
  created() {
    findAllClass().then((res) => (this.classList = res.data));
    findAllStudent().then((res) => (this.data = res.data));
  },
  methods: {
    async onDelete({ studentID: id }) {
      const data = [...this.data];
      this.data = data.filter((item) => item.studentID !== id);
      const result = await deleteStudent(id);
      if (result.status === 200) {
        this.$message.success("删除学生成功!", 1);
        history.go(0);
      } else {
        this.$message.error("删除学生失败!", 2);
      }
    },
    handleSubmit() {
      findStudent(this.query).then((res) => (this.data = res.data));
    },
  },
};
</script>

<style scoped>
</style>