import axios from "./axios";

export async function findByClassId(id) {
  return await axios.get(`/classTable/${id}`).then((res) => res);
}

export async function findByTeacherId(id) {
  return await axios.get(`/teacherTable/${id}`).then((res) => res);
}
