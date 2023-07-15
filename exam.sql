CREATE TABLE deans (
  dean_id SERIAL PRIMARY KEY,
  dean_name VARCHAR(30),
  dean_surname VARCHAR(30)
);

CREATE TABLE faculty (
	faculty_id SERIAL PRIMARY KEY,
	faculty_name VARCHAR(40)
);

CREATE TABLE deans_bridge (
	deans_bridge_id SERIAL PRIMARY KEY,
	dean_id INT REFERENCES deans(dean_id),
	faculty_id INT REFERENCES faculty(faculty_id)
);

CREATE TABLE course (
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(40)
);

CREATE TABLE course_level (
	cs_level INT,
	course_id INT
);

CREATE TABLE subjects (
	subject_id SERIAL PRIMARY KEY,
	subject_name VARCHAR
);

CREATE TABLE lecturer (
	lecturer_id SERIAL PRIMARY KEY,
	lecturer_name VARCHAR(25),
	lecturer_surname VARCHAR(25)
);

CREATE TABLE sbj_lect_bridge (
	sbj_lect_bridge_id SERIAL PRIMARY KEY,
	lecturer_id INT REFERENCES lecturer(lecturer_id),
	subject_id INT REFERENCES subjects(subject_id)
);

CREATE TABLE study_plan (
	study_plan_id SERIAL PRIMARY KEY,
	sbj_lect_bridge_id INT REFERENCES sbj_lect_bridge(sbj_lect_bridge_id),
	subject_count INT,
	subject_price INT
);

CREATE TABLE fac_course_bg (
	fac_course_bg SERIAL PRIMARY KEY,
	course_id INT REFERENCES course(course_id),
	faculty_id INT REFERENCES faculty(faculty_id),
	study_plan_id INT REFERENCES study_plan(study_plan_id)
);

CREATE TABLE extra_course (
	extra_course_id SERIAL PRIMARY KEY,
	extra_course_name VARCHAR(30),
	extra_course_price INT
);

CREATE TABLE students (
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(20),
	student_surname VARCHAR(25)
);

CREATE TABLE student_bridge (
	student_bridge_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES students(student_id),
	extra_course_id INT REFERENCES extra_course(extra_course_id)
);

CREATE TABLE exams (
	exam_id SERIAL PRIMARY KEY,
	exam_grade INT
);

CREATE TABLE exams_bridge (
	exams_bridge_id SERIAL PRIMARY KEY,
	exam_id INT REFERENCES exams(exam_id),
	study_plan_id INT REFERENCES study_plan(study_plan_id),
	student_id INT REFERENCES students(student_id)
);

INSERT INTO deans (dean_name, dean_surname)
VALUES ('Karen', 'javadyan'),
	('Eduard', 'Ghazaryan'),
	('Armen', 'Sandrosyan');

INSERT INTO faculty (faculty_name)
VALUES ('Philology'),
	('Economocs'),
	('Radiopfysics');

INSERT INTO deans_bridge (dean_id, faculty_id)
VALUES (1, 1),
	(2, 2),
	(3, 3);

INSERT INTO course (course_name)
VALUES ('Armenian Language and Litreture'),
	('Financial Management'),
	('Accounting and Auting'),
	('Radiophysics and Electronics'),
	('Telecomunications and Signal Processing');

