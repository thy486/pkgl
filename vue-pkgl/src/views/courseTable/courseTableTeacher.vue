<template>
  <div>
    <a-form-model
      layout="inline"
      :model="query"
      @submit="handleSubmit"
      @submit.native.prevent
    >
      <a-form-model-item label="工号">
        <a-input v-model="query.teacherID" />
      </a-form-model-item>
      <a-form-model-item>
        <a-button type="primary" html-type="submit"> 查询 </a-button>
      </a-form-model-item>
    </a-form-model>
    <a-table :columns="columns" :data-source="data" @expand="handleExpand">
      <a-table
        slot="expandedRowRender"
        slot-scope="text"
        :columns="innerColumns"
        :data-source="innerData"
        :pagination="false"
        bordered
      />
    </a-table>
  </div>
</template>
<script>
import { findAllTeacher, findById } from "@/services/teacher";
import { findByTeacherId } from "@/services/classTable";
const columns = [
  { title: "工号", dataIndex: "teacherID" },
  { title: "姓名", dataIndex: "name" },
  { title: "性别", dataIndex: "sex" },
  { title: "年龄", dataIndex: "age" },
];
const innerColumns = [
  { title: "星期一", dataIndex: "monday" },
  { title: "星期二", dataIndex: "tuesday" },
  { title: "星期三", dataIndex: "wednesday" },
  { title: "星期四", dataIndex: "thursday" },
  { title: "星期五", dataIndex: "friday" },
];
export default {
  data() {
    return {
      data: [],
      columns,
      innerColumns,
      innerData: [],
      query: {
        teacherID: "",
      },
    };
  },
  created() {
    findAllTeacher().then((res) => (this.data = res.data));
  },
  methods: {
    handleExpand(expanded, { teacherID: id }) {
      if (expanded) {
        findByTeacherId(id).then((res) => {
          var a = res.data;

          this.innerData = [];
          for (let i = 0; i < 7; i++) {
            this.innerData.push({
              monday: "",
              tuesday: "",
              wednesday: "",
              thursday: "",
              friday: "",
            });
          }

          var list = ["monday", "tuesday", "wednesday", "thursday", "friday"];
          for (let i = 0; i < a.length; i++) {
            var x = list[a[i].week - 1];
            var y = a[i].time - 1;
            this.innerData[y][x] = `${a[i].courseName}(${a[i].className})`;
          }
        });
      }
    },
    handleSubmit() {
      findById(this.query.teacherID).then((res) => (this.data = [res.data]));
    },
  },
};
</script>
