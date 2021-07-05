<template>
    <div>
        <a-button type="primary" >
            <router-link to="/vue/courseAdd">添加</router-link>
        </a-button>
        <a-table size="small" :columns="columns" :data-source="data" bordered :pagination="true">
            <template slot="action" slot-scope="text, record">
                <a-button type="primary">
                    <router-link :to='`/vue/courseEdit/${record.courseID}`'>编辑</router-link>
                </a-button>&nbsp;
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
import {deleteCourse,findAllCourse} from '@/services/course';
const columns = [
    {
        title: '课程名称',
        dataIndex: 'name',
        align: "center"
    },
    {
        title: '操作',
        dataIndex: 'action',
        align: "center",
        scopedSlots: { customRender: 'action' },
    },
];
export default {
    data() {
        return {
            data: [],
            columns,
        };
    },
    created() {
        findAllCourse().then(res=>{
            this.data = res.data;
        });
    },
    methods: {
        async onDelete({courseID:id}){
            const data = [...this.data];
            this.data = data.filter(item => item.courseID !== id);
            const result = await deleteCourse(id);
            if (result.status === 200) {
                this.$message.success("删除课程成功!", 1);
                history.go(0);
            } else {
                this.$message.error("删除课程失败!", 2);
            }
        }
    }
};
</script>

<style scoped>

</style>