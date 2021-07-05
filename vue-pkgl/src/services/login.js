import axios from "./axios";
export async function login({ name = "", pwd = "" } = {}) {
  return await axios({
    url: "/login",
    method: "post",
    data: { name, pwd },
  }).then((res) => res);
}

export async function logout() {
  return await axios.get("/logout").then((res) => res);
}
