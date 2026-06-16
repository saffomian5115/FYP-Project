USE AI_Driven_SMart_LMS;
SET FOREIGN_KEY_CHECKS = 0;

USE AI_Driven_Smart_LMS;

-- =====================================================
-- SEED 01: DEPARTMENTS
-- =====================================================

INSERT INTO departments (id, name, code, description, head_of_department) VALUES
(1, 'Information Technology', 'IT',   'Department of Information Technology', NULL),
(2, 'Computer Science',       'CS',   'Department of Computer Science',       NULL),
(3, 'Business Administration','BBA',  'Department of Business Administration',NULL),
(4, 'Mathematics',            'MATH', 'Department of Mathematics',            NULL);

-- =====================================================
-- SEED 02: PROGRAMS
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO programs (id, name, code, department_id, duration_years, total_credit_hours, degree_type) VALUES
(1, 'Bachelor of Science in Information Technology', 'BSIT', 1, 4, 130, 'BS'),
(2, 'Bachelor of Science in Computer Science',       'BSCS', 2, 4, 130, 'BS'),
(3, 'Bachelor of Business Administration',           'BBA',  3, 4, 120, 'BBA'),
(4, 'Associate Degree in Information Technology',    'ADIT', 1, 2, 66,  'AD');

-- =====================================================
-- SEED 03: SEMESTERS
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO semesters (id, name, code, start_date, end_date, is_active, registration_start, registration_end, add_drop_last_date) VALUES
(1, 'Fall 2021',   'FALL-2021',   '2021-09-01', '2022-01-31', FALSE, '2021-08-15', '2021-09-10', '2021-09-20'),
(2, 'Spring 2022', 'SPRING-2022', '2022-02-01', '2022-06-30', FALSE, '2022-01-15', '2022-02-10', '2022-02-20'),
(3, 'Fall 2024',   'FALL-2024',   '2024-09-01', '2025-01-31', FALSE, '2024-08-15', '2024-09-10', '2024-09-20'),
(4, 'Spring 2025', 'SPRING-2025', '2025-02-01', '2025-06-30', TRUE,  '2025-01-15', '2025-02-10', '2025-02-20');

-- =====================================================
-- SEED 04: COURSES
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO courses (id, code, name, credit_hours, lecture_hours, lab_hours, description, department_id, program_id, semester_level, is_elective) VALUES
-- BSIT Core Courses (earlier semesters)
(1,  'IT-101', 'Introduction to Computing',           3, 3, 0, 'Basic computing concepts',                        1, 1, 1, FALSE),
(2,  'IT-102', 'Programming Fundamentals',            3, 2, 2, 'Introduction to programming with C++',            1, 1, 1, FALSE),
(3,  'IT-103', 'Calculus and Analytical Geometry',    3, 3, 0, 'Mathematical foundations',                        4, 1, 1, FALSE),
(4,  'IT-201', 'Data Structures and Algorithms',      3, 2, 2, 'Core data structures',                            1, 1, 3, FALSE),
(5,  'IT-202', 'Computer Networks',                   3, 3, 0, 'Networking fundamentals',                         1, 1, 4, FALSE),
(6,  'IT-203', 'Web Technologies',                    3, 2, 2, 'HTML, CSS, JavaScript, PHP',                      1, 1, 5, FALSE),

-- BSIT 8th Semester Courses (your class subjects)
(7,  'IT-401', 'Database Administration',             3, 2, 2, 'Advanced database administration, tuning & DBA skills', 1, 1, 8, FALSE),
(8,  'IT-402', 'OOP with Java',                       3, 2, 2, 'Object-Oriented Programming concepts using Java', 1, 1, 8, FALSE),
(9,  'IT-403', 'Software Project Management',         3, 3, 0, 'Agile, Scrum and project management methodologies',1, 1, 8, FALSE),
(10, 'IT-404', 'Final Year Project',                  3, 0, 6, 'Capstone final year project',                    1, 1, 8, FALSE),

-- BSCS Courses
(11, 'CS-101', 'Programming in C',                    3, 2, 2, 'C programming language',                         2, 2, 1, FALSE),
(12, 'CS-301', 'Operating Systems',                   3, 3, 0, 'OS concepts and design',                         2, 2, 5, FALSE);

-- ── CLOs for Database Administration ─────────────────
INSERT INTO course_clos (course_id, clo_number, description, domain, level) VALUES
(7, 'CLO-1', 'Understand database architecture and administration tasks',       'Cognitive',   'Knowledge'),
(7, 'CLO-2', 'Perform database backup, recovery, and performance tuning',       'Psychomotor', 'Application'),
(7, 'CLO-3', 'Implement user management and security in database systems',      'Psychomotor', 'Application');

-- ── CLOs for OOP with Java ────────────────────────────
INSERT INTO course_clos (course_id, clo_number, description, domain, level) VALUES
(8, 'CLO-1', 'Apply object-oriented principles: encapsulation, inheritance, polymorphism', 'Cognitive',   'Application'),
(8, 'CLO-2', 'Develop Java applications using classes, interfaces, and exceptions',        'Psychomotor', 'Application'),
(8, 'CLO-3', 'Design and implement GUI applications using Java Swing or JavaFX',           'Psychomotor', 'Synthesis');

-- ── CLOs for Software Project Management ─────────────
INSERT INTO course_clos (course_id, clo_number, description, domain, level) VALUES
(9, 'CLO-1', 'Understand Agile and Scrum methodologies',                        'Cognitive',   'Comprehension'),
(9, 'CLO-2', 'Create project plans, risk assessments and cost estimates',       'Cognitive',   'Application'),
(9, 'CLO-3', 'Manage software teams and deliver projects on schedule',          'Affective',   'Application');

-- =====================================================
-- SEED 05: ADMIN USERS
-- Password for all: Admin@123
-- bcrypt hash of "Admin@123"
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO users (id, roll_number, email, password_hash, role, is_active) VALUES
(1, NULL, 'usman.admin@bzu.edu.pk',
 '$2b$12$.B0JSpE.0aluBkNcCgcGQOzm2S6tC5hrFQKBfQfcy/RRx/6RBTEuq',
 'admin', TRUE),

(2, NULL, 'security@bzu.edu.pk',
 '$2b$12$.B0JSpE.0aluBkNcCgcGQOzm2S6tC5hrFQKBfQfcy/RRx/6RBTEuq',
 'admin', TRUE),

(3, NULL, 'gate.operator@bzu.edu.pk',
 '$2b$12$.B0JSpE.0aluBkNcCgcGQOzm2S6tC5hrFQKBfQfcy/RRx/6RBTEuq',
 'admin', TRUE);

INSERT INTO admin_profiles (user_id, employee_id, full_name, designation, phone, email_official, role_type) VALUES
(1, 'EMP-001', 'Mr. Usman',        'System Administrator', '0300-1234567', 'usman.admin@bzu.edu.pk',  'admin'),
(2, 'EMP-002', 'Ahmad Security',   'Security Admin',       '0300-2345678', 'security@bzu.edu.pk',     'security_admin'),
(3, 'EMP-003', 'Ali Gate Operator','Gate Operator',        '0300-3456789', 'gate.operator@bzu.edu.pk','gate_operator');

-- =====================================================
-- SEED 06: TEACHERS
-- Password for all: Teacher@123
-- bcrypt hash of "Teacher@123"
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO users (id, roll_number, email, password_hash, role, is_active) VALUES
(4, NULL, 'ghulam.ghos@bzu.edu.pk',
 '$2b$12$qz6Q0HsJOSUvj2qXLqcVSu0wsHvej5zn78/22BOXMgm2lMMXYgDx6',
 'teacher', TRUE),

(5, NULL, 'asif.raza@bzu.edu.pk',
 '$2b$12$qz6Q0HsJOSUvj2qXLqcVSu0wsHvej5zn78/22BOXMgm2lMMXYgDx6',
 'teacher', TRUE),

(6, NULL, 'aqsa.maam@bzu.edu.pk',
 '$2b$12$qz6Q0HsJOSUvj2qXLqcVSu0wsHvej5zn78/22BOXMgm2lMMXYgDx6',
 'teacher', TRUE),

(7, NULL, 'iqra.maam@bzu.edu.pk',
 '$2b$12$qz6Q0HsJOSUvj2qXLqcVSu0wsHvej5zn78/22BOXMgm2lMMXYgDx6',
 'teacher', TRUE);

INSERT INTO teacher_profiles (user_id, employee_id, full_name, designation, qualification, specialization, joining_date, phone, email, cnic) VALUES
(4, 'TCH-001', 'Mr. Ghulam Ghos', 'Lecturer',            'MS Information Technology', 'Database Systems, Java Programming',       '2018-09-01', '0301-1111111', 'ghulam.ghos@bzu.edu.pk', '36302-1111111-1'),
(5, 'TCH-002', 'Mr. Asif Raza',   'Lecturer',            'MS Computer Science',       'Software Engineering, Project Management',  '2019-02-01', '0301-2222222', 'asif.raza@bzu.edu.pk',   '36302-2222222-2'),
(6, 'TCH-003', 'Ma''am Aqsa',     'Assistant Professor', 'MS Software Engineering',   'Web Technologies, OOP',                    '2017-03-01', '0301-3333333', 'aqsa.maam@bzu.edu.pk',   '36302-3333333-3'),
(7, 'TCH-004', 'Ma''am Iqra',     'Lecturer',            'MS Data Science',           'Data Analytics, Machine Learning',          '2020-08-01', '0301-4444444', 'iqra.maam@bzu.edu.pk',   '36302-4444444-4');

-- Update Department HODs
UPDATE departments SET head_of_department = 4 WHERE id = 1;
UPDATE departments SET head_of_department = 4 WHERE id = 2;

-- =====================================================
-- SEED 07: STUDENTS
-- Password for all: Student@123
-- bcrypt hash of "Student@123"
-- =====================================================
USE AI_Driven_Smart_LMS;

-- BSIT 8th Semester Students (Mr. Ghulam Ghos ki class)
INSERT INTO users (id, roll_number, email, password_hash, role, is_active) VALUES
(9,  'BSIT-21-01', 'sarfraz@student.bzu.edu.pk',       '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(10, 'BSIT-21-02', 'zain.arain@student.bzu.edu.pk',    '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(11, 'BSIT-21-03', 'moeez.israr@student.bzu.edu.pk',   '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(12, 'BSIT-21-04', 'saba.hafeez@student.bzu.edu.pk',   '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(13, 'BSIT-21-05', 'shamaya@student.bzu.edu.pk',        '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(14, 'BSIT-21-06', 'kinza@student.bzu.edu.pk',          '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(15, 'BSIT-21-07', 'hafsa@student.bzu.edu.pk',          '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(16, 'BSIT-21-08', 'azka@student.bzu.edu.pk',           '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(17, 'BSIT-21-09', 'kashaf@student.bzu.edu.pk',         '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE),
(18, 'BSIT-21-10', 'haiqa@student.bzu.edu.pk',          '$2b$12$oE61qDe.Wt/p3M6F4pNRweoYqJsBltm2TDYNF7201ORC4QbbQAFva', 'student', TRUE);

INSERT INTO student_profiles
  (user_id, registration_number, full_name, father_name, date_of_birth, gender, cnic, phone, current_address, city, guardian_phone, guardian_relation)
VALUES
(9,  'BZU-IT-2021-001', 'Sarfraz',      'Muhammad Sarfraz',   '2003-03-15', 'male',   '36302-0000001-1', '0311-1000001', 'Street 1, Multan', 'Multan', '0311-9000001', 'Father'),
(10, 'BZU-IT-2021-002', 'Zain Arain',   'Arain Sahib',        '2003-05-20', 'male',   '36302-0000002-2', '0311-1000002', 'Street 2, Multan', 'Multan', '0311-9000002', 'Father'),
(11, 'BZU-IT-2021-003', 'Moeez Israr',  'Israr Ahmed',        '2002-11-10', 'male',   '36302-0000003-3', '0311-1000003', 'Street 3, Multan', 'Multan', '0311-9000003', 'Father'),
(12, 'BZU-IT-2021-004', 'Saba Hafeez',  'Hafeez Ahmad',       '2003-07-25', 'female', '36302-0000004-4', '0311-1000004', 'Street 4, Multan', 'Multan', '0311-9000004', 'Father'),
(13, 'BZU-IT-2021-005', 'Shamaya',       'Shamaya Sahib',     '2003-01-18', 'female', '36302-0000005-5', '0311-1000005', 'Street 5, Multan', 'Multan', '0311-9000005', 'Father'),
(14, 'BZU-IT-2021-006', 'Kinza',         'Kinza Sahib',       '2003-06-30', 'female', '36302-0000006-6', '0311-1000006', 'Street 6, Multan', 'Multan', '0311-9000006', 'Father'),
(15, 'BZU-IT-2021-007', 'Hafsa',         'Hafsa Sahib',       '2002-12-12', 'female', '36302-0000007-7', '0311-1000007', 'Street 7, Multan', 'Multan', '0311-9000007', 'Father'),
(16, 'BZU-IT-2021-008', 'Azka',          'Azka Sahib',        '2003-04-22', 'female', '36302-0000008-8', '0311-1000008', 'Street 8, Multan', 'Multan', '0311-9000008', 'Father'),
(17, 'BZU-IT-2021-009', 'Kashaf',        'Kashaf Sahib',      '2003-08-14', 'female', '36302-0000009-9', '0311-1000009', 'Street 9, Multan', 'Multan', '0311-9000009', 'Father'),
(18, 'BZU-IT-2021-010', 'Haiqa',         'Haiqa Sahib',       '2003-02-28', 'female', '36302-0000010-0', '0311-1000010', 'Street 10, Multan','Multan', '0311-9000010', 'Father');

-- =====================================================
-- SEED 08: STUDENT PROGRAM ENROLLMENTS
-- =====================================================
USE AI_Driven_Smart_LMS;

INSERT INTO student_program_enrollment
  (student_id, program_id, batch_year, enrollment_semester_id, current_semester, status, advisor_id, enrollment_date, expected_graduation)
VALUES
-- BSIT 2021 Batch → Semester 8 (Final Year) -- All 10 students under Mr. Ghulam Ghos
(9,  1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(10, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(11, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(12, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(13, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(14, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(15, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(16, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(17, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30'),
(18, 1, 2021, 1, 8, 'active', 4, '2021-09-01', '2025-06-30');

-- =====================================================
-- SEED 09: COURSE OFFERINGS + ENROLLMENTS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Course Offerings (Spring 2025 = semester_id 4) ──
-- Mr. Ghulam Ghos teaches Database Administration (offering 1) and OOP with Java (offering 2)
-- Mr. Asif Raza teaches Software Project Management (offering 3)
-- Ma'am Aqsa teaches Web Technologies elective (offered as offering 4)
INSERT INTO course_offerings
  (id, course_id, semester_id, instructor_id, section, max_students, enrolled_students, room_number, schedule_json, is_active)
VALUES
(1, 7,  4, 4, 'A', 40, 10, 'IT-301', '[{"day":"monday","start_time":"08:00","end_time":"09:30"},{"day":"wednesday","start_time":"08:00","end_time":"09:30"}]', TRUE),
(2, 8,  4, 4, 'A', 40, 10, 'IT-302', '[{"day":"tuesday","start_time":"10:00","end_time":"11:30"},{"day":"thursday","start_time":"10:00","end_time":"11:30"}]', TRUE),
(3, 9,  4, 5, 'A', 40, 10, 'IT-303', '[{"day":"monday","start_time":"11:00","end_time":"12:30"},{"day":"friday","start_time":"11:00","end_time":"12:30"}]',   TRUE),
(4, 10, 4, 6, 'A', 40, 10, 'IT-304', '[{"day":"wednesday","start_time":"02:00","end_time":"03:30"},{"day":"friday","start_time":"02:00","end_time":"03:30"}]', TRUE);

-- ── Course Enrollments ───────────────────────────────
-- All 10 students enrolled in all 4 offerings

-- Offering 1 (Database Administration) - Mr. Ghulam Ghos
INSERT INTO enrollments (student_id, offering_id, status, is_approved, advisor_approval_requested) VALUES
(9,  1, 'enrolled', TRUE, TRUE),
(10, 1, 'enrolled', TRUE, TRUE),
(11, 1, 'enrolled', TRUE, TRUE),
(12, 1, 'enrolled', TRUE, TRUE),
(13, 1, 'enrolled', TRUE, TRUE),
(14, 1, 'enrolled', TRUE, TRUE),
(15, 1, 'enrolled', TRUE, TRUE),
(16, 1, 'enrolled', TRUE, TRUE),
(17, 1, 'enrolled', TRUE, TRUE),
(18, 1, 'enrolled', TRUE, TRUE);

-- Offering 2 (OOP with Java) - Mr. Ghulam Ghos
INSERT INTO enrollments (student_id, offering_id, status, is_approved, advisor_approval_requested) VALUES
(9,  2, 'enrolled', TRUE, TRUE),
(10, 2, 'enrolled', TRUE, TRUE),
(11, 2, 'enrolled', TRUE, TRUE),
(12, 2, 'enrolled', TRUE, TRUE),
(13, 2, 'enrolled', TRUE, TRUE),
(14, 2, 'enrolled', TRUE, TRUE),
(15, 2, 'enrolled', TRUE, TRUE),
(16, 2, 'enrolled', TRUE, TRUE),
(17, 2, 'enrolled', TRUE, TRUE),
(18, 2, 'enrolled', TRUE, TRUE);

-- Offering 3 (Software Project Management) - Mr. Asif Raza
INSERT INTO enrollments (student_id, offering_id, status, is_approved, advisor_approval_requested) VALUES
(9,  3, 'enrolled', TRUE, TRUE),
(10, 3, 'enrolled', TRUE, TRUE),
(11, 3, 'enrolled', TRUE, TRUE),
(12, 3, 'enrolled', TRUE, TRUE),
(13, 3, 'enrolled', TRUE, TRUE),
(14, 3, 'enrolled', TRUE, TRUE),
(15, 3, 'enrolled', TRUE, TRUE),
(16, 3, 'enrolled', TRUE, TRUE),
(17, 3, 'enrolled', TRUE, TRUE),
(18, 3, 'enrolled', TRUE, TRUE);

-- Offering 4 (Final Year Project) - Ma'am Aqsa
INSERT INTO enrollments (student_id, offering_id, status, is_approved, advisor_approval_requested) VALUES
(9,  4, 'enrolled', TRUE, TRUE),
(10, 4, 'enrolled', TRUE, TRUE),
(11, 4, 'enrolled', TRUE, TRUE),
(12, 4, 'enrolled', TRUE, TRUE),
(13, 4, 'enrolled', TRUE, TRUE),
(14, 4, 'enrolled', TRUE, TRUE),
(15, 4, 'enrolled', TRUE, TRUE),
(16, 4, 'enrolled', TRUE, TRUE),
(17, 4, 'enrolled', TRUE, TRUE),
(18, 4, 'enrolled', TRUE, TRUE);

-- =====================================================
-- SEED 10: LECTURE SESSIONS + ATTENDANCE
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Lecture Sessions (Offering 1 - Database Administration) ─
INSERT INTO lecture_sessions
  (id, offering_id, session_date, start_time, end_time, topic, session_type, attendance_marked, marked_by, marked_at)
VALUES
(1,  1, '2025-02-03', '08:00', '09:30', 'Introduction to Database Administration',    'lecture', TRUE, 4, '2025-02-03 09:35:00'),
(2,  1, '2025-02-05', '08:00', '09:30', 'DBA Roles and Responsibilities',             'lecture', TRUE, 4, '2025-02-05 09:35:00'),
(3,  1, '2025-02-10', '08:00', '09:30', 'Database Installation and Configuration',    'lecture', TRUE, 4, '2025-02-10 09:35:00'),
(4,  1, '2025-02-12', '08:00', '09:30', 'User Management and Privileges',             'lecture', TRUE, 4, '2025-02-12 09:35:00'),
(5,  1, '2025-02-17', '08:00', '09:30', 'Backup and Recovery Strategies',             'lecture', TRUE, 4, '2025-02-17 09:35:00'),
(6,  1, '2025-02-19', '08:00', '09:30', 'Performance Tuning and Indexing',            'lecture', TRUE, 4, '2025-02-19 09:35:00'),
(7,  1, '2025-02-24', '08:00', '09:30', 'Database Security',                          'lecture', TRUE, 4, '2025-02-24 09:35:00'),
(8,  1, '2025-02-26', '08:00', '09:30', 'Replication and High Availability',          'lecture', TRUE, 4, '2025-02-26 09:35:00'),

-- ── Lecture Sessions (Offering 2 - OOP with Java) ────
(9,  2, '2025-02-04', '10:00', '11:30', 'Introduction to OOP Concepts',               'lecture', TRUE, 4, '2025-02-04 11:35:00'),
(10, 2, '2025-02-06', '10:00', '11:30', 'Java Classes and Objects',                   'lecture', TRUE, 4, '2025-02-06 11:35:00'),
(11, 2, '2025-02-11', '10:00', '11:30', 'Inheritance and Polymorphism',               'lecture', TRUE, 4, '2025-02-11 11:35:00'),
(12, 2, '2025-02-13', '10:00', '11:30', 'Interfaces and Abstract Classes',            'lecture', TRUE, 4, '2025-02-13 11:35:00'),
(13, 2, '2025-02-18', '10:00', '11:30', 'Exception Handling in Java',                 'lecture', TRUE, 4, '2025-02-18 11:35:00'),
(14, 2, '2025-02-20', '10:00', '11:30', 'Java Collections Framework',                 'lecture', TRUE, 4, '2025-02-20 11:35:00');

-- ── Lecture Attendance (Offering 1 - DBA) ──────────────

-- Sarfraz (9) - Good attendance 7/8 = 87.5%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 9, 'present', 4),(2, 9, 'present', 4),(3, 9, 'present', 4),(4, 9, 'present', 4),
(5, 9, 'present', 4),(6, 9, 'absent',  4),(7, 9, 'present', 4),(8, 9, 'present', 4);

-- Zain Arain (10) - Perfect 8/8 = 100%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 10, 'present', 4),(2, 10, 'present', 4),(3, 10, 'present', 4),(4, 10, 'present', 4),
(5, 10, 'present', 4),(6, 10, 'present', 4),(7, 10, 'present', 4),(8, 10, 'present', 4);

-- Moeez Israr (11) - Low 5/8 = 62.5% SHORT ALERT
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 11, 'present', 4),(2, 11, 'absent',  4),(3, 11, 'absent',  4),(4, 11, 'present', 4),
(5, 11, 'absent',  4),(6, 11, 'present', 4),(7, 11, 'present', 4),(8, 11, 'absent',  4);

-- Saba Hafeez (12) - 7/8 = 87.5%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 12, 'present', 4),(2, 12, 'present', 4),(3, 12, 'late',    4),(4, 12, 'present', 4),
(5, 12, 'present', 4),(6, 12, 'absent',  4),(7, 12, 'present', 4),(8, 12, 'present', 4);

-- Shamaya (13) - 6/8 = 75%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 13, 'present', 4),(2, 13, 'absent',  4),(3, 13, 'present', 4),(4, 13, 'absent',  4),
(5, 13, 'present', 4),(6, 13, 'present', 4),(7, 13, 'absent',  4),(8, 13, 'present', 4);

-- Kinza (14) - 8/8 = 100%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 14, 'present', 4),(2, 14, 'present', 4),(3, 14, 'present', 4),(4, 14, 'present', 4),
(5, 14, 'present', 4),(6, 14, 'present', 4),(7, 14, 'present', 4),(8, 14, 'present', 4);

-- Hafsa (15) - 7/8 = 87.5%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 15, 'present', 4),(2, 15, 'present', 4),(3, 15, 'present', 4),(4, 15, 'present', 4),
(5, 15, 'absent',  4),(6, 15, 'present', 4),(7, 15, 'present', 4),(8, 15, 'present', 4);

-- Azka (16) - 6/8 = 75%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 16, 'present', 4),(2, 16, 'absent',  4),(3, 16, 'present', 4),(4, 16, 'present', 4),
(5, 16, 'present', 4),(6, 16, 'absent',  4),(7, 16, 'present', 4),(8, 16, 'present', 4);

-- Kashaf (17) - 7/8 = 87.5%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 17, 'present', 4),(2, 17, 'present', 4),(3, 17, 'absent',  4),(4, 17, 'present', 4),
(5, 17, 'present', 4),(6, 17, 'present', 4),(7, 17, 'present', 4),(8, 17, 'absent',  4);

-- Haiqa (18) - 8/8 = 100%
INSERT INTO lecture_attendance (session_id, student_id, status, marked_by) VALUES
(1, 18, 'present', 4),(2, 18, 'present', 4),(3, 18, 'present', 4),(4, 18, 'present', 4),
(5, 18, 'present', 4),(6, 18, 'present', 4),(7, 18, 'present', 4),(8, 18, 'present', 4);

-- ── Attendance Summaries (Offering 1 - DBA) ──────────
INSERT INTO attendance_summary
  (student_id, offering_id, total_classes, attended_classes, percentage, alert_triggered, last_updated)
VALUES
(9,  1, 8, 7, 87.50,  FALSE, '2025-02-26'),
(10, 1, 8, 8, 100.00, FALSE, '2025-02-26'),
(11, 1, 8, 5, 62.50,  TRUE,  '2025-02-26'),
(12, 1, 8, 7, 87.50,  FALSE, '2025-02-26'),
(13, 1, 8, 6, 75.00,  FALSE, '2025-02-26'),
(14, 1, 8, 8, 100.00, FALSE, '2025-02-26'),
(15, 1, 8, 7, 87.50,  FALSE, '2025-02-26'),
(16, 1, 8, 6, 75.00,  FALSE, '2025-02-26'),
(17, 1, 8, 7, 87.50,  FALSE, '2025-02-26'),
(18, 1, 8, 8, 100.00, FALSE, '2025-02-26');

-- ── Attendance Summaries (Offering 2 - OOP with Java) ─
INSERT INTO attendance_summary
  (student_id, offering_id, total_classes, attended_classes, percentage, alert_triggered, last_updated)
VALUES
(9,  2, 6, 6, 100.00, FALSE, '2025-02-20'),
(10, 2, 6, 5, 83.33,  FALSE, '2025-02-20'),
(11, 2, 6, 4, 66.67,  FALSE, '2025-02-20'),
(12, 2, 6, 6, 100.00, FALSE, '2025-02-20'),
(13, 2, 6, 5, 83.33,  FALSE, '2025-02-20'),
(14, 2, 6, 6, 100.00, FALSE, '2025-02-20'),
(15, 2, 6, 5, 83.33,  FALSE, '2025-02-20'),
(16, 2, 6, 4, 66.67,  FALSE, '2025-02-20'),
(17, 2, 6, 6, 100.00, FALSE, '2025-02-20'),
(18, 2, 6, 6, 100.00, FALSE, '2025-02-20');

-- ── Campus Gates ─────────────────────────────────────
INSERT INTO campus_gates
  (id, gate_name, gate_code, gate_type, location_description, ip_address, is_active)
VALUES
(1, 'Main Entrance Gate', 'GATE-MAIN', 'main',       'Main entrance of BZU campus',       '192.168.1.10', TRUE),
(2, 'IT Department Gate', 'GATE-IT',   'department',  'IT Department side entrance',       '192.168.1.11', TRUE),
(3, 'Library Gate',       'GATE-LIB',  'library',     'Central library entrance',          '192.168.1.12', TRUE),
(4, 'Lab Block Gate',     'GATE-LAB',  'lab',         'Computer lab block entrance',       '192.168.1.13', TRUE);

INSERT INTO gate_cameras (id, gate_id, camera_name, camera_ip, camera_type, resolution, is_primary, status) VALUES
(1, 1, 'Main Gate Cam 1', '192.168.1.101', 'entry', '1080p', TRUE,  'active'),
(2, 1, 'Main Gate Cam 2', '192.168.1.102', 'exit',  '1080p', FALSE, 'active'),
(3, 2, 'IT Gate Cam 1',   '192.168.1.103', 'both',  '720p',  TRUE,  'active'),
(4, 3, 'Library Cam 1',   '192.168.1.104', 'both',  '720p',  TRUE,  'active');

INSERT INTO gate_schedules (gate_id, day_of_week, open_time, close_time) VALUES
(1, 'monday',    '07:00', '22:00'),
(1, 'tuesday',   '07:00', '22:00'),
(1, 'wednesday', '07:00', '22:00'),
(1, 'thursday',  '07:00', '22:00'),
(1, 'friday',    '07:00', '22:00'),
(1, 'saturday',  '08:00', '14:00'),
(1, 'sunday',    '00:00', '00:00');

-- =====================================================
-- SEED 11: ASSIGNMENTS + SUBMISSIONS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Assignments ──────────────────────────────────────
INSERT INTO assignments
  (id, offering_id, title, description, total_marks, weightage_percent, due_date, file_required, allowed_file_types, plagiarism_check, created_by)
VALUES
-- Offering 1 (Database Administration)
(1, 1, 'Assignment 1 - DBA Installation Report',
 'Install MySQL Server and write a report covering installation steps, configuration, and initial user setup.',
 20, 10.00, '2025-02-15 23:59:00', TRUE, '.pdf,.docx', FALSE, 4),

(2, 1, 'Assignment 2 - Backup & Recovery Plan',
 'Design a full backup and recovery plan for a hospital database system. Include logical/physical backup strategies.',
 20, 10.00, '2025-03-01 23:59:00', TRUE, '.pdf,.docx', TRUE, 4),

(3, 1, 'Assignment 3 - Performance Tuning Report',
 'Analyze a slow-running query, apply indexing strategies, and document the performance improvement.',
 30, 15.00, '2025-03-20 23:59:00', TRUE, '.pdf,.sql', TRUE, 4),

-- Offering 2 (OOP with Java)
(4, 2, 'Assignment 1 - Java Class Design',
 'Design a class hierarchy for a university system. Implement at least 3 classes using inheritance and encapsulation.',
 25, 10.00, '2025-02-20 23:59:00', TRUE, '.java,.zip', FALSE, 4),

(5, 2, 'Assignment 2 - Java Collections Project',
 'Build a student record management console app using Java ArrayList and HashMap.',
 25, 10.00, '2025-03-10 23:59:00', TRUE, '.java,.zip', FALSE, 4),

-- Offering 3 (Software Project Management)
(6, 3, 'Assignment 1 - Project Charter',
 'Create a full project charter for your Final Year Project including scope, schedule, budget, and stakeholders.',
 40, 15.00, '2025-02-28 23:59:00', TRUE, '.pdf,.docx', FALSE, 5),

-- Offering 4 (Final Year Project)
(7, 4, 'FYP Proposal Document',
 'Submit a detailed FYP proposal including problem statement, objectives, methodology, and expected outcomes.',
 30, 10.00, '2025-02-25 23:59:00', TRUE, '.pdf', TRUE, 6);


-- ── Submissions (Assignment 1 - DBA Installation) ────
INSERT INTO assignment_submissions
  (assignment_id, student_id, file_path, remarks, obtained_marks, feedback, status, graded_by, graded_at)
VALUES
(1, 9,  'uploads/submissions/a1_sarfraz_dba.pdf',  'Detailed steps included',           18, 'Well documented. Add screenshots.', 'graded', 4, '2025-02-17 10:00:00'),
(1, 10, 'uploads/submissions/a1_zain_dba.pdf',     'All steps with screenshots',        20, 'Perfect submission!',               'graded', 4, '2025-02-17 10:30:00'),
(1, 11, 'uploads/submissions/a1_moeez_dba.pdf',    'Basic installation only',           13, 'Missing config section. Redo.',     'graded', 4, '2025-02-17 11:00:00'),
(1, 12, 'uploads/submissions/a1_saba_dba.pdf',     NULL,                                17, 'Good work, minor errors.',          'graded', 4, '2025-02-17 11:30:00'),
(1, 13, 'uploads/submissions/a1_shamaya_dba.pdf',  'Late submission',                   12, 'Late. Incomplete config steps.',    'late',   4, '2025-02-17 12:00:00'),
(1, 14, 'uploads/submissions/a1_kinza_dba.pdf',    NULL,                                19, 'Excellent detail and clarity.',     'graded', 4, '2025-02-17 12:30:00'),
(1, 15, 'uploads/submissions/a1_hafsa_dba.pdf',    NULL,                                16, 'Good effort. Improve formatting.',  'graded', 4, '2025-02-17 13:00:00'),
(1, 16, 'uploads/submissions/a1_azka_dba.pdf',     NULL,                                15, 'Decent work. Add more detail.',     'graded', 4, '2025-02-17 13:30:00'),
(1, 17, 'uploads/submissions/a1_kashaf_dba.pdf',   NULL,                                18, 'Nice structure and clean steps.',   'graded', 4, '2025-02-17 14:00:00'),
(1, 18, 'uploads/submissions/a1_haiqa_dba.pdf',    NULL,                                20, 'Outstanding! Complete and neat.',   'graded', 4, '2025-02-17 14:30:00');

-- ── Submissions (Assignment 4 - Java Class Design) ───
INSERT INTO assignment_submissions
  (assignment_id, student_id, file_path, remarks, obtained_marks, feedback, status, graded_by, graded_at)
VALUES
(4, 9,  'uploads/submissions/a4_sarfraz_java.zip', 'Used 4 classes with inheritance',   22, 'Well designed class hierarchy.',   'graded', 4, '2025-02-22 10:00:00'),
(4, 10, 'uploads/submissions/a4_zain_java.zip',    NULL,                                25, 'Perfect OOP implementation!',      'graded', 4, '2025-02-22 10:30:00'),
(4, 11, 'uploads/submissions/a4_moeez_java.zip',   NULL,                                16, 'Missing polymorphism examples.',   'graded', 4, '2025-02-22 11:00:00'),
(4, 12, 'uploads/submissions/a4_saba_java.zip',    NULL,                                20, 'Good. Minor compilation issue.',   'graded', 4, '2025-02-22 11:30:00'),
(4, 14, 'uploads/submissions/a4_kinza_java.zip',   NULL,                                23, 'Excellent with proper comments.',  'graded', 4, '2025-02-22 12:00:00'),
(4, 15, 'uploads/submissions/a4_hafsa_java.zip',   NULL,                                21, 'Good design. Clean code.',         'graded', 4, '2025-02-22 12:30:00'),
(4, 17, 'uploads/submissions/a4_kashaf_java.zip',  NULL,                                19, 'Good effort. Add more methods.',   'graded', 4, '2025-02-22 13:00:00'),
(4, 18, 'uploads/submissions/a4_haiqa_java.zip',   NULL,                                24, 'Great implementation!',            'graded', 4, '2025-02-22 13:30:00');
-- Students 13, 16 did not submit

-- =====================================================
-- SEED 12: QUIZZES + QUESTIONS + ATTEMPTS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Quizzes ──────────────────────────────────────────
INSERT INTO quizzes
  (id, offering_id, title, description, quiz_type, total_questions, total_marks, time_limit_minutes, start_time, end_time, is_mandatory, auto_grading, shuffle_questions, created_by)
VALUES
-- Offering 1 (Database Administration)
(1, 1, 'Quiz 1 - DBA Basics',
 'Test your knowledge of DBA roles, responsibilities and database architecture.',
 'teacher', 5, 10, 15,
 '2025-02-10 08:00:00', '2025-02-10 23:59:00',
 TRUE, TRUE, FALSE, 4),

(2, 1, 'Quiz 2 - Backup & Security',
 'Backup strategies, user management and database security concepts.',
 'teacher', 5, 10, 15,
 '2025-02-19 08:00:00', '2025-02-19 23:59:00',
 TRUE, TRUE, TRUE, 4),

-- Offering 2 (OOP with Java)
(3, 2, 'Quiz 1 - OOP Concepts',
 'Classes, objects, inheritance and polymorphism in Java.',
 'teacher', 5, 10, 15,
 '2025-02-11 10:00:00', '2025-02-11 23:59:00',
 TRUE, TRUE, FALSE, 4),

-- Offering 3 (Software Project Management)
(4, 3, 'Quiz 1 - Agile & Scrum',
 'Agile manifesto, Scrum ceremonies and project lifecycle.',
 'teacher', 5, 10, 20,
 '2025-02-17 11:00:00', '2025-02-17 23:59:00',
 TRUE, TRUE, FALSE, 5);


-- ── Quiz Questions ───────────────────────────────────

-- Quiz 1 (DBA Basics)
INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, marks, difficulty, explanation) VALUES
(1, 'What does DBA stand for?',
 'mcq', '["Data Block Architecture","Database Administrator","Dynamic Byte Allocation","Data Backup Agent"]',
 'Database Administrator', 2, 'easy',
 'DBA stands for Database Administrator, responsible for managing database systems.'),

(1, 'Which command is used to create a new user in MySQL?',
 'mcq', '["ADD USER","NEW USER","CREATE USER","INSERT USER"]',
 'CREATE USER', 2, 'easy',
 'The CREATE USER command is used to create new database users.'),

(1, 'What is the purpose of an index in a database?',
 'mcq', '["To delete records faster","To speed up data retrieval","To encrypt data","To backup data"]',
 'To speed up data retrieval', 2, 'medium',
 'Indexes improve the speed of data retrieval operations on a database table.'),

(1, 'Which type of backup copies only the data that has changed since the last backup?',
 'mcq', '["Full backup","Cold backup","Incremental backup","Hot backup"]',
 'Incremental backup', 2, 'medium',
 'Incremental backup only backs up data changed since the last backup operation.'),

(1, 'What is a tablespace in Oracle/MySQL?',
 'mcq', '["A temporary variable","A logical storage unit for database objects","A network connection","A user role"]',
 'A logical storage unit for database objects', 2, 'medium',
 'A tablespace is a logical storage unit that groups related database objects together.');

-- Quiz 3 (OOP Concepts)
INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, marks, difficulty, explanation) VALUES
(3, 'Which OOP principle hides internal implementation details?',
 'mcq', '["Inheritance","Polymorphism","Encapsulation","Abstraction"]',
 'Encapsulation', 2, 'easy',
 'Encapsulation hides the internal state and implementation from outside classes.'),

(3, 'Which keyword is used to inherit a class in Java?',
 'mcq', '["implements","extends","inherits","super"]',
 'extends', 2, 'easy',
 'The extends keyword is used in Java to inherit from a parent class.'),

(3, 'What is method overriding?',
 'mcq', '["Defining a method with same name but different parameters","Redefining a parent class method in a subclass","Calling a method twice","Deleting a method"]',
 'Redefining a parent class method in a subclass', 2, 'medium',
 'Method overriding allows a subclass to provide its own implementation of a parent class method.'),

(3, 'Which Java keyword refers to the current object inside a class?',
 'mcq', '["self","current","this","me"]',
 'this', 2, 'easy',
 'The this keyword refers to the current instance of the class in Java.'),

(3, 'What is an abstract class in Java?',
 'mcq', '["A class with no methods","A class that cannot be instantiated","A class with private constructor","A final class"]',
 'A class that cannot be instantiated', 2, 'medium',
 'An abstract class cannot be instantiated directly and may contain abstract methods.');


-- ── Quiz Attempts ────────────────────────────────────

-- Quiz 1 (DBA Basics) Attempts
INSERT INTO quiz_attempts (quiz_id, student_id, start_time, end_time, score, total_marks, percentage, answers, status) VALUES
(1, 9,  '2025-02-10 08:30:00', '2025-02-10 08:43:00', 10, 10, 100.00, '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 10, '2025-02-10 09:00:00', '2025-02-10 09:13:00', 8,  10, 80.00,  '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Full backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 11, '2025-02-10 09:30:00', '2025-02-10 09:42:00', 6,  10, 60.00,  '{"1":"Database Administrator","2":"ADD USER","3":"To delete records faster","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 12, '2025-02-10 10:00:00', '2025-02-10 10:12:00', 10, 10, 100.00, '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 13, '2025-02-10 10:30:00', '2025-02-10 10:43:00', 8,  10, 80.00,  '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Full backup","5":"A network connection"}', 'completed'),
(1, 14, '2025-02-10 11:00:00', '2025-02-10 11:14:00', 10, 10, 100.00, '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 15, '2025-02-10 11:30:00', '2025-02-10 11:42:00', 8,  10, 80.00,  '{"1":"Database Administrator","2":"CREATE USER","3":"To encrypt data","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 16, '2025-02-10 12:00:00', '2025-02-10 12:13:00', 6,  10, 60.00,  '{"1":"Data Block Architecture","2":"CREATE USER","3":"To speed up data retrieval","4":"Full backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 17, '2025-02-10 12:30:00', '2025-02-10 12:44:00', 8,  10, 80.00,  '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Cold backup","5":"A logical storage unit for database objects"}', 'completed'),
(1, 18, '2025-02-10 13:00:00', '2025-02-10 13:14:00', 10, 10, 100.00, '{"1":"Database Administrator","2":"CREATE USER","3":"To speed up data retrieval","4":"Incremental backup","5":"A logical storage unit for database objects"}', 'completed');

-- Quiz 3 (OOP Concepts) Attempts
INSERT INTO quiz_attempts (quiz_id, student_id, start_time, end_time, score, total_marks, percentage, answers, status) VALUES
(3, 9,  '2025-02-11 10:30:00', '2025-02-11 10:43:00', 8,  10, 80.00,  '{"6":"Encapsulation","7":"extends","8":"Redefining a parent class method in a subclass","9":"self","10":"A class that cannot be instantiated"}', 'completed'),
(3, 10, '2025-02-11 11:00:00', '2025-02-11 11:14:00', 10, 10, 100.00, '{"6":"Encapsulation","7":"extends","8":"Redefining a parent class method in a subclass","9":"this","10":"A class that cannot be instantiated"}', 'completed'),
(3, 12, '2025-02-11 11:30:00', '2025-02-11 11:42:00', 10, 10, 100.00, '{"6":"Encapsulation","7":"extends","8":"Redefining a parent class method in a subclass","9":"this","10":"A class that cannot be instantiated"}', 'completed'),
(3, 14, '2025-02-11 12:00:00', '2025-02-11 12:13:00', 8,  10, 80.00,  '{"6":"Abstraction","7":"extends","8":"Redefining a parent class method in a subclass","9":"this","10":"A class that cannot be instantiated"}', 'completed'),
(3, 18, '2025-02-11 12:30:00', '2025-02-11 12:43:00', 10, 10, 100.00, '{"6":"Encapsulation","7":"extends","8":"Redefining a parent class method in a subclass","9":"this","10":"A class that cannot be instantiated"}', 'completed');

-- =====================================================
-- SEED 13: EXAMS + RESULTS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Exams ────────────────────────────────────────────
INSERT INTO exams
  (id, offering_id, exam_type, title, total_marks, weightage_percent, exam_date, start_time, end_time, room_number)
VALUES
-- Offering 1 (Database Administration)
(1, 1, 'midterm', 'Database Administration Midterm Exam', 50, 30.00, '2025-03-15', '08:00', '10:00', 'Exam Hall A'),
(2, 1, 'final',   'Database Administration Final Exam',   100, 50.00, '2025-06-01', '08:00', '11:00', 'Exam Hall A'),

-- Offering 2 (OOP with Java)
(3, 2, 'midterm', 'OOP with Java Midterm Exam',           50, 30.00, '2025-03-17', '10:00', '12:00', 'Exam Hall B'),
(4, 2, 'final',   'OOP with Java Final Exam',             100, 50.00, '2025-06-03', '10:00', '13:00', 'Exam Hall B'),

-- Offering 3 (Software Project Management)
(5, 3, 'midterm', 'Software Project Management Midterm',  50, 30.00, '2025-03-18', '11:00', '13:00', 'IT-201'),

-- Offering 4 (Final Year Project)
(6, 4, 'midterm', 'FYP Progress Evaluation',              50, 30.00, '2025-03-20', '02:00', '04:00', 'IT-202');


-- ── Exam Results (Midterm 1 - DBA) ──────────────────
INSERT INTO exam_results (exam_id, student_id, obtained_marks, grade, entered_by) VALUES
(1, 9,  44, 'A',  4),
(1, 10, 49, 'A+', 4),
(1, 11, 30, 'C',  4),
(1, 12, 41, 'A-', 4),
(1, 13, 36, 'B',  4),
(1, 14, 47, 'A+', 4),
(1, 15, 38, 'B+', 4),
(1, 16, 33, 'C+', 4),
(1, 17, 40, 'A-', 4),
(1, 18, 48, 'A+', 4);

-- ── Exam Results (Midterm 3 - OOP with Java) ────────
INSERT INTO exam_results (exam_id, student_id, obtained_marks, grade, entered_by) VALUES
(3, 9,  42, 'A',  4),
(3, 10, 48, 'A+', 4),
(3, 11, 28, 'C',  4),
(3, 12, 43, 'A',  4),
(3, 13, 35, 'B',  4),
(3, 14, 46, 'A+', 4),
(3, 15, 39, 'B+', 4),
(3, 16, 31, 'C+', 4),
(3, 17, 41, 'A-', 4),
(3, 18, 47, 'A+', 4);

-- ── Grade updates for completed enrollments ──────────
UPDATE enrollments SET grade_letter = 'A',  grade_points = 4.00 WHERE student_id = 9  AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'A+', grade_points = 4.00 WHERE student_id = 10 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'C',  grade_points = 2.00 WHERE student_id = 11 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'A-', grade_points = 3.67 WHERE student_id = 12 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'B',  grade_points = 3.00 WHERE student_id = 13 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'A+', grade_points = 4.00 WHERE student_id = 14 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'B+', grade_points = 3.33 WHERE student_id = 15 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'C+', grade_points = 2.33 WHERE student_id = 16 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'A-', grade_points = 3.67 WHERE student_id = 17 AND offering_id = 1;
UPDATE enrollments SET grade_letter = 'A+', grade_points = 4.00 WHERE student_id = 18 AND offering_id = 1;

-- =====================================================
-- SEED 14: FEE STRUCTURE + VOUCHERS + PAYMENTS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Fee Structure ────────────────────────────────────
INSERT INTO fee_structure
  (id, program_id, semester_number, tuition_fee, admission_fee, library_fee, sports_fee, other_fees, valid_from)
VALUES
(1,  1, 1, 35000, 5000, 1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2021-09-01'),
(2,  1, 2, 35000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2022-02-01'),
(3,  1, 3, 36000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2022-09-01'),
(4,  1, 4, 36000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2023-02-01'),
(5,  1, 5, 38000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2023-09-01'),
(6,  1, 6, 38000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2000},{"name":"Examination Fee","amount":1500}]', '2024-02-01'),
(7,  1, 7, 40000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2500},{"name":"Examination Fee","amount":2000}]', '2024-09-01'),
(8,  1, 8, 40000, 0,    1000, 500, '[{"name":"Lab Fee","amount":2500},{"name":"Examination Fee","amount":2000}]', '2025-02-01');


-- ── Fee Vouchers (Spring 2025 = semester_id 4) ───────
INSERT INTO fee_vouchers
  (id, student_id, voucher_number, semester_id, amount, due_date, issue_date, status, fine_amount)
VALUES
(1,  9,  'VCH-2025-00001', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0),
(2,  10, 'VCH-2025-00002', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0),
(3,  11, 'VCH-2025-00003', 4, 46000.00, '2025-02-28', '2025-02-01', 'partial', 0),
(4,  12, 'VCH-2025-00004', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0),
(5,  13, 'VCH-2025-00005', 4, 46000.00, '2025-02-28', '2025-02-01', 'overdue', 1500),
(6,  14, 'VCH-2025-00006', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0),
(7,  15, 'VCH-2025-00007', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0),
(8,  16, 'VCH-2025-00008', 4, 46000.00, '2025-02-28', '2025-02-01', 'unpaid',  0),
(9,  17, 'VCH-2025-00009', 4, 46000.00, '2025-02-28', '2025-02-01', 'overdue', 1000),
(10, 18, 'VCH-2025-00010', 4, 46000.00, '2025-02-28', '2025-02-01', 'paid',    0);


-- ── Fee Payments ─────────────────────────────────────
INSERT INTO fee_payments
  (voucher_id, amount_paid, payment_method, reference_number, bank_name, received_by, receipt_number)
VALUES
(1,  46000.00, 'bank_transfer', 'TXN-2025-001', 'HBL',      1, 'RCP-2025-001'),
(2,  46000.00, 'online',        'TXN-2025-002', 'Easypaisa', 1, 'RCP-2025-002'),
(4,  46000.00, 'cash',           NULL,           NULL,        1, 'RCP-2025-004'),
(6,  46000.00, 'bank_transfer', 'TXN-2025-006', 'MCB',       1, 'RCP-2025-006'),
(7,  46000.00, 'online',        'TXN-2025-007', 'JazzCash',  1, 'RCP-2025-007'),
(10, 46000.00, 'bank_transfer', 'TXN-2025-010', 'UBL',       1, 'RCP-2025-010'),
-- Partial payment
(3,  25000.00, 'cash',           NULL,           NULL,        1, 'RCP-2025-003');

-- =====================================================
-- SEED 15: ANNOUNCEMENTS + NOTICES + CHAT GROUPS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Announcements ────────────────────────────────────
INSERT INTO announcements
  (id, title, content, created_by, target_type, target_id, priority, pinned_until)
VALUES
(1, 'Welcome to Spring 2025 Semester',
 'Dear Students, Welcome to Spring 2025 semester. Classes will begin from February 3, 2025. Please ensure your course registrations are complete. Best regards, Mr. Usman (Admin).',
 1, 'all', NULL, 'normal', '2025-02-10'),

(2, 'Fee Submission Deadline - URGENT',
 'This is to inform all BSIT 8th Semester students that the last date for fee submission is February 28, 2025. After this date a fine of Rs. 100/day will be charged.',
 1, 'all', NULL, 'urgent', '2025-02-28'),

(3, 'Database Administration - Lab Session',
 'Dear Students, A lab session for Database Administration will be held on Saturday February 22, 2025 at 10:00 AM in Lab 3. Attendance is mandatory. - Mr. Ghulam Ghos',
 4, 'course', 1, 'high', NULL),

(4, 'OOP with Java - Quiz 1 Reminder',
 'Quiz 1 for OOP with Java will be held on February 11, 2025 during class time. Topic: Classes, Objects, Inheritance. Duration: 15 minutes. - Mr. Ghulam Ghos',
 4, 'course', 2, 'normal', NULL),

(5, 'IT Department - Semester 8 Final Project Guidelines',
 'All BSIT 8th Semester students must submit their Final Year Project proposals by February 25, 2025. Late submissions will not be accepted.',
 4, 'department', 1, 'high', '2025-02-25'),

(6, 'Software Project Management - Assignment 1 Extension',
 'The deadline for Project Charter submission has been extended to March 5, 2025. Please prepare a complete document. - Mr. Asif Raza',
 5, 'course', 3, 'normal', NULL),

(7, 'Midterm Exam Schedule Announced',
 'Midterm examinations for BSIT 8th Semester will commence from March 15, 2025. Detailed schedule is posted on the notice board. Best of luck to all students!',
 1, 'all', NULL, 'high', '2025-03-15');

-- ── Notice Board ──────────────────────────────────────
INSERT INTO notice_board
  (title, content, posted_by, category, valid_until, is_active)
VALUES
('BSIT 8th Semester Timetable Spring 2025',
 'Monday/Wednesday 08:00-09:30 - Database Administration (Mr. Ghulam Ghos, IT-301) | Tuesday/Thursday 10:00-11:30 - OOP with Java (Mr. Ghulam Ghos, IT-302) | Monday/Friday 11:00-12:30 - Software Project Management (Mr. Asif Raza, IT-303) | Wednesday/Friday 14:00-15:30 - Final Year Project (Ma''am Aqsa, IT-304)',
 1, 'academic', '2025-06-30', TRUE),

('Fee Challan Submission - BSIT 8th Semester',
 'Students who have not submitted their fee for Spring 2025 are reminded to do so immediately. Contact accounts department for duplicate challan. Fine: Rs. 100/day after deadline.',
 1, 'financial', '2025-03-15', TRUE),

('FYP Proposal Submission Guidelines',
 'Final Year Project proposals must include: Problem Statement, Objectives, Scope, Methodology, Technology Stack, Timeline, and Expected Outcomes. Submit in PDF format to Ma''am Aqsa.',
 6, 'academic', '2025-02-25', TRUE);

-- ── Chat Groups ──────────────────────────────────────
INSERT INTO chat_groups
  (id, name, group_type, offering_id, created_by, is_active, moderation_required)
VALUES
(1, 'Database Administration - BSIT 8th',    'class',   1, 4, TRUE, FALSE),
(2, 'OOP with Java - BSIT 8th',              'class',   2, 4, TRUE, FALSE),
(3, 'Software Project Management - BSIT 8th','class',   3, 5, TRUE, FALSE),
(4, 'Final Year Project - BSIT 8th',         'class',   4, 6, TRUE, FALSE),
(5, 'BSIT 2021 Batch General Chat',          'general', NULL, 4, TRUE, FALSE);


-- ── Chat Group Members ───────────────────────────────

-- Group 1 (Database Administration) - Mr. Ghulam Ghos + all 10 students
INSERT INTO chat_group_members (group_id, user_id, role) VALUES
(1, 4, 'teacher'),
(1, 9, 'member'),(1, 10, 'member'),(1, 11, 'member'),(1, 12, 'member'),(1, 13, 'member'),
(1, 14, 'member'),(1, 15, 'member'),(1, 16, 'member'),(1, 17, 'member'),(1, 18, 'member');

-- Group 2 (OOP with Java) - Mr. Ghulam Ghos + all 10 students
INSERT INTO chat_group_members (group_id, user_id, role) VALUES
(2, 4, 'teacher'),
(2, 9, 'member'),(2, 10, 'member'),(2, 11, 'member'),(2, 12, 'member'),(2, 13, 'member'),
(2, 14, 'member'),(2, 15, 'member'),(2, 16, 'member'),(2, 17, 'member'),(2, 18, 'member');

-- Group 3 (Software Project Management) - Mr. Asif Raza + all 10 students
INSERT INTO chat_group_members (group_id, user_id, role) VALUES
(3, 5, 'teacher'),
(3, 9, 'member'),(3, 10, 'member'),(3, 11, 'member'),(3, 12, 'member'),(3, 13, 'member'),
(3, 14, 'member'),(3, 15, 'member'),(3, 16, 'member'),(3, 17, 'member'),(3, 18, 'member');

-- Group 4 (FYP) - Ma'am Aqsa + all 10 students
INSERT INTO chat_group_members (group_id, user_id, role) VALUES
(4, 6, 'teacher'),
(4, 9, 'member'),(4, 10, 'member'),(4, 11, 'member'),(4, 12, 'member'),(4, 13, 'member'),
(4, 14, 'member'),(4, 15, 'member'),(4, 16, 'member'),(4, 17, 'member'),(4, 18, 'member');

-- Group 5 (Batch General)
INSERT INTO chat_group_members (group_id, user_id, role) VALUES
(5, 4, 'monitor'),
(5, 9, 'member'),(5, 10, 'member'),(5, 11, 'member'),(5, 12, 'member'),(5, 13, 'member'),
(5, 14, 'member'),(5, 15, 'member'),(5, 16, 'member'),(5, 17, 'member'),(5, 18, 'member');


-- ── Sample Messages ──────────────────────────────────
INSERT INTO messages
  (group_id, sender_id, message, message_type, sent_at)
VALUES
(1, 4,  'Assalam o Alaikum! Welcome to Database Administration class. Please use this group for course-related queries only.', 'system', '2025-02-03 08:00:00'),
(1, 9,  'Walaikum Assalam Sir! Thank you for adding us.', 'text', '2025-02-03 08:05:00'),
(1, 10, 'Sir, will we be using MySQL or Oracle for lab tasks?', 'text', '2025-02-03 08:10:00'),
(1, 4,  'We will primarily use MySQL. Please install MySQL 8.0 before the first lab session.', 'text', '2025-02-03 08:15:00'),
(1, 12, 'Sir what is the lab manual for Assignment 1?', 'text', '2025-02-05 09:00:00'),
(1, 4,  'Install MySQL, create a database, add users and roles. Document with screenshots.', 'text', '2025-02-05 09:05:00'),
(1, 18, 'Sir can we use XAMPP instead of standalone MySQL?', 'text', '2025-02-10 08:30:00'),
(1, 4,  'Yes, XAMPP is fine. Make sure to use phpMyAdmin for user management screenshots.', 'text', '2025-02-10 08:35:00'),

(2, 4,  'Welcome to OOP with Java! This semester we cover Java fundamentals, inheritance, interfaces and design patterns.', 'text', '2025-02-04 10:00:00'),
(2, 9,  'Sir should we use Eclipse or IntelliJ?', 'text', '2025-02-04 10:30:00'),
(2, 4,  'Both are fine. I recommend IntelliJ IDEA Community Edition. Download from jetbrains.com.', 'text', '2025-02-04 10:35:00'),
(2, 14, 'Sir will we cover JavaFX this semester?', 'text', '2025-02-05 10:00:00'),
(2, 4,  'Yes, in the last 3 weeks we will build a small JavaFX application. Stay consistent!', 'text', '2025-02-05 10:05:00'),

(3, 5,  'Assalam o Alaikum! Welcome to Software Project Management. Please submit Assignment 1 project charter by Feb 28.', 'text', '2025-02-03 11:00:00'),
(3, 11, 'Sir can we base the charter on our FYP project?', 'text', '2025-02-03 11:30:00'),
(3, 5,  'Yes, use your FYP project for all assignments in this course. It will save time and improve depth.', 'text', '2025-02-03 11:35:00');

-- =====================================================
-- SEED 16: AI ANALYTICS + CHATBOT INTENTS + FAQS
-- =====================================================
USE AI_Driven_Smart_LMS;

-- ── Student Performance Scores ───────────────────────
INSERT INTO student_performance_scores
  (student_id, semester_id, academic_score, consistency_index, improvement_index,
   engagement_level, class_rank, section_rank, trend_direction,
   risk_prediction, weak_subjects, recommendations, score_breakdown, calculated_at)
VALUES
(9, 4,
 85.00, 82.00, 5.00, 'high', 3, 3, 'improving',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Great performance! Keep it up."}]',
 '{"lecture_attendance":87.50,"campus_presence":88.00,"assignment_consistency":90.00,"quiz_accuracy":100.00,"gpa_factor":100.00}',
 '2025-02-26 12:00:00'),

(10, 4,
 96.00, 94.00, 9.00, 'high', 1, 1, 'improving',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Excellent! Top performer in class."}]',
 '{"lecture_attendance":100.00,"campus_presence":98.00,"assignment_consistency":100.00,"quiz_accuracy":80.00,"gpa_factor":100.00}',
 '2025-02-26 12:00:00'),

(11, 4,
 55.00, 42.00, -4.00, 'low', 10, 10, 'declining',
 '{"level":"high","factors":["Low lecture attendance","Missing assignments","Poor quiz performance"],"at_risk":true}',
 '[{"course":"Database Administration","code":"IT-401","attendance":62.50,"reason":"Low attendance"}]',
 '[{"type":"attendance","priority":"high","message":"Attend more lectures to avoid shortage"},{"type":"assignment","priority":"high","message":"Submit all pending assignments immediately"}]',
 '{"lecture_attendance":62.50,"campus_presence":60.00,"assignment_consistency":50.00,"quiz_accuracy":60.00,"gpa_factor":50.00}',
 '2025-02-26 12:00:00'),

(12, 4,
 80.00, 75.00, 3.00, 'high', 4, 4, 'stable',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"quiz","priority":"medium","message":"Practice more quiz questions to improve accuracy."}]',
 '{"lecture_attendance":87.50,"campus_presence":85.00,"assignment_consistency":85.00,"quiz_accuracy":100.00,"gpa_factor":91.75}',
 '2025-02-26 12:00:00'),

(13, 4,
 68.00, 60.00, -1.00, 'medium', 7, 7, 'stable',
 '{"level":"medium","factors":["Low lecture attendance","Late submission"],"at_risk":false}',
 '[]',
 '[{"type":"attendance","priority":"medium","message":"Improve attendance to secure grades"},{"type":"assignment","priority":"medium","message":"Avoid late submissions"}]',
 '{"lecture_attendance":75.00,"campus_presence":70.00,"assignment_consistency":60.00,"quiz_accuracy":80.00,"gpa_factor":75.00}',
 '2025-02-26 12:00:00'),

(14, 4,
 94.00, 90.00, 7.00, 'high', 2, 2, 'improving',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Outstanding performance! Maintain it."}]',
 '{"lecture_attendance":100.00,"campus_presence":96.00,"assignment_consistency":95.00,"quiz_accuracy":100.00,"gpa_factor":100.00}',
 '2025-02-26 12:00:00'),

(15, 4,
 78.00, 72.00, 2.00, 'medium', 5, 5, 'stable',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Good performance. Try to improve quiz scores."}]',
 '{"lecture_attendance":87.50,"campus_presence":84.00,"assignment_consistency":85.00,"quiz_accuracy":80.00,"gpa_factor":83.25}',
 '2025-02-26 12:00:00'),

(16, 4,
 65.00, 58.00, -2.00, 'medium', 8, 8, 'declining',
 '{"level":"medium","factors":["Low quiz performance","Missing assignment"],"at_risk":false}',
 '[{"course":"OOP with Java","code":"IT-402","quiz_score":60.00,"reason":"Low quiz score"}]',
 '[{"type":"quiz","priority":"high","message":"Practice OOP and Java concepts daily"},{"type":"assignment","priority":"high","message":"Submit missing Java assignment"}]',
 '{"lecture_attendance":75.00,"campus_presence":72.00,"assignment_consistency":50.00,"quiz_accuracy":60.00,"gpa_factor":58.25}',
 '2025-02-26 12:00:00'),

(17, 4,
 76.00, 70.00, 1.00, 'medium', 6, 6, 'stable',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Decent performance. Focus on exam preparation."}]',
 '{"lecture_attendance":87.50,"campus_presence":82.00,"assignment_consistency":75.00,"quiz_accuracy":80.00,"gpa_factor":91.75}',
 '2025-02-26 12:00:00'),

(18, 4,
 97.00, 95.00, 10.00, 'high', 1, 1, 'improving',
 '{"level":"low","factors":[],"at_risk":false}',
 '[]',
 '[{"type":"general","priority":"low","message":"Exceptional performance! You are a top student."}]',
 '{"lecture_attendance":100.00,"campus_presence":99.00,"assignment_consistency":100.00,"quiz_accuracy":100.00,"gpa_factor":100.00}',
 '2025-02-26 12:00:00');


-- ── Chatbot Intents ──────────────────────────────────
INSERT INTO chatbot_intents (intent_name, description, example_phrases, response_template, is_active) VALUES
('check_attendance',
 'Student asks about their attendance status',
 '["What is my attendance?","How many classes have I missed?","Am I short in attendance?","Check my attendance"]',
 'Your current attendance in {course} is {percentage}%. You have attended {attended} out of {total} classes.',
 TRUE),

('check_result',
 'Student asks about exam or quiz results',
 '["What are my marks?","Show my result","How did I do in the midterm?","My quiz score"]',
 'Your result for {exam}: {obtained}/{total} marks. Grade: {grade}.',
 TRUE),

('fee_status',
 'Student asks about fee payment status',
 '["Is my fee submitted?","Fee deadline?","Fee voucher status","How much fee is pending?"]',
 'Your fee voucher {voucher_no} status is {status}. Amount: Rs. {amount}. Due date: {due_date}.',
 TRUE),

('assignment_deadline',
 'Student asks about upcoming assignment deadlines',
 '["When is the assignment due?","Assignment deadline?","Submission date?"]',
 'Assignment "{title}" for {course} is due on {due_date}. Total marks: {total_marks}.',
 TRUE),

('timetable',
 'Student asks about class schedule',
 '["What is my timetable?","When is the next class?","Class schedule","When does DBA class start?"]',
 'Your timetable for Spring 2025: DBA - Mon/Wed 08:00-09:30 | OOP Java - Tue/Thu 10:00-11:30 | SPM - Mon/Fri 11:00-12:30 | FYP - Wed/Fri 14:00-15:30.',
 TRUE);

-- ── Chatbot FAQs ─────────────────────────────────────
INSERT INTO chatbot_faqs (question, answer, category, is_active) VALUES
('How do I check my attendance?',
 'Login to the LMS, go to My Courses, select any course and click on Attendance to see your detailed attendance record.',
 'attendance', TRUE),

('What is the minimum attendance requirement?',
 'The minimum required attendance is 75%. Students below 75% will not be allowed to appear in final exams.',
 'attendance', TRUE),

('How do I submit an assignment?',
 'Go to My Courses > select the course > Assignments > click Submit on the relevant assignment and upload your file.',
 'assignments', TRUE),

('What file formats are allowed for assignment submission?',
 'Allowed formats are .pdf, .docx, .java, .zip, .sql depending on the assignment. Check each assignment description for specific requirements.',
 'assignments', TRUE),

('How do I contact my teacher?',
 'You can use the Chat section in your course group, or email your teacher directly. Mr. Ghulam Ghos: ghulam.ghos@bzu.edu.pk | Mr. Asif Raza: asif.raza@bzu.edu.pk',
 'general', TRUE),

('When are the midterm exams?',
 'Midterm exams for Spring 2025 commence on March 15, 2025. DBA Midterm: March 15 | OOP Java Midterm: March 17 | SPM Midterm: March 18 | FYP Evaluation: March 20.',
 'exams', TRUE),

('How do I get a duplicate fee challan?',
 'Contact the accounts department in person or email accounts@bzu.edu.pk with your roll number to request a duplicate fee challan.',
 'fees', TRUE);

-- ── AI Quizzes ───────────────────────────────────────
INSERT INTO ai_quizzes
  (student_id, offering_id, topic, difficulty, questions_json, correct_answers_json, score_percentage, feedback, weak_areas)
VALUES
(9, 1, 'Database Indexing', 'medium',
 '[{"id":1,"question":"What type of index is automatically created on a PRIMARY KEY?","options":["Unique Index","Clustered Index","Full-text Index","Composite Index"],"correct_answer":"Clustered Index","explanation":"Primary keys automatically create clustered indexes in most RDBMS."},{"id":2,"question":"Which SQL command is used to create an index?","options":["MAKE INDEX","CREATE INDEX","ADD INDEX","INDEX ON"],"correct_answer":"CREATE INDEX","explanation":"CREATE INDEX is the standard SQL command to create an index on a table column."},{"id":3,"question":"What is the disadvantage of too many indexes?","options":["Faster SELECT","Slower INSERT/UPDATE","Increased memory","Both B and C"],"correct_answer":"Both B and C","explanation":"Too many indexes slow down write operations and consume extra disk space."}]',
 '{"1":"Clustered Index","2":"CREATE INDEX","3":"Both B and C"}',
 100.00, 'Perfect! Excellent understanding of database indexing.', '[]'),

(11, 1, 'Database Backup', 'easy',
 '[{"id":1,"question":"What does a full backup include?","options":["Changed data only","All database data","Only transaction logs","Index data only"],"correct_answer":"All database data","explanation":"A full backup includes a complete copy of all database data."},{"id":2,"question":"Which backup type is fastest to restore?","options":["Incremental","Differential","Full","Log"],"correct_answer":"Full","explanation":"Full backups are fastest to restore as all data is in one backup set."},{"id":3,"question":"What is a transaction log backup used for?","options":["Schema backup","Point-in-time recovery","Index backup","User backup"],"correct_answer":"Point-in-time recovery","explanation":"Transaction log backups allow point-in-time recovery of a database."}]',
 '{"1":"Changed data only","2":"Full","3":"Index backup"}',
 33.33, 'Needs improvement. Review backup types and recovery strategies.', '["Backup Types","Recovery Strategies"]'),

(10, 2, 'Java Inheritance', 'medium',
 '[{"id":1,"question":"Can a Java class extend multiple classes?","options":["Yes","No","Only abstract classes","Only interfaces"],"correct_answer":"No","explanation":"Java does not support multiple inheritance through classes. Use interfaces instead."},{"id":2,"question":"Which keyword is used to call parent class constructor in Java?","options":["parent()","base()","super()","this()"],"correct_answer":"super()","explanation":"super() is used to call the parent class constructor in Java."},{"id":3,"question":"What is the default parent class of all Java classes?","options":["AbstractClass","BaseClass","Object","Main"],"correct_answer":"Object","explanation":"All Java classes implicitly extend the Object class from java.lang package."}]',
 '{"1":"No","2":"super()","3":"Object"}',
 100.00, 'Excellent! Perfect score on Java Inheritance.', '[]');


-- ── Campus Attendance Logs ───────────────────────────
INSERT INTO campus_attendance
  (student_id, gate_id, camera_id, entry_time, exit_time, entry_direction,
   face_match_confidence, processing_time_ms, spoof_check_passed, liveness_score,
   is_duplicate_filtered, manual_override)
VALUES
-- Sarfraz (9) - Regular attendee
(9, 1, 1, '2025-02-03 07:45:00', '2025-02-03 14:30:00', 'in', 96.50, 245, TRUE, 0.92, FALSE, FALSE),
(9, 1, 1, '2025-02-04 08:10:00', '2025-02-04 13:45:00', 'in', 97.20, 231, TRUE, 0.94, FALSE, FALSE),
(9, 1, 1, '2025-02-05 07:55:00', '2025-02-05 14:00:00', 'in', 96.90, 252, TRUE, 0.93, FALSE, FALSE),
(9, 1, 1, '2025-02-10 08:05:00', '2025-02-10 15:30:00', 'in', 95.60, 248, TRUE, 0.90, FALSE, FALSE),
(9, 1, 1, '2025-02-17 07:50:00', '2025-02-17 14:20:00', 'in', 97.10, 239, TRUE, 0.92, FALSE, FALSE),

-- Zain Arain (10) - Perfect attendee
(10, 1, 1, '2025-02-03 07:30:00', '2025-02-03 15:00:00', 'in', 98.20, 220, TRUE, 0.97, FALSE, FALSE),
(10, 1, 1, '2025-02-04 07:35:00', '2025-02-04 14:30:00', 'in', 97.80, 225, TRUE, 0.96, FALSE, FALSE),
(10, 1, 1, '2025-02-05 07:40:00', '2025-02-05 15:10:00', 'in', 98.50, 218, TRUE, 0.98, FALSE, FALSE),
(10, 1, 1, '2025-02-10 07:25:00', '2025-02-10 14:45:00', 'in', 98.10, 222, TRUE, 0.97, FALSE, FALSE),
(10, 1, 1, '2025-02-17 07:45:00', '2025-02-17 15:20:00', 'in', 97.90, 228, TRUE, 0.96, FALSE, FALSE),

-- Moeez Israr (11) - Irregular
(11, 1, 1, '2025-02-03 09:15:00', '2025-02-03 12:30:00', 'in', 94.30, 265, TRUE, 0.88, FALSE, FALSE),
(11, 1, 1, '2025-02-10 10:00:00', '2025-02-10 13:00:00', 'in', 93.80, 270, TRUE, 0.87, FALSE, FALSE),
(11, 1, 1, '2025-02-17 11:30:00', '2025-02-17 14:00:00', 'in', 94.50, 260, TRUE, 0.89, FALSE, FALSE),

-- Haiqa (18) - Perfect
(18, 1, 1, '2025-02-03 07:20:00', '2025-02-03 15:00:00', 'in', 98.80, 215, TRUE, 0.98, FALSE, FALSE),
(18, 1, 1, '2025-02-04 07:25:00', '2025-02-04 14:45:00', 'in', 98.60, 218, TRUE, 0.97, FALSE, FALSE),
(18, 1, 1, '2025-02-05 07:30:00', '2025-02-05 15:30:00', 'in', 99.00, 210, TRUE, 0.99, FALSE, FALSE);

-- ── Face Recognition Attempt Logs ────────────────────
INSERT INTO face_recognition_logs
  (student_id, gate_id, camera_id, confidence, match_success, processing_time_ms, spoof_check_passed, liveness_score)
VALUES
(9,    1, 1, 96.50, TRUE,  245, TRUE, 0.92),
(10,   1, 1, 98.20, TRUE,  220, TRUE, 0.97),
(11,   1, 1, 94.30, TRUE,  265, TRUE, 0.88),
(18,   1, 1, 98.80, TRUE,  215, TRUE, 0.98),
(NULL, 1, 1, 45.20, FALSE, 312, FALSE, 0.42),
(NULL, 1, 1, 38.50, FALSE, 325, TRUE,  0.35);


SET FOREIGN_KEY_CHECKS = 1;

-- ── Verify Data ──────────────────────────────────────
SELECT 'departments'              AS table_name, COUNT(*) AS records FROM departments
UNION ALL SELECT 'programs',                               COUNT(*) FROM programs
UNION ALL SELECT 'semesters',                              COUNT(*) FROM semesters
UNION ALL SELECT 'courses',                                COUNT(*) FROM courses
UNION ALL SELECT 'users',                                  COUNT(*) FROM users
UNION ALL SELECT 'student_profiles',                       COUNT(*) FROM student_profiles
UNION ALL SELECT 'teacher_profiles',                       COUNT(*) FROM teacher_profiles
UNION ALL SELECT 'course_offerings',                       COUNT(*) FROM course_offerings
UNION ALL SELECT 'enrollments',                            COUNT(*) FROM enrollments
UNION ALL SELECT 'lecture_sessions',                       COUNT(*) FROM lecture_sessions
UNION ALL SELECT 'lecture_attendance',                     COUNT(*) FROM lecture_attendance
UNION ALL SELECT 'campus_gates',                           COUNT(*) FROM campus_gates
UNION ALL SELECT 'campus_attendance',                      COUNT(*) FROM campus_attendance
UNION ALL SELECT 'assignments',                            COUNT(*) FROM assignments
UNION ALL SELECT 'assignment_submissions',                 COUNT(*) FROM assignment_submissions
UNION ALL SELECT 'quizzes',                                COUNT(*) FROM quizzes
UNION ALL SELECT 'quiz_questions',                         COUNT(*) FROM quiz_questions
UNION ALL SELECT 'quiz_attempts',                          COUNT(*) FROM quiz_attempts
UNION ALL SELECT 'exams',                                  COUNT(*) FROM exams
UNION ALL SELECT 'exam_results',                           COUNT(*) FROM exam_results
UNION ALL SELECT 'fee_structure',                          COUNT(*) FROM fee_structure
UNION ALL SELECT 'fee_vouchers',                           COUNT(*) FROM fee_vouchers
UNION ALL SELECT 'fee_payments',                           COUNT(*) FROM fee_payments
UNION ALL SELECT 'announcements',                          COUNT(*) FROM announcements
UNION ALL SELECT 'notice_board',                           COUNT(*) FROM notice_board
UNION ALL SELECT 'chat_groups',                            COUNT(*) FROM chat_groups
UNION ALL SELECT 'messages',                               COUNT(*) FROM messages
UNION ALL SELECT 'student_performance_scores',             COUNT(*) FROM student_performance_scores
UNION ALL SELECT 'chatbot_intents',                        COUNT(*) FROM chatbot_intents
UNION ALL SELECT 'chatbot_faqs',                           COUNT(*) FROM chatbot_faqs
UNION ALL SELECT 'ai_quizzes',                             COUNT(*) FROM ai_quizzes;