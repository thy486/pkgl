<template>
    <div id="app">
        <template v-if="$cookies.get('name')">
            <header>
                <Header/>
            </header>
            <a-row class="main">
                <a-col :span="isCollapsed?2:3" style="transition: all .3s ease-out;">
                    <Aside @handleCollapsed="handleCollapsed"/>
                </a-col>
                <a-col :span="isCollapsed?22:21" style="transition: all .3s ease-out;padding: 30px;height: 95vh;overflow: auto;">
                    <router-view/>
                </a-col>
            </a-row>
        </template>
        <template v-else>
            <router-view/>
        </template>
    </div>
</template>

<script>
import Login from "@/views/login/Login";
import Header from "@/components/Header";
import Aside from "@/components/Aside";

export default {
    name: "Home",
    components: {
        Aside,
        Login,
        Header,
    },
    data: () => ({
        isCollapsed: false
    }),
    methods: {
        handleCollapsed(isCollapsed) {
            this.isCollapsed = isCollapsed;
        }
    },
    beforeCreate() {
        const name = this.$cookies.get('name');
        if(!name){
            this.$router.push('/vue/login');
        }
    }
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    user-select: none;
}

html, body {
    width: 100%;
    height: 100%;
}
header {
    width: 100%;
    background-color: #000;
    height: 60px;
}

.main {
    position: fixed;
    top: 60px;
    left: 0;
    bottom: 0;
    right: 0;
}
</style>