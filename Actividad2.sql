CREATE SCHEMA IF NOT EXISTS db_class2;
USE db_class2;
CREATE TABLE IF NOT EXISTS teacher(
id INT PRIMARY KEY,
teacher_name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS student(
id INT PRIMARY KEY,
student_name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS course(
id INT PRIMARY KEY,
course_name VARCHAR(45) NOT NULL,
id_teacher INT NOT NULL,
CONSTRAINT fk_course_teacher FOREIGN KEY (id_teacher) REFERENCES teacher(id)
);

CREATE TABLE IF NOT EXISTS student_course(
student_id INT NOT NULL,
course_id INT NOT NULL,
CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student(id),
CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES course(id)
);