CREATE DATABASE  IF NOT EXISTS `project-moviedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project-moviedb`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: project-moviedb
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `appeared_in`
--

DROP TABLE IF EXISTS `appeared_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeared_in` (
  `STAR` varchar(30) NOT NULL,
  `Movie` varchar(50) NOT NULL,
  PRIMARY KEY (`STAR`,`Movie`),
  KEY `Movie_idx` (`Movie`),
  CONSTRAINT `Movie` FOREIGN KEY (`Movie`) REFERENCES `made_money` (`MOVIE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeared_in`
--

LOCK TABLES `appeared_in` WRITE;
/*!40000 ALTER TABLE `appeared_in` DISABLE KEYS */;
INSERT INTO `appeared_in` VALUES ('Brad Pitt','12 Years a Slave'),('Tom Hanks','Angels & Demons '),('Jennifer Aniston','Bruce Almighty'),('Tom Hanks','Catch Me If You Can'),('Jennifer Garner','Dallas Buyers Club'),('Ben Affleck','Daredevil'),('Jennifer Garner','Daredevil'),('Vincent Cassel','Derailed'),('Johnny Depp','Donnie Brasco'),('Brad Pitt','Fight Club'),('Edward Norton','Fight Club'),('Ben Affleck','Gigli'),('Jennifer Lopez','Gigli'),('George Clooney','Gravity'),('Emma Watson','Harry Potter and the Deathly Hallows: Part 2'),('Emma Watson','Harry Potter and the Sorcerer\'s Stone'),('Jennifer Lopez','Ice Age: Continental Drift'),('Brad Pitt','Inglourious Basterds'),('Matt Damon','Interstellar'),('Johnny Depp','Into the Woods'),('Scarlett Johansson','Iron Man 2'),('Monica Bellucci','Irreversible'),('Vincent Cassel','Irreversible'),('Ben Affleck','Jersey Girl'),('Jennifer Lopez','Jersey Girl'),('Angelina Jolie','Lara Croft: Tomb Raider'),('Rita Wilson','Larry Crowne'),('Tom Hanks','Larry Crowne'),('Scarlett Johansson','Lucy'),('Angelina Jolie','Maleficent'),('Monica Bellucci','Malena'),('Angelina Jolie','Mr. & Mrs. Smith'),('Brad Pitt','Mr. & Mrs. Smith'),('Samantha Lewes','Mr. Success'),('Rita Wilson','My Life in Ruins'),('Brad Pitt','Ocean\'s Thirteen'),('George Clooney','Ocean\'s Thirteen'),('Matt Damon','Ocean\'s Thirteen'),('Vincent Cassel','Ocean\'s Thirteen'),('Ryan Reynolds','Paper Man'),('Johnny Depp','Pirates of the Caribbean: At World\'s End'),('Monica Bellucci','The Apartment'),('Vincent Cassel','The Apartment'),('Scarlett Johansson','The Avengers'),('Rita Wilson','The Bonfire of the Vanities '),('Tom Hanks','The Bonfire of the Vanities '),('Matt Damon','The Bourne Ultimatum'),('Ryan Reynolds','The Captive'),('Ben Affleck','The Company Men'),('Matt Damon','The Departed'),('Edward Norton','The Illusionist'),('Edward Norton','The Incredible Hulk'),('George Clooney','The Monuments Men'),('Matt Damon','The Monuments Men'),('Emma Watson','This Is the End'),('Rita Wilson','Volunteers'),('Tom Hanks','Volunteers'),('Ryan Reynolds','X-Men Origins: Wolverine');
/*!40000 ALTER TABLE `appeared_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divorced`
--

DROP TABLE IF EXISTS `divorced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divorced` (
  `COUPLE_NUM` int(11) NOT NULL,
  `DAY` date DEFAULT NULL,
  PRIMARY KEY (`COUPLE_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divorced`
--

LOCK TABLES `divorced` WRITE;
/*!40000 ALTER TABLE `divorced` DISABLE KEYS */;
INSERT INTO `divorced` VALUES (2,'2010-12-14'),(3,'2013-08-26'),(4,'2015-09-30'),(5,'2015-09-28'),(6,'2015-06-30'),(7,'2005-01-01'),(8,'1987-02-28'),(9,'2015-10-02');
/*!40000 ALTER TABLE `divorced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_couple`
--

DROP TABLE IF EXISTS `in_couple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_couple` (
  `STAR` varchar(30) NOT NULL,
  `COUPLE_NUM` int(11) NOT NULL,
  PRIMARY KEY (`STAR`,`COUPLE_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_couple`
--

LOCK TABLES `in_couple` WRITE;
/*!40000 ALTER TABLE `in_couple` DISABLE KEYS */;
INSERT INTO `in_couple` VALUES ('Angelina Jolie',4),('Angelina Jolie',9),('Angelina Jolie',10),('Ben Affleck',1),('Ben Affleck',6),('Brad Pitt',4),('Brad Pitt',7),('Brad Pitt',9),('Brad Pitt',10),('Jennifer Aniston',7),('Jennifer Garner',6),('Jennifer Lopez',1),('Monica Bellucci',3),('Rita Wilson',5),('Rita Wilson',11),('Ryan Reynolds',2),('Samantha Lewes ',8),('Scarlett Johansson',2),('Tom Hanks',5),('Tom Hanks',8),('Tom Hanks',11),('Vincent Cassel',3);
/*!40000 ALTER TABLE `in_couple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `made_money`
--

DROP TABLE IF EXISTS `made_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `made_money` (
  `MOVIE` varchar(50) NOT NULL,
  `HOW_MUCH` decimal(15,2) DEFAULT '0.00',
  `DAY_OPENED` date DEFAULT NULL,
  PRIMARY KEY (`MOVIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `made_money`
--

LOCK TABLES `made_money` WRITE;
/*!40000 ALTER TABLE `made_money` DISABLE KEYS */;
INSERT INTO `made_money` VALUES ('12 Years a Slave',56667870.00,'2013-11-08'),('Angels & Demons ',133375846.00,'2009-05-15'),('Bruce Almighty',85734045.00,'2003-05-23'),('Catch Me If You Can',60082000.00,'2002-12-25'),('Dallas Buyers Club',27296514.00,'2013-11-22'),('Daredevil',431881.00,'2003-02-14'),('Derailed',22000000.00,'2005-11-11'),('Donnie Brasco',41954997.00,'1997-02-28'),('Fight Club',37023395.00,'1999-10-15'),('Gigli',4753518.00,'2003-08-01'),('Gravity',274084951.00,'2013-10-04'),('Harry Potter and the Deathly Hallows: Part 2',380955619.00,'2011-07-15'),('Harry Potter and the Sorcerer\'s Stone',317557891.00,'2001-11-16'),('Ice Age: Continental Drift',161317423.00,'2012-06-13'),('Inglourious Basterds',120523073.00,'2009-08-21'),('Interstellar',187991439.00,'2014-11-07'),('Into the Woods',127997349.00,'2014-12-25'),('Iron Man 2',312057433.00,'2010-05-07'),('Irreversible',7535012.00,'2002-05-22'),('Jersey Girl',35000000.00,'2004-03-26'),('Lara Croft: Tomb Raider',2355719.00,'2001-06-15'),('Larry Crowne',35565975.00,'2011-07-01'),('Lucy',126546825.00,'2014-07-25'),('Maleficent',241407328.00,'2014-05-30'),('Malena',3429045.00,'2001-02-02'),('Mr. & Mrs. Smith',186336103.00,'2005-06-10'),('Mr. Success',150001.00,'1984-08-07'),('My Life in Ruins',8662318.00,'2009-06-05'),('Ocean\'s Thirteen',117144465.00,'2007-06-08'),('Paper Man',115388.00,'2009-06-15'),('Pirates of the Caribbean: At World\'s End',309404152.00,'2007-05-25'),('The Apartment',8751057.00,'1996-10-02'),('The Avengers',623279547.00,'2012-05-04'),('The Bonfire of the Vanities ',15691192.00,'1990-12-21'),('The Bourne Ultimatum',227137090.00,'2007-08-03'),('The Captive',225393.00,'2014-12-12'),('The Company Men',4439063.00,'2011-02-11'),('The Departed',132373442.00,'2006-10-06'),('The Illusionist',927956.00,'2006-09-01'),('The Incredible Hulk',134518390.00,'2008-06-13'),('The Monuments Men',78031620.00,'2014-02-07'),('This Is the End',101470202.00,'2013-06-12'),('Volunteers',187569.00,'1985-08-16'),('X-Men Origins: Wolverine',179883016.00,'2009-05-01');
/*!40000 ALTER TABLE `made_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `married`
--

DROP TABLE IF EXISTS `married`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `married` (
  `COUPLE_NUM` int(11) NOT NULL,
  `DAY` date DEFAULT NULL,
  PRIMARY KEY (`COUPLE_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `married`
--

LOCK TABLES `married` WRITE;
/*!40000 ALTER TABLE `married` DISABLE KEYS */;
INSERT INTO `married` VALUES (2,'2008-09-27'),(3,'1999-12-01'),(4,'2013-08-23'),(5,'1988-07-27'),(6,'2005-06-25'),(7,'2000-06-29'),(8,'1978-01-30'),(9,'2015-10-02'),(10,'2015-10-04'),(11,'2015-10-08');
/*!40000 ALTER TABLE `married` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-11 19:19:33
