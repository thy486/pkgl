<template>
  <a-table
    :columns="columns"
    :data-source="data"
    :pagination="false"
    @expand="handleExpand"
  >
    <a-table
      slot="expandedRowRender"
      slot-scope="text"
      :columns="innerColumns"
      :data-source="innerData"
      :pagination="false"
      bordered
    />
  </a-table>
</template>
<script>
import { findAllClass } from "@/services/class";
import { findByClassId } from "@/services/classTable";
const columns = [{ title: "班级名称", dataIndex: "className" }];
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
    };
  },
  created() {
    findAllClass().then((res) => (this.data = res.data));
  },
  methods: {
    handleExpand(expanded, { classID: id }) {
      if (expanded) {
        findByClassId(id).then((res) => (this.innerData = res.data));
      }
    },
  },
};
</script>
