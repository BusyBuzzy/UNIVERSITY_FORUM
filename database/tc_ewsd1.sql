/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `academic_year` (
  `academic_id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `closure_date` date NOT NULL,
  `final_closure_date` date NOT NULL,
  `academic_year_name` varchar(30) NOT NULL,
  `action` varchar(20) NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`academic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_content` text NOT NULL,
  `comment_checkbox` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  `idea_id` int NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `idea_id` (`idea_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`idea_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ideas` (
  `idea_id` int NOT NULL AUTO_INCREMENT,
  `idea_checkbox` varchar(50) NOT NULL,
  `idea_content` text NOT NULL,
  `idea_attachment` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `academic_id` int NOT NULL,
  `idea_date` date NOT NULL,
  `idea_likes` int NOT NULL DEFAULT '0',
  `idea_dislikes` int NOT NULL DEFAULT '0',
  `idea_comment_count` int NOT NULL DEFAULT '0',
  `idea_view_count` int NOT NULL DEFAULT '0',
  `dept_id` int NOT NULL,
  PRIMARY KEY (`idea_id`),
  KEY `dept_id` (`dept_id`),
  KEY `academic_id` (`academic_id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ideas_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ideas_ibfk_2` FOREIGN KEY (`academic_id`) REFERENCES `academic_year` (`academic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ideas_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ideas_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `rating_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `idea_id` int NOT NULL,
  `rating` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_type` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_dob` date NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `dept_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `academic_year` (`academic_id`, `start_date`, `closure_date`, `final_closure_date`, `academic_year_name`, `action`) VALUES
(36, '2022-04-24', '2023-04-14', '2026-05-19', '2022-2023', 'inactive');
INSERT INTO `academic_year` (`academic_id`, `start_date`, `closure_date`, `final_closure_date`, `academic_year_name`, `action`) VALUES
(37, '2023-04-22', '2024-04-26', '2026-06-30', '2023-2024', '');
INSERT INTO `academic_year` (`academic_id`, `start_date`, `closure_date`, `final_closure_date`, `academic_year_name`, `action`) VALUES
(38, '2024-04-22', '2025-04-22', '2025-04-24', '2024-2025', '');
INSERT INTO `academic_year` (`academic_id`, `start_date`, `closure_date`, `final_closure_date`, `academic_year_name`, `action`) VALUES
(39, '2025-04-24', '2026-05-22', '2026-05-31', '2025-2026', 'active');

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(21, 'Student Affairs');
INSERT INTO `category` (`category_id`, `category_name`) VALUES
(22, 'Academic Affairs');
INSERT INTO `category` (`category_id`, `category_name`) VALUES
(23, 'Suggestions');
INSERT INTO `category` (`category_id`, `category_name`) VALUES
(24, 'Fresher Welcome'),
(25, 'Graduation'),
(26, 'Exam ');

INSERT INTO `comments` (`comment_id`, `comment_content`, `comment_checkbox`, `user_id`, `idea_id`, `comment_date`) VALUES
(63, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta justo magna, at venenatis arcu pellentesque ut.', 'anonymous', 59, 73, '2022-03-11');
INSERT INTO `comments` (`comment_id`, `comment_content`, `comment_checkbox`, `user_id`, `idea_id`, `comment_date`) VALUES
(64, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra in arcu sit amet aliquam. Nulla mollis ex lorem, in venenatis erat fermentum eu.', 'anonymous', 59, 72, '2022-03-11');
INSERT INTO `comments` (`comment_id`, `comment_content`, `comment_checkbox`, `user_id`, `idea_id`, `comment_date`) VALUES
(65, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget lorem non augue laoreet scelerisque', '', 62, 74, '2022-03-11');
INSERT INTO `comments` (`comment_id`, `comment_content`, `comment_checkbox`, `user_id`, `idea_id`, `comment_date`) VALUES
(66, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt. ', '', 62, 76, '2022-03-11'),
(67, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut.', '', 58, 82, '2022-03-12'),
(68, '23', 'anonymous', 1, 72, '2025-04-22'),
(69, 'nbnb', '', 1, 72, '2025-04-22'),
(70, 'asa', '', 1, 73, '2025-04-22'),
(71, 'xcxcx', '', 1, 73, '2025-04-22'),
(72, 'qwe', 'anonymous', 1, 75, '2025-04-22'),
(73, 'hello ', 'anonymous', 1, 74, '2025-04-23'),
(74, 'ya it must be there', 'anonymous', 1, 86, '2025-04-24'),
(75, 'hvhvh', '', 69, 72, '2025-04-25'),
(76, 'testing\r\n', '', 1, 86, '2025-04-26'),
(77, 'Comment Testing Anonymous', 'anonymous', 70, 76, '2025-04-28'),
(78, 'Comment Testing With username', '', 70, 76, '2025-04-28'),
(79, 'testing', '', 51, 74, '2025-04-30'),
(80, 'testing 1', 'anonymous', 51, 74, '2025-04-30'),
(81, 'testing 1', 'anonymous', 51, 74, '2025-04-30'),
(82, 'testing\r\n', '', 51, 74, '2025-04-30');

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'HR Department');
INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(27, 'Engineering Department');
INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(28, 'Medical Department');
INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(29, 'Art Department'),
(30, 'Accounting Department'),
(31, 'Science & Technology');

INSERT INTO `ideas` (`idea_id`, `idea_checkbox`, `idea_content`, `idea_attachment`, `user_id`, `category_id`, `academic_id`, `idea_date`, `idea_likes`, `idea_dislikes`, `idea_comment_count`, `idea_view_count`, `dept_id`) VALUES
(72, '', 'Should we make a contest for mr and miss fresher?', 'mr-freshers-miss-freshers-.jpg', 49, 24, 37, '2022-03-10', 4, 1, 4, 24, 1);
INSERT INTO `ideas` (`idea_id`, `idea_checkbox`, `idea_content`, `idea_attachment`, `user_id`, `category_id`, `academic_id`, `idea_date`, `idea_likes`, `idea_dislikes`, `idea_comment_count`, `idea_view_count`, `dept_id`) VALUES
(73, '', 'There is not enough books in the library. How do you guys think?', 'library.jpeg', 51, 23, 37, '2022-03-10', 4, 1, 3, 11, 27);
INSERT INTO `ideas` (`idea_id`, `idea_checkbox`, `idea_content`, `idea_attachment`, `user_id`, `category_id`, `academic_id`, `idea_date`, `idea_likes`, `idea_dislikes`, `idea_comment_count`, `idea_view_count`, `dept_id`) VALUES
(74, 'anonymous', 'In laboratory, most of the equipment is broken and some of them are rusted. Students do not have  any chances to learn through experiment. Should i write letter to principal? ', 'lab.jpg', 52, 23, 37, '2022-03-11', 1, 1, 6, 12, 27);
INSERT INTO `ideas` (`idea_id`, `idea_checkbox`, `idea_content`, `idea_attachment`, `user_id`, `category_id`, `academic_id`, `idea_date`, `idea_likes`, `idea_dislikes`, `idea_comment_count`, `idea_view_count`, `dept_id`) VALUES
(75, '', 'I want to make a tour of university campus for freshers.', 'Yonsei.png', 57, 24, 37, '2022-03-11', 2, 0, 1, 7, 29),
(76, '', 'Can i make an event for students how to incorporate meaningful break time into busy schedule?', 'break.jpg', 56, 21, 37, '2022-03-11', 2, 1, 3, 14, 28),
(77, '', 'The environmental center is coming campus to present ways that students can adopt a zero waste lifestyle and how to support helping protect the earth.', 'tree.jpg', 58, 21, 37, '2022-03-11', 1, 0, 0, 3, 29),
(79, 'anonymous', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis nisi quis quam feugiat tincidunt. Fusce non lorem non lacus consequat rutrum. Mauris tempor elit vitae purus vulputate bibendum. Ut. ', 'test1.jpg', 59, 25, 37, '2022-03-11', 1, 0, 0, 1, 29),
(80, 'anonymous', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed libero metus. Suspendisse cursus odio dictum gravida interdum. Morbi eros enim, egestas quis justo vitae. ', 'exam.jpg', 62, 26, 37, '2022-03-11', 1, 0, 0, 3, 30),
(82, 'anonymous', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet vulputate purus. Nunc in tempus dolor. Cras congue vitae nulla et maximus. Nulla et. ', 'test4.jpg', 60, 21, 37, '2022-03-12', 1, 0, 1, 3, 30),
(83, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas lobortis purus sit amet quam rutrum tempus. Integer volutpat mi dolor, tempus feugiat nulla hendrerit in. ', 'test5.jpg', 61, 21, 37, '2022-03-12', 1, 0, 0, 4, 30),
(84, 'anonymous', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur quis leo sed fringilla. Pellentesque condimentum vulputate massa id sollicitudin. Mauris a egestas neque. Nulla. ', 'test7.jpg', 58, 25, 37, '2022-03-12', 1, 0, 0, 3, 29),
(85, 'anonymous', 'need coffee shop', 'anime-coffee-shop-illustration.jpg', 1, 22, 38, '2025-04-20', 0, 1, 0, 9, 1),
(86, 'anonymous', 'need coffee shop', 'anime-coffee-shop-illustration.jpg', 1, 22, 38, '2025-04-20', 1, 0, 2, 5, 1),
(88, '', 'Testing (With Identificaiton)', 'testing.jpg', 64, 21, 39, '2025-04-28', 0, 0, 0, 2, 27),
(89, 'anonymous', 'Testing2 (Anonymous)', 'testing.jpg', 64, 21, 39, '2025-04-28', 0, 0, 0, 1, 27),
(90, '', 'Testing3', 'testing.jpg', 64, 21, 39, '2025-04-28', 0, 0, 0, 1, 27),
(91, '', 'Testing123', 'testing.jpg', 64, 23, 39, '2025-04-28', 0, 0, 0, 0, 27);

INSERT INTO `login_logs` (`id`, `user_id`, `browser`, `ip_address`, `login_time`, `logout_time`) VALUES
(1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:04:59', NULL);
INSERT INTO `login_logs` (`id`, `user_id`, `browser`, `ip_address`, `login_time`, `logout_time`) VALUES
(2, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:07:46', NULL);
INSERT INTO `login_logs` (`id`, `user_id`, `browser`, `ip_address`, `login_time`, `logout_time`) VALUES
(3, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:14:22', NULL);
INSERT INTO `login_logs` (`id`, `user_id`, `browser`, `ip_address`, `login_time`, `logout_time`) VALUES
(4, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:14:59', NULL),
(5, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:21:45', NULL),
(6, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:35:46', '2025-04-30 15:37:33'),
(7, 10, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:39:08', '2025-04-30 15:39:21'),
(8, 5, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:39:41', '2025-04-30 15:39:49'),
(9, 49, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:50:33', '2025-04-30 15:58:35'),
(10, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:58:47', '2025-04-30 15:59:36'),
(11, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 15:59:45', NULL),
(12, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:04:25', '2025-04-30 16:04:46'),
(13, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:04:56', '2025-04-30 16:10:56'),
(14, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:11:24', '2025-04-30 16:11:56'),
(15, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:13:43', '2025-04-30 16:20:31'),
(16, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:20:55', '2025-04-30 16:23:06'),
(17, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:23:13', '2025-04-30 16:23:34'),
(18, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:24:55', '2025-04-30 16:43:13'),
(19, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:43:38', NULL),
(20, 64, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:56:56', '2025-04-30 16:57:06'),
(21, 67, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 16:57:24', '2025-04-30 17:00:22'),
(22, 51, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 17:00:33', NULL),
(23, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 21:18:02', NULL),
(24, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-30 23:17:28', NULL),
(25, 69, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0', '::1', '2025-04-30 23:22:30', '2025-04-30 23:24:03');

INSERT INTO `rating_info` (`id`, `user_id`, `idea_id`, `rating`) VALUES
(238, 49, 67, 'Like');
INSERT INTO `rating_info` (`id`, `user_id`, `idea_id`, `rating`) VALUES
(239, 49, 68, 'Dislike');
INSERT INTO `rating_info` (`id`, `user_id`, `idea_id`, `rating`) VALUES
(240, 49, 69, 'Like');
INSERT INTO `rating_info` (`id`, `user_id`, `idea_id`, `rating`) VALUES
(241, 52, 72, 'Like'),
(242, 52, 73, 'Like'),
(243, 56, 75, 'Like'),
(244, 56, 72, 'Like'),
(245, 56, 73, 'Like'),
(246, 56, 74, 'Like'),
(247, 59, 72, 'Like'),
(248, 59, 73, 'Like'),
(249, 62, 73, 'Dislike'),
(250, 62, 76, 'Like'),
(251, 60, 72, 'Like'),
(253, 60, 74, 'Dislike'),
(254, 60, 75, 'Like'),
(255, 60, 76, 'Like'),
(256, 60, 81, 'Like'),
(257, 60, 77, 'Like'),
(258, 60, 78, 'Like'),
(259, 60, 80, 'Like'),
(260, 58, 82, 'Like'),
(261, 58, 83, 'Like'),
(262, 58, 84, 'Like'),
(264, 1, 73, 'Like'),
(265, 1, 79, 'Like'),
(266, 1, 86, 'Like'),
(267, 49, 85, 'Dislike'),
(268, 69, 72, 'Dislike'),
(269, 70, 76, 'Dislike');

INSERT INTO `roles` (`role_id`, `role_type`) VALUES
(1, 'admin');
INSERT INTO `roles` (`role_id`, `role_type`) VALUES
(2, 'qa_manager');
INSERT INTO `roles` (`role_id`, `role_type`) VALUES
(7, 'qa_coordinator');
INSERT INTO `roles` (`role_id`, `role_type`) VALUES
(8, 'staff');

INSERT INTO `users` (`user_id`, `username`, `user_dob`, `user_gender`, `user_phone`, `user_address`, `user_email`, `user_password`, `role_id`, `dept_id`, `created_at`, `last_login`, `status`) VALUES
(1, 'Team Complex', '2000-08-14', 'male', '09123456789', 'Yangon', 'complex@gmail.com', 'complex123', 1, 1, '2025-04-23 23:15:58', '2025-04-30 23:17:27', 0);
INSERT INTO `users` (`user_id`, `username`, `user_dob`, `user_gender`, `user_phone`, `user_address`, `user_email`, `user_password`, `role_id`, `dept_id`, `created_at`, `last_login`, `status`) VALUES
(2, 'Lynn Myat Bhone Htut', '2000-05-05', 'male', '09123456789', 'Yangon', 'lmbh@gmail.com', 'lmbh', 8, 29, '2025-04-23 23:15:58', '2025-04-30 11:36:31', 0);
INSERT INTO `users` (`user_id`, `username`, `user_dob`, `user_gender`, `user_phone`, `user_address`, `user_email`, `user_password`, `role_id`, `dept_id`, `created_at`, `last_login`, `status`) VALUES
(3, 'Wai Yan Htun', '2000-06-06', 'male', '09123456789', 'Yangon', 'wyh@gmail.com', 'wyh', 8, 27, '2025-04-23 23:15:58', '2025-04-30 01:36:31', 0);
INSERT INTO `users` (`user_id`, `username`, `user_dob`, `user_gender`, `user_phone`, `user_address`, `user_email`, `user_password`, `role_id`, `dept_id`, `created_at`, `last_login`, `status`) VALUES
(4, 'Lwin', '2000-04-12', 'male', '09123456789', 'Yangon', 'lmo@gmail.com', 'lmo', 8, 1, '2025-04-23 23:15:58', '2025-04-30 13:36:31', 0),
(5, 'Wai Yam Lin', '2000-05-23', 'male', '09123456789', 'Yangon', 'wyl@gmail.com', 'wyl', 8, 27, '2025-04-23 23:15:58', '2025-04-30 15:39:41', 0),
(6, 'Nant Theint Nadi Soe', '2000-10-22', 'female', '09123456789', 'Yangon', 'ntns@gmail.com', 'ntns', 8, 30, '2025-04-23 23:15:58', '2025-04-30 08:36:31', 0),
(7, 'Aye Thant Kyi', '2000-02-17', 'female', '09123456789', 'Yangon', 'atk@gmail.com', 'atk', 8, 30, '2025-04-23 23:15:58', '2025-04-29 11:36:31', 0),
(8, 'May Phyu Phyu Aung', '2000-08-19', 'female', '09123456789', 'Yangon', 'mppa@gmail.com', 'mppa', 8, 29, '2025-04-23 23:15:58', '2025-04-28 11:36:31', 0),
(9, 'Test Admin', '2002-03-12', 'female', '09123456789', 'Mandalay', 'admin@gmail.com', 'admin123', 1, 1, '2025-04-27 18:15:58', '2025-04-28 16:33:03', 0),
(10, 'QA Manager', '1985-01-26', 'male', '096833556', 'Ahlone, yangon', 'manager@gmail.com', 'manager123', 2, 1, '2025-04-23 23:15:58', '2025-04-30 15:39:08', 0),
(11, 'HR Department', '1984-05-22', 'male', '0934793895', 'Insein, yangon', 'hrcoordinator@gmail.com', 'hrcoordinator123', 7, 1, '2025-04-23 23:15:58', '2025-04-29 00:24:47', 0),
(12, 'Engineering Department', '1983-06-29', 'male', '095487244', 'ahlone, yangon', 'engcoordinator@gmail.com', 'engcoordinator123', 7, 27, '2025-04-23 23:15:58', NULL, 0),
(13, 'Medical Department', '1982-08-30', 'male', '09726563', 'North dagon, yangon', 'medcoordinator@gmail.com', 'medcoordinator123', 7, 28, '2025-04-23 23:15:58', NULL, 0),
(14, 'Art Department', '1980-03-19', 'male', '09335338', 'Hlaing, yangon', 'artcoordinator@gmail.com', 'artcoordinator123', 7, 29, '2025-04-23 23:15:58', NULL, 0),
(15, 'Accounting Department', '1983-04-28', 'male', '09885378', 'Kabaraye, yangon.', 'acccoordinator@gmail.com', 'acccordinator123', 7, 30, '2025-04-23 23:15:58', NULL, 0),
(16, 'Staff', '2000-05-11', 'female', '09123456788', 'Yangon', 'staff@gmail.com', 'staff123', 8, 30, '2025-04-23 23:15:58', '2025-04-30 11:09:13', 0),
(49, 'Hazel', '2000-08-25', 'female', '09500099', 'mya kan thar 2nd street, ygn', 'hazel@gmail.com', 'hazel', 8, 1, '2025-04-23 23:15:58', '2025-04-30 15:50:33', 0),
(50, 'Zin', '2000-08-01', 'female', '09899822', 'kamayut', 'zin@gmail.com', 'zin', 8, 1, '2025-04-23 23:15:58', NULL, 0),
(51, 'Zen', '1999-01-01', 'male', '09278822', 'Kyouk Myoung', 'zen@gmail.com', 'zen', 8, 27, '2025-04-23 23:15:58', '2025-04-30 17:00:33', 0),
(52, 'Jorge', '1999-02-02', 'male', '092277333', 'Hlaing ', 'jorge@gmail.com', 'jorge', 8, 27, '2025-04-23 23:15:58', NULL, 0),
(53, 'Axel ', '1998-08-08', 'male', '092223881', 'sagaing', 'aung@gmail.com', 'aung', 8, 27, '2025-04-23 23:15:58', NULL, 0),
(54, 'Jennie', '1995-01-01', 'female', '09886543', 'Hlaing, yangon', 'jennie@gmail.com', 'jennie', 8, 28, '2025-04-23 23:15:58', NULL, 0),
(55, 'Rose', '1994-03-03', 'female', '09335789', 'Myaynigone, yangon', 'rose@gmail.com', 'rose', 8, 28, '2025-04-23 23:15:58', NULL, 0),
(56, 'Irene', '1994-02-02', 'female', '09253744', 'Shwe pyi thar, yangon', 'irene@gmail.com', 'irene', 8, 28, '2025-04-23 23:15:58', NULL, 0),
(57, 'Liam', '1992-02-02', 'male', '09284442', 'Taunggyi', 'liam@gmail.com', 'liam', 8, 29, '2025-04-23 23:15:58', NULL, 0),
(58, 'Oliver', '1991-05-05', 'female', '09278422', 'sanchaung, yangon', 'oliver@gmail.com', 'oliver', 8, 29, '2025-04-23 23:15:58', NULL, 0),
(59, 'Lucas', '1990-04-07', 'male', '09232442', 'Kamayut, yangon', 'lucas@gmail.com', 'lucas', 8, 29, '2025-04-23 23:15:58', NULL, 0),
(60, 'Emma', '1990-01-28', 'female', '097728473', 'Sanchaung, yangon', 'emma@gmail.com', 'emma', 8, 30, '2025-04-23 23:15:58', NULL, 0),
(61, 'Lily', '1992-08-08', 'female', '092244677', 'Hledan, yangon', 'lily@gmail.com', 'lily', 8, 30, '2025-04-23 23:15:58', NULL, 0),
(62, 'Melody', '1989-02-28', 'female', '096652822', 'Shwe pyi thar, yangon', 'melody@gmail.com', 'melody', 8, 30, '2025-04-23 23:15:58', '2025-04-30 11:30:55', 0),
(64, 'Staff Testing', '2000-02-14', 'male', '09123456789', 'Yankin,Yangon', 'staff@gmail.com', 'staff', 8, 27, '2025-04-27 18:20:58', '2025-04-30 16:56:56', 0),
(65, 'Test QAC', '2004-02-22', 'female', '09123456789', 'Yangon', 'coordinator@gmail.com', 'coordinator123', 7, 31, '2025-04-28 23:53:42', '2025-04-30 11:41:32', 0),
(67, 'Test Staff', '2003-02-07', 'female', '09123456789', 'Mandalay', 'test@gmail.com', 'test123', 8, 31, '2025-04-29 00:39:01', '2025-04-30 16:57:24', 0),
(69, 'test ', '2000-01-20', 'male', '0912321321', 'Shan', 'abc@gmail.com', 'abc', 8, 31, '2025-04-30 15:55:30', '2025-04-30 23:22:30', 1);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;