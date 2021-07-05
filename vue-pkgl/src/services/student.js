import axios from "./axios";
export function findAllStudent() {
  return axios.get("/student").then((res) => res);
}

export async function addStudent({
  birthday = "",
  classID = 0,
  name = "",
  sex = "",
} = {}) {
  return await axios({
    url: "/student",
    method: "post",
    data: { birthday, classID, name, sex },
  }).then((res) => res);
}

export async function findStudent({
  studentID = 0,
  classID = 0,
  name = "",
  sex = "",
} = {}) {
  return await axios({
    url: "/student/find",
    method: "post",
    data: { studentID, classID, name, sex },
  }).then((res) => res);
}
// body: JSON.stringify({
//   studentID: +studentID,
//   classID: +classID,
//   name,
//   sex,
// }),

export async function findByName(name) {
  return await axios.get(`/student/findByName?name=${name}`).then((res) => res);
}

export async function updateStudent({
  studentID = 0,
  birthday = "",
  classID = 0,
  name = "",
  sex = "",
} = {}) {
  return await axios({
    url: "/student/update",
    method: "post",
    data: { studentID, birthday, classID, name, sex },
  }).then((res) => res);
}

export async function findById(id) {
  return await axios.get(`/student/${id}`).then((res) => res);
}

export async function deleteStudent(id) {
  return await axios.delete(`/student/${id}`).then((res) => res);
}
