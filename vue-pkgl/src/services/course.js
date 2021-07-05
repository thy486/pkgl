import axios from "./axios";

export async function findAllCourse() {
  return await axios.get("/course").then((res) => res);
}

export async function addCourse({ name = "" } = {}) {
  return await axios({
    url: "/course",
    method: "post",
    data: { name },
  }).then((res) => res);
}

export async function findByName() {
  return await axios.get("/course/findByName").then((res) => res);
}

export async function findById(id) {
  return await axios.get(`/course/${id}`).then((res) => res);
}

export async function updateCourse({ courseID = 0, name = "" } = {}) {
  return await axios({
    url: "/course/update",
    method: "post",
    data: { courseID, name },
  }).then((res) => res);
}

export async function deleteCourse(id) {
  return await axios.delete(`/course/${id}`).then((res) => res);
}
