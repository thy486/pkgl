<template>
    <a-result status="404" title="404" sub-title="对不起，您访问的页面不存在!">
        <template #extra>
            <a-button type="primary">
                <router-link to="/">返回首页</router-link>
            </a-button>
        </template>
    </a-result>
</template>
<script>
export default {
    name: 'NotFound',
};
</script>
