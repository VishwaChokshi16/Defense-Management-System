-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: defense
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `asset_id` int NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(100) DEFAULT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `acquisition_date` date DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `militaryunits` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'a1','tank','operational',1,'2000-04-14'),(2,'a2','fighter jet','under repair',6,'2001-05-23'),(3,'a3','gun','operational',4,'2000-11-14'),(4,'a4','helicopter','decommissioned',5,'2002-11-16'),(5,'a5','bomb','operational',3,'2002-01-05');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `militaryunits`
--

DROP TABLE IF EXISTS `militaryunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `militaryunits` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(50) DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  `base_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militaryunits`
--

LOCK TABLES `militaryunits` WRITE;
/*!40000 ALTER TABLE `militaryunits` DISABLE KEYS */;
INSERT INTO `militaryunits` VALUES (1,'Indigo','Tank battalion','Rishi Sharma','Region B'),(2,'ArtL','Artillery','Priyanka Parikh','Region A'),(3,'Indigo','Tank battalion','Rishabh Verma','Region C'),(4,'INF','Infantry','Sana Makwana','Region A'),(5,'INF','Infantry','Chirag Patel','Region D'),(6,'ArtL','Artillery','Kartik Sinha','Region B');
/*!40000 ALTER TABLE `militaryunits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(255) DEFAULT NULL,
  `operation_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `operation_status` varchar(20) DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  PRIMARY KEY (`operation_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `operations_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `militaryunits` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,'Operation Desert Shield','Defensive','2024-11-01','2024-11-30','Active',1),(2,'Operation Thunder Strike','Offensive','2024-10-15','2024-12-01','Active',2),(3,'Operation Vigilant Guardian','Surveillance','2024-11-05','2025-01-15','Planned',4),(4,'Operation Iron Resolve','Defensive','2024-09-20','2024-11-10','Completed',6),(5,'Operation Firestorm','Offensive','2024-10-25','2024-11-25','Active',3);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `personnel_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `ranks` varchar(20) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  PRIMARY KEY (`personnel_id`),
  UNIQUE KEY `ranks` (`ranks`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `militaryunits` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,'Pravit','Parikh','first','active','987654321',3),(2,'Devanshi','Panchal','fourth','active','987654322',2),(3,'Malhar','Solanki','second','on leave','987654323',1),(4,'Vruxak','Patel','third','retired','98765434',4),(5,'Shrey','Sharma','fifth','active','987654325',6),(6,'Krina','Singh','sixth','on leave','987654326',5),(7,'Vishwa','Chokshi','seventh','active','987654327',3),(8,'Bhaskar','Kadhao','eighth','retired','987654328',1),(9,'Kishore','Desai','ninth','active','987654329',5);
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `training_id` int NOT NULL AUTO_INCREMENT,
  `personnel_id` int DEFAULT NULL,
  `course_name` varchar(200) DEFAULT NULL,
  `course_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`training_id`),
  KEY `personnel_id` (`personnel_id`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,4,'Basic Combat Training','2024-11-01','Completed'),(2,5,'Advanced Tactical Operations','2024-10-15','In Progress'),(3,8,'Survival Skills and Wilderness Training','2024-09-20','Completed'),(4,2,'Combat Medical Training','2024-11-10','Scheduled'),(5,7,'Cybersecurity for Defence Personnel','2024-11-05','Completed'),(6,9,'Leadership and Command Training','2024-12-01','Scheduled');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-10 22:24:50
