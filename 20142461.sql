-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: film_booking
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id_resv` int(11) NOT NULL AUTO_INCREMENT,
  `id_mem` int(11) DEFAULT NULL,
  `id_film` int(11) DEFAULT NULL,
  `film_name` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `resv_time` date DEFAULT NULL,
  `seat_no` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_resv`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (11,6,5,'Jack Reacher','2016-11-01','2017-02-25','2016-12-04',2,1),(14,6,15,'Finding Dory','2016-06-01','2016-09-25','2016-12-04',5,0),(15,7,15,'Finding Dory','2016-06-01','2016-09-25','2016-12-04',3,1),(16,8,17,'Doctor Strange','2016-10-01','2017-01-25','2016-12-04',5,0),(17,7,19,'Monsters, inc.','2017-03-01','2017-07-25','2016-12-04',1,0),(18,7,19,'Monsters, inc.','2017-03-01','2017-07-25','2016-12-04',3,1),(19,6,15,'Finding Dory','2016-06-01','2016-09-25','2016-12-04',8,1),(21,8,17,'Doctor Strange','2016-10-01','2017-01-25','2016-12-06',7,0),(22,8,16,'Captain America : Civil War','2016-04-01','2016-08-25','2016-12-06',1,0),(27,6,16,'Captain America : Civil War','2016-04-01','2016-08-25','2016-12-06',6,0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `id_mem` int(11) NOT NULL AUTO_INCREMENT,
  `password` text,
  `name_mem` text,
  `age_mem` int(11) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  PRIMARY KEY (`id_mem`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,'admin','admin',NULL,NULL),(6,'abcd','client1',21,'2016-12-04'),(7,'abcd','client2',10,'2016-12-04'),(8,'abcd3','client3',14,'2016-12-04');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `name_film` text,
  `age_phase` int(11) DEFAULT NULL,
  `seat_num` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (5,'Jack Reacher',15,9,'2016-11-01','2017-02-25'),(15,'Finding Dory',0,9,'2016-06-01','2016-09-25'),(16,'Captain America : Civil War',12,9,'2016-04-01','2016-08-25'),(17,'Doctor Strange',12,9,'2016-10-01','2017-01-25'),(18,'The Notebook',15,9,'2016-10-01','2016-12-25'),(19,'Monsters, inc.',0,9,'2017-03-01','2017-07-25');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `id_seat` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) DEFAULT NULL,
  `s1` tinyint(1) DEFAULT NULL,
  `s2` tinyint(1) DEFAULT NULL,
  `s3` tinyint(1) DEFAULT NULL,
  `s4` tinyint(1) DEFAULT NULL,
  `s5` tinyint(1) DEFAULT NULL,
  `s6` tinyint(1) DEFAULT NULL,
  `s7` tinyint(1) DEFAULT NULL,
  `s8` tinyint(1) DEFAULT NULL,
  `s9` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_seat`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `movie` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (2,5,1,0,1,1,1,1,1,1,1),(12,15,1,1,0,1,0,1,1,0,1),(13,16,0,1,1,1,1,0,1,1,1),(14,17,1,1,1,1,0,1,0,1,1),(15,18,1,1,1,1,1,1,1,1,1),(16,19,0,1,0,1,1,1,1,1,1);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06  1:04:34
