import axios from "axios";
import { message } from "ant-design-vue";
// axios默认配置
axios.defaults.timeout = 10000; // 超时时间
axios.defaults.baseURL = "/api";
axios.defaults.withCredentials = true;

// http request 拦截器
// axios.interceptors.request.use(
//   config => {
//     config.headers["Content-Type"] = "application/json;charset=UTF-8";
//     if (Cookies.get("token")) {
//       config.headers.Authorization = Cookies.get("token");
//     }
//     return config;
//   },
//   error => {
//     return Promise.reject(error.response);
//   }
// );

// http response 拦截器
axios.interceptors.response.use((response) => {
  //   console.log("axios:");
  //   console.log(response);
  if (response.data.status !== 200) {
    message.error(response.data.msg, 2);
    return Promise.reject(response);
  }
  return Promise.resolve(response.data);
});
// (error) => {
//   console.log(error);

//   if (error.response.status === 404) {
//     Message({
//       message: "请求地址出错",
//       type: "warning",
//     });
//   } else if (error.response.status === 401) {
//     Message({
//       message: error.response.data.message,
//       type: "warning",
//     });
//     Cookies.remove("access_token");
//     setTimeout(() => {
//       location.reload();
//     }, 3000);
//   } else if (error.response.status === 500) {
//     Message({
//       message: "服务器错误",
//       type: "error",
//     });
//   } else {
//     Message({
//       message: "服务器连接失败",
//       type: "error",
//     });
//   }
//   return Promise.reject(error.response); // 返回接口返回的错误信息
// };
export default axios;
