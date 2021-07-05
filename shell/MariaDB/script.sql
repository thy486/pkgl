create database PKGL;
use PKGL;

create table class(
                      classID int primary key auto_increment,
                      className char(20) not null
);
insert into class(className) values ('1班');
insert into class(className) values ('2班');

create table student(
                        studentID int primary key auto_increment,
                        name char(10) not null ,
                        sex char(2) ,
                        birthday date null ,
                        classID int,foreign key (classID) references class(classID)
);

INSERT INTO `student` VALUES (1, '黄平', '男', '2015-03-13', 2);
INSERT INTO `student` VALUES (2, '孔军', '女', '2001-08-10', 2);
INSERT INTO `student` VALUES (3, '常涛', '男', '2015-01-31', 2);
INSERT INTO `student` VALUES (4, '廖明', '女', '1992-06-26', 2);
INSERT INTO `student` VALUES (5, '董刚', '女', '1983-06-24', 1);
INSERT INTO `student` VALUES (6, '段艳', '男', '2004-02-20', 1);
INSERT INTO `student` VALUES (7, '尹芳', '男', '1973-04-12', 1);
INSERT INTO `student` VALUES (8, '乔丽', '女', '1980-04-09', 2);
INSERT INTO `student` VALUES (9, '梁明', '男', '1998-03-16', 2);
INSERT INTO `student` VALUES (10, '周霞', '男', '1972-07-06', 2);
INSERT INTO `student` VALUES (11, '潘超', '女', '2020-01-12', 2);
INSERT INTO `student` VALUES (12, '龚娟', '男', '2017-01-09', 2);
INSERT INTO `student` VALUES (13, '孔军', '男', '2020-08-28', 1);
INSERT INTO `student` VALUES (14, '卢明', '女', '1991-11-07', 2);
INSERT INTO `student` VALUES (15, '谢艳', '男', '2010-12-15', 1);
INSERT INTO `student` VALUES (16, '程静', '男', '1991-03-18', 2);
INSERT INTO `student` VALUES (17, '顾芳', '男', '2008-04-16', 2);
INSERT INTO `student` VALUES (18, '贾明', '女', '2008-04-07', 1);
INSERT INTO `student` VALUES (19, '史磊', '男', '1976-03-21', 1);
INSERT INTO `student` VALUES (20, '彭杰', '男', '2011-12-17', 1);
INSERT INTO `student` VALUES (21, '韩平', '男', '1971-11-24', 2);
INSERT INTO `student` VALUES (22, '李平', '女', '1978-08-14', 1);
INSERT INTO `student` VALUES (23, '孔霞', '女', '2019-02-09', 2);
INSERT INTO `student` VALUES (24, '邱霞', '女', '1987-03-02', 2);
INSERT INTO `student` VALUES (25, '石杰', '女', '1998-10-28', 1);
INSERT INTO `student` VALUES (26, '丁强', '男', '2000-07-22', 2);
INSERT INTO `student` VALUES (27, '龙超', '男', '2012-10-31', 2);
INSERT INTO `student` VALUES (28, '龙伟', '男', '2008-01-30', 2);
INSERT INTO `student` VALUES (29, '蔡涛', '男', '1990-04-08', 1);
INSERT INTO `student` VALUES (30, '马明', '女', '2002-04-13', 2);
INSERT INTO `student` VALUES (31, '田敏', '男', '1995-05-06', 1);
INSERT INTO `student` VALUES (32, '乔艳', '男', '1987-11-25', 1);
INSERT INTO `student` VALUES (33, '薛洋', '男', '1986-08-23', 2);
INSERT INTO `student` VALUES (34, '吴强', '女', '2016-08-15', 1);
INSERT INTO `student` VALUES (35, '朱平', '女', '1982-11-05', 2);
INSERT INTO `student` VALUES (36, '雷秀兰', '男', '2003-03-13', 1);
INSERT INTO `student` VALUES (37, '金敏', '女', '1972-01-29', 2);
INSERT INTO `student` VALUES (38, '乔娜', '男', '1997-12-17', 2);
INSERT INTO `student` VALUES (39, '秦伟', '男', '1980-10-23', 2);
INSERT INTO `student` VALUES (40, '汪桂英', '女', '1987-06-11', 2);
INSERT INTO `student` VALUES (41, '李平', '男', '1973-12-26', 1);
INSERT INTO `student` VALUES (42, '杨秀兰', '男', '2016-09-19', 2);
INSERT INTO `student` VALUES (43, '薛秀英', '男', '2003-05-26', 1);
INSERT INTO `student` VALUES (44, '姚军', '男', '2009-11-09', 1);
INSERT INTO `student` VALUES (45, '林磊', '男', '1997-06-11', 1);
INSERT INTO `student` VALUES (46, '邱秀英', '男', '1970-01-07', 1);
INSERT INTO `student` VALUES (47, '白芳', '女', '1976-11-19', 2);
INSERT INTO `student` VALUES (48, '乔洋', '男', '2003-10-01', 2);
INSERT INTO `student` VALUES (49, '钱涛', '男', '2012-08-26', 1);
INSERT INTO `student` VALUES (50, '郑静', '女', '1981-01-25', 1);
INSERT INTO `student` VALUES (51, '尹磊', '男', '1976-11-27', 1);
INSERT INTO `student` VALUES (52, '吴敏', '男', '1983-12-27', 1);
INSERT INTO `student` VALUES (53, '赖静', '女', '2006-07-16', 1);
INSERT INTO `student` VALUES (54, '姚霞', '女', '2011-09-02', 2);
INSERT INTO `student` VALUES (55, '傅芳', '男', '1996-08-25', 2);
INSERT INTO `student` VALUES (56, '程丽', '男', '1987-12-11', 1);
INSERT INTO `student` VALUES (57, '雷芳', '女', '1975-03-20', 2);
INSERT INTO `student` VALUES (58, '马娟', '女', '1977-08-07', 2);
INSERT INTO `student` VALUES (59, '高军', '男', '2005-10-02', 1);
INSERT INTO `student` VALUES (60, '彭刚', '女', '1983-09-24', 2);
INSERT INTO `student` VALUES (61, '蒋敏', '女', '1973-04-24', 1);
INSERT INTO `student` VALUES (62, '汤勇', '女', '1989-02-07', 1);
INSERT INTO `student` VALUES (63, '何娟', '女', '2002-12-24', 2);
INSERT INTO `student` VALUES (64, '陈涛', '女', '1999-10-20', 2);
INSERT INTO `student` VALUES (65, '梁强', '男', '1994-08-21', 2);
INSERT INTO `student` VALUES (66, '董丽', '男', '1984-12-31', 1);
INSERT INTO `student` VALUES (67, '薛秀英', '女', '2020-09-03', 2);
INSERT INTO `student` VALUES (68, '吴芳', '女', '2013-12-18', 1);
INSERT INTO `student` VALUES (69, '曾霞', '男', '1997-06-13', 1);
INSERT INTO `student` VALUES (70, '任芳', '男', '1972-09-30', 2);
INSERT INTO `student` VALUES (71, '许涛', '男', '2019-12-14', 1);
INSERT INTO `student` VALUES (72, '冯军', '女', '1984-10-13', 1);
INSERT INTO `student` VALUES (73, '叶强', '女', '1990-04-15', 1);
INSERT INTO `student` VALUES (74, '雷丽', '女', '2001-02-26', 1);
INSERT INTO `student` VALUES (75, '宋明', '女', '2001-08-24', 1);
INSERT INTO `student` VALUES (76, '文伟', '男', '1980-11-01', 2);
INSERT INTO `student` VALUES (77, '许丽', '女', '2011-07-31', 1);
INSERT INTO `student` VALUES (78, '邵勇', '女', '1990-11-30', 2);
INSERT INTO `student` VALUES (79, '魏静', '女', '2001-03-23', 2);
INSERT INTO `student` VALUES (80, '郭秀英', '女', '1992-04-10', 2);
INSERT INTO `student` VALUES (81, '赵超', '女', '1999-04-25', 1);
INSERT INTO `student` VALUES (82, '戴刚', '男', '2012-07-23', 2);
INSERT INTO `student` VALUES (83, '邵敏', '女', '1998-02-08', 1);
INSERT INTO `student` VALUES (84, '周勇', '男', '2018-10-21', 1);
INSERT INTO `student` VALUES (85, '薛超', '男', '1975-10-02', 2);
INSERT INTO `student` VALUES (86, '蒋秀英', '男', '2001-10-17', 2);
INSERT INTO `student` VALUES (87, '朱秀英', '男', '1988-06-15', 1);
INSERT INTO `student` VALUES (88, '邹杰', '男', '1979-03-24', 1);
INSERT INTO `student` VALUES (89, '易秀英', '女', '1979-02-26', 2);
INSERT INTO `student` VALUES (90, '蔡磊', '男', '1974-01-03', 1);
INSERT INTO `student` VALUES (91, '徐敏', '男', '1984-11-27', 1);
INSERT INTO `student` VALUES (92, '邓芳', '男', '2011-07-04', 1);
INSERT INTO `student` VALUES (93, '蒋静', '女', '2000-02-20', 1);
INSERT INTO `student` VALUES (94, '姚娜', '女', '1970-09-26', 1);
INSERT INTO `student` VALUES (95, '林杰', '女', '1992-10-23', 1);
INSERT INTO `student` VALUES (96, '锺涛', '男', '1982-03-26', 2);
INSERT INTO `student` VALUES (97, '孔丽', '男', '1980-04-24', 1);
INSERT INTO `student` VALUES (98, '陆涛', '男', '1994-09-26', 2);
INSERT INTO `student` VALUES (99, '宋勇', '男', '1983-01-25', 2);
INSERT INTO `student` VALUES (100, '夏桂英', '女', '1975-12-12', 1);

