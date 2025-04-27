CREATE DATABASE  IF NOT EXISTS `tc_ewsd1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tc_ewsd1`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: tc_ewsd1
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `academic_id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `closure_date` date NOT NULL,
  `final_closure_date` date NOT NULL,
  `academic_year_name` varchar(30) NOT NULL,
  `action` varchar(20) NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`academic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (35,'2025-04-22','2026-04-22','2026-05-31','2025-2026',''),(37,'2025-04-22','2026-04-30','2026-06-30','2025-2026','active'),(38,'2025-04-24','2026-04-15','2026-05-19','2025-2026','inactive');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (21,'Student Affairs'),(22,'Academic Affairs'),(23,'Suggestions'),(24,'Fresher Welcome'),(25,'Graduation'),(26,'Exam ');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_content` text NOT NULL,
  `comment_checkbox` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  `idea_id` int NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (63,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta justo magna, at venenatis arcu pellentesque ut.','anonymous',59,73,'2022-03-11'),(64,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra in arcu sit amet aliquam. Nulla mollis ex lorem, in venenatis erat fermentum eu.','anonymous',59,72,'2022-03-11'),(65,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget lorem non augue laoreet scelerisque','',62,74,'2022-03-11'),(66,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt. ','',62,76,'2022-03-11'),(67,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut.','',58,82,'2022-03-12'),(68,'23','anonymous',1,72,'2025-04-22'),(69,'nbnb','',1,72,'2025-04-22'),(70,'asa','',1,73,'2025-04-22'),(71,'xcxcx','',1,73,'2025-04-22'),(72,'qwe','anonymous',1,75,'2025-04-22'),(73,'hello ','anonymous',1,74,'2025-04-23'),(74,'ya it must be there','anonymous',1,86,'2025-04-24'),(75,'hvhvh','',69,72,'2025-04-25');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'HR Department'),(27,'Engineering Department'),(28,'Medical Department'),(29,'Art Department'),(30,'Accounting Department');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas`
--

DROP TABLE IF EXISTS `ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  PRIMARY KEY (`idea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` VALUES (72,'','Should we make a contest for mr and miss fresher?','mr-freshers-miss-freshers-.jpg',49,24,37,'2022-03-10',4,2,4,14,1),(73,'','There is not enough books in the library. How do you guys think?','library.jpeg',51,23,37,'2022-03-10',4,1,3,9,27),(74,'anonymous','In laboratory, most of the equipment is broken and some of them are rusted. Students do not have  any chances to learn through experiment. Should i write letter to principal? ','lab.jpg',52,23,37,'2022-03-11',1,1,2,10,27),(75,'','I want to make a tour of university campus for freshers.','Yonsei.png',57,24,37,'2022-03-11',2,0,1,7,29),(76,'','Can i make an event for students how to incorporate meaningful break time into busy schedule?','break.jpg',56,21,37,'2022-03-11',2,0,1,7,28),(77,'','The environmental center is coming campus to present ways that students can adopt a zero waste lifestyle and how to support helping protect the earth.','tree.jpg',58,21,37,'2022-03-11',1,0,0,2,29),(78,'anonymous','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ligula urna, auctor nec erat posuere, tincidunt cursus elit. Nunc feugiat lacinia vehicula. Nunc nec blandit leo, ut cursus sem. Fusce. ','testing.jpg',59,22,37,'2022-03-11',1,0,0,2,29),(79,'anonymous','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis nisi quis quam feugiat tincidunt. Fusce non lorem non lacus consequat rutrum. Mauris tempor elit vitae purus vulputate bibendum. Ut. ','test1.jpg',59,25,37,'2022-03-11',1,0,0,1,29),(80,'anonymous','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed libero metus. Suspendisse cursus odio dictum gravida interdum. Morbi eros enim, egestas quis justo vitae. ','exam.jpg',62,26,37,'2022-03-11',1,0,0,3,30),(81,'','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id accumsan sem. Donec mattis ut augue nec ornare. Vestibulum rhoncus fringilla aliquet. Integer in justo. ','test3.jpg',62,22,37,'2022-03-12',1,0,0,2,30),(82,'anonymous','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet vulputate purus. Nunc in tempus dolor. Cras congue vitae nulla et maximus. Nulla et. ','test4.jpg',60,21,37,'2022-03-12',1,0,1,3,30),(83,'','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas lobortis purus sit amet quam rutrum tempus. Integer volutpat mi dolor, tempus feugiat nulla hendrerit in. ','test5.jpg',61,21,37,'2022-03-12',1,0,0,3,30),(84,'anonymous','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur quis leo sed fringilla. Pellentesque condimentum vulputate massa id sollicitudin. Mauris a egestas neque. Nulla. ','test7.jpg',58,25,37,'2022-03-12',1,0,0,3,29),(85,'anonymous','need coffee shop','anime-coffee-shop-illustration.jpg',1,22,37,'2025-04-24',0,1,0,2,1),(86,'anonymous','need coffee shop','anime-coffee-shop-illustration.jpg',1,22,37,'2025-04-24',1,0,1,3,1);
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_info`
--

