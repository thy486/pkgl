import axios from "./axios";

export async function findAllTeacher() {
  return await axios.get("/teacher").then((res) => res);
}

export async function addTeacher({ age = 0, name = "", sex = "" } = {}) {
  return await axios({
    url: "/teacher",
    method: "post",
    data: { age, name, sex },
  }).then((res) => res);
}

export async function findCourse(id) {
  return await axios.get(`/teacher/course/${id}`).then((res) => res);
}

export async function find({
  teacherID = 0,
  age = 0,
  name = "",
  sex = "",
} = {}) {
  return await axios({
    url: "/teacher/find",
    method: "post",
    data: { teacherID, age, name, sex },
  }).then((res) => res);
}

export async function findByName(name) {
  return await axios.get(`/teacher/findByName?name=${name}`).then((res) => res);
}

export async function updateTeacher({
  teacherID = 0,
  age = 0,
  name = "",
  sex = "",
} = {}) {
  return await axios({
    url: "/teacher/update",
    method: "post",
    data: { teacherID, age, name, sex },
  }).then((res) => res);
}

export async function findById(id) {
  return await axios.get(`/teacher/${id}`).then((res) => res);
}

export async function deleteTeacher(id) {
  return await axios.delete(`/teacher/${id}`).then((res) => res);
}
