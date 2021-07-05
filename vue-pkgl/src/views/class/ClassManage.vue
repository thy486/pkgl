<template>
    <div>
        <a-button type="primary" >
            <router-link to="/vue/classAdd">添加</router-link>
        </a-button>
        <a-table size="small" :columns="columns" :data-source="data" bordered :pagination="true">
            <template slot="action" slot-scope="text, record">
                <a-button type="primary">
                    <router-link :to='`/vue/classEdit/${record.classID}`'>编辑</router-link>
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
import {findAllClass,deleteClass} from '@/services/class';
const columns = [
    {
        title: '班级名称',
        dataIndex: 'className',
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
        findAllClass().then(res=>{
            this.data = res.data;
        });
    },
    methods: {
        async onDelete({classID:id}){
            const data = [...this.data];
            this.data = data.filter(item => item.classID !== id);
            const result = await deleteClass(id);
            if (result.status === 200) {
                this.$message.success("删除班级成功!", 1);
                history.go(0);
            } else {
                this.$message.error("删除班级失败!", 2);
            }
        }
    }
};
</script>

<style scoped>

</style>