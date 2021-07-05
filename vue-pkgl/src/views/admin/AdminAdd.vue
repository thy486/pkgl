<template>
    <a-form layout="vertical" :form="form" @submit="handleSubmit" style="width:500px;margin: 80px auto;">
        <a-form-item
            :validate-status="userNameError() ? 'error' : ''"
            :help="userNameError() || ''"
        >
            <a-input
                v-decorator="[
            'name',
            {
              rules: [
                { required: true, message: '请输入账号！' },
              ],
            },
          ]">
                <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)"/>
            </a-input>
        </a-form-item>
        <a-form-item
            :validate-status="passwordError() ? 'error' : ''"
            :help="passwordError() || ''"
        >
            <a-input
                v-decorator="[
            'pwd',
            {
              rules: [
                { required: true, message: '请输入密码！' },
              ],
            },
          ]"
                type="password"
            >
                <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)"/>
            </a-input>
        </a-form-item>
        <a-form-item>
            <a-button
                type="primary"
                html-type="submit"
                style="width: 130px;margin-right: 10px;"
                :disabled="hasErrors(form.getFieldsError())"
            >
                添加管理员
            </a-button>
            <a-button html-type="reset" style="width: 130px;">
                重置
            </a-button>
        </a-form-item>
    </a-form>
</template>

<script>
import {add} from '@/services/admin';

function hasErrors(fieldsError) {
    return Object.keys(fieldsError).some((field) => fieldsError[field]);
}

export default {
    data() {
        return {
            hasErrors,
            form: this.$form.createForm(this, {name: "vertical_add"}),
        };
    },
    mounted() {
        this.$nextTick(() => {
            this.form.validateFields();
        });
    },
    methods: {
        userNameError() {
            const {getFieldError, isFieldTouched} = this.form;
            return isFieldTouched("name") && getFieldError("name");
        },
        passwordError() {
            const {getFieldError, isFieldTouched} = this.form;
            return isFieldTouched("pwd") && getFieldError("pwd");
        },
        handleSubmit(e) {
            e.preventDefault();
            this.form.validateFields(async (err, values) => {
                if (!err) {
                    const {status} = await add(values);
                    if (status === 200) {
                        this.$message.success("添加成功!", 1);
                    } else {
                        this.$message.error("该管理员账号已存在!", 2);
                        return false;
                    }
                }
            });
        },
    },
};
</script>