create table teacher(
                        teacherID int primary key auto_increment,
                        name char(10) not null ,
                        sex char(2) ,
                        age int
);
insert into teacher(name, sex, age) VALUES ('张三','男',33);
insert into teacher(name, sex, age) VALUES ('李四','女',33);
insert into teacher(name, sex, age) VALUES ('王五','男',33);
insert into teacher(name, sex, age) VALUES ('马六','男',33);
insert into teacher(name, sex, age) VALUES ('马三','男',33);
insert into teacher(name, sex, age) VALUES ('张四','男',33);
insert into teacher(name, sex, age) VALUES ('李五','男',33);
insert into teacher(name, sex, age) VALUES ('张六','男',33);


create table course(
                       courseID int primary key auto_increment,
                       name char(30)
);
insert into course(name) values ('化学');
insert into course(name) values ('生物');
insert into course(name) values ('语文');
insert into course(name) values ('数学');
insert into course(name) values ('英语');
insert into course(name) values ('地理');
insert into course(name) values ('政治');
insert into course(name) values ('物理');

create table classCourse(
                            id int  primary key auto_increment,
                            classID int,foreign key (classID) references class(classID),
                            courseID int ,foreign key (courseID) references course(courseID),
                            week tinyint unsigned comment '时间，1代表星期一，7代表星期天',
                            time tinyint unsigned comment '第几节课',
                            teacherId int,foreign key (teacherId) references teacher(teacherID)
);
#一班课表
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,1,1,1,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,2,1,2,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,3,1,3,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,4,1,4,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,5,1,5,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,6,1,6,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,7,1,7,7);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,8,2,1,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,1,2,2,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,2,2,3,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,3,2,4,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,4,2,5,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,5,2,6,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,6,2,7,6);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,7,3,1,7);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,8,3,2,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,1,3,3,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,2,3,4,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,3,3,5,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,4,3,6,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,5,3,7,5);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,6,4,1,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,7,4,2,7);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,8,4,3,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,1,4,4,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,2,4,5,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,3,4,6,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,4,4,7,4);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,8,5,1,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,1,5,2,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,2,5,3,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,3,5,4,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,4,5,5,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,5,5,6,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (1,6,5,7,6);