INSERT INTO course_level (cs_level, course_id)
VALUES (1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(4, 3);

INSERT INTO subjects (subject_name)
VALUES ('Armenian'),
	('Armenian Literature'),
	('English'),
	('Theory of Economics'),
	('Marketing'),
	('Math'),
	('Accounting'),
	('Phylosophy'),
	('Informatics'),
	('Physics'),
	('Data Analisis'),
	('Semiconductors'),
	('Probability Theory'),
	('Microelectronics'),
	('Sensoria');

INSERT INTO lecturer (lecturer_name, lecturer_surname)
VALUES ('Karine', 'Gevorgyan'),
	('Narine', 'Sahakyan'),
	('Nona', 'Gasparyan'),
	('Aram', 'Grigoryan'),
	('Armine', 'Bakhshyan'),
	('Gagik', 'babayan'),
	('Anna', 'Bayadyan'),
	('Hakob', 'hakobjanyan'),
	('Gayane', 'Arosyan'),
	('Mher', 'Nersisyan'),
	('Lusine', 'Aramyan'),
	('Narek', 'Tumanyan'),
	('Ashot', 'Sandrosyan'),
	('Gohar', 'Harutyunyan'),
	('Vahe', 'Silikyan');

INSERT INTO sbj_lect_bridge (lecturer_id, subject_id)
VALUES (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15);

INSERT INTO study_plan (sbj_lect_bridge_id, subject_count, subject_price)
VALUES (1, 46, 3100),
	(2, 36, 3700),
	(3, 54, 3800),
	(4, 60, 4200),
	(5, 68, 3900),
	(6, 58, 3850),
	(7, 60, 2890),
	(8, 28, 4600),
	(9, 38, 3350),
	(10, 70, 3400),
	(11, 64, 2900),
	(12, 36, 3650),
	(13, 62, 2600),
	(14, 48, 3640),
	(15, 45, 3400);

INSERT INTO fac_course_bg (course_id, faculty_id, study_plan_id)
VALUES (1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 1, 4),
	(5, 2, 5),
	(1, 3, 6),
	(2, 1, 7),
	(3, 2, 8),
	(4, 3, 9),
	(5, 1, 10),
	(1, 2, 11),
	(2, 3, 12),
	(3, 1, 13),
	(4, 2, 14),
	(5, 3, 15);

INSERT INTO extra_course (extra_course_name, extra_course_price)
VALUES ('Spanish', 19000),
	('German', 21000),
	('French', 22000);

INSERT INTO students (student_name, student_surname)
VALUES ('Sona', 'Davtyan'),
	('Yuri', 'Khachatryan'),
	('Andranik', 'Samsonyan'),
	('Hayk', 'Gharamanyan'),
	('Gor', 'Hovhannisyan'),
	('Mika', 'Aydinyan'),
	('Hakob', 'Injikushyan'),
	('Liana', 'Kalpakchyan'),
	('Anush', 'Yerznkyan'),
	('Erik', 'Grigoryan'),
	('Armen', 'Khachatryan'),
	('Arshak', 'Kerimyan'),
	('Ruben', 'Kostanyan'),
	('Artur', 'Babayan'),
	('Sahak', 'Sargsyan'),
	('Samvel', 'Shegiyan'),
	('Gor', 'Titanyan'),
	('Davit', 'Arakelov'),
	('Levon', 'Yenokyan'),
	('Arsen', 'Erkoyan'),
	('Arman', 'Erkoyan'),
	('Eduard', 'Baghdasaryan'),
	('Susanna', 'Baroyan'),
	('Ararat', 'Tshzmachyan'),
	('Samvel', 'Hovhannisyan'),
	('Davit', 'Aleksanyan'),
	('Lidia', 'Ayvazyan'),
	('Hasmik', 'Manukyan'),
	('Artak', 'Hovsepyan'),
	('Husik', 'Hovhannisyan');
	
INSERT INTO student_bridge (student_id, extra_course_id)
VALUES (1, 1),
	(2, 2),
	(3, 3),
	(4, 1),
	(5, 2),
	(6, 3),
	(7, 1),
	(8, 2),
	(9, 3),
	(10, 1),
	(11, 2),
	(12, 3),
	(13, 1),
	(14, 2),
	(15, 3),
	(16, 1),
	(17, 2),
	(18, 3),
	(19, 1),
	(20, 2),
	(21, 3),
	(22, 1),
	(23, 2),
	(24, 3),
	(25, 1),
	(26, 2),
	(27, 3),
	(28, 1),
	(29, 2),
	(30, 3);

INSERT INTO exams (exam_grade)
VALUES
 (18),
	(17),
	(19),
	(15),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(15),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(9),
	(10),
	(10),
	(11),
	(12),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(15),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(9),
	(10),
	(10),
	(11),
	(12),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(15),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(9),
	(10),
	(10),
	(11),
	(12),
	(14),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7),
	(8),
	(9),
	(10),
	(13),
	(12),
	(11),
	(10),
	(9),
	(8),
	(7);

