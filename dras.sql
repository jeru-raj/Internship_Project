-- MySQL dump 10.13  Distrib 8.4.10, for Linux (x86_64)
--
-- Host: localhost    Database: dras
-- ------------------------------------------------------
-- Server version	8.4.10-0ubuntu0.26.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Donors`
--

DROP TABLE IF EXISTS `Donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donors` (
  `donor_id` int NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `active_flag` char(1) DEFAULT 'Y',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donors`
--

LOCK TABLES `Donors` WRITE;
/*!40000 ALTER TABLE `Donors` DISABLE KEYS */;
INSERT INTO `Donors` VALUES (1,'David','cara15201766@gmail.com','Y','2026-06-15 17:17:16','2026-06-17 12:26:27'),(2,'Mary','cara15201766@gmail.com','Y','2026-06-15 17:17:16','2026-06-17 12:27:34'),(3,'John','cara15201766@gmail.com','Y','2026-06-15 17:17:16','2026-06-17 12:31:12'),(4,'Jerusha','cara15201766@gmail.com','Y','2026-06-22 13:17:02','2026-06-22 13:17:02'),(5,'Kaviya','cara15201766@gmail.com','Y','2026-06-24 14:48:06','2026-06-24 14:48:06'),(6,'Ashika','cara15201766@gmail.com','Y','2026-06-24 15:12:04','2026-06-24 15:12:04'),(7,'Aro','cara15201766@gmail.com','Y','2026-06-24 17:05:38','2026-06-24 17:05:38'),(8,'Sophia','cara15201766@gmail.com','Y','2026-06-24 17:09:16','2026-06-24 17:09:16'),(9,'Kovil','cara15201766@gmail.com','Y',NULL,NULL),(10,'Joana','cara15201766@gmail.com','Y',NULL,NULL),(11,'Kavi','cara15201766@gmail.com','Y',NULL,NULL),(12,'donor','cara15201766@gmail.com','Y','2026-06-25 12:50:44','2026-06-25 12:50:44'),(13,'Jefferson','cara15201766@gmail.com','Y','2026-06-25 12:58:37','2026-06-25 12:58:37'),(14,'Stella','cara15201766@gmail.com','Y','2026-06-25 13:03:33','2026-06-25 13:03:33'),(15,'Donor1','cara15201766@gmail.com','Y','2026-06-28 06:17:27','2026-06-28 06:17:27'),(16,'Donor2','cara15201766@gmail.com','Y','2026-06-28 08:08:46','2026-06-28 08:08:46'),(17,'Donor3','cara15201766@gmail.com','Y','2026-06-28 08:18:34','2026-06-28 08:18:34'),(18,'Donor4','cara15201766@gmail.com','Y','2026-06-28 08:19:33','2026-06-28 08:19:33'),(19,'Donor5','cara15201766@gmail.com','Y','2026-06-28 08:39:24','2026-06-28 08:39:24'),(20,'Donor6','cara15201766@gmail.com','Y','2026-06-28 08:45:20','2026-06-28 08:45:20'),(21,'Donor7','cara15201766@gmail.com','Y','2026-06-29 08:17:20','2026-06-29 08:17:20'),(22,'Donor8','cara15201766@gmail.com','Y','2026-06-29 08:33:50','2026-06-29 08:33:50'),(23,'Donor9','cara15201766@gmail.com','Y','2026-06-29 09:10:35','2026-06-29 09:10:35'),(24,'Donor10','cara15201766@gmail.com','Y','2026-06-29 09:17:10','2026-06-29 09:17:10'),(25,'Donor11','cara15201766@gmail.com','Y','2026-06-29 09:34:42','2026-06-29 09:34:42'),(26,'Donor12','cara15201766@gmail.com','Y','2026-06-29 09:37:39','2026-06-29 09:37:39'),(27,'Donor13','cara15201766@gmail.com','Y','2026-06-29 10:33:43','2026-06-29 10:33:43'),(28,'Donor14','cara15201766@gmail.com','Y','2026-06-29 17:55:11','2026-06-29 17:55:11'),(29,'Donor15','cara15201766@gmail.com','Y','2026-06-29 20:06:52','2026-06-29 20:06:52'),(30,'Donor16','cara15201766@gmail.com','Y','2026-06-30 07:07:10','2026-06-30 07:07:10');
/*!40000 ALTER TABLE `Donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Email_Log`
--

DROP TABLE IF EXISTS `Email_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Email_Log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `sent_timestamp` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`log_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `Email_Log_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `Sponsor_Report_History` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Email_Log`
--

LOCK TABLES `Email_Log` WRITE;
/*!40000 ALTER TABLE `Email_Log` DISABLE KEYS */;
INSERT INTO `Email_Log` VALUES (1,7,'cara15201766@gmail.com','2026-06-17 13:48:33','SUCCESS','Email sent successfully'),(2,8,'cara15201766@gmail.com','2026-06-17 17:59:37','SUCCESS','Email sent successfully'),(3,9,'cara15201766@gmail.com','2026-06-17 18:33:43','SUCCESS','Email sent successfully'),(4,10,'cara15201766@gmail.com','2026-06-17 19:01:00','SUCCESS','Email sent successfully'),(5,11,'cara15201766@gmail.com','2026-06-17 19:06:04','SUCCESS','Email sent successfully'),(6,11,'cara15201766@gmail.com','2026-06-17 19:06:07','SUCCESS','Email sent successfully'),(7,13,'cara15201766@gmail.com','2026-06-17 19:08:06','SUCCESS','Email sent successfully'),(8,13,'cara15201766@gmail.com','2026-06-17 19:08:06','SUCCESS','Email sent successfully'),(9,15,'cara15201766@gmail.com','2026-06-17 19:34:08','SUCCESS','Email sent successfully'),(10,15,'cara15201766@gmail.com','2026-06-17 19:34:08','SUCCESS','Email sent successfully'),(11,17,'cara15201766@gmail.com','2026-06-17 19:36:08','SUCCESS','Email sent successfully'),(12,18,'cara15201766@gmail.com','2026-06-18 12:18:07','SUCCESS','Email sent successfully'),(13,19,'cara15201766@gmail.com','2026-06-18 12:37:05','SUCCESS','Email sent successfully'),(14,NULL,'cara15201766@gmail.com','2026-06-21 13:57:32','FAILED','(535, b\'5.7.8 Username and Password not accepted. For more information, go to\\n5.7.8  https://support.google.com/mail/?p=BadCredentials d9443c01a7336-2c7444a9c66sm43991945ad.72 - gsmtp\')'),(15,NULL,'cara15201766@gmail.com','2026-06-21 13:58:06','FAILED','(535, b\'5.7.8 Username and Password not accepted. For more information, go to\\n5.7.8  https://support.google.com/mail/?p=BadCredentials d9443c01a7336-2c7439f86d0sm40986715ad.40 - gsmtp\')'),(16,20,'cara15201766@gmail.com','2026-06-21 14:00:07','SUCCESS','Email sent successfully'),(17,21,'cara15201766@gmail.com','2026-06-21 16:37:28','SUCCESS','Email sent successfully'),(18,22,'cara15201766@gmail.com','2026-06-21 21:01:14','SUCCESS','Email sent successfully'),(19,23,'cara15201766@gmail.com','2026-06-21 21:41:31','SUCCESS','Email sent successfully'),(20,24,'cara15201766@gmail.com','2026-06-21 21:54:35','SUCCESS','Email sent successfully'),(21,25,'cara15201766@gmail.com','2026-06-21 22:23:06','SUCCESS','Email sent successfully'),(22,26,'cara15201766@gmail.com','2026-06-21 22:26:13','SUCCESS','Email sent successfully'),(23,26,'cara15201766@gmail.com','2026-06-21 22:26:20','SUCCESS','Email sent successfully'),(24,28,'cara15201766@gmail.com','2026-06-22 12:54:06','SUCCESS','Email sent successfully'),(25,29,'cara15201766@gmail.com','2026-06-22 12:55:35','SUCCESS','Email sent successfully'),(26,30,'cara15201766@gmail.com','2026-06-22 13:24:10','SUCCESS','Email sent successfully'),(27,31,'cara15201766@gmail.com','2026-06-24 15:08:08','SUCCESS','Email sent successfully'),(28,32,'cara15201766@gmail.com','2026-06-24 15:18:07','SUCCESS','Email sent successfully'),(29,33,'cara15201766@gmail.com','2026-06-24 17:10:12','SUCCESS','Email sent successfully'),(30,34,'cara15201766@gmail.com','2026-06-24 17:12:23','SUCCESS','Email sent successfully'),(31,37,'cara15201766@gmail.com','2026-06-25 15:38:08','SUCCESS','Email sent successfully'),(32,40,'cara15201766@gmail.com','2026-06-25 15:48:08','SUCCESS','Email sent successfully'),(33,42,'cara15201766@gmail.com','2026-06-25 18:14:08','SUCCESS','Email sent successfully'),(34,44,'cara15201766@gmail.com','2026-06-25 18:36:09','SUCCESS','Email sent successfully');
/*!40000 ALTER TABLE `Email_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FieldWorkers`
--

DROP TABLE IF EXISTS `FieldWorkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FieldWorkers` (
  `fieldworker_id` int NOT NULL AUTO_INCREMENT,
  `fieldworker_name` varchar(255) DEFAULT NULL,
  `active_flag` char(1) DEFAULT 'Y',
  `donor_id` int DEFAULT NULL,
  PRIMARY KEY (`fieldworker_id`),
  KEY `fk_fieldworker_donor` (`donor_id`),
  CONSTRAINT `fk_fieldworker_donor` FOREIGN KEY (`donor_id`) REFERENCES `Donors` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FieldWorkers`
--

LOCK TABLES `FieldWorkers` WRITE;
/*!40000 ALTER TABLE `FieldWorkers` DISABLE KEYS */;
INSERT INTO `FieldWorkers` VALUES (1,'John','Y',NULL),(2,'Samuel','Y',NULL),(3,'Godfrey','Y',NULL),(4,'Laxman','Y',NULL),(5,'Mani','Y',NULL),(6,'Esther','Y',NULL),(7,'Sherlyn','Y',NULL),(8,'Ponnamal','Y',NULL),(9,'Julie','Y',NULL),(10,'Jeru','Y',NULL),(11,'Missionary','Y',NULL),(12,'Jayson','Y',NULL),(13,'Mala','Y',NULL),(14,'Lavanya','Y',4),(15,'Shalini','Y',6),(16,'Worker1','Y',15),(17,'Worker2','Y',16),(18,'Worker4','Y',18),(19,'Worker5','Y',19),(20,'Worker6','Y',20),(21,'Worker7','Y',21),(22,'Worker8','Y',22),(23,'Worker9','Y',23),(24,'Worker10','Y',24),(25,'Worker11','Y',25),(26,'Worker12','Y',26),(27,'Worker13','Y',27),(28,'Worker14','Y',28),(29,'Worker15','Y',29),(30,'Worker16','Y',30);
/*!40000 ALTER TABLE `FieldWorkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsor_Report_History`
--

DROP TABLE IF EXISTS `Sponsor_Report_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsor_Report_History` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `donor_id` int DEFAULT NULL,
  `fieldworker_id` int DEFAULT NULL,
  `report_file_name` varchar(500) DEFAULT NULL,
  `receipt_file_name` varchar(500) DEFAULT NULL,
  `report_month` int DEFAULT NULL,
  `report_year` int DEFAULT NULL,
  `email_sent` char(1) DEFAULT NULL,
  `sent_date` datetime DEFAULT NULL,
  `email_subject` varchar(500) DEFAULT NULL,
  `email_status` varchar(50) DEFAULT NULL,
  `error_message` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `uq_report_upload` (`donor_id`,`fieldworker_id`,`report_month`,`report_year`),
  KEY `fieldworker_id` (`fieldworker_id`),
  CONSTRAINT `Sponsor_Report_History_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `Donors` (`donor_id`),
  CONSTRAINT `Sponsor_Report_History_ibfk_2` FOREIGN KEY (`fieldworker_id`) REFERENCES `FieldWorkers` (`fieldworker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsor_Report_History`
--

LOCK TABLES `Sponsor_Report_History` WRITE;
/*!40000 ALTER TABLE `Sponsor_Report_History` DISABLE KEYS */;
INSERT INTO `Sponsor_Report_History` VALUES (1,1,1,'John_David_0626.pdf',NULL,6,2026,'Y','2026-06-16 14:00:52','Monthly Mission Report - June 2026','SUCCESS',NULL,'2026-06-16 14:00:52'),(3,1,1,'John_David_0726.pdf',NULL,7,2026,'Y','2026-06-17 12:37:44','Monthly Mission Report - 7/2026','SUCCESS',NULL,'2026-06-17 12:37:44'),(4,1,1,'John_David_0826.pdf',NULL,8,2026,'Y','2026-06-17 12:49:53','Monthly Mission Report – 8/2026','SUCCESS',NULL,'2026-06-17 12:49:53'),(5,2,2,'Samuel_Mary_0926.jpg',NULL,9,2026,'Y','2026-06-17 13:17:45','Monthly Mission Report – 9/2026','SUCCESS',NULL,'2026-06-17 13:17:45'),(6,2,2,'Samuel_Mary_0526.jpg',NULL,5,2026,'Y','2026-06-17 13:17:51','Monthly Mission Report – 5/2026','SUCCESS',NULL,'2026-06-17 13:17:51'),(7,1,1,'John_David_1026.pdf',NULL,10,2026,'Y','2026-06-17 13:48:33','Monthly Mission Report – 10/2026','SUCCESS',NULL,'2026-06-17 13:48:33'),(8,1,1,'John_David_1126.pdf',NULL,11,2026,'Y','2026-06-17 17:59:37','Monthly Mission Report – 11/2026','SUCCESS',NULL,'2026-06-17 17:59:37'),(9,1,1,'John_David_1125.pdf',NULL,11,2025,'Y','2026-06-17 18:33:43','Monthly Mission Report – 11/2025','SUCCESS',NULL,'2026-06-17 18:33:43'),(10,1,1,'John_David_1124.pdf',NULL,11,2024,'Y','2026-06-17 19:01:00','Monthly Mission Report – 11/2024','SUCCESS',NULL,'2026-06-17 19:01:00'),(11,1,1,'John_David_1120.pdf',NULL,11,2020,'Y','2026-06-17 19:06:04','Monthly Mission Report – 11/2020','SUCCESS',NULL,'2026-06-17 19:06:04'),(13,1,1,'John_David_1121.pdf',NULL,11,2021,'Y','2026-06-17 19:08:06','Monthly Mission Report – 11/2021','SUCCESS',NULL,'2026-06-17 19:08:06'),(15,1,1,'John_David_1321.pdf',NULL,13,2021,'Y','2026-06-17 19:34:08','Monthly Mission Report – 13/2021','SUCCESS',NULL,'2026-06-17 19:34:08'),(17,1,1,'John_David_1421.pdf',NULL,14,2021,'Y','2026-06-17 19:36:07','Monthly Mission Report – 14/2021','SUCCESS',NULL,'2026-06-17 19:36:07'),(18,1,1,'John_David_1226.pdf',NULL,12,2026,'Y','2026-06-18 12:18:07','Monthly Mission Report – 12/2026','SUCCESS',NULL,'2026-06-18 12:18:07'),(19,1,1,'John_David_0127.pdf',NULL,1,2027,'Y','2026-06-18 12:37:05','Monthly Mission Report – 1/2027','SUCCESS',NULL,'2026-06-18 12:37:05'),(20,1,1,'John_David_0327.pdf',NULL,3,2027,'Y','2026-06-21 14:00:06','Monthly Mission Report – 3/2027','SUCCESS',NULL,'2026-06-21 14:00:06'),(21,1,1,'John_David_0227.pdf',NULL,2,2027,'Y','2026-06-21 16:37:28','Monthly Mission Report – 2/2027','SUCCESS',NULL,'2026-06-21 16:37:28'),(22,1,1,'John_David_0229.pdf',NULL,2,2029,'Y','2026-06-21 21:01:14','Monthly Mission Report – 2/2029','SUCCESS',NULL,'2026-06-21 21:01:14'),(23,1,1,'John_David_0106.pdf',NULL,1,2006,'Y','2026-06-21 21:41:30','Monthly Mission Report – 1/2006','SUCCESS',NULL,'2026-06-21 21:41:30'),(24,1,1,'John_David_0926.pdf',NULL,9,2026,'Y','2026-06-21 21:54:34','Monthly Mission Report – 9/2026','SUCCESS',NULL,'2026-06-21 21:54:34'),(25,2,2,'Samuel_Mary_0106.pdf',NULL,1,2006,'Y','2026-06-21 22:23:06','Monthly Mission Report – 1/2006','SUCCESS',NULL,'2026-06-21 22:23:06'),(26,2,2,'Samuel_Mary_0124.pdf',NULL,1,2024,'Y','2026-06-21 22:26:13','Monthly Mission Report – 1/2024','SUCCESS',NULL,'2026-06-21 22:26:13'),(28,1,1,'John_David_0521.pdf',NULL,5,2021,'Y','2026-06-22 12:54:05','Monthly Mission Report – 5/2021','SUCCESS',NULL,'2026-06-22 12:54:05'),(29,2,2,'Samuel_Mary_0521.pdf',NULL,5,2021,'Y','2026-06-22 12:55:34','Monthly Mission Report – 5/2021','SUCCESS',NULL,'2026-06-22 12:55:34'),(30,4,3,'Godfrey_Jerusha_0626.pdf',NULL,6,2026,'Y','2026-06-22 13:24:10','Monthly Mission Report – 6/2026','SUCCESS',NULL,'2026-06-22 13:24:10'),(31,5,4,'Laxman_Kaviya_0806.pdf',NULL,8,2006,'Y','2026-06-24 15:08:08','Monthly Mission Report – 8/2006','SUCCESS',NULL,'2026-06-24 15:08:08'),(32,6,5,'Mani_Ashika_0107.pdf',NULL,1,2007,'Y','2026-06-24 15:18:07','Monthly Mission Report – 1/2007','SUCCESS',NULL,'2026-06-24 15:18:07'),(33,7,6,'Esther_Aro_1280.pdf',NULL,12,2080,'Y','2026-06-24 17:10:12','Monthly Mission Report – 12/2080','SUCCESS',NULL,'2026-06-24 17:10:12'),(34,8,7,'Sherlyn_Sophia_1110.pdf',NULL,11,2010,'Y','2026-06-24 17:12:23','Monthly Mission Report – 11/2010','SUCCESS',NULL,'2026-06-24 17:12:23'),(37,10,9,'Julie_Joana_0107.pdf',NULL,1,2007,'Y','2026-06-29 07:43:14',NULL,'SUCCESS',NULL,NULL),(40,9,8,'Ponnamal_Kovil_0773.pdf',NULL,7,2073,'Y','2026-06-29 07:43:20',NULL,'SUCCESS',NULL,NULL),(42,11,10,'Jeru_Kavi_0806.pdf',NULL,8,2006,'Y','2026-06-29 07:43:26',NULL,'SUCCESS',NULL,NULL),(44,14,13,'Mala_Stella_0710.pdf',NULL,7,2010,'Y','2026-06-29 07:43:32',NULL,'SUCCESS',NULL,NULL),(46,4,14,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 07:43:38',NULL,'SUCCESS',NULL,NULL),(47,6,15,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 07:43:44',NULL,'SUCCESS',NULL,NULL),(48,15,16,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 07:43:49',NULL,'SUCCESS',NULL,NULL),(49,16,17,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-28 08:09:46',NULL,'SUCCESS',NULL,NULL),(50,18,18,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-28 08:20:49',NULL,'SUCCESS',NULL,NULL),(51,20,20,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-28 08:47:03',NULL,'SUCCESS',NULL,NULL),(52,21,21,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 08:20:08',NULL,'SUCCESS',NULL,NULL),(53,22,22,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 08:36:08',NULL,'SUCCESS',NULL,NULL),(54,22,22,'report.pdf','receipt.pdf',7,2026,'Y','2026-06-29 08:44:08',NULL,'SUCCESS',NULL,NULL),(55,24,24,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 09:22:08',NULL,'SUCCESS',NULL,NULL),(56,25,25,'report.pdf','receipt.pdf',6,2026,'Y','2026-06-29 09:36:09',NULL,'SUCCESS',NULL,NULL),(57,26,26,'report.pdf','receipt.pdf',7,2026,'Y','2026-06-29 09:40:14',NULL,'SUCCESS',NULL,NULL),(58,27,27,'report.pdf','receipt.pdf',5,2026,'Y','2026-06-29 10:54:09',NULL,'SUCCESS',NULL,NULL),(59,28,28,'report.pdf','receipt.pdf',8,2026,'Y','2026-06-29 17:58:08',NULL,'SUCCESS',NULL,NULL),(60,29,29,'report.pdf','receipt.pdf',12,2026,'Y','2026-06-29 20:10:10',NULL,'SUCCESS',NULL,NULL),(61,30,30,'report.pdf','receipt.pdf',12,2026,'Y','2026-06-30 07:10:09',NULL,'SUCCESS',NULL,NULL);
/*!40000 ALTER TABLE `Sponsor_Report_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add donors',7,'add_donors'),(26,'Can change donors',7,'change_donors'),(27,'Can delete donors',7,'delete_donors'),(28,'Can view donors',7,'view_donors'),(29,'Can add email log',8,'add_emaillog'),(30,'Can change email log',8,'change_emaillog'),(31,'Can delete email log',8,'delete_emaillog'),(32,'Can view email log',8,'view_emaillog'),(33,'Can add missionaries',9,'add_missionaries'),(34,'Can change missionaries',9,'change_missionaries'),(35,'Can delete missionaries',9,'delete_missionaries'),(36,'Can view missionaries',9,'view_missionaries'),(37,'Can add sponsor report history',10,'add_sponsorreporthistory'),(38,'Can change sponsor report history',10,'change_sponsorreporthistory'),(39,'Can delete sponsor report history',10,'delete_sponsorreporthistory'),(40,'Can view sponsor report history',10,'view_sponsorreporthistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'dras_app','donors'),(8,'dras_app','emaillog'),(9,'dras_app','missionaries'),(10,'dras_app','sponsorreporthistory'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-25 12:48:07.041657'),(2,'auth','0001_initial','2026-06-25 12:48:29.325477'),(3,'admin','0001_initial','2026-06-25 12:48:35.176179'),(4,'admin','0002_logentry_remove_auto_add','2026-06-25 12:48:35.272402'),(5,'admin','0003_logentry_add_action_flag_choices','2026-06-25 12:48:35.359143'),(6,'contenttypes','0002_remove_content_type_name','2026-06-25 12:48:45.080112'),(7,'auth','0002_alter_permission_name_max_length','2026-06-25 12:48:48.664847'),(8,'auth','0003_alter_user_email_max_length','2026-06-25 12:48:49.795060'),(9,'auth','0004_alter_user_username_opts','2026-06-25 12:48:50.423352'),(10,'auth','0005_alter_user_last_login_null','2026-06-25 12:48:54.425277'),(11,'auth','0006_require_contenttypes_0002','2026-06-25 12:48:54.545149'),(12,'auth','0007_alter_validators_add_error_messages','2026-06-25 12:48:54.701230'),(13,'auth','0008_alter_user_username_max_length','2026-06-25 12:49:01.238953'),(14,'auth','0009_alter_user_last_name_max_length','2026-06-25 12:49:09.211347'),(15,'auth','0010_alter_group_name_max_length','2026-06-25 12:49:09.568528'),(16,'auth','0011_update_proxy_permissions','2026-06-25 12:49:10.108391'),(17,'auth','0012_alter_user_first_name_max_length','2026-06-25 12:49:20.021096'),(18,'dras_app','0001_initial','2026-06-25 12:49:20.151859'),(19,'sessions','0001_initial','2026-06-25 12:49:22.082760');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30 13:50:38
