CREATE DATABASE learning_system;
USE learning_system;

-- bang student
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_fullname VARCHAR(100) NOT NULL,
    student_datebirth DATE,
    student_email VARCHAR(255) UNIQUE
);

-- bang teacher
CREATE TABLE teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_fullname VARCHAR(100) NOT NULL,
    teacher_email VARCHAR(255) UNIQUE
);

-- bang khoa hoc
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    coursename VARCHAR(150) NOT NULL,
    course_description TEXT,
    number_of_sessions INT CHECK (number_of_sessions > 0),
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- bang dang ky
CREATE TABLE enrollment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- bang ket qua
CREATE TABLE score (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    midscore DECIMAL(4,2) CHECK(midscore >= 0 AND midscore <= 10),
    endscore DECIMAL(4,2) CHECK(endscore >= 0 AND endscore <= 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- add sv
INSERT INTO student(student_fullname, student_datebirth, student_email)
VALUES
('TRAN MINH QUANG', '2002-03-01', 'quang@gmail.com'),
('LE THI HOA', '2001-06-12', 'hoa@gmail.com'),
('PHAM VAN NAM', '2000-09-21', 'nam@gmail.com'),
('DO THI LAN', '2003-11-05', 'lan@gmail.com'),
('HOANG ANH TUAN', '2002-07-17', 'tuan@gmail.com');

-- add gv
INSERT INTO teacher (teacher_fullname, teacher_email)
VALUES
('NGUYEN VAN BINH', 'binh@gmail.com'),
('TRAN THI HANG', 'hang@gmail.com'),
('LE VAN SON', 'son@gmail.com'),
('PHAM THI DAO', 'dao@gmail.com'),
('HOANG VAN DUC', 'duc@gmail.com');

-- add khóa hoc
INSERT INTO course (coursename, course_description, number_of_sessions, teacher_id)
VALUES
('MYSQL CO BAN', 'HOC CO BAN VE MYSQL', 20, 1),
('JAVASCRIPT CO BAN', 'LAP TRINH JS TU CO BAN', 22, 2),
('PYTHON FOUNDATION', 'NHAP MON PYTHON', 18, 3),
('JAVA CORE PROGRAMMING', 'LAP TRINH JAVA', 24, 4),
('REACTJS FRONTEND', 'XAY DUNG WEB VOI REACT', 18, 5);

-- dang ky
INSERT INTO enrollment (student_id, course_id)
VALUES
(1,2),
(2,3),
(3,4),
(4,5),
(5,1);

-- diem
INSERT INTO score (student_id, course_id, midscore, endscore)
VALUES
(1,2,7.5,8.0),
(2,3,9.0,9.5),
(3,4,6.0,7.0),
(4,5,8.5,8.75),
(5,1,5.5,6.25);

-- cap nhat
UPDATE student
SET student_email = 'updated@gmail.com'
WHERE student_id = 3;

UPDATE course
SET course_description = 'KHOA HOC CAP NHAT'
WHERE course_id = 5;

UPDATE score
SET endscore = 10
WHERE student_id = 1 AND course_id = 2;

-- xoa
DELETE FROM enrollment
WHERE student_id = 5 AND course_id = 1;

DELETE FROM score
WHERE student_id = 3 AND course_id = 4;

-- truy van
SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM score;
