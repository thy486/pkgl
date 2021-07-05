import axios from "./axios";

export async function findAllClass() {
  return await axios.get("/class").then((res) => res);
}

export async function addClass({ className = "" } = {}) {
  return await axios({
    url: "/class",
    method: "post",
    data: { className },
  }).then((res) => res);
}

export async function findClass(id) {
  return await axios.get(`/class/course/${id}`).then((res) => res);
}

export async function updateClass({ classID = 0, className = "" } = {}) {
  return await axios({
    url: "/class.update",
    method: "post",
    data: { classID, className },
  }).then((res) => res);
}

export async function findById(id) {
  return await axios.get(`/class/${id}`).then((res) => res);
}

export async function deleteClass(id) {
  return await axios.delete(`/class/${id}`).then((res) => res);
}