INSERT INTO exams_bridge (exam_id, study_plan_id, student_id)
VALUES 
	(1, 1, 1),
	(2, 1, 1),
	(3, 1, 1),
	(4, 1, 1),
	(5, 1, 1),
	(6, 2, 2),
	(7, 2, 2),
	(8, 2, 2),
	(9, 2, 2),
	(10, 2, 2),
	(11, 3, 3),
	(12, 3, 3),
	(13, 3, 3),
	(14, 3, 3),
	(15, 3, 3),
	(16, 5, 5),
	(17, 5, 5),
	(18, 5, 5),
	(19, 5, 5),
	(20, 5, 5),
	(21, 6, 6),
	(22, 6, 6), 
	(23, 6, 6),
	(24, 6, 6),
	(25, 6, 6),
	(26, 7, 7),
	(27, 7, 7),
	(28, 7, 7),
	(29, 7, 7),
	(30, 7, 7),
	(31, 8, 8),
	(32, 8, 8),
	(33, 8, 8),
	(34, 8, 8),
	(35, 8, 8),
	(36, 9, 9),
	(37, 9, 9),
	(38, 9, 9),
	(39, 9, 9),
	(40, 9, 9),
	(41, 10, 10),
	(42, 10, 10),
	(43, 10, 10),
	(44, 10, 10),
	(45, 10, 10),
	(46, 11, 11),
	(47, 11, 11),
	(48, 11, 11),
	(49, 11, 11),
	(50, 11, 11),
	(51, 12, 12),
	(52, 12, 12),
	(53, 12, 12),
	(54, 12, 12),
	(55, 12, 12),
	(56, 13, 13),
	(57, 13, 13),
	(58, 13, 13),
	(59, 13, 13),
	(60, 13, 13),
	(61, 13, 13),
	(62, 14, 14),
	(63, 14, 14),
	(64, 14, 14),
	(64, 14, 14),
	(65, 14, 14),
	(66, 15, 15),
	(67, 15, 15),
	(68, 15, 15),
	(69, 15, 15),
	(70, 15, 15),
	(71, 1, 16),
	(72, 1, 16),
	(73, 1, 16),
	(74, 1, 16),
	(75, 1, 16),
	(76, 2, 17),
	(76, 2, 17),
	(77, 2, 17),
	(78, 2, 17),
	(79, 2, 17),
	(80, 3, 18),
	(81, 3, 18),
	(82, 3, 18),
	(83, 3, 18),
	(84, 3, 18),
	(85, 4, 19),
	(86, 4, 19),
	(87, 4, 19),
	(88, 4, 19),
	(89, 4, 19),
	(90, 5, 20),
	(91, 5, 20),
	(92, 5, 20),
	(93, 5, 20),
	(94, 5, 20),
	(95, 6, 21),
	(96, 6, 21),
	(97, 6, 21),
	(98, 6, 21),
	(99, 6, 21),
	(100, 7, 22),
	(101, 7, 22),
	(102, 7, 22),
	(103, 7, 22),
	(104, 7, 22),
	(105, 8, 23),
	(106, 8, 23),
	(107, 8, 23),
	(108, 8, 23),
	(109, 8, 23),
	(110, 9, 24),
	(111, 9, 24),
	(112, 9, 24),
	(113, 9, 24),
	(114, 9, 24),
	(116, 10, 25),
	(117, 10, 25),
	(118, 10, 25),
	(119, 10, 25),
	(120, 10, 25),
	(121, 11, 26),
	(122, 11, 26),
	(123, 11, 26),
	(124, 11, 26),
	(125, 11, 26),
	(126, 12, 27),
	(127, 12, 27),
	(128, 12, 27),
	(129, 12, 27),
	(130, 12, 27),
	(131, 13, 28),
	(132, 13, 28),
	(133, 13, 28),
	(134, 13, 28),
	(135, 13, 28),
	(137, 14, 29),
	(138, 14, 29),
	(139, 14, 29),
	(140, 14, 29),
	(141, 14, 29),
	(142, 15, 30),
	(143, 15, 30),
	(144, 15, 30),
	(145, 15, 30),
	(146, 15, 30);
 
