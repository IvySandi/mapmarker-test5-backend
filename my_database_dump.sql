-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: location
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cameragroups`
--

DROP TABLE IF EXISTS `cameragroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameragroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cameraId` int DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CameraGroups_groupId_cameraId_unique` (`cameraId`,`groupId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `cameragroups_ibfk_1` FOREIGN KEY (`cameraId`) REFERENCES `cameras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cameragroups_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cameragroups`
--

LOCK TABLES `cameragroups` WRITE;
/*!40000 ALTER TABLE `cameragroups` DISABLE KEYS */;
INSERT INTO `cameragroups` VALUES (1,'2024-12-03 08:30:58','2024-12-03 08:30:58',13,1),(2,'2024-12-03 08:57:22','2024-12-03 08:57:22',5,3),(3,'2024-12-03 08:57:22','2024-12-03 08:57:22',6,3),(4,'2024-12-03 10:22:19','2024-12-03 10:22:19',5,4),(5,'2024-12-03 10:22:19','2024-12-03 10:22:19',6,4),(6,'2024-12-03 10:22:33','2024-12-03 10:22:33',5,5),(7,'2024-12-03 10:22:33','2024-12-03 10:22:33',6,5);
/*!40000 ALTER TABLE `cameragroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cameras`
--

DROP TABLE IF EXISTS `cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cameras`
--

LOCK TABLES `cameras` WRITE;
/*!40000 ALTER TABLE `cameras` DISABLE KEYS */;
INSERT INTO `cameras` VALUES (5,'Camera 1',1.3521,103.82,'Security','https://cdn.pixabay.com/photo/2021/07/21/02/16/architecture-6482060_1280.jpg','Near Jurong West',NULL,NULL,'2024-12-03 10:14:37',1),(6,'Camera 2',1.3621,103.83,'IT','https://cdn.pixabay.com/photo/2015/02/24/13/23/buildings-647400_1280.jpg','Near Bukit Batok',NULL,NULL,'2024-12-03 10:14:32',0),(7,'Camera 3',1.3421,103.81,'Maintenance','https://cdn.pixabay.com/photo/2017/09/04/18/00/marina-bay-of-singapore-2714866_1280.jpg','Near Choa Chu Kang',NULL,NULL,'2024-12-03 09:34:20',0),(8,'Camera 4',1.3321,103.8,'Security','https://cdn.pixabay.com/photo/2019/07/15/15/55/singapore-4339710_1280.jpg','Near Jurong East',NULL,NULL,NULL,0),(13,'Camera 1',37.7749,-122.419,'Security','camera1.jpg','Outdoor camera',NULL,'2024-12-03 08:30:58','2024-12-03 08:30:58',1);
/*!40000 ALTER TABLE `cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Group A','2024-12-03 08:30:58','2024-12-03 08:30:58'),(2,'Group B','2024-12-03 08:55:00','2024-12-03 08:55:00'),(3,'Group B','2024-12-03 08:57:22','2024-12-03 08:57:22'),(4,'Testing','2024-12-03 10:22:19','2024-12-03 10:22:19'),(5,'Group B','2024-12-03 10:22:33','2024-12-03 10:22:33');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20241201160403-create-camera.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 20:48:05
