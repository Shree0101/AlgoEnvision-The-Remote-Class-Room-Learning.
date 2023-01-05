-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 12:03 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `air_quality`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(33) NOT NULL,
  `last_name` varchar(33) NOT NULL,
  `email` varchar(33) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`) VALUES
(1, 'admin', 'admin', 'a@a.com', '9988776655', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `teacher_name` varchar(33) NOT NULL,
  `subject` varchar(15) NOT NULL,
  `description` varchar(55) NOT NULL,
  `document` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `teacher_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `teacher_name`, `subject`, `description`, `document`, `uploaded_at`, `teacher_id_id`) VALUES
(1, 'vishal', 'Python', 'python notes', '/media/Python_vishal_30042022_123301.pdf', '2022-04-30 07:03:01.568283', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin model', 7, 'add_adminmodel'),
(26, 'Can change admin model', 7, 'change_adminmodel'),
(27, 'Can delete admin model', 7, 'delete_adminmodel'),
(28, 'Can view admin model', 7, 'view_adminmodel'),
(29, 'Can add course model', 8, 'add_coursemodel'),
(30, 'Can change course model', 8, 'change_coursemodel'),
(31, 'Can delete course model', 8, 'delete_coursemodel'),
(32, 'Can view course model', 8, 'view_coursemodel'),
(33, 'Can add discussion model', 9, 'add_discussionmodel'),
(34, 'Can change discussion model', 9, 'change_discussionmodel'),
(35, 'Can delete discussion model', 9, 'delete_discussionmodel'),
(36, 'Can view discussion model', 9, 'view_discussionmodel'),
(37, 'Can add result model', 10, 'add_resultmodel'),
(38, 'Can change result model', 10, 'change_resultmodel'),
(39, 'Can delete result model', 10, 'delete_resultmodel'),
(40, 'Can view result model', 10, 'view_resultmodel'),
(41, 'Can add question model', 11, 'add_questionmodel'),
(42, 'Can change question model', 11, 'change_questionmodel'),
(43, 'Can delete question model', 11, 'delete_questionmodel'),
(44, 'Can view question model', 11, 'view_questionmodel'),
(45, 'Can add student model', 12, 'add_studentmodel'),
(46, 'Can change student model', 12, 'change_studentmodel'),
(47, 'Can delete student model', 12, 'delete_studentmodel'),
(48, 'Can view student model', 12, 'view_studentmodel'),
(49, 'Can add homework model', 13, 'add_homeworkmodel'),
(50, 'Can change homework model', 13, 'change_homeworkmodel'),
(51, 'Can delete homework model', 13, 'delete_homeworkmodel'),
(52, 'Can view homework model', 13, 'view_homeworkmodel'),
(53, 'Can add teacher model', 14, 'add_teachermodel'),
(54, 'Can change teacher model', 14, 'change_teachermodel'),
(55, 'Can delete teacher model', 14, 'delete_teachermodel'),
(56, 'Can view teacher model', 14, 'view_teachermodel'),
(57, 'Can add assignment model', 15, 'add_assignmentmodel'),
(58, 'Can change assignment model', 15, 'change_assignmentmodel'),
(59, 'Can delete assignment model', 15, 'delete_assignmentmodel'),
(60, 'Can view assignment model', 15, 'view_assignmentmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `question_number` int(10) UNSIGNED NOT NULL,
  `total_marks` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_name`, `question_number`, `total_marks`) VALUES
(1, 'Java', 5, 10),
(2, 'Python', 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE `discussion` (
  `id` int(11) NOT NULL,
  `user_name` varchar(33) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`id`, `user_name`, `user_type`, `user_id`, `message`, `date`, `time`) VALUES
(1, 'ajit', 'student', 2, 'Hello', '2022-04-29', '19:55:45.183867'),
(2, 'vishal', 'teacher', 2, 'Hi', '2022-04-30', '12:33:49.214493'),
(3, 'ajit', 'student', 2, 'please share django form info', '2022-04-30', '13:01:37.239929'),
(4, 'ganesh', 'student', 3, 'please share python tuple info', '2022-04-30', '13:02:37.836657'),
(5, 'shiv', 'teacher', 1, 'django forms define with django.forms which is helpful for validating data and building UI', '2022-04-30', '13:08:50.161587'),
(6, 'vishal', 'teacher', 2, 'python tuple use round brakets', '2022-04-30', '13:12:11.648704');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'AdminApp', 'adminmodel'),
(8, 'AdminApp', 'coursemodel'),
(9, 'AdminApp', 'discussionmodel'),
(11, 'AdminApp', 'questionmodel'),
(10, 'AdminApp', 'resultmodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(13, 'StudentApp', 'homeworkmodel'),
(12, 'StudentApp', 'studentmodel'),
(15, 'TeacherApp', 'assignmentmodel'),
(14, 'TeacherApp', 'teachermodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'TeacherApp', '0001_initial', '2022-04-29 03:22:10.379454'),
(2, 'StudentApp', '0001_initial', '2022-04-29 03:22:11.995099'),
(3, 'AdminApp', '0001_initial', '2022-04-29 03:22:15.738947'),
(4, 'contenttypes', '0001_initial', '2022-04-29 03:22:16.155941'),
(5, 'auth', '0001_initial', '2022-04-29 03:22:24.754292'),
(6, 'admin', '0001_initial', '2022-04-29 03:22:26.714206'),
(7, 'admin', '0002_logentry_remove_auto_add', '2022-04-29 03:22:26.761135'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-29 03:22:26.792382'),
(9, 'contenttypes', '0002_remove_content_type_name', '2022-04-29 03:22:27.494745'),
(10, 'auth', '0002_alter_permission_name_max_length', '2022-04-29 03:22:28.319670'),
(11, 'auth', '0003_alter_user_email_max_length', '2022-04-29 03:22:29.354338'),
(12, 'auth', '0004_alter_user_username_opts', '2022-04-29 03:22:29.416800'),
(13, 'auth', '0005_alter_user_last_login_null', '2022-04-29 03:22:29.740061'),
(14, 'auth', '0006_require_contenttypes_0002', '2022-04-29 03:22:29.786933'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2022-04-29 03:22:29.824737'),
(16, 'auth', '0008_alter_user_username_max_length', '2022-04-29 03:22:30.520371'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2022-04-29 03:22:32.110384'),
(18, 'auth', '0010_alter_group_name_max_length', '2022-04-29 03:22:32.727986'),
(19, 'auth', '0011_update_proxy_permissions', '2022-04-29 03:22:32.765748'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2022-04-29 03:22:33.399053'),
(21, 'sessions', '0001_initial', '2022-04-29 03:22:34.155038');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0mgbgbli5313ovtcjaedpisb1zh0dvnk', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkOy4:wLG7cgtuRhOmY9EwWhgmu-t_oPC-c6fP_WBEiGOppEU', '2022-05-13 11:39:24.074248'),
('6ugyw4h4at5hcs5jyun1mofj3k68v39x', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkNAv:70psDdZwWww7d2SRqh6a1XqMHx9vi-gy29AGl7Mni7o', '2022-05-13 09:44:33.506450'),
('8h5yp6xadvlkoesx1ro7key2hryvc6oa', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkHji:lf93VpD6HzUsl3RhUu3SDeNf1e7Ix9NSrHHUlQXQC7Y', '2022-05-13 03:56:06.918127'),
('bcxcbdoh0mqsi4b2cvsmqw674q0axcje', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkNtT:OP8qUu0nfjXIkaXy4mzhPbohIbDNvuD3yLAxfrLfFtk', '2022-05-13 10:30:35.954464'),
('g4kl6pngwzfgclfw12a45wieqy1uh3an', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkMkv:sRZSICDAh9AcIePwUUL4DezTq4YtD9h2DpvSruu_sB4', '2022-05-13 09:17:41.357538'),
('hmpya8rujd1gwkojrnduhsffgqt5jj43', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkLgw:_IUOwvYi9i8qYcDTaMBTTt688BgOOIMW7VHs63YxvvU', '2022-05-13 08:09:30.086052'),
('i6u3vfwg9n9i68vq1m9mhzljiee0lbxa', '.eJyrViotTi1SslIqLilNSc0rUdKBseIzU5SsjBDctMyi4pL4vMTcVKDqxKxMZKWpuYmZOSBhh0S95PxcpVoASEYefw:1nkRYX:OEnji3e_uxEGqKKZgUXOe-OpSawIQb7Ha_KD00kmpng', '2022-05-13 14:25:13.739972'),
('inm8mu2aoopqt6h98gse2nmf5pz0gd9p', 'OTY1N2U2Y2RiOGIzNDcwYjA3OWJhYjJiMmEwMmViNGQzZWFhYTQzZjp7InVzZXIiOiJzdHVkZW50Iiwic3R1ZGVudF9pZCI6Miwic3R1ZGVudF9maXJzdF9uYW1lIjoiYWppdCIsInN0dWRlbnRfZW1haWwiOiJhQGEuY29tIn0=', '2022-05-14 08:20:30.422896'),
('m2b49gxi7nzsmc818175wuydk4sbd61g', 'OTY1N2U2Y2RiOGIzNDcwYjA3OWJhYjJiMmEwMmViNGQzZWFhYTQzZjp7InVzZXIiOiJzdHVkZW50Iiwic3R1ZGVudF9pZCI6Miwic3R1ZGVudF9maXJzdF9uYW1lIjoiYWppdCIsInN0dWRlbnRfZW1haWwiOiJhQGEuY29tIn0=', '2022-05-14 07:42:29.440051'),
('n1o7ufjyxu5mco5stvej7vraa2v6ch27', 'Y2M5YTE1NGNlYjYwNTIxODM1NzFhOGQ2YjBjM2Q4ZDhhNThiZTQ2MTp7InVzZXIiOiJzdHVkZW50Iiwic3R1ZGVudF9pZCI6Mywic3R1ZGVudF9maXJzdF9uYW1lIjoiZ2FuZXNoIiwic3R1ZGVudF9lbWFpbCI6ImdhbmVzaEBnbWFpbC5jb20ifQ==', '2022-05-14 07:22:14.935684'),
('prx2awnpim0ou8qxhj11nhov45gc3oym', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkTaQ:ZCC64anoZi7EtClhiTDHGULCf72yKc9CTQLkwOlix8w', '2022-05-13 16:35:18.895847'),
('s8nhh34vw1bp3f26fj77goamsfgcylpz', '.eJyrViotTi1SslJKTMnNzFPSgdDxmSlKVoYwTlpmUXFJfF5ibiqGutTcxMwckKhDol5yfq5SLQBAqRrn:1nkPoj:VRahx4aLqFrc7IEMAOkRKWmT0dtJ1HOaNzHVROC20mM', '2022-05-13 12:33:49.403946');

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `teacher_email` varchar(33) NOT NULL,
  `subject` varchar(15) NOT NULL,
  `description` varchar(55) NOT NULL,
  `document` varchar(100) NOT NULL,
  `remark` varchar(55) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  `teacher_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `teacher_email`, `subject`, `description`, `document`, `remark`, `uploaded_at`, `student_id_id`, `teacher_id_id`) VALUES
(1, 'vishal@gmail.com', 'Python', 'homework python forms and models', '/media/Python_ganesh_30042022_123730.docx', 'write demo program', '2022-04-30 07:11:03.443186', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `marks` int(10) UNSIGNED NOT NULL,
  `question` varchar(600) NOT NULL,
  `option1` varchar(200) NOT NULL,
  `option2` varchar(200) NOT NULL,
  `option3` varchar(200) NOT NULL,
  `option4` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `marks`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `course_id`) VALUES
(1, 2, 'Number of primitive data types in Java are?', '6', '7', '8', '9', 'Option3', 1),
(2, 2, 'Which of the following option leads to the portability and security of Java?', 'Bytecode is executed by JVM', 'The applet makes the Java code secure and portable', 'Use of exception handling', 'Dynamic binding between objects', 'Option1', 1),
(3, 2, 'Which of the following is not a Java features?', 'Dynamic', 'Architecture Neutral', 'Use of pointers', 'Object-oriented', 'Option3', 1),
(5, 2, 'What does the expression float a = 35 / 0 return?', '0', 'Not a Number', 'Infinity', 'Run time exception', 'Option3', 1),
(6, 2, 'Which of the following for loop declaration is not valid?', 'for ( int i = 99; i >= 0; i / 9 )', 'for ( int i = 7; i <= 77; i += 7 )', 'for ( int i = 20; i >= 2; - -i )', 'for ( int i = 2; i <= 20; i = 2* i )', 'Option1', 1),
(7, 2, 'What is the maximum length of a Python identifier?', '32', '16', '128', 'No fix length is specified', 'Option4', 2),
(8, 2, 'Who developed the Python language?', 'Zim Den', 'Guido van Rossum', 'Niene Stom', 'Wick van Rossum', 'Option2', 2),
(9, 2, 'Which one of the following is the correct extension of the Python file?', '.py', '.python', '.p', 'None of these', 'Option1', 2),
(11, 2, 'Which of the following concepts is not a part of Python?', 'Pointers', 'Dynamic Typing', 'Loops', 'All of above', 'Option1', 2),
(12, 2, 'Which of the following statements are used in Exception Handling in Python?', 'try', 'except', 'finally', 'All of above', 'Option4', 2),
(13, 2, 'How many threads can be executed at a time?', 'Only one thread', 'Multiple threads', 'Only main (main() method) thread', 'Two threads', 'Option2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `marks` int(10) UNSIGNED NOT NULL,
  `date` datetime(6) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `marks`, `date`, `exam_id`, `student_id`) VALUES
(1, 10, '2022-04-29 16:33:00.445317', 1, 2),
(2, 11, '2022-04-29 16:35:03.073130', 2, 2),
(3, 11, '2022-04-30 07:08:30.206731', 1, 3),
(4, 11, '2022-04-30 07:09:04.320874', 2, 3),
(5, 4, '2022-04-30 07:20:34.370625', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(33) NOT NULL,
  `last_name` varchar(33) NOT NULL,
  `email` varchar(33) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`) VALUES
(2, 'ajit', 'patil', 'a@a.com', '9988776655', 'a'),
(3, 'ganesh', 'borade', 'ganesh@gmail.com', '9988771234', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `first_name` varchar(33) NOT NULL,
  `last_name` varchar(33) NOT NULL,
  `email` varchar(33) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(33) NOT NULL,
  `subject` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `subject`) VALUES
(1, 'shiv', 'raj', 'a@a.com', '9988776655', 'a', 'Python'),
(2, 'vishal', 'vish', 'vishal@gmail.com', '9900998877', 'a', 'Python');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Assignments_teacher_id_id_44a50c39_fk_Teacher_id` (`teacher_id_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Homework_student_id_id_5516a371_fk_Student_id` (`student_id_id`),
  ADD KEY `Homework_teacher_id_id_f7f21d8e_fk_Teacher_id` (`teacher_id_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Question_course_id_5c85a1d2_fk_Course_id` (`course_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Result_exam_id_ceadc2f7_fk_Course_id` (`exam_id`),
  ADD KEY `Result_student_id_b7ca3953_fk_Student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `Assignments_teacher_id_id_44a50c39_fk_Teacher_id` FOREIGN KEY (`teacher_id_id`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `Homework_student_id_id_5516a371_fk_Student_id` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `Homework_teacher_id_id_f7f21d8e_fk_Teacher_id` FOREIGN KEY (`teacher_id_id`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `Question_course_id_5c85a1d2_fk_Course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `Result_exam_id_ceadc2f7_fk_Course_id` FOREIGN KEY (`exam_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `Result_student_id_b7ca3953_fk_Student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
