/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import VueRouter from 'vue-router';
Vue.use(VueRouter);

import routers from './route';

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

//Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// const app = new Vue({
//     el: '#app',
// });


// 路由配置
// const RouterConfig = {
//     routes: [
//         // ExampleComponent laravel默认的示例组件
//         { path: '/', component: require('./components/ExampleComponent.vue') },
//     ]
// };
// const router = new VueRouter(RouterConfig);
// const router = new VueRouter({
//     routers
// })
//const app = new Vue({
//     el: '#app',
//     router: router,
//     template: "<div>这是laravel+vue的项目</div>"
// });

// let router = new VueRouter({
//     routes: [
//         //一个个对象
//         { path: '/', component: ExampleComponent }
//     ]
// });s

let router = new VueRouter(routers);
new Vue({
    el: '#app',
    router,
});

