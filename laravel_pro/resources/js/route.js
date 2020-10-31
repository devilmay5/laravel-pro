import Vue from 'vue'
import Router from 'vue-router'
import ExampleComponent from './components/ExampleComponent.vue'
import Test from './components/Test.vue'
import H1 from './components/H1.vue';
import H2 from './components/H2.vue';

let router = {
    routes: [
        {
            path: '/',
            component: ExampleComponent
        },
        {
            path: '/test',
            name:'test',
            component: Test,
            children:[
                {path: '/h1', name: 'H1', component: H1},
                {path: '/h2', name: 'H2', component: H2},
            ]
        },
    ]
};

export default router;
