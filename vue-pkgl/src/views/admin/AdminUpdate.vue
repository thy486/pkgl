<template>
    <a-form :form="form" @submit="handleSubmit" style="width: 70%;margin-left: 30px;margin-top: 80px;">
        <a-form-item v-bind="formItemLayout" label="账号">
            <a-input
                v-decorator="[
          'name',
          {
            rules: [
              {
                required: true,
                message: '请输入你的账号!',
              }
            ],
          },
        ]"
            />
        </a-form-item>
        <a-form-item v-bind="formItemLayout" label="旧密码" has-feedback>
            <a-input
                v-decorator="[
          'pwd',
          {
            rules: [
              {
                required: true,
                message: '请输入你的旧密码!',
              },
              {
                validator: validateToNextPassword,
              },
            ],
          },
        ]"
                type="password"
            />
        </a-form-item>
        <a-form-item v-bind="formItemLayout" label="新密码" has-feedback>
            <a-input
                v-decorator="[
          'newPwd',
          {
            rules: [
              {
                required: true,
                message: '请输入你的新密码!',
              },
              {
                validator: validateToNextPassword,
              },
            ],
          },
        ]"
                type="password"
            />
        </a-form-item>
        <a-form-item v-bind="formItemLayout" label="确认密码" has-feedback>
            <a-input
                v-decorator="[
          'confirm',
          {
            rules: [
              {
                required: true,
                message: '请确认你的密码!',
              },
              {
                validator: compareToFirstPassword,
              },
            ],
          },
        ]"
                type="password"
                @blur="handleConfirmBlur"
            />
        </a-form-item>
        <a-form-item v-bind="tailFormItemLayout">
            <a-button type="primary" html-type="submit">
                修改密码
            </a-button>
            <a-button html-type="reset">
                重置
            </a-button>
        </a-form-item>
    </a-form>
</template>

<script>
import {update} from "@/services/admin";
import {login} from "@/services/login";

export default {
    data() {
        return {
            confirmDirty: false,
            formItemLayout: {
                labelCol: {
                    xs: {span: 24},
                    sm: {span: 8},
                },
                wrapperCol: {
                    xs: {span: 24},
                    sm: {span: 16},
                },
            },
            tailFormItemLayout: {
                wrapperCol: {
                    xs: {
                        span: 24,
                        offset: 0,
                    },
                    sm: {
                        span: 16,
                        offset: 8,
                    },
                },
            },
        };
    },
    beforeCreate() {
        this.form = this.$form.createForm(this, {name: 'update_pwd'});
    },
    methods: {
        handleSubmit(e) {
            e.preventDefault();
            this.form.validateFieldsAndScroll(async (err, values) => {
                if (!err) {
                    const {name,pwd,newPwd} = values;
                    const loginRes = await login({name,pwd});
                    if (loginRes.status===200){
                        const updateRes = await update({name,pwd:newPwd});
                        if (updateRes.status===200){
                            this.$message.success("修改密码成功!",1);
                        }
                    }else {
                        this.$message.error("原账号或密码输入有误!",2);
                        return false;
                    }
                }
            });
        },
        handleConfirmBlur(e) {
            const value = e.target.value;
            this.confirmDirty = this.confirmDirty || !!value;
        },
        compareToFirstPassword(rule, value, callback) {
            const form = this.form;
            if (value && value !== form.getFieldValue('newPwd')) {
                callback('两次输入密码不一致!');
            } else {
                callback();
            }
        },
        validateToNextPassword(rule, value, callback) {
            const form = this.form;
            if (value && this.confirmDirty) {
                form.validateFields(['confirm'], {force: true});
            }
            callback();
        }
    },
};
</script>