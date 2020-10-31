import axios from 'axios'
export default {
    // 首页接口
    getUser: function (params) {
        return axios.post('api/index/get-pro-list',params)
    },
}
