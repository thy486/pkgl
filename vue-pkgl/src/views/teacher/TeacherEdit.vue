<template>
    <div>
        <a-button type="primary">
            <router-link to="/vue/teacher">返回管理主页</router-link>
        </a-button>
        <a-form-model ref="ruleForm" :model="ruleForm" :rules="rules" v-bind="layout">
            <a-form-model-item has-feedback label="姓名" prop="name">
                <a-input v-model="ruleForm.name" type="text" autocomplete="off"/>
            </a-form-model-item>
            <a-form-model-item has-feedback label="性别" prop="sex">
                <a-radio-group v-model="ruleForm.sex">
                    <a-radio value="男">男</a-radio>
                    <a-radio value="女"><span style="margin-right: 10px;">女</span></a-radio>
                </a-radio-group>
            </a-form-model-item>
            <a-form-model-item has-feedback label="年龄" prop="age">
                <a-input v-model.number="ruleForm.age"/>
            </a-form-model-item>
            <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
                <a-button type="primary" @click="submitForm('ruleForm')">
                    修改
                </a-button>
                <a-button style="margin-left: 10px" @click="resetForm('ruleForm')">
                    重置
                </a-button>
            </a-form-model-item>
        </a-form-model>
    </div>
</template>
<script>
import {addTeacher, findById,updateTeacher} from '@/services/teacher';
export default {
    data() {
        let checkPending;
        let checkAge = (rule, value, callback) => {
            clearTimeout(checkPending);
            if (!value) {
                return callback(new Error('请输入年龄'));
            }
            checkPending = setTimeout(() => {
                if (!Number.isInteger(value)) {
                    callback(new Error('请输入整数'));
                } else {
                    if (value < 20) {
                        callback(new Error('年龄必须大于20'));
                    } else {
                        callback();
                    }
                }
            }, 1000);
        };
        let validateName = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入姓名'));
            } else {
                if (this.ruleForm.name !== '') {
                    this.$refs.ruleForm.validateField('name');
                }
                callback();
            }
        };
        let validateSex = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请选择性别'));
            } else {
                if (this.ruleForm.sex !== '') {
                    this.$refs.ruleForm.validateField('sex');
                }
                callback();
            }
        };
        return {
            ruleForm: {
                name: '',
                sex: '',
                age: '',
            },
            rules: {
                name: [{validator: validateName, trigger: 'change'}],
                age: [{validator: checkAge, trigger: 'change'}],
                sex: [{validator: validateSex, trigger: 'change'}],
            },
            layout: {
                labelCol: {span: 4},
                wrapperCol: {span: 14},
            },
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate(async valid => {
                if (valid) {
                    const result = await updateTeacher(this.ruleForm);
                    if (result.status===200){
                        this.$message.success('修改成功!',2);
                        this.$router.push('/vue/teacher');
                    }
                } else {
                    this.$message.error("请重新输入!", 2);
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
    },
    mounted(){
        findById(this.$route.params.id).then(res=>{
            this.ruleForm = res.data;
        })
    }
};
</script>