# 二班课表
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,1,1,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,2,1,2,7);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,4,1,3,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,4,1,4,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,5,1,5,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,8,1,6,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,7,1,7,2);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,8,2,1,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,2,2,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,2,2,3,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,5,2,4,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,2,5,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,5,2,6,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,2,7,7);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,7,3,1,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,3,2,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,3,3,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,2,3,4,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,3,3,5,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,3,6,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,5,3,7,7);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,4,1,8);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,7,4,2,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,3,4,3,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,4,4,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,2,4,5,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,4,6,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,4,4,7,5);

insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,8,5,1,1);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,1,5,2,2);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,5,5,3,3);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,3,5,4,4);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,4,5,5,5);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,7,5,6,6);
insert into classCourse(classID, courseID, week, time, teacherId) VALUES (2,6,5,7,7);



create table admin(
                      name varchar(20) primary key ,
                      pwd varchar(20)
);
insert into admin values ('admin','1');
insert into admin values ('1','1');

# 创建存储过程检测指定教师、指定节次是否有课

delimiter //  --将结束符换成//

CREATE PROCEDURE hasClass(teacherId int ,week int , time int)
BEGIN
    SELECT count(*) FROM classCourse,course
    WHERE classCourse.teacherId=teacherId
      and classCourse.week=week
      and classCourse.time=time
      and classCourse.courseID=course.courseID;

end//
 
delimiter ;   --将结束符换回;

# call hasClass(1,1,1);

# 创建存储过程生成指定班级的课程表

delimiter //  --将结束符换成//

create procedure classSchedule(classID int)
begin
    select week as 星期,time as 节次,course.name,teacher.name from classCourse,course,teacher
    where classCourse.classID=classID
      and classCourse.courseID=course.courseID
      and classCourse.teacherId=teacher.teacherID
    order by week,time;
end//
 
delimiter ;   --将结束符换回;

# call classSchedule(2);


# 创建存储过程生成指定老师的课程表

delimiter //  --将结束符换成//

create procedure teacherSchedule(teacherID int)
begin
    select week as 星期,time as 节次,course.name,class.className from classCourse,course,class
    where classCourse.teacherId=teacherID
      and classCourse.courseID=course.courseID
      and classCourse.classID=class.classID
    order by week,time;
end//
 
delimiter ;   --将结束符换回;

# call teacherSchedule(1);