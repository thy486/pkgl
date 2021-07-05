export default [
  {
    path: "/vue/login",
    name: "login",
    component: () => import("@/views/login/Login"),
  },
  { path: "/", redirect: "/vue" },
  {
    path: "/vue",
    name: "home",
    component: () => import("@/views/Home"),
  },
  {
    path: "/vue/teacher",
    name: "teacher",
    component: () => import("@/views/teacher/TeacherManage"),
  },
  {
    path: "/vue/teacherAdd",
    name: "teacherAdd",
    component: () => import("@/views/teacher/TeacherAdd"),
  },
  {
    path: "/vue/teacherEdit/:id",
    name: "teacherEdit",
    component: () => import("@/views/teacher/TeacherEdit"),
  },
  {
    path: "/vue/student",
    name: "student",
    component: () => import("@/views/student/StudentManage"),
  },
  {
    path: "/vue/studentAdd",
    name: "studentAdd",
    component: () => import("@/views/student/StudentAdd"),
  },
  {
    path: "/vue/studentEdit/:id",
    name: "studentEdit",
    component: () => import("@/views/student/StudentEdit"),
  },
  {
    path: "/vue/course",
    name: "course",
    component: () => import("@/views/course/CourseManage"),
  },
  {
    path: "/vue/courseAdd",
    name: "courseAdd",
    component: () => import("@/views/course/CourseAdd"),
  },
  {
    path: "/vue/courseEdit/:id",
    name: "courseEdit",
    component: () => import("@/views/course/CourseEdit"),
  },
  {
    path: "/vue/admin/update",
    name: "adminUpdate",
    component: () => import("@/views/admin/AdminUpdate"),
  },
  {
    path: "/vue/admin/add",
    name: "adminAdd",
    component: () => import("@/views/admin/AdminAdd"),
  },
  {
    path: "/vue/class",
    name: "class",
    component: () => import("@/views/class/ClassManage"),
  },
  {
    path: "/vue/classAdd",
    name: "classAdd",
    component: () => import("@/views/class/ClassAdd"),
  },
  {
    path: "/vue/classEdit/:id",
    name: "classEdit",
    component: () => import("@/views/class/ClassEdit"),
  },
  {
    path: "/vue/courseTableClass",
    name: "courseTableClassroom",
    component: () => import("@/views/courseTable/courseTableClass"),
  },
  {
    path: "/vue/courseTableTeacher",
    name: "courseTableTeacher",
    component: () => import("@/views/courseTable/courseTableTeacher"),
  },
  {
    path: "*",
    component: () => import("@/views/NotFound"),
  },
];
