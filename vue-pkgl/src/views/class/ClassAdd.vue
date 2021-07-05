<template>
    <div>
        <a-button type="primary">
            <router-link to="/vue/class">返回管理主页</router-link>
        </a-button>
        <a-form-model ref="ruleForm" :model="ruleForm" :rules="rules" v-bind="layout">
            <a-form-model-item has-feedback label="班级名称" prop="className">
                <a-input v-model="ruleForm.className" type="text" autocomplete="off" />
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
import {addClass} from '@/services/class';
export default {
    data() {
        let validateName = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入班级名称'));
            } else {
                if (this.ruleForm.name !== '') {
                    this.$refs.ruleForm.validateField('className');
                }
                callback();
            }
        };
        return {
            ruleForm: {
                className: ""
            },
            rules: {
                name: [{ validator: validateName, trigger: 'change' }],
            },
            layout: {
                labelCol: { span: 4 },
                wrapperCol: { span: 14 },
            },
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate(async valid => {
                if (valid) {
                    const result = await addClass(this.ruleForm);
                    if (result.status===200){
                        this.$message.success('添加成功!',2);
                        this.$router.push('/vue/class');
                    }
                }else{
                    this.$message.error("请重新输入!",2);
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
    },
};
</script>
