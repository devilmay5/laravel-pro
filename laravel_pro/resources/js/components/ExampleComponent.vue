<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Example Component</div>

                    <div class="card-body">
                        I'm an example component.
                    </div>
                    <router-link :to="{name:'test',params:{username:'jspang',id:'555'}}">Hi页面1</router-link>
                    <router-link :to="{name:'H1'}">H1页面</router-link>
                    <router-link :to="{name:'H2'}">H2页面</router-link>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    import store from '../store'
    import api from "../api";

    export default {
        data() {
            return {}
        },
        mounted() {
            console.log('Component mounted.')
            let res = this.getUser();
          //  console.log(res)
        },

        methods: {
            getUser() {
                let req = {};
                req['page_index'] = 1;
                req['page_size'] = 20;
                api.getUser(req).then(function (res) {
                    console.log(res);
                });
            }
        },
    }
</script>
