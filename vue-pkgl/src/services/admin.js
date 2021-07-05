import axios from "./axios";
export function add({ name = "", pwd = "" } = {}) {
  return axios({
    url: "/admin/add",
    method: "post",
    data: { name, pwd },
  }).then((res) => res);
}

export async function update({ name = "", pwd = "" } = {}) {
  return await axios({
    url: "/admin/update",
    method: "post",
    data: { name, pwd },
  }).then((res) => res);
}