1)
SELECT c.course_name, SUM(sp.subject_price*sp.subject_count) AS course_fee
FROM course c
JOIN fac_course_bg fcb ON c.course_id = fcb.course_id
JOIN study_plan sp ON fcb.study_plan_id = sp.study_plan_id
GROUP BY c.course_id, c.course_name;

2)
SELECT SUM(study_plan.subject_count * study_plan.subject_price) AS study_plan_income,
       SUM(extra_course.extra_course_price) AS extra_course_income,
       SUM(study_plan.subject_count * study_plan.subject_price) + SUM(extra_course.extra_course_price) AS total_income
FROM study_plan
JOIN fac_course_bg ON study_plan.study_plan_id = fac_course_bg.study_plan_id
JOIN extra_course ON fac_course_bg.course_id = extra_course.extra_course_id;

3)
SELECT s.student_name, s.student_surname, c.course_name, f.faculty_name, su.subject_name, e.exam_grade,
  CASE
    WHEN e.exam_grade >= 8 THEN 'adequate'
    ELSE 'liquid'
  END AS comment
FROM
  exams_bridge eb
  JOIN students s ON eb.student_id = s.student_id
  JOIN study_plan sp ON eb.study_plan_id = sp.study_plan_id
  JOIN sbj_lect_bridge slb ON sp.sbj_lect_bridge_id = slb.sbj_lect_bridge_id
  JOIN subjects su ON slb.subject_id = su.subject_id
  JOIN fac_course_bg fcb ON sp.study_plan_id = fcb.study_plan_id
  JOIN course c ON fcb.course_id = c.course_id
  JOIN faculty f ON fcb.faculty_id = f.faculty_id
  JOIN exams e ON eb.exam_id = e.exam_id;

4)
SELECT s.student_id, s.student_name, s.student_surname, e.exam_grade
FROM students s
INNER JOIN exams_bridge eb ON eb.student_id = s.student_id
INNER JOIN exams e ON e.exam_id = eb.exam_id
WHERE e.exam_grade >= 8;

5)
SELECT s.student_name, f.faculty_name, AVG(e.exam_grade) AS average_grade
FROM students s
JOIN exams_bridge eb ON s.student_id = eb.student_id
JOIN study_plan sp ON eb.study_plan_id = sp.study_plan_id
JOIN fac_course_bg fcb ON sp.study_plan_id = fcb.study_plan_id
JOIN faculty f ON fcb.faculty_id = f.faculty_id
JOIN exams e ON eb.exam_id = e.exam_id
GROUP BY s.student_id, f.faculty_id
HAVING AVG(e.exam_grade) = (
    SELECT MAX(avg_grade)
    FROM (
        SELECT AVG(exam_grade) AS avg_grade
        FROM exams_bridge eb
        JOIN exams e ON eb.exam_id = e.exam_id
        GROUP BY eb.student_id, eb.study_plan_id
    ) AS subquery
)
OR AVG(e.exam_grade) = (
    SELECT MIN(avg_grade)
    FROM (
        SELECT AVG(exam_grade) AS avg_grade
        FROM exams_bridge eb
        JOIN exams e ON eb.exam_id = e.exam_id
        GROUP BY eb.student_id, eb.study_plan_id
    ) AS subquery
)
ORDER BY f.faculty_name, average_grade DESC;

6)
SELECT
  s.student_id,
  s.student_name,
  s.student_surname,
  COALESCE(sp.subject_price*sp.subject_count, 0) AS payment_per_year,
  COALESCE(ec.extra_course_price, 0) AS extra_course_payment,
  COALESCE(sp.subject_price*sp.subject_count, 0) + COALESCE(ec.extra_course_price, 0) AS total_payment
FROM
  students s
LEFT JOIN
  student_bridge sb ON s.student_id = sb.student_id
LEFT JOIN
  extra_course ec ON sb.extra_course_id = ec.extra_course_id
LEFT JOIN
  fac_course_bg fcb ON fcb.faculty_id = sb.extra_course_id
LEFT JOIN
  study_plan sp ON sp.study_plan_id = fcb.study_plan_id;

