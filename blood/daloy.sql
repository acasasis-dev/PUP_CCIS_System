-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: daloy
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Temporary table structure for view `adminmessage`
--

DROP TABLE IF EXISTS `adminmessage`;
/*!50001 DROP VIEW IF EXISTS `adminmessage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `adminmessage` AS SELECT 
 1 AS `intADMINMESSAGE_ID`,
 1 AS `strACCOUNT_EMAIL`,
 1 AS `intACCOUNT_ID`,
 1 AS `intADMIN_ID`,
 1 AS `strMESSAGE_SUBJ`,
 1 AS `strMESSAGE_CONTENT`,
 1 AS `dtmMESSAGE_DATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `beneficiary`
--

DROP TABLE IF EXISTS `beneficiary`;
/*!50001 DROP VIEW IF EXISTS `beneficiary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `beneficiary` AS SELECT 
 1 AS `intPERSON_ID`,
 1 AS `strPERSON_FN`,
 1 AS `strPERSON_MN`,
 1 AS `strPERSON_LN`,
 1 AS `intBENEFICIARY_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `bloodbanks`
--

DROP TABLE IF EXISTS `bloodbanks`;
/*!50001 DROP VIEW IF EXISTS `bloodbanks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bloodbanks` AS SELECT 
 1 AS `intBLOODBANK_ID`,
 1 AS `intACCOUNT_ID`,
 1 AS `intCATEGORY_ID`,
 1 AS `strBLOODBANK_NAME`,
 1 AS `strACCOUNT_EMAIL`,
 1 AS `strCATEGORY_NAME`,
 1 AS `strBLOODBANK_LOCATION`,
 1 AS `strBLOODBANK_CONTACT1`,
 1 AS `strBLOODBANK_CONTACT2`,
 1 AS `strBLOODBANK_CONTACT3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `bloodmessage`
--

DROP TABLE IF EXISTS `bloodmessage`;
/*!50001 DROP VIEW IF EXISTS `bloodmessage`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bloodmessage` AS SELECT 
 1 AS `intBLOODMESSAGE_ID`,
 1 AS `strACCOUNT_EMAIL`,
 1 AS `intACCOUNT_ID`,
 1 AS `intBLOODBANK_ID`,
 1 AS `strMESSAGE_SUBJ`,
 1 AS `strMESSAGE_CONTENT`,
 1 AS `dtmMESSAGE_DATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!50001 DROP VIEW IF EXISTS `donor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `donor` AS SELECT 
 1 AS `intDONOR_ID`,
 1 AS `intPERSON_ID`,
 1 AS `strPERSON_FN`,
 1 AS `strPERSON_MN`,
 1 AS `strPERSON_LN`,
 1 AS `strBLOODTYPE_DESCRIPTION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `event`
--

DROP TABLE IF EXISTS `event`;
/*!50001 DROP VIEW IF EXISTS `event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `event` AS SELECT 
 1 AS `intEVENT_ID`,
 1 AS `strEVENT_DESC`,
 1 AS `strEVENT_LOCATION`,
 1 AS `dtmEVENT_DATETIME`,
 1 AS `strBLOODBANK_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `geo_locations`
--

DROP TABLE IF EXISTS `geo_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_locations` (
  `intBLOODBANK_ID` int(11) DEFAULT NULL,
  `gloc_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_locations`
--

LOCK TABLES `geo_locations` WRITE;
/*!40000 ALTER TABLE `geo_locations` DISABLE KEYS */;
INSERT INTO `geo_locations` VALUES (1,'https://facebook.com');
/*!40000 ALTER TABLE `geo_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `message`
--

DROP TABLE IF EXISTS `message`;
/*!50001 DROP VIEW IF EXISTS `message`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `message` AS SELECT 
 1 AS `intMESSAGE_ID`,
 1 AS `strACCOUNT_EMAIL`,
 1 AS `intACCOUNT_ID`,
 1 AS `intPERSON_ID`,
 1 AS `strMESSAGE_SUBJ`,
 1 AS `strMESSAGE_CONTENT`,
 1 AS `dtmMESSAGE_DATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_con_id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `msg_con_id` (`msg_con_id`),
  KEY `sender` (`sender`),
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`msg_con_id`) REFERENCES `msg_con` (`msg_con_id`),
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `tblaccounts` (`intACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_con`
--

DROP TABLE IF EXISTS `msg_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_con` (
  `msg_con_id` int(11) NOT NULL AUTO_INCREMENT,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  PRIMARY KEY (`msg_con_id`),
  KEY `user1` (`user1`),
  KEY `user2` (`user2`),
  CONSTRAINT `msg_con_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `tblaccounts` (`intACCOUNT_ID`),
  CONSTRAINT `msg_con_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `tblaccounts` (`intACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_con`
--

LOCK TABLES `msg_con` WRITE;
/*!40000 ALTER TABLE `msg_con` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_con` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `post`
--

DROP TABLE IF EXISTS `post`;
/*!50001 DROP VIEW IF EXISTS `post`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `post` AS SELECT 
 1 AS `intPOST_ID`,
 1 AS `intACCOUNT_ID`,
 1 AS `intBLOODTYPE_ID`,
 1 AS `intBLOODCOMPONENT_ID`,
 1 AS `strBLOODTYPE_DESCRIPTION`,
 1 AS `strBLOODCOMPONENT_DESCRIPTION`,
 1 AS `intPOSTSTATUS_ID`,
 1 AS `strSTATUS_DESCRIPTION`,
 1 AS `strPOST_CONTENT`,
 1 AS `dtmPOST_DATE`,
 1 AS `intPERSON_ID`,
 1 AS `strPERSON_FN`,
 1 AS `strPERSON_MN`,
 1 AS `strPERSON_LN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!50001 DROP VIEW IF EXISTS `reserve`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reserve` AS SELECT 
 1 AS `intBLOODRESERVE_ID`,
 1 AS `intPERSON_ID`,
 1 AS `intACCOUNT_ID`,
 1 AS `strPERSON_FN`,
 1 AS `strPERSON_MN`,
 1 AS `strPERSON_LN`,
 1 AS `strBLOODBANK_NAME`,
 1 AS `intQUANTITY`,
 1 AS `dtmRESERVE_DATE`,
 1 AS `dtmDEADLINE_DATE`,
 1 AS `strBLOODTYPE_DESCRIPTION`,
 1 AS `strBLOODCOMPONENT_DESCRIPTION`,
 1 AS `bool_ISBENEFICIARY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `respondents`
--

DROP TABLE IF EXISTS `respondents`;
/*!50001 DROP VIEW IF EXISTS `respondents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `respondents` AS SELECT 
 1 AS `intPERSON_ID`,
 1 AS `intACCOUNT_ID`,
 1 AS `strACCOUNT_EMAIL`,
 1 AS `strPERSON_FN`,
 1 AS `strPERSON_MN`,
 1 AS `strPERSON_LN`,
 1 AS `strBLOODTYPE_DESCRIPTION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!50001 DROP VIEW IF EXISTS `stocks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `stocks` AS SELECT 
 1 AS `intACCOUNT_ID`,
 1 AS `strBLOODBANK_NAME`,
 1 AS `strBLOODCOMPONENT_DESCRIPTION`,
 1 AS `intBLOODSTOCK_AP`,
 1 AS `intBLOODSTOCK_AN`,
 1 AS `intBLOODSTOCK_BP`,
 1 AS `intBLOODSTOCK_BN`,
 1 AS `intBLOODSTOCK_ABP`,
 1 AS `intBLOODSTOCK_ABN`,
 1 AS `intBLOODSTOCK_OP`,
 1 AS `intBLOODSTOCK_ON`,
 1 AS `dblBLOODSTOCK_PRICE`,
 1 AS `intBLOODBANK_ID`,
 1 AS `intBLOODSTOCK_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tblaccounts`
--

DROP TABLE IF EXISTS `tblaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaccounts` (
  `intACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strACCOUNT_EMAIL` varchar(25) NOT NULL,
  `strACCOUNT_PASSWORD` varchar(15) NOT NULL,
  `intACCOUNTTYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`intACCOUNT_ID`),
  UNIQUE KEY `strACCOUNT_EMAIL` (`strACCOUNT_EMAIL`),
  KEY `intACCOUNTTYPE_ID` (`intACCOUNTTYPE_ID`),
  CONSTRAINT `tblaccounts_ibfk_1` FOREIGN KEY (`intACCOUNTTYPE_ID`) REFERENCES `tblaccounttype` (`intACCOUNTTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccounts`
--

LOCK TABLES `tblaccounts` WRITE;
/*!40000 ALTER TABLE `tblaccounts` DISABLE KEYS */;
INSERT INTO `tblaccounts` VALUES (1,'admin@admin','admin',1),(2,'CES@BLOOD','CES',2),(3,'admin2@admin2','1234',1),(4,'ces@gmail.com','ces',3),(5,'yanie@danielle','1234',3),(6,'yanie@danielle.com','1234',3),(7,'hello@world.com','123',3),(8,'johnsnow@email.com','123',3);
/*!40000 ALTER TABLE `tblaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaccounttype`
--

DROP TABLE IF EXISTS `tblaccounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaccounttype` (
  `intACCOUNTTYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strACCOUNT_DESC` varchar(10) NOT NULL,
  PRIMARY KEY (`intACCOUNTTYPE_ID`),
  UNIQUE KEY `strACCOUNT_DESC` (`strACCOUNT_DESC`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccounttype`
--

LOCK TABLES `tblaccounttype` WRITE;
/*!40000 ALTER TABLE `tblaccounttype` DISABLE KEYS */;
INSERT INTO `tblaccounttype` VALUES (1,'Admin'),(2,'Blood Bank'),(3,'Member');
/*!40000 ALTER TABLE `tblaccounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladmin` (
  `intADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strADMIN_FN` varchar(20) NOT NULL,
  `strADMIN_MN` varchar(20) NOT NULL,
  `strADMIN_LN` varchar(20) NOT NULL,
  `strADMIN_CONTACT` varchar(13) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intADMIN_ID`),
  UNIQUE KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  CONSTRAINT `tbladmin_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmin`
--

LOCK TABLES `tbladmin` WRITE;
/*!40000 ALTER TABLE `tbladmin` DISABLE KEYS */;
INSERT INTO `tbladmin` VALUES (1,'admin','admin','admin','987654321',1),(2,'Admin2','Admin2','Admin2','99999999999',3);
/*!40000 ALTER TABLE `tbladmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminmessage`
--

DROP TABLE IF EXISTS `tbladminmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladminmessage` (
  `intADMINMESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strMESSAGE_SUBJ` varchar(25) NOT NULL,
  `strMESSAGE_CONTENT` varchar(300) NOT NULL,
  `dtmMESSAGE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intADMIN_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intADMINMESSAGE_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intADMIN_ID` (`intADMIN_ID`),
  CONSTRAINT `tbladminmessage_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbladminmessage_ibfk_2` FOREIGN KEY (`intADMIN_ID`) REFERENCES `tbladmin` (`intADMIN_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladminmessage`
--

LOCK TABLES `tbladminmessage` WRITE;
/*!40000 ALTER TABLE `tbladminmessage` DISABLE KEYS */;
INSERT INTO `tbladminmessage` VALUES (1,'admin','ikaw','2017-10-26 10:15:21',1,4),(2,'ces ','gmail','2017-10-26 11:29:46',1,4),(3,'a','a','2017-10-26 11:43:53',1,2),(4,'hay ','admin','2017-10-26 11:45:34',1,4);
/*!40000 ALTER TABLE `tbladminmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbeneficiary`
--

DROP TABLE IF EXISTS `tblbeneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbeneficiary` (
  `intBENEFICIARY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intBENEFICIARY_ID`),
  UNIQUE KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  CONSTRAINT `tblbeneficiary_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbeneficiary`
--

LOCK TABLES `tblbeneficiary` WRITE;
/*!40000 ALTER TABLE `tblbeneficiary` DISABLE KEYS */;
INSERT INTO `tblbeneficiary` VALUES (1,4),(2,5),(3,7),(4,8);
/*!40000 ALTER TABLE `tblbeneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodbank`
--

DROP TABLE IF EXISTS `tblbloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbloodbank` (
  `intBLOODBANK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strBLOODBANK_NAME` varchar(25) NOT NULL,
  `strBLOODBANK_CONTACT1` varchar(13) NOT NULL,
  `strBLOODBANK_CONTACT2` varchar(13) NOT NULL,
  `strBLOODBANK_CONTACT3` varchar(13) NOT NULL,
  `strBLOODBANK_LOCATION` varchar(100) NOT NULL,
  `intCATEGORY_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intBLOODBANK_ID`),
  UNIQUE KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  UNIQUE KEY `strBLOODBANK_NAME` (`strBLOODBANK_NAME`),
  KEY `tblbloodbank_ibfk_1` (`intCATEGORY_ID`),
  CONSTRAINT `tblbloodbank_ibfk_1` FOREIGN KEY (`intCATEGORY_ID`) REFERENCES `tblcategory` (`intCATEGORY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblbloodbank_ibfk_2` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodbank`
--

LOCK TABLES `tblbloodbank` WRITE;
/*!40000 ALTER TABLE `tblbloodbank` DISABLE KEYS */;
INSERT INTO `tblbloodbank` VALUES (1,'CES BLOOD BANK','098765544315','0987654334567','78926217','PUREZA',3,2);
/*!40000 ALTER TABLE `tblbloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodcomponent`
--

DROP TABLE IF EXISTS `tblbloodcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbloodcomponent` (
  `intBLOODCOMPONENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strBLOODCOMPONENT_DESCRIPTION` varchar(20) NOT NULL,
  PRIMARY KEY (`intBLOODCOMPONENT_ID`),
  UNIQUE KEY `strBLOODCOMPONENT_DESCRIPTION` (`strBLOODCOMPONENT_DESCRIPTION`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodcomponent`
--

LOCK TABLES `tblbloodcomponent` WRITE;
/*!40000 ALTER TABLE `tblbloodcomponent` DISABLE KEYS */;
INSERT INTO `tblbloodcomponent` VALUES (4,'CRYOPRECIPITATED AHF'),(3,'PLASMA'),(2,'PLATELETS'),(5,'RED CELLS'),(1,'WHOLE BLOOD');
/*!40000 ALTER TABLE `tblbloodcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodmessage`
--

DROP TABLE IF EXISTS `tblbloodmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbloodmessage` (
  `intBLOODMESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strMESSAGE_SUBJ` varchar(20) NOT NULL,
  `strMESSAGE_CONTENT` varchar(300) NOT NULL,
  `dtmMESSAGE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intBLOODBANK_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intBLOODMESSAGE_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intBLOODBANK_ID` (`intBLOODBANK_ID`),
  CONSTRAINT `tblbloodmessage_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblbloodmessage_ibfk_2` FOREIGN KEY (`intBLOODBANK_ID`) REFERENCES `tblbloodbank` (`intBLOODBANK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodmessage`
--

LOCK TABLES `tblbloodmessage` WRITE;
/*!40000 ALTER TABLE `tblbloodmessage` DISABLE KEYS */;
INSERT INTO `tblbloodmessage` VALUES (1,'Ces ','Blood','0000-00-00 00:00:00',1,1);
/*!40000 ALTER TABLE `tblbloodmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodstock`
--

DROP TABLE IF EXISTS `tblbloodstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbloodstock` (
  `intBLOODSTOCK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `intBLOODBANK_ID` int(11) NOT NULL,
  `dblBLOODSTOCK_PRICE` decimal(10,0) NOT NULL,
  `intBLOODSTOCK_AP` int(11) NOT NULL,
  `intBLOODSTOCK_AN` int(11) NOT NULL,
  `intBLOODSTOCK_BP` int(11) NOT NULL,
  `intBLOODSTOCK_BN` int(11) NOT NULL,
  `intBLOODSTOCK_ABP` int(11) NOT NULL,
  `intBLOODSTOCK_ABN` int(11) NOT NULL,
  `intBLOODSTOCK_OP` int(11) NOT NULL,
  `intBLOODSTOCK_ON` int(11) NOT NULL,
  PRIMARY KEY (`intBLOODSTOCK_ID`),
  KEY `intBLOODBANK_ID` (`intBLOODBANK_ID`),
  KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  CONSTRAINT `tblbloodstock_ibfk_1` FOREIGN KEY (`intBLOODBANK_ID`) REFERENCES `tblbloodbank` (`intBLOODBANK_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblbloodstock_ibfk_2` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodstock`
--

LOCK TABLES `tblbloodstock` WRITE;
/*!40000 ALTER TABLE `tblbloodstock` DISABLE KEYS */;
INSERT INTO `tblbloodstock` VALUES (1,2,1,0,0,0,0,0,0,0,0,0),(2,4,1,2500,2,4,5,7,3,4,6,5);
/*!40000 ALTER TABLE `tblbloodstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodtype`
--

DROP TABLE IF EXISTS `tblbloodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbloodtype` (
  `intBLOODTYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strBLOODTYPE_DESCRIPTION` varchar(4) NOT NULL,
  PRIMARY KEY (`intBLOODTYPE_ID`),
  UNIQUE KEY `strBLOODTYPE_DESCRIPTION` (`strBLOODTYPE_DESCRIPTION`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodtype`
--

LOCK TABLES `tblbloodtype` WRITE;
/*!40000 ALTER TABLE `tblbloodtype` DISABLE KEYS */;
INSERT INTO `tblbloodtype` VALUES (1,'A+'),(2,'A-'),(5,'AB+'),(6,'AB-'),(3,'B+'),(4,'B-'),(7,'O+'),(8,'O-');
/*!40000 ALTER TABLE `tblbloodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcategory`
--

DROP TABLE IF EXISTS `tblcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcategory` (
  `intCATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strCATEGORY_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`intCATEGORY_ID`),
  UNIQUE KEY `strCATEGORY_NAME` (`strCATEGORY_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategory`
--

LOCK TABLES `tblcategory` WRITE;
/*!40000 ALTER TABLE `tblcategory` DISABLE KEYS */;
INSERT INTO `tblcategory` VALUES (1,'Blood Bank'),(6,'Blood Donation Center'),(3,'General Hospital'),(4,'Non-Governmental Organization'),(2,'Private Hospital'),(5,'Volunteer Organization');
/*!40000 ALTER TABLE `tblcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldonor`
--

DROP TABLE IF EXISTS `tbldonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldonor` (
  `intDONOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intPERSON_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`intDONOR_ID`),
  KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`),
  KEY `intPERSON_ID` (`intPERSON_ID`),
  CONSTRAINT `tbldonor_ibfk_1` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbldonor_ibfk_2` FOREIGN KEY (`intPERSON_ID`) REFERENCES `tblperson` (`intPERSON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldonor`
--

LOCK TABLES `tbldonor` WRITE;
/*!40000 ALTER TABLE `tbldonor` DISABLE KEYS */;
INSERT INTO `tbldonor` VALUES (1,1,6),(2,3,2),(3,5,1);
/*!40000 ALTER TABLE `tbldonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblevents`
--

DROP TABLE IF EXISTS `tblevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblevents` (
  `intEVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strEVENT_DESC` varchar(20) NOT NULL,
  `strEVENT_LOCATION` varchar(30) NOT NULL,
  `dtmEVENT_DATETIME` datetime NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  PRIMARY KEY (`intEVENT_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  CONSTRAINT `tblevents_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblevents`
--

LOCK TABLES `tblevents` WRITE;
/*!40000 ALTER TABLE `tblevents` DISABLE KEYS */;
INSERT INTO `tblevents` VALUES (1,'Event','Event Location','2017-10-28 10:30:00',2);
/*!40000 ALTER TABLE `tblevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmessage`
--

DROP TABLE IF EXISTS `tblmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmessage` (
  `intMESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strMESSAGE_SUBJ` varchar(20) NOT NULL,
  `strMESSAGE_CONTENT` varchar(300) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intPERSON_ID` int(11) NOT NULL,
  `dtmMESSAGE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intMESSAGE_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intPERSON_ID` (`intPERSON_ID`),
  CONSTRAINT `tblmessage_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblmessage_ibfk_2` FOREIGN KEY (`intPERSON_ID`) REFERENCES `tblperson` (`intPERSON_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmessage`
--

LOCK TABLES `tblmessage` WRITE;
/*!40000 ALTER TABLE `tblmessage` DISABLE KEYS */;
INSERT INTO `tblmessage` VALUES (1,'ces','joi',2,1,'0000-00-00 00:00:00'),(3,'Hoy admin','gago',2,1,'2017-10-26 10:46:30'),(4,'admin','admin',2,1,'2017-10-26 10:50:35'),(5,'yanie','ay',1,1,'2017-10-26 11:02:30'),(6,'admin ','isa pa',1,1,'2017-10-26 11:22:30'),(7,'admin ','ito',1,1,'2017-10-26 11:30:46'),(8,'yanie','ako',4,2,'2017-10-26 14:36:26'),(9,'yanie ','ikaw',5,1,'2017-10-26 14:36:52'),(10,'hoy ','reply',4,2,'2017-10-26 14:37:27');
/*!40000 ALTER TABLE `tblmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblperson`
--

DROP TABLE IF EXISTS `tblperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblperson` (
  `intPERSON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intACCOUNT_ID` int(11) NOT NULL,
  `strPERSON_FN` varchar(20) NOT NULL,
  `strPERSON_MN` varchar(20) NOT NULL,
  `strPERSON_LN` varchar(20) NOT NULL,
  `dtmPERSON_BDAY` date NOT NULL,
  `strPERSON_ADDRESS` varchar(50) NOT NULL,
  `strPERSON_CONTACTNO` varchar(13) NOT NULL,
  `bool_ISBENEFICIARY` tinyint(1) NOT NULL,
  `bool_ISDONOR` tinyint(1) NOT NULL,
  PRIMARY KEY (`intPERSON_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  CONSTRAINT `tblperson_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblperson`
--

LOCK TABLES `tblperson` WRITE;
/*!40000 ALTER TABLE `tblperson` DISABLE KEYS */;
INSERT INTO `tblperson` VALUES (1,4,'cesces','joi','isaac','2017-10-24','0','09090909090',1,1),(2,5,'ya','ni','e','2002-09-09','qwertyui','0987654321',1,1),(3,6,'rty','gh','cvbn','2002-09-09','tyuqhgt','98762789',0,1),(4,7,'hello','middle','world','0000-00-00','helloworld','09999999999',1,1),(5,8,'john','snow','dela cruz','0000-00-00','helloworld','09999999999',1,1);
/*!40000 ALTER TABLE `tblperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpost`
--

DROP TABLE IF EXISTS `tblpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpost` (
  `intPOST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `strPOST_CONTENT` varchar(250) NOT NULL,
  `intPOSTSTATUS_ID` int(11) NOT NULL,
  `dtmPOST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intPOST_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`),
  KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  KEY `intPOSTSTATUS_ID` (`intPOSTSTATUS_ID`),
  CONSTRAINT `tblpost_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblpost_ibfk_2` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblpost_ibfk_3` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblpost_ibfk_4` FOREIGN KEY (`intPOSTSTATUS_ID`) REFERENCES `tblpoststatus` (`intPOSTSTATUS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpost`
--

LOCK TABLES `tblpost` WRITE;
/*!40000 ALTER TABLE `tblpost` DISABLE KEYS */;
INSERT INTO `tblpost` VALUES (2,5,3,4,'yanie post',1,'0000-00-00 00:00:00'),(3,4,1,3,'ces post',1,'2017-10-26 11:09:50'),(4,4,4,2,'a',2,'2017-10-26 15:24:48');
/*!40000 ALTER TABLE `tblpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpostdonor`
--

DROP TABLE IF EXISTS `tblpostdonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpostdonor` (
  `intPDONOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intPOST_ID` int(11) NOT NULL,
  PRIMARY KEY (`intPDONOR_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intPOST_ID` (`intPOST_ID`),
  CONSTRAINT `tblpostdonor_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblpostdonor_ibfk_2` FOREIGN KEY (`intPOST_ID`) REFERENCES `tblpost` (`intPOST_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpostdonor`
--

LOCK TABLES `tblpostdonor` WRITE;
/*!40000 ALTER TABLE `tblpostdonor` DISABLE KEYS */;
INSERT INTO `tblpostdonor` VALUES (6,4,2),(7,5,3),(8,5,4),(9,5,4),(10,4,2),(12,8,3),(13,8,3),(14,8,3),(15,7,3),(16,7,2);
/*!40000 ALTER TABLE `tblpostdonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpoststatus`
--

DROP TABLE IF EXISTS `tblpoststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpoststatus` (
  `intPOSTSTATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `strSTATUS_DESCRIPTION` varchar(15) NOT NULL,
  PRIMARY KEY (`intPOSTSTATUS_ID`),
  UNIQUE KEY `strSTATUS_DESCRIPTION` (`strSTATUS_DESCRIPTION`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpoststatus`
--

LOCK TABLES `tblpoststatus` WRITE;
/*!40000 ALTER TABLE `tblpoststatus` DISABLE KEYS */;
INSERT INTO `tblpoststatus` VALUES (1,'IN NEED'),(2,'SOLVED');
/*!40000 ALTER TABLE `tblpoststatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreservation`
--

DROP TABLE IF EXISTS `tblreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreservation` (
  `intBLOODRESERVE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intBLOODBANK_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `intQUANTITY` int(11) NOT NULL,
  `dtmRESERVE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmDEADLINE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intBLOODRESERVE_ID`),
  KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  KEY `intBLOODBANK_ID` (`intBLOODBANK_ID`),
  KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`),
  CONSTRAINT `tblreservation_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblreservation_ibfk_2` FOREIGN KEY (`intBLOODBANK_ID`) REFERENCES `tblbloodbank` (`intBLOODBANK_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblreservation_ibfk_3` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblreservation_ibfk_4` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreservation`
--

LOCK TABLES `tblreservation` WRITE;
/*!40000 ALTER TABLE `tblreservation` DISABLE KEYS */;
INSERT INTO `tblreservation` VALUES (1,7,1,1,4,2,'2018-03-05 18:25:40','2018-03-05 18:25:40'),(2,7,1,1,1,2,'2018-03-05 19:08:38','2018-03-05 19:08:38'),(3,7,1,4,4,5,'2018-03-05 19:22:34','2018-03-05 19:22:34');
/*!40000 ALTER TABLE `tblreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `adminmessage`
--

/*!50001 DROP VIEW IF EXISTS `adminmessage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adminmessage` AS select `tbladminmessage`.`intADMINMESSAGE_ID` AS `intADMINMESSAGE_ID`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblaccounts`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tbladminmessage`.`intADMIN_ID` AS `intADMIN_ID`,`tbladminmessage`.`strMESSAGE_SUBJ` AS `strMESSAGE_SUBJ`,`tbladminmessage`.`strMESSAGE_CONTENT` AS `strMESSAGE_CONTENT`,`tbladminmessage`.`dtmMESSAGE_DATE` AS `dtmMESSAGE_DATE` from ((`tblaccounts` join `tbladmin`) join `tbladminmessage`) where ((`tblaccounts`.`intACCOUNT_ID` = `tbladminmessage`.`intACCOUNT_ID`) and (`tbladmin`.`intADMIN_ID` = `tbladminmessage`.`intADMIN_ID`)) order by `tbladminmessage`.`intADMINMESSAGE_ID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `beneficiary`
--

/*!50001 DROP VIEW IF EXISTS `beneficiary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `beneficiary` AS select `tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbeneficiary`.`intBENEFICIARY_ID` AS `intBENEFICIARY_ID` from (`tblperson` join `tblbeneficiary`) where (`tblbeneficiary`.`intACCOUNT_ID` = `tblperson`.`intACCOUNT_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bloodbanks`
--

/*!50001 DROP VIEW IF EXISTS `bloodbanks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bloodbanks` AS select `tblbloodbank`.`intBLOODBANK_ID` AS `intBLOODBANK_ID`,`tblbloodbank`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblbloodbank`.`intCATEGORY_ID` AS `intCATEGORY_ID`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblcategory`.`strCATEGORY_NAME` AS `strCATEGORY_NAME`,`tblbloodbank`.`strBLOODBANK_LOCATION` AS `strBLOODBANK_LOCATION`,`tblbloodbank`.`strBLOODBANK_CONTACT1` AS `strBLOODBANK_CONTACT1`,`tblbloodbank`.`strBLOODBANK_CONTACT2` AS `strBLOODBANK_CONTACT2`,`tblbloodbank`.`strBLOODBANK_CONTACT3` AS `strBLOODBANK_CONTACT3` from ((`tblbloodbank` join `tblcategory`) join `tblaccounts`) where ((`tblbloodbank`.`intCATEGORY_ID` = `tblcategory`.`intCATEGORY_ID`) and (`tblbloodbank`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bloodmessage`
--

/*!50001 DROP VIEW IF EXISTS `bloodmessage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bloodmessage` AS select `tblbloodmessage`.`intBLOODMESSAGE_ID` AS `intBLOODMESSAGE_ID`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblaccounts`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblbloodmessage`.`intBLOODBANK_ID` AS `intBLOODBANK_ID`,`tblbloodmessage`.`strMESSAGE_SUBJ` AS `strMESSAGE_SUBJ`,`tblbloodmessage`.`strMESSAGE_CONTENT` AS `strMESSAGE_CONTENT`,`tblbloodmessage`.`dtmMESSAGE_DATE` AS `dtmMESSAGE_DATE` from ((`tblaccounts` join `tblbloodbank`) join `tblbloodmessage`) where ((`tblaccounts`.`intACCOUNT_ID` = `tblbloodmessage`.`intACCOUNT_ID`) and (`tblbloodbank`.`intBLOODBANK_ID` = `tblbloodmessage`.`intBLOODBANK_ID`)) order by `tblbloodmessage`.`intBLOODMESSAGE_ID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `donor`
--

/*!50001 DROP VIEW IF EXISTS `donor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `donor` AS select `tbldonor`.`intDONOR_ID` AS `intDONOR_ID`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION` from ((`tblperson` join `tbldonor`) join `tblbloodtype`) where ((`tbldonor`.`intBLOODTYPE_ID` = `tblbloodtype`.`intBLOODTYPE_ID`) and (`tblperson`.`intPERSON_ID` = `tbldonor`.`intPERSON_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event`
--

/*!50001 DROP VIEW IF EXISTS `event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event` AS select `tblevents`.`intEVENT_ID` AS `intEVENT_ID`,`tblevents`.`strEVENT_DESC` AS `strEVENT_DESC`,`tblevents`.`strEVENT_LOCATION` AS `strEVENT_LOCATION`,`tblevents`.`dtmEVENT_DATETIME` AS `dtmEVENT_DATETIME`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME` from ((`tblevents` join `tblbloodbank`) join `tblaccounts`) where ((`tblevents`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblaccounts`.`intACCOUNT_ID` = `tblbloodbank`.`intACCOUNT_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `message`
--

/*!50001 DROP VIEW IF EXISTS `message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `message` AS select `tblmessage`.`intMESSAGE_ID` AS `intMESSAGE_ID`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblaccounts`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblmessage`.`intPERSON_ID` AS `intPERSON_ID`,`tblmessage`.`strMESSAGE_SUBJ` AS `strMESSAGE_SUBJ`,`tblmessage`.`strMESSAGE_CONTENT` AS `strMESSAGE_CONTENT`,`tblmessage`.`dtmMESSAGE_DATE` AS `dtmMESSAGE_DATE` from ((`tblaccounts` join `tblperson`) join `tblmessage`) where ((`tblaccounts`.`intACCOUNT_ID` = `tblmessage`.`intACCOUNT_ID`) and (`tblperson`.`intPERSON_ID` = `tblmessage`.`intPERSON_ID`)) order by `tblmessage`.`intMESSAGE_ID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `post`
--

/*!50001 DROP VIEW IF EXISTS `post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post` AS select `tblpost`.`intPOST_ID` AS `intPOST_ID`,`tblpost`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblpost`.`intBLOODTYPE_ID` AS `intBLOODTYPE_ID`,`tblpost`.`intBLOODCOMPONENT_ID` AS `intBLOODCOMPONENT_ID`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblpost`.`intPOSTSTATUS_ID` AS `intPOSTSTATUS_ID`,`tblpoststatus`.`strSTATUS_DESCRIPTION` AS `strSTATUS_DESCRIPTION`,`tblpost`.`strPOST_CONTENT` AS `strPOST_CONTENT`,`tblpost`.`dtmPOST_DATE` AS `dtmPOST_DATE`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN` from (((((`tblaccounts` join `tblpoststatus`) join `tblpost`) join `tblbloodtype`) join `tblbloodcomponent`) join `tblperson`) where ((`tblaccounts`.`intACCOUNT_ID` = `tblpost`.`intACCOUNT_ID`) and (`tblbloodtype`.`intBLOODTYPE_ID` = `tblpost`.`intBLOODTYPE_ID`) and (`tblbloodcomponent`.`intBLOODCOMPONENT_ID` = `tblpost`.`intBLOODCOMPONENT_ID`) and (`tblpoststatus`.`intPOSTSTATUS_ID` = `tblpost`.`intPOSTSTATUS_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) order by `tblpost`.`intPOST_ID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reserve`
--

/*!50001 DROP VIEW IF EXISTS `reserve`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reserve` AS select `tblreservation`.`intBLOODRESERVE_ID` AS `intBLOODRESERVE_ID`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblbloodbank`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblreservation`.`intQUANTITY` AS `intQUANTITY`,`tblreservation`.`dtmRESERVE_DATE` AS `dtmRESERVE_DATE`,`tblreservation`.`dtmDEADLINE_DATE` AS `dtmDEADLINE_DATE`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblperson`.`bool_ISBENEFICIARY` AS `bool_ISBENEFICIARY` from (((((`tblreservation` join `tblbloodbank`) join `tblaccounts`) join `tblperson`) join `tblbloodtype`) join `tblbloodcomponent`) where ((`tblbloodtype`.`intBLOODTYPE_ID` = `tblreservation`.`intBLOODTYPE_ID`) and (`tblbloodcomponent`.`intBLOODCOMPONENT_ID` = `tblreservation`.`intBLOODCOMPONENT_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblreservation`.`intACCOUNT_ID`) and (`tblbloodbank`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblbloodbank`.`intBLOODBANK_ID` = `tblreservation`.`intBLOODBANK_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `respondents`
--

/*!50001 DROP VIEW IF EXISTS `respondents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `respondents` AS select `tbldonor`.`intPERSON_ID` AS `intPERSON_ID`,`tblpost`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION` from ((((((`tblreservation` join `tbldonor`) join `tblaccounts`) join `tblperson`) join `tblbloodtype`) join `tblpostdonor`) join `tblpost`) where ((`tblbloodtype`.`intBLOODTYPE_ID` = `tbldonor`.`intBLOODTYPE_ID`) and (`tblperson`.`intPERSON_ID` = `tbldonor`.`intPERSON_ID`) and (`tblpostdonor`.`intPOST_ID` = `tblpost`.`intPOST_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stocks`
--

/*!50001 DROP VIEW IF EXISTS `stocks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stocks` AS select `tblaccounts`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblbloodstock`.`intBLOODSTOCK_AP` AS `intBLOODSTOCK_AP`,`tblbloodstock`.`intBLOODSTOCK_AN` AS `intBLOODSTOCK_AN`,`tblbloodstock`.`intBLOODSTOCK_BP` AS `intBLOODSTOCK_BP`,`tblbloodstock`.`intBLOODSTOCK_BN` AS `intBLOODSTOCK_BN`,`tblbloodstock`.`intBLOODSTOCK_ABP` AS `intBLOODSTOCK_ABP`,`tblbloodstock`.`intBLOODSTOCK_ABN` AS `intBLOODSTOCK_ABN`,`tblbloodstock`.`intBLOODSTOCK_OP` AS `intBLOODSTOCK_OP`,`tblbloodstock`.`intBLOODSTOCK_ON` AS `intBLOODSTOCK_ON`,`tblbloodstock`.`dblBLOODSTOCK_PRICE` AS `dblBLOODSTOCK_PRICE`,`tblbloodstock`.`intBLOODBANK_ID` AS `intBLOODBANK_ID`,`tblbloodstock`.`intBLOODSTOCK_ID` AS `intBLOODSTOCK_ID` from (((`tblbloodstock` join `tblbloodcomponent`) join `tblbloodbank`) join `tblaccounts`) where ((`tblbloodstock`.`intBLOODCOMPONENT_ID` = `tblbloodcomponent`.`intBLOODCOMPONENT_ID`) and (`tblbloodbank`.`intBLOODBANK_ID` = `tblbloodstock`.`intBLOODBANK_ID`) and (`tblaccounts`.`intACCOUNT_ID` = `tblbloodbank`.`intACCOUNT_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20  0:22:01
