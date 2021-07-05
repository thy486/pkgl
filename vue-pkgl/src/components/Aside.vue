<template>
    <div>
        <a-button type="primary" @click="toggleCollapsed" id="toggleCollapsed">
            <a-icon :type="collapsed ? 'menu-unfold' : 'menu-fold'"/>
        </a-button>
        <a-menu
            :default-selected-keys="['1']"
            mode="inline"
            theme="dark"
            style="height: 100vh;"
            :inline-collapsed="collapsed"
            @click="handleClick"
        >
            <a-menu-item key="/vue/teacher">
                <a-icon type="team"/>
                <span>教师信息管理</span>
            </a-menu-item>
            <a-menu-item key="/vue/student">
                <a-icon type="team"/>
                <span>学生信息管理</span>
            </a-menu-item>
            <a-menu-item key="/vue/course">
                <a-icon type="profile"/>
                <span>课程信息管理</span>
            </a-menu-item>
            <a-menu-item key="/vue/class">
                <a-icon type="solution"/>
                <span>班级信息管理</span>
            </a-menu-item>
            <a-sub-menu key="/vue/admin">
                <span slot="title"><a-icon type="user"/><span>系统用户管理</span></span>
                <a-menu-item key="/vue/admin/update">
                    密码管理
                </a-menu-item>
                <a-menu-item key="/vue/admin/add">
                    用户管理
                </a-menu-item>
            </a-sub-menu>
            <a-sub-menu key="/vue/courseTable">
                <span slot="title"><a-icon type="table"/><span>课程表管理</span></span>
                <a-menu-item key="/vue/courseTableClass">
                    班级课程表管理
                </a-menu-item>
                <a-menu-item key="/vue/courseTableTeacher">
                    教师课程表管理
                </a-menu-item>
            </a-sub-menu>
        </a-menu>
    </div>
</template>

<script>
export default {
    name: 'Aside',
    data() {
        return {
            collapsed: false,
        };
    },
    methods: {
        toggleCollapsed() {
            this.collapsed = !this.collapsed;
            this.$emit("handleCollapsed",this.collapsed);
        },
        handleClick({key}){
            this.$router.push(key);
        }
    },
};
</script>

<style scoped>
#toggleCollapsed{
    position: fixed;
    left: -42px;
    top: 15px;
    transition: all .3s;
}
#toggleCollapsed:hover{
    left: -15px;
}
</style>
