<template>
    <div>
        {{username}}-{{id}}
        <router-view></router-view>
    </div>

</template>

<script>
    export default {
        name: "Test",
        data: function () {
            return {
                'username': '我是你爸爸',
                'id': '1'
            }
        },
        created() {
            console.log(this.$route.params)
            this.$data.username = this.$route.params.username;
            this.$data.id = this.$route.params.id;
            console.log(this.$data)
        }
    }
</script>

<style scoped>

</style>