DROP TABLE IF EXISTS `rating_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `idea_id` int NOT NULL,
  `rating` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_info`
--

LOCK TABLES `rating_info` WRITE;
/*!40000 ALTER TABLE `rating_info` DISABLE KEYS */;
INSERT INTO `rating_info` VALUES (238,49,67,'Like'),(239,49,68,'Dislike'),(240,49,69,'Like'),(241,52,72,'Like'),(242,52,73,'Like'),(243,56,75,'Like'),(244,56,72,'Like'),(245,56,73,'Like'),(246,56,74,'Like'),(247,59,72,'Like'),(248,59,73,'Like'),(249,62,73,'Dislike'),(250,62,76,'Like'),(251,60,72,'Like'),(253,60,74,'Dislike'),(254,60,75,'Like'),(255,60,76,'Like'),(256,60,81,'Like'),(257,60,77,'Like'),(258,60,78,'Like'),(259,60,80,'Like'),(260,58,82,'Like'),(261,58,83,'Like'),(262,58,84,'Like'),(263,1,72,'Dislike'),(264,1,73,'Like'),(265,1,79,'Like'),(266,1,86,'Like'),(267,49,85,'Dislike'),(268,69,72,'Dislike');
/*!40000 ALTER TABLE `rating_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_type` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'qa_manager'),(7,'qa_coordinator'),(8,'staff');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Khin','2000-08-14','female','09123','Mawlamyine','khin@gmail.com','123',1,1,'2025-04-23 23:15:58','2025-04-25 02:20:12'),(49,'Hazel','2000-08-25','female','09500099','mya kan thar 2nd street, ygn','hazel@gmail.com','hazel',8,1,'2025-04-23 23:15:58','2025-04-24 01:51:59'),(50,'Zin','2000-08-01','female','09899822','kamayut','zin@gmail.com','zin',8,1,'2025-04-23 23:15:58',NULL),(51,'Zen','1999-01-01','male','09278822','Kyouk Myoung','zen@gmail.com','zen',8,27,'2025-04-23 23:15:58',NULL),(52,'Jorge','1999-02-02','male','092277333','Hlaing ','jorge@gmail.com','jorge',8,27,'2025-04-23 23:15:58',NULL),(53,'Axel ','1998-08-08','male','092223881','sagaing','aung@gmail.com','aung',8,27,'2025-04-23 23:15:58',NULL),(54,'Jennie','1995-01-01','female','09886543','Hlaing, yangon','jennie@gmail.com','jennie',8,28,'2025-04-23 23:15:58',NULL),(55,'Rose','1994-03-03','female','09335789','Myaynigone, yangon','rose@gmail.com','rose',8,28,'2025-04-23 23:15:58',NULL),(56,'Irene','1994-02-02','female','09253744','Shwe pyi thar, yangon','irene@gmail.com','irene',8,28,'2025-04-23 23:15:58',NULL),(57,'Liam','1992-02-02','male','09284442','Taunggyi','liam@gmail.com','liam',8,29,'2025-04-23 23:15:58',NULL),(58,'Oliver','1991-05-05','female','09278422','sanchaung, yangon','oliver@gmail.com','oliver',8,29,'2025-04-23 23:15:58',NULL),(59,'Lucas','1990-04-07','male','09232442','Kamayut, yangon','lucas@gmail.com','lucas',8,29,'2025-04-23 23:15:58',NULL),(60,'Emma','1990-01-28','female','097728473','Sanchaung, yangon','emma@gmail.com','emma',8,30,'2025-04-23 23:15:58',NULL),(61,'Lily','1992-08-08','female','092244677','Hledan, yangon','lily@gmail.com','lily',8,30,'2025-04-23 23:15:58',NULL),(62,'Melody','1989-02-28','female','096652822','Shwe pyi thar, yangon','melody@gmail.com','melody',8,30,'2025-04-23 23:15:58',NULL),(63,'John','1985-01-26','male','096833556','Ahlone, yangon','john@gmail.com','john',2,1,'2025-04-23 23:15:58','2025-04-24 01:15:56'),(64,'Luke','1984-05-22','male','0934793895','Insein, yangon','luke@gmail.com','luke',7,1,'2025-04-23 23:15:58',NULL),(65,'Thomas','1983-06-29','male','095487244','ahlone, yangon','thomas@gmail.com','thomas',7,27,'2025-04-23 23:15:58',NULL),(66,'Andrew','1982-08-30','male','09726563','North dagon, yangon','andrew@gmail.com','andrew',7,28,'2025-04-23 23:15:58',NULL),(67,'Roman','1980-03-19','male','09335338','Hlaing, yangon','roman@gmail.com','roman',7,29,'2025-04-23 23:15:58',NULL),(68,'Austin','1983-04-28','male','09885378','Kabaraye, yangon.','austin@gmail.com','austin',7,30,'2025-04-23 23:15:58',NULL),(69,'wyhtun2','1999-03-15','male','1131074996','yangon','wai@gmail.com','123',8,27,'2025-04-23 23:15:58','2025-04-25 01:25:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25  2:24:40
