<template>
    <div>
        <div>
            <a-button type="primary" >
                <router-link to="/vue/teacherAdd">添加</router-link>
            </a-button>
        </div>
        <br>
        <a-form-model layout="inline" :model="query" @submit="handleSubmit" @submit.native.prevent>
            <a-form-model-item label="工号">
                <a-input v-model="query.teacherID"/>
            </a-form-model-item>
            <a-form-model-item label="姓名">
                <a-input v-model="query.name"/>
            </a-form-model-item>
            <a-form-model-item label="性别">
                <a-radio-group v-model="query.sex">
                    <a-radio value="男">男</a-radio>
                    <a-radio value="女">女</a-radio>
                </a-radio-group>
            </a-form-model-item>
            <a-form-model-item label="年龄">
                <a-input v-model.number="query.age" type="number"/>
            </a-form-model-item>
            <a-form-model-item>
                <a-button
                    type="primary"
                    html-type="submit"
                >
                    查询
                </a-button>
            </a-form-model-item>
        </a-form-model>
        <br>
        <a-table size="small" :columns="columns" :data-source="data" bordered :pagination="true">
            <template slot="action" slot-scope="text, record">
                <a-button type="primary">
                    <router-link :to='`/vue/teacherEdit/${record.teacherID}`'>编辑</router-link>
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
import {deleteTeacher,findAllTeacher,find} from '@/services/teacher';
const columns = [
    {
        title: '工号',
        dataIndex: 'teacherID',
        align: "center"
    },
    {
        title: '姓名',
        dataIndex: 'name',
        align: "center"
    },
    {
        title: '性别',
        dataIndex: 'sex',
        align: "center"
    },
    {
        title: '年龄',
        dataIndex: 'age',
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
            query: {
                teacherID: '',
                name: '',
                sex: '',
                age: ''
            }
        };
    },
    created() {
        findAllTeacher().then(res=>{
            this.data = res.data;
        });
    },
    methods: {
        async onDelete({teacherID:id}){
            const data = [...this.data];
            this.data = data.filter(item => item.teacherID !== id);
            const result = await deleteTeacher(id);
            if (result.status === 200) {
                this.$message.success("删除老师成功!", 1);
                history.go(0);
            } else {
                this.$message.error("删除老师失败!", 2);
            }
        },
        handleSubmit(){
            find(this.query).then(res=>this.data = res.data);
        }
    }
};
</script>

<style scoped>

</style>