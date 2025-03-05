-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 08:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credits` int(11) NOT NULL,
  `semester` enum('semester1','semester2') NOT NULL,
  `faculty_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `credits`, `semester`, `faculty_id`) VALUES
(1, 'ML', 1, '', 1),
(2, 'ICP', 1, 'semester1', 1),
(101, 'Data Structures', 3, '', 1),
(104, 'Electrical Calculus', 1, 'semester1', 1),
(105, 'OOP', 1, 'semester1', 1),
(107, 'Engineering Calculus', 2, 'semester2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `material_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_materials`
--

INSERT INTO `course_materials` (`material_id`, `course_id`, `title`, `content`, `upload_date`) VALUES
(1, 1, 'Threading', 'Multithreading', '0000-00-00 00:00:00'),
(2, 1, 'Threading', 'Multithreading', '2024-12-01 16:13:49'),
(3, 1, 'Threading', 'Multithreading', '2024-12-03 18:53:44'),
(4, 1, 'Neural Networks ', 'Explore the mathematical concepts ', '2024-12-03 19:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `enrollment_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `date_enrolled` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `grade`, `enrollment_status`, `date_enrolled`) VALUES
(1, NULL, NULL, NULL, 'pending', '2024-11-29 20:31:14'),
(2, NULL, NULL, NULL, 'pending', '2024-11-29 20:51:26'),
(3, 68302026, 1, NULL, 'approved', '2024-11-29 23:25:46'),
(4, 68302026, 101, NULL, 'approved', '2024-11-29 23:26:23'),
(5, 68302026, 101, NULL, 'approved', '2024-11-30 12:20:53'),
(6, 68302026, 1, NULL, 'rejected', '2024-11-30 12:21:42'),
(7, 9, 1, NULL, 'approved', '2024-12-02 20:12:58'),
(8, 9, 101, NULL, 'approved', '2024-12-03 14:42:33'),
(9, 9, 101, NULL, 'approved', '2024-12-03 19:07:26'),
(10, 4, 2, NULL, 'pending', '2024-12-03 19:09:12'),
(11, 9, 1, NULL, 'approved', '2024-12-03 19:27:01'),
(12, 9, 2, NULL, 'approved', '2024-12-03 19:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `department_id` int(100) DEFAULT NULL,
  `faculty_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `department_id`, `faculty_name`) VALUES
(1, 1, 'Dr. John Doe');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `grade` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `enrollment_id`, `grade`) VALUES
(13, 7, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `student_id`, `payment_amount`, `payment_date`, `payment_method`, `status`) VALUES
(1, 9, 800.00, '2024-12-03 00:14:02', 'Bank Transfer ', 'Approved'),
(2, 9, 2.00, '2024-12-03 15:18:44', 'Credit Card', 'Approved'),
(3, 9, 900.00, '2024-12-03 19:07:41', 'Bank Transfer ', 'Approved'),
(4, 9, 800.00, '2024-12-03 19:29:16', 'Credit Card', 'Approved'),
(5, 9, 800.00, '2024-12-03 19:32:55', 'Credit Card', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `profile_pic` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `dob`, `major`, `enrollment_date`, `profile_pic`) VALUES
(9, '2024-12-02', 'Cs', NULL, NULL),
(20, '2024-12-02', 'CS', NULL, NULL),
(21, '2024-11-24', 'MIS', NULL, NULL),
(22, '2024-11-24', 'MIS', NULL, NULL),
(23, '2024-11-23', 'Electrical Engineering ', NULL, NULL),
(24, '2024-11-23', 'Electrical Engineering ', NULL, NULL),
(25, '2024-12-03', 'Cs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','faculty','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `role`) VALUES
(1, 'Beatrice ', 'Abraham', 'beatrice.abraham@ashesi.edu.gh', 'password@123', 'faculty'),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', 'password@123', 'student'),
(3, 'Jessica', 'Doesi', 'jessica.doesi@ashesi.edu.gh', 'password@123', 'faculty'),
(4, 'Ama', 'Quansah', 'Ama12@gmail.com', 'password@123', 'student'),
(5, 'Ama', 'Ansah', 'ama.ansah@ashesi.edu.gh', 'password@123', 'admin'),
(8, 'Bob', 'Asare', 'b.asare@gmail.com', 'password@123', 'student'),
(9, 'Dennis', 'Mensah', 'dmensah@ashesi.edu.gh', 'password@123', 'student'),
(12, 'Abigail', 'Arthur', 'abigailart@gmail.com', 'password@123', 'faculty'),
(14, 'Jamal-Deen', 'Abdulai', 'jamal.abdulai@ashesi.edu.gh', 'password@123', 'faculty'),
(16, 'Maame', 'Abrahram', 'Mab12@yahoo.com', 'password@123', 'faculty'),
(18, 'Kweku', 'Yamoah', 'Kayems@ashesi.edu.gh', 'password@123', 'admin'),
(20, 'Peggy', 'Dadzie', 'Pegd@yahoo.com', 'password@123', 'student'),
(21, 'Henry', 'Abraham', 'henry.abraham@ashesi.edu.gh', 'password@123', 'student'),
(22, 'Henrietta', 'Abraham', 'henrietta.abraham@ashesi.edu.gh', 'password@123', 'student'),
(23, 'Daniel', 'Ernest', 'daniel.ernest@ashesi.edu.gh', 'password@123', 'student'),
(24, 'Charlotte', 'Abraham', 'charlotte.abrahamt@ashesi.edu.gh', 'password@123', 'student'),
(25, 'Ama', 'Abraham', 'Ama.esuan@ashesi.edu.gh', 'password@123', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `fk_department_id` (`department_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

--
-- Constraints for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD CONSTRAINT `course_materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
