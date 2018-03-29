CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.6.59    Database: test
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `auditcheck`
--

DROP TABLE IF EXISTS `auditcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditcheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `pwd` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditcheck`
--

LOCK TABLES `auditcheck` WRITE;
/*!40000 ALTER TABLE `auditcheck` DISABLE KEYS */;
INSERT INTO `auditcheck` VALUES (1,'12',NULL),(2,'2131',NULL),(3,'a',NULL),(4,'123',NULL),(5,'admin','adm@@1IN'),(6,'admin','adm@@1IN');
/*!40000 ALTER TABLE `auditcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `AUDIT_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIONs` varchar(100) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `DETAIL` varchar(6553) DEFAULT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `ENTITY_NAME` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `MAC_ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUDIT_LOG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (124,'Saved','2018-02-22 13:18:00','{\"id\":244,\"pageName\":\"demoTable1\",\"fromContextHelp\":\"test\"}',306236607,'PageMapping','0.0.0.0','00-00-00-00-00-00'),(125,'Saved','2018-02-22 13:18:01','{\"id\":1315,\"fieldController\":\"textbox\",\"fieldLabel\":\"care\",\"fieldName\":\"care\",\"fieldValue\":null,\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$\",\"tooltip\":\"test\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"10\"}',2124913435,'TblFormSchema','0.0.0.0','00-00-00-00-00-00'),(126,'Deleted','2018-02-22 13:18:17','{\"id\":244,\"pageName\":\"demoTable1\",\"fromContextHelp\":\"test\"}',346336413,'PageMapping','0.0.0.0','00-00-00-00-00-00'),(127,'Deleted','2018-02-22 14:00:55','{\"ID\":6,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',2030229012,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(128,'Deleted','2018-02-22 14:01:01','{\"ID\":10,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',2096678993,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(129,'Deleted','2018-02-22 14:01:05','{\"ID\":7,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',1842095624,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(130,'Deleted','2018-02-22 14:01:10','{\"ID\":5,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',883777504,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(131,'Deleted','2018-02-22 14:01:12','{\"ID\":4,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',175947956,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(132,'Deleted','2018-02-22 14:01:16','{\"ID\":3,\"code\":null,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',876601066,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(133,'Saved','2018-02-22 14:04:36','{\"ID\":11,\"code\":1,\"aadhar\":\"022220181404283890_demo2102.txt|022220181404283891_demo2102.txt\",\"pan\":\"022220181404283892_demo2102.txt\",\"edit\":null,\"delete\":null}',423302540,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(134,'Saved','2018-02-22 14:12:22','{\"ID\":12,\"code\":3,\"aadhar\":\"022220181412147530_demo2102.txt|022220181412147541_demo2102.txt\",\"pan\":\"022220181412147542_demo2102.txt\",\"edit\":null,\"delete\":null}',160636331,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(135,'Saved','2018-02-22 15:46:49','{\"ID\":13,\"code\":111,\"aadhar\":\"022220181546459990_demo2102.txt\",\"pan\":\"0222201815464601_demo2102.txt\",\"edit\":null,\"delete\":null}',1899476464,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(136,'Saved','2018-02-22 17:59:17','{\"ID\":6,\"code\":1,\"name\":\"parth\",\"edit\":null,\"delete\":null}',57248228,'Dmeo55','0.0.0.0','00-00-00-00-00-00'),(137,'Updated','2018-02-22 17:59:33','{\"ID\":6,\"code\":1,\"name\":\"parthpatel\",\"edit\":null,\"delete\":null}',1763611560,'Dmeo55','0.0.0.0','00-00-00-00-00-00'),(138,'Saved','2018-02-22 18:08:59','{\"ID\":14,\"code\":4,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',1376971567,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(139,'Updated','2018-02-22 18:19:15','{\"ID\":11,\"code\":1,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',700125351,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(140,'Saved','2018-02-22 18:22:48','{\"ID\":15,\"code\":112,\"aadhar\":\"022220181822455790_demo2102.txt\",\"pan\":\"022220181822455961_demo2102.txt\",\"edit\":null,\"delete\":null}',865445318,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(141,'Updated','2018-02-22 18:23:26','{\"ID\":15,\"code\":112,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',1930610541,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(142,'Updated','2018-02-23 12:42:56','{\"ID\":1,\"code\":1,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',598039729,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(143,'Saved','2018-02-23 13:22:01','{\"ID\":3,\"gender\":\"Male\",\"test\":1,\"hob\":\"Cricket,Reading\",\"edit\":null,\"delete\":null}',1831061884,'TEst111','0.0.0.0','00-00-00-00-00-00'),(144,'Updated','2018-02-23 13:53:45','{\"ID\":1,\"code\":1,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',1478830033,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(145,'Updated','2018-02-23 13:59:03','{\"ID\":1,\"code\":1,\"aadhar\":\"022320181359007980_demo2102.txt\",\"pan\":\"022320181359007991_demo2102.txt\",\"edit\":null,\"delete\":null}',795456461,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(146,'Updated','2018-02-23 14:00:26','{\"ID\":11,\"code\":1,\"aadhar\":null,\"pan\":null,\"edit\":null,\"delete\":null}',1299760439,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(147,'Deleted','2018-02-23 16:01:34','{\"ID\":2,\"gender\":null,\"test\":null,\"hob\":null,\"edit\":null,\"delete\":null}',345800042,'TEst111','0.0.0.0','00-00-00-00-00-00'),(148,'Deleted','2018-02-23 17:05:08','{\"id\":47,\"code\":335,\"dt\":\"Dec 12, 2033 12:12:00 AM\",\"name\":\"Bhadresh\",\"dob\":\"Nov 11, 1994\"}',1548727372,'Demo44','0.0.0.0','00-00-00-00-00-00'),(149,'Deleted','2018-02-23 17:07:56','{\"id\":55}',1639245270,'Demo44','0.0.0.0','00-00-00-00-00-00'),(150,'Saved','2018-02-26 12:44:21','{\"ID\":16,\"code\":5,\"aadhar\":\"90\",\"pan\":\"91\"}',1592294445,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(151,'Updated','2018-02-26 14:46:49','{\"ID\":16,\"code\":5,\"aadhar\":\"90\",\"pan\":\"91\"}',762401154,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(152,'Updated','2018-02-26 14:53:05','{\"ID\":16,\"code\":5,\"aadhar\":\"90\",\"pan\":\"91\"}',789940617,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(153,'Saved','2018-02-26 15:17:53','{\"ID\":17,\"code\":6,\"aadhar\":\"92\",\"pan\":\"93\"}',1922605056,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(154,'Updated','2018-02-26 15:19:27','{\"ID\":17,\"code\":6,\"aadhar\":\"92|93\",\"pan\":\"94\"}',280684640,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(155,'Deleted','2018-02-26 15:22:25','{\"ID\":11}',1105252516,'Demo2102','0.0.0.0','00-00-00-00-00-00'),(156,'Saved','2018-02-26 19:28:41','{\"ID\":1,\"code\":101,\"pan\":\"95\",\"uuid\":\"96|97|98|99\"}',7532631,'Tets_file','0.0.0.0','00-00-00-00-00-00'),(157,'Updated','2018-02-26 19:30:33','{\"ID\":1,\"code\":101,\"pan\":\"95\",\"uuid\":\"96\"}',1986104920,'Tets_file','0.0.0.0','00-00-00-00-00-00'),(158,'Updated','2018-02-26 19:30:50','{\"ID\":1,\"code\":101,\"uuid\":\"95\"}',1659738623,'Tets_file','0.0.0.0','00-00-00-00-00-00'),(159,'Updated','2018-02-26 19:32:28','{\"ID\":1,\"code\":101,\"pan\":\"95\",\"uuid\":\"96|97|98\"}',518447136,'Tets_file','0.0.0.0','00-00-00-00-00-00'),(160,'Saved','2018-02-27 12:32:04','{\"ID\":1,\"all_files\":\"104|105|106\",\"documents\":\"101|102|103\",\"name\":\"sttl\",\"aadhar\":\"99\",\"pan\":\"100\"}',587570663,'File_test','0.0.0.0','00-00-00-00-00-00'),(161,'Saved','2018-02-27 14:13:21','{\"ID\":1,\"code\":12}',2010037963,'File2702','0.0.0.0','00-00-00-00-00-00'),(162,'Updated','2018-02-27 14:23:48','{\"ID\":1,\"code\":12,\"file2\":\"108\",\"file3\":\"109\",\"file1\":\"107\"}',700040273,'File2702','0.0.0.0','00-00-00-00-00-00'),(163,'Saved','2018-02-27 14:24:48','{\"ID\":2,\"code\":1}',950678625,'File2702','0.0.0.0','00-00-00-00-00-00'),(164,'Saved','2018-02-27 14:25:32','{\"ID\":3,\"code\":2,\"file2\":\"111\",\"file3\":\"112\",\"file1\":\"110\"}',1581652392,'File2702','0.0.0.0','00-00-00-00-00-00');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_formgeneration`
--

DROP TABLE IF EXISTS `auditlog_formgeneration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_formgeneration` (
  `AUDIT_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIONs` varchar(100) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `DETAIL` varchar(6553) DEFAULT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `ENTITY_NAME` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `MAC_ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUDIT_LOG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=305 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_formgeneration`
--

LOCK TABLES `auditlog_formgeneration` WRITE;
/*!40000 ALTER TABLE `auditlog_formgeneration` DISABLE KEYS */;
INSERT INTO `auditlog_formgeneration` VALUES (196,'Saved','2018-02-23 13:59:04','{\"id\":89,\"fileName\":\"022320181359007991_demo2102.txt\",\"fileType\":\"application/pdf\",\"tableName\":\"demo2102\",\"tableId\":1,\"file\":null,\"extension\":\".pdf\"}',1858963736,'file_upload','0.0.0.0','00-00-00-00-00-00'),(197,'Updated','2018-02-23 14:16:55','{\"id\":243,\"pageName\":\"demo2102\",\"fromContextHelp\":\"demo2102\"}',699295764,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(215,'Saved','2018-02-26 12:44:19','{\"id\":91,\"fileName\":\"022620181244155371_demo2102.txt\",\"originalName\":\"JPA + Hibernate - Basic Auditing by using Entity Callback Listeners.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',2043898933,'file_upload','0.0.0.0','00-00-00-00-00-00'),(199,'Saved','2018-02-23 14:16:56','{\"id\":1333,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldValue\":null,\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"5\"}',-570921151,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(200,'Saved','2018-02-23 14:16:57','{\"id\":1334,\"fieldController\":\"file\",\"fieldLabel\":\"Aadhar\",\"fieldName\":\"aadhar\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"multiple\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',476508451,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(201,'Saved','2018-02-23 14:16:58','{\"id\":1335,\"fieldController\":\"file\",\"fieldLabel\":\"Pan\",\"fieldName\":\"pan\",\"fieldValue\":\"Pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"Pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',257798334,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(195,'Saved','2018-02-23 13:59:04','{\"id\":88,\"fileName\":\"022320181359007980_demo2102.txt\",\"fileType\":\"image/jpeg\",\"tableName\":\"demo2102\",\"tableId\":1,\"file\":null,\"extension\":\".jpg\"}',-1622926979,'file_upload','0.0.0.0','00-00-00-00-00-00'),(214,'Saved','2018-02-26 12:44:18','{\"id\":90,\"fileName\":\"022620181244155230_demo2102.txt\",\"originalName\":\"1334765_orig.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',787928890,'file_upload','0.0.0.0','00-00-00-00-00-00'),(192,'drop','2018-02-23 13:05:00','{}',3938,' demotable2','0.0.0.0','00-00-00-00-00-00'),(191,'Deleted','2018-02-23 13:05:00','{\"fk\":\"246\"}',-880354479,'tbl_form_schema ','0.0.0.0','00-00-00-00-00-00'),(190,'Deleted','2018-02-24 13:05:00','{\"id\":\"246\"}',-1702615641,'page_mapping ','0.0.0.0','00-00-00-00-00-00'),(189,'HQL','2018-02-23 13:01:58','\"delete from file_upload where fileName\\u003d\\u00270221201817445144_demo2102.txt\\u0027\"',1024315310,'String','0.0.0.0','00-00-00-00-00-00'),(188,'Saved','2018-02-23 10:53:24','{\"id\":1337,\"fieldController\":\"date\",\"fieldLabel\":\"From Date\",\"fieldName\":\"fromdate\",\"fieldValue\":null,\"fieldType\":\"DATE\",\"fieldIndex\":2,\"regex\":\"\",\"tooltip\":\"Enter From Date\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"false\",\"datePast\":\"false\",\"dateFuture\":\"false\",\"required\":\"no\",\"fk\":247,\"size\":\"0\"}',2038267148,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(187,'Saved','2018-02-23 10:53:23','{\"id\":1336,\"fieldController\":\"comboBox\",\"fieldLabel\":\"Action\",\"fieldName\":\"action\",\"fieldValue\":\"Insert,Update,Delete,Drop\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"\",\"tooltip\":\"Enter Action\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":247,\"size\":\"6\"}',1954106170,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(185,'Saved','2018-02-23 10:53:20','{\"id\":247,\"pageName\":\"AuditReport\",\"fromContextHelp\":\"Audit Report\"}',1112940448,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(186,'Saved','2018-02-23 10:53:22','{\"id\":1335,\"fieldController\":\"date\",\"fieldLabel\":\"To date\",\"fieldName\":\"todate\",\"fieldValue\":null,\"fieldType\":\"DATE\",\"fieldIndex\":3,\"regex\":\"\",\"tooltip\":\"Enter To Date\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"false\",\"datePast\":\"false\",\"dateFuture\":\"false\",\"required\":\"no\",\"fk\":247,\"size\":\"0\"}',1733516252,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(184,'drop','2018-02-22 18:43:05','{}',3938,' demotable3','0.0.0.0','00-00-00-00-00-00'),(183,'Deleted','2018-02-25 18:43:05','{\"fk\":\"247\"}',-880353518,'tbl_form_schema ','0.0.0.0','00-00-00-00-00-00'),(182,'Deleted','2018-02-22 18:43:05','{\"id\":\"247\"}',-1702614680,'page_mapping ','0.0.0.0','00-00-00-00-00-00'),(202,'Updated','2018-02-23 14:21:51','{\"id\":243,\"pageName\":\"demo2102\",\"fromContextHelp\":\"demo2102\"}',699295764,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(204,'Saved','2018-02-23 14:21:52','{\"id\":1333,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldValue\":null,\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"5\"}',-570921151,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(205,'Saved','2018-02-23 14:21:53','{\"id\":1334,\"fieldController\":\"file\",\"fieldLabel\":\"Aadhar\",\"fieldName\":\"aadhar\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"multiple\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',476508451,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(206,'Saved','2018-02-23 14:21:53','{\"id\":1335,\"fieldController\":\"file\",\"fieldLabel\":\"Pan\",\"fieldName\":\"pan\",\"fieldValue\":\"Pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"Pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',257798334,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(207,'Updated','2018-02-26 11:49:16','{\"id\":244,\"pageName\":\"File_test\",\"fromContextHelp\":\"Testing of file upload\"}',-408125712,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(209,'Saved','2018-02-26 11:49:17','{\"id\":1336,\"fieldController\":\"file\",\"fieldLabel\":\"all files\",\"fieldName\":\"all_files\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":5,\"regex\":\"multiple\",\"tooltip\":\"images\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-333070653,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(210,'Saved','2018-02-26 11:49:18','{\"id\":1337,\"fieldController\":\"file\",\"fieldLabel\":\"documents\",\"fieldName\":\"documents\",\"fieldValue\":\"xlsx,xls\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":4,\"regex\":\"multiple\",\"tooltip\":\"docs\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',370990002,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(211,'Saved','2018-02-26 11:49:19','{\"id\":1338,\"fieldController\":\"textbox\",\"fieldLabel\":\"Name\",\"fieldName\":\"name\",\"fieldValue\":null,\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"^[A-Za-z]{0,}$\",\"tooltip\":\"Name\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"45\"}',1189067319,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(212,'Saved','2018-02-26 11:49:20','{\"id\":1339,\"fieldController\":\"file\",\"fieldLabel\":\"uuid\",\"fieldName\":\"aadhar\",\"fieldValue\":\"doc,docx\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"single\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',628303736,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(213,'Saved','2018-02-26 11:49:20','{\"id\":1340,\"fieldController\":\"file\",\"fieldLabel\":\"pan\",\"fieldName\":\"pan\",\"fieldValue\":\"pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',806487075,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(216,'Deleted','2018-02-26 14:46:46','{\"id\":90,\"fileName\":\"022620181244155230_demo2102.txt\",\"originalName\":\"1334765_orig.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',787928890,'file_upload','0.0.0.0','00-00-00-00-00-00'),(217,'Deleted','2018-02-26 14:46:47','{\"id\":91,\"fileName\":\"022620181244155371_demo2102.txt\",\"originalName\":\"JPA + Hibernate - Basic Auditing by using Entity Callback Listeners.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',2043898933,'file_upload','0.0.0.0','00-00-00-00-00-00'),(218,'Saved','2018-02-26 14:46:47','{\"id\":90,\"fileName\":null,\"originalName\":\"34ac52a0-6d5b-4e68-9e77-19b3fcfbd311.png\",\"fileType\":\"image/png\",\"extension\":\".png\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-2071478600,'file_upload','0.0.0.0','00-00-00-00-00-00'),(219,'Saved','2018-02-26 14:46:47','{\"id\":91,\"fileName\":null,\"originalName\":\"Form Generator Utility Manual.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-447396482,'file_upload','0.0.0.0','00-00-00-00-00-00'),(220,'Deleted','2018-02-26 14:53:03','{\"id\":90,\"fileName\":\"022320181359007980_demo2102.txt\",\"originalName\":\"34ac52a0-6d5b-4e68-9e77-19b3fcfbd311.png\",\"fileType\":\"image/png\",\"extension\":\".png\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-592529116,'file_upload','0.0.0.0','00-00-00-00-00-00'),(221,'Deleted','2018-02-26 14:53:03','{\"id\":91,\"fileName\":\"022320181359007991_demo2102.txt\",\"originalName\":\"Form Generator Utility Manual.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-997514288,'file_upload','0.0.0.0','00-00-00-00-00-00'),(222,'Saved','2018-02-26 14:53:03','{\"id\":90,\"fileName\":\"022620181453001180_demo2102.txt\",\"originalName\":\"34ac52a0-6d5b-4e68-9e77-19b3fcfbd311.png\",\"fileType\":\"image/png\",\"extension\":\".png\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-630631768,'file_upload','0.0.0.0','00-00-00-00-00-00'),(223,'Saved','2018-02-26 14:53:04','{\"id\":91,\"fileName\":\"022620181453001181_demo2102.txt\",\"originalName\":\"JPA + Hibernate - Basic Auditing by using Entity Callback Listeners.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1118739986,'file_upload','0.0.0.0','00-00-00-00-00-00'),(224,'Updated','2018-02-26 14:58:41','{\"id\":243,\"pageName\":\"demo2102\",\"fromContextHelp\":\"demo2102\"}',699295764,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(225,'HQL','2018-02-26 14:58:42','\"delete from TblFormSchema where  fk \\u003d 243\"',-1925843661,'String','0.0.0.0','00-00-00-00-00-00'),(226,'Saved','2018-02-26 14:58:42','{\"id\":1341,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldValue\":null,\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"5\"}',818115076,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(227,'Saved','2018-02-26 14:58:42','{\"id\":1342,\"fieldController\":\"file\",\"fieldLabel\":\"Aadhar\",\"fieldName\":\"aadhar\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"multiple\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',1865544678,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(228,'Saved','2018-02-26 14:58:43','{\"id\":1343,\"fieldController\":\"file\",\"fieldLabel\":\"Pan\",\"fieldName\":\"pan\",\"fieldValue\":\"Pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"Pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":243,\"size\":\"1000\"}',1765174555,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(229,'Updated','2018-02-26 15:03:52','{\"id\":243,\"pageName\":\"demo2102\",\"fromContextHelp\":\"demo2102\"}',699295764,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(230,'HQL','2018-02-26 15:03:53','\"delete from TblFormSchema where  fk \\u003d 243\"',-1925843661,'String','0.0.0.0','00-00-00-00-00-00'),(231,'Saved','2018-02-26 15:03:53','{\"id\":1341,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldValue\":null,\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"5\"}',818115076,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(232,'Saved','2018-02-26 15:03:54','{\"id\":1342,\"fieldController\":\"file\",\"fieldLabel\":\"Aadhar\",\"fieldName\":\"aadhar\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"multiple\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"1000\"}',2145916372,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(233,'Saved','2018-02-26 15:03:55','{\"id\":1343,\"fieldController\":\"file\",\"fieldLabel\":\"Pan\",\"fieldName\":\"pan\",\"fieldValue\":\"pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"Pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":243,\"size\":\"1000\"}',-2039224545,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(234,'Saved','2018-02-26 15:17:51','{\"id\":92,\"fileName\":\"022620181517457830_demo2102.txt\",\"originalName\":\"Penguins.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-246140856,'file_upload','0.0.0.0','00-00-00-00-00-00'),(235,'Saved','2018-02-26 15:17:52','{\"id\":93,\"fileName\":\"022620181517457831_demo2102.txt\",\"originalName\":\"Question_book_gujarati.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1288369208,'file_upload','0.0.0.0','00-00-00-00-00-00'),(236,'Deleted','2018-02-26 15:19:24','{\"id\":92,\"fileName\":\"022620181517457830_demo2102.txt\",\"originalName\":\"Penguins.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-246140856,'file_upload','0.0.0.0','00-00-00-00-00-00'),(237,'Deleted','2018-02-26 15:19:25','{\"id\":93,\"fileName\":\"022620181517457831_demo2102.txt\",\"originalName\":\"Question_book_gujarati.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1288369208,'file_upload','0.0.0.0','00-00-00-00-00-00'),(238,'Saved','2018-02-26 15:19:25','{\"id\":92,\"fileName\":\"022620181519225380_demo2102.txt\",\"originalName\":\"Lighthouse - Copy.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1124026290,'file_upload','0.0.0.0','00-00-00-00-00-00'),(239,'Saved','2018-02-26 15:19:26','{\"id\":93,\"fileName\":\"022620181519225381_demo2102.txt\",\"originalName\":\"Lighthouse.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',285685470,'file_upload','0.0.0.0','00-00-00-00-00-00'),(240,'Saved','2018-02-26 15:19:26','{\"id\":94,\"fileName\":\"022620181519225382_demo2102.txt\",\"originalName\":\"2016SEP06992.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1797919914,'file_upload','0.0.0.0','00-00-00-00-00-00'),(241,'Updated','2018-02-26 16:05:16','{\"id\":244,\"pageName\":\"File_test\",\"fromContextHelp\":\"Testing of file upload\"}',-408125712,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(242,'HQL','2018-02-26 16:05:17','\"delete from TblFormSchema where  fk \\u003d 244\"',-1925843630,'String','0.0.0.0','00-00-00-00-00-00'),(243,'Saved','2018-02-26 16:05:17','{\"id\":1344,\"fieldController\":\"file\",\"fieldLabel\":\"all files\",\"fieldName\":\"all_files\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":5,\"regex\":\"multiple\",\"tooltip\":\"images\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-774264160,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(244,'Saved','2018-02-26 16:05:18','{\"id\":1345,\"fieldController\":\"file\",\"fieldLabel\":\"documents\",\"fieldName\":\"documents\",\"fieldValue\":\"xlsx,xls\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":4,\"regex\":\"multiple\",\"tooltip\":\"docs\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-421106827,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(245,'Saved','2018-02-26 16:05:18','{\"id\":1346,\"fieldController\":\"textbox\",\"fieldLabel\":\"Name\",\"fieldName\":\"name\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"^[A-Za-z]{0,}$\",\"tooltip\":\"Name\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"45\"}',1973500800,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(246,'Saved','2018-02-26 16:05:18','{\"id\":1347,\"fieldController\":\"file\",\"fieldLabel\":\"uuid\",\"fieldName\":\"aadhar\",\"fieldValue\":\"doc,docx\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"single\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',2017339963,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(247,'Saved','2018-02-26 16:05:19','{\"id\":1348,\"fieldController\":\"file\",\"fieldLabel\":\"pan\",\"fieldName\":\"pan\",\"fieldValue\":\"pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-816874725,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(248,'Updated','2018-02-26 16:09:14','{\"id\":244,\"pageName\":\"File_test\",\"fromContextHelp\":\"Testing of file upload\"}',-408125712,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(249,'HQL','2018-02-26 16:09:14','\"delete from TblFormSchema where  fk \\u003d 244\"',-1925843630,'String','0.0.0.0','00-00-00-00-00-00'),(250,'Saved','2018-02-26 16:09:15','{\"id\":1344,\"fieldController\":\"file\",\"fieldLabel\":\"all files\",\"fieldName\":\"all_files\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":5,\"regex\":\"multiple\",\"tooltip\":\"images\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-774264160,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(251,'Saved','2018-02-26 16:09:16','{\"id\":1345,\"fieldController\":\"file\",\"fieldLabel\":\"documents\",\"fieldName\":\"documents\",\"fieldValue\":\"xlsx,xls\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":4,\"regex\":\"multiple\",\"tooltip\":\"docs\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-421106827,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(252,'Saved','2018-02-26 16:09:16','{\"id\":1346,\"fieldController\":\"textbox\",\"fieldLabel\":\"Name\",\"fieldName\":\"name\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"^[A-Za-z]{0,}$\",\"tooltip\":\"Name\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"45\"}',1973500800,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(253,'Saved','2018-02-26 16:09:17','{\"id\":1347,\"fieldController\":\"file\",\"fieldLabel\":\"uuid\",\"fieldName\":\"aadhar\",\"fieldValue\":\"doc,docx\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"single\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',2017339963,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(254,'Saved','2018-02-26 16:09:17','{\"id\":1348,\"fieldController\":\"file\",\"fieldLabel\":\"pan\",\"fieldName\":\"pan\",\"fieldValue\":\"pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-816874725,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(255,'Saved','2018-02-26 19:27:08','{\"id\":245,\"pageName\":\"tets_file\",\"fromContextHelp\":\"tets\"}',-128799651,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(256,'Saved','2018-02-26 19:27:08','{\"id\":1349,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code i.e 101\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":245,\"size\":\"11\"}',1038062375,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(257,'Saved','2018-02-26 19:27:09','{\"id\":1350,\"fieldController\":\"file\",\"fieldLabel\":\"pan\",\"fieldName\":\"pan\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"single\",\"tooltip\":\"pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":245,\"size\":\"2048\"}',28649088,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(258,'Saved','2018-02-26 19:27:10','{\"id\":1351,\"fieldController\":\"file\",\"fieldLabel\":\"uuid\",\"fieldName\":\"uuid\",\"fieldValue\":\"Pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"multiple\",\"tooltip\":\"uuid\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":245,\"size\":\"2048\"}',-347278555,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(259,'Saved','2018-02-26 19:28:37','{\"id\":95,\"fileName\":\"022620181928318750_tets_file.txt\",\"originalName\":\"loan 2.jpeg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpeg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-847723964,'file_upload','0.0.0.0','00-00-00-00-00-00'),(260,'Saved','2018-02-26 19:28:38','{\"id\":96,\"fileName\":\"022620181928318751_tets_file.txt\",\"originalName\":\"2014MAY00353.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1361558306,'file_upload','0.0.0.0','00-00-00-00-00-00'),(261,'Saved','2018-02-26 19:28:39','{\"id\":97,\"fileName\":\"022620181928318752_tets_file.txt\",\"originalName\":\"Define_in_HTML_PDF_Form_Fields.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1750519930,'file_upload','0.0.0.0','00-00-00-00-00-00'),(262,'Saved','2018-02-26 19:28:39','{\"id\":98,\"fileName\":\"022620181928318753_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1481201048,'file_upload','0.0.0.0','00-00-00-00-00-00'),(263,'Saved','2018-02-26 19:28:40','{\"id\":99,\"fileName\":\"022620181928318754_tets_file.txt\",\"originalName\":\"document.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-84053812,'file_upload','0.0.0.0','00-00-00-00-00-00'),(264,'Deleted','2018-02-26 19:30:30','{\"id\":95,\"fileName\":\"022620181928318750_tets_file.txt\",\"originalName\":\"loan 2.jpeg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpeg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-847723964,'file_upload','0.0.0.0','00-00-00-00-00-00'),(265,'Deleted','2018-02-26 19:30:30','{\"id\":96,\"fileName\":\"022620181928318751_tets_file.txt\",\"originalName\":\"2014MAY00353.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1361558306,'file_upload','0.0.0.0','00-00-00-00-00-00'),(266,'Deleted','2018-02-26 19:30:31','{\"id\":97,\"fileName\":\"022620181928318752_tets_file.txt\",\"originalName\":\"Define_in_HTML_PDF_Form_Fields.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1750519930,'file_upload','0.0.0.0','00-00-00-00-00-00'),(267,'Deleted','2018-02-26 19:30:31','{\"id\":98,\"fileName\":\"022620181928318753_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1481201048,'file_upload','0.0.0.0','00-00-00-00-00-00'),(268,'Deleted','2018-02-26 19:30:31','{\"id\":99,\"fileName\":\"022620181928318754_tets_file.txt\",\"originalName\":\"document.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-84053812,'file_upload','0.0.0.0','00-00-00-00-00-00'),(269,'Saved','2018-02-26 19:30:32','{\"id\":95,\"fileName\":\"022620181930288720_tets_file.txt\",\"originalName\":\"Chrysanthemum - Copy.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',576600270,'file_upload','0.0.0.0','00-00-00-00-00-00'),(270,'Saved','2018-02-26 19:30:32','{\"id\":96,\"fileName\":\"022620181930288721_tets_file.txt\",\"originalName\":\"document(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',499803932,'file_upload','0.0.0.0','00-00-00-00-00-00'),(271,'Deleted','2018-02-26 19:30:48','{\"id\":95,\"fileName\":\"022620181930288720_tets_file.txt\",\"originalName\":\"Chrysanthemum - Copy.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',576600270,'file_upload','0.0.0.0','00-00-00-00-00-00'),(272,'Deleted','2018-02-26 19:30:49','{\"id\":96,\"fileName\":\"022620181930288721_tets_file.txt\",\"originalName\":\"document(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',499803932,'file_upload','0.0.0.0','00-00-00-00-00-00'),(273,'Saved','2018-02-26 19:30:49','{\"id\":95,\"fileName\":\"022620181930471290_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1020369480,'file_upload','0.0.0.0','00-00-00-00-00-00'),(274,'Deleted','2018-02-26 19:32:25','{\"id\":95,\"fileName\":\"022620181930471290_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1020369480,'file_upload','0.0.0.0','00-00-00-00-00-00'),(275,'Saved','2018-02-26 19:32:25','{\"id\":95,\"fileName\":\"0226201819322450_tets_file.txt\",\"originalName\":\"Tulips.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',988273969,'file_upload','0.0.0.0','00-00-00-00-00-00'),(276,'Saved','2018-02-26 19:32:26','{\"id\":96,\"fileName\":\"0226201819322451_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1784565764,'file_upload','0.0.0.0','00-00-00-00-00-00'),(277,'Saved','2018-02-26 19:32:26','{\"id\":97,\"fileName\":\"0226201819322452_tets_file.txt\",\"originalName\":\"Divwise_Empwise_CPF_Report.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-963994042,'file_upload','0.0.0.0','00-00-00-00-00-00'),(278,'Saved','2018-02-26 19:32:27','{\"id\":98,\"fileName\":\"0226201819322453_tets_file.txt\",\"originalName\":\"document(1).pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1067579456,'file_upload','0.0.0.0','00-00-00-00-00-00'),(279,'Updated','2018-02-27 10:32:59','{\"id\":244,\"pageName\":\"File_test\",\"fromContextHelp\":\"Testing of file upload\"}',-408125712,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(280,'HQL','2018-02-27 10:33:00','\"delete from TblFormSchema where  fk \\u003d 244\"',-1925843630,'String','0.0.0.0','00-00-00-00-00-00'),(281,'Saved','2018-02-27 10:33:01','{\"id\":1352,\"fieldController\":\"file\",\"fieldLabel\":\"all files\",\"fieldName\":\"all_files\",\"fieldValue\":\"Image\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":5,\"regex\":\"multiple\",\"tooltip\":\"images\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-1215457667,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(282,'Saved','2018-02-27 10:33:02','{\"id\":1353,\"fieldController\":\"file\",\"fieldLabel\":\"documents\",\"fieldName\":\"documents\",\"fieldValue\":\"xlsx,xls\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":4,\"regex\":\"multiple\",\"tooltip\":\"docs\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-1213203656,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(283,'Saved','2018-02-27 10:33:03','{\"id\":1354,\"fieldController\":\"textbox\",\"fieldLabel\":\"Name\",\"fieldName\":\"name\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":1,\"regex\":\"^[A-Za-z]{0,}$\",\"tooltip\":\"Name\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"45\"}',-564018787,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(284,'Saved','2018-02-27 10:33:03','{\"id\":1355,\"fieldController\":\"file\",\"fieldLabel\":\"uuid\",\"fieldName\":\"aadhar\",\"fieldValue\":\"doc,docx\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"single\",\"tooltip\":\"aadhar\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-888591106,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(285,'Saved','2018-02-27 10:33:04','{\"id\":1356,\"fieldController\":\"file\",\"fieldLabel\":\"pan\",\"fieldName\":\"pan\",\"fieldValue\":\"pdf\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"single\",\"tooltip\":\"pan\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":244,\"size\":\"1024\"}',-1332852130,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(286,'Saved','2018-02-27 12:31:59','{\"id\":99,\"fileName\":\"022720181231585150_File_test.txt\",\"originalName\":\"Bug listing of formutility.docx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"extension\":\".docx\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1327291410,'file_upload','0.0.0.0','00-00-00-00-00-00'),(287,'Saved','2018-02-27 12:32:00','{\"id\":100,\"fileName\":\"022720181231585151_File_test.txt\",\"originalName\":\"2014JUN00463.pdf\",\"fileType\":\"application/pdf\",\"extension\":\".pdf\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',540455006,'file_upload','0.0.0.0','00-00-00-00-00-00'),(288,'Saved','2018-02-27 12:32:01','{\"id\":101,\"fileName\":\"022720181231585152_File_test.txt\",\"originalName\":\"Copy of IT Declaration Form_FY 2016-17.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1948906113,'file_upload','0.0.0.0','00-00-00-00-00-00'),(289,'Saved','2018-02-27 12:32:01','{\"id\":102,\"fileName\":\"022720181231585153_File_test.txt\",\"originalName\":\"Kajal.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-323934519,'file_upload','0.0.0.0','00-00-00-00-00-00'),(290,'Saved','2018-02-27 12:32:02','{\"id\":103,\"fileName\":\"022720181231585154_File_test.txt\",\"originalName\":\"Parth Patel.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1364514615,'file_upload','0.0.0.0','00-00-00-00-00-00'),(291,'Saved','2018-02-27 12:32:02','{\"id\":104,\"fileName\":\"022720181231585155_File_test.txt\",\"originalName\":\"022220181412147530_demo2102 (1).png\",\"fileType\":\"image/png\",\"extension\":\".png\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',1176012321,'file_upload','0.0.0.0','00-00-00-00-00-00'),(292,'Saved','2018-02-27 12:32:02','{\"id\":105,\"fileName\":\"022720181231585156_File_test.txt\",\"originalName\":\"022220181412147530_demo2102.png\",\"fileType\":\"image/png\",\"extension\":\".png\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',293820961,'file_upload','0.0.0.0','00-00-00-00-00-00'),(293,'Saved','2018-02-27 12:32:03','{\"id\":106,\"fileName\":\"022720181231585157_File_test.txt\",\"originalName\":\"022220181412147541_demo2102.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\PARTH DATA\\\\FormGeneratorUtility\\\\FormUtility SVN WORKSPACE\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1665927572,'file_upload','0.0.0.0','00-00-00-00-00-00'),(294,'Saved','2018-02-27 14:12:57','{\"id\":246,\"pageName\":\"file2702\",\"fromContextHelp\":\"context file2702\"}',147817224,'page_mapping','0.0.0.0','00-00-00-00-00-00'),(295,'Saved','2018-02-27 14:12:57','{\"id\":1357,\"fieldController\":\"textbox\",\"fieldLabel\":\"code\",\"fieldName\":\"code\",\"fieldType\":\"INT\",\"fieldIndex\":1,\"regex\":\"^[1-9]{1,}[0-9]{0,}$\",\"tooltip\":\"code\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"yes\",\"fk\":246,\"size\":\"5\"}',363573334,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(296,'Saved','2018-02-27 14:12:58','{\"id\":1358,\"fieldController\":\"file\",\"fieldLabel\":\"file2\",\"fieldName\":\"file2\",\"fieldValue\":\"Office\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":3,\"regex\":\"multiple\",\"tooltip\":\"office files\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":246,\"size\":\"1000\"}',1379279026,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(297,'Saved','2018-02-27 14:12:58','{\"id\":1359,\"fieldController\":\"file\",\"fieldLabel\":\"file3\",\"fieldName\":\"file3\",\"fieldValue\":\"xls,xlsx\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":4,\"regex\":\"multiple\",\"tooltip\":\"pdf files\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":246,\"size\":\"1000\"}',1318065422,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(298,'Saved','2018-02-27 14:12:59','{\"id\":1360,\"fieldController\":\"file\",\"fieldLabel\":\"file1\",\"fieldName\":\"file1\",\"fieldValue\":\"jpg,jpeg\",\"fieldType\":\"VARCHAR\",\"fieldIndex\":2,\"regex\":\"multiple\",\"tooltip\":\"jpg files\",\"startDate\":\"\",\"endDate\":\"\",\"dateFormat\":\"\",\"dateAll\":\"\",\"datePast\":\"\",\"dateFuture\":\"\",\"required\":\"no\",\"fk\":246,\"size\":\"1000\"}',1724824718,'tbl_form_schema','0.0.0.0','00-00-00-00-00-00'),(299,'Saved','2018-02-27 14:23:47','{\"id\":107,\"fileName\":\"022720181423451560_file2702.txt\",\"originalName\":\"Dark%20Fantasy%20Cookies01.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-882342182,'file_upload','0.0.0.0','00-00-00-00-00-00'),(300,'Saved','2018-02-27 14:23:47','{\"id\":108,\"fileName\":\"022720181423451561_file2702.txt\",\"originalName\":\"Important Links.docx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"extension\":\".docx\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1313846492,'file_upload','0.0.0.0','00-00-00-00-00-00'),(301,'Saved','2018-02-27 14:23:48','{\"id\":109,\"fileName\":\"022720181423451562_file2702.txt\",\"originalName\":\"WorkingHoursFormGenUtility.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1400728658,'file_upload','0.0.0.0','00-00-00-00-00-00'),(302,'Saved','2018-02-27 14:25:31','{\"id\":110,\"fileName\":\"022720181425307070_file2702.txt\",\"originalName\":\"silver-touch-technologies-pvt-ltd-1-638.jpg\",\"fileType\":\"image/jpeg\",\"extension\":\".jpg\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',596068836,'file_upload','0.0.0.0','00-00-00-00-00-00'),(303,'Saved','2018-02-27 14:25:31','{\"id\":111,\"fileName\":\"022720181425307071_file2702.txt\",\"originalName\":\"Utility Excel.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',298307125,'file_upload','0.0.0.0','00-00-00-00-00-00'),(304,'Saved','2018-02-27 14:25:31','{\"id\":112,\"fileName\":\"022720181425307072_file2702.txt\",\"originalName\":\"CAS_CLC.xlsx\",\"fileType\":\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"extension\":\".xlsx\",\"location\":\"D:\\\\java\\\\DynamicFormCreation_WorkSpace\\\\FormGeneratorUtility\\\\WebContent\\\\image\"}',-1968062910,'file_upload','0.0.0.0','00-00-00-00-00-00');
/*!40000 ALTER TABLE `auditlog_formgeneration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `auditlog_view`
--

DROP TABLE IF EXISTS `auditlog_view`;
/*!50001 DROP VIEW IF EXISTS `auditlog_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `auditlog_view` AS SELECT 
 1 AS `AUDIT_LOG_ID`,
 1 AS `ACTIONs`,
 1 AS `CREATED_DATE`,
 1 AS `DETAIL`,
 1 AS `ENTITY_ID`,
 1 AS `ENTITY_NAME`,
 1 AS `IP_ADDRESS`,
 1 AS `MAC_ADDRESS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auditreport`
--

DROP TABLE IF EXISTS `auditreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditreport` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `todate` date DEFAULT NULL,
  `action` varchar(6) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditreport`
--

LOCK TABLES `auditreport` WRITE;
/*!40000 ALTER TABLE `auditreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataa`
--

DROP TABLE IF EXISTS `dataa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataa` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataa`
--

LOCK TABLES `dataa` WRITE;
/*!40000 ALTER TABLE `dataa` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_validation`
--

DROP TABLE IF EXISTS `date_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_validation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `datetime1` datetime DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_validation`
--

LOCK TABLES `date_validation` WRITE;
/*!40000 ALTER TABLE `date_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_validation1`
--

DROP TABLE IF EXISTS `date_validation1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_validation1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `datetime1` datetime DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_validation1`
--

LOCK TABLES `date_validation1` WRITE;
/*!40000 ALTER TABLE `date_validation1` DISABLE KEYS */;
INSERT INTO `date_validation1` VALUES (1,'2018-02-24 17:40:00','2018-02-13'),(2,'2018-02-24 17:41:00','2018-02-15');
/*!40000 ALTER TABLE `date_validation1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `num` int(4) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo`
--

LOCK TABLES `demo` WRITE;
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
INSERT INTO `demo` VALUES (1,'asd1',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2131',3,NULL,NULL,NULL,NULL,NULL,NULL),(9,'a',10,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2',1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'1',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'1',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,'3',3,NULL,NULL,NULL,NULL,NULL,NULL),(8,'2',2,NULL,NULL,NULL,NULL,NULL,NULL),(10,'a',10,NULL,NULL,NULL,NULL,NULL,NULL),(11,'a',10,NULL,NULL,NULL,NULL,NULL,NULL),(12,'a',10,NULL,NULL,NULL,NULL,NULL,NULL),(13,'a',10,NULL,NULL,NULL,NULL,NULL,NULL),(14,'a',11,NULL,NULL,NULL,NULL,NULL,NULL),(15,'va',11,NULL,NULL,NULL,NULL,NULL,NULL),(16,'vaa',11,NULL,NULL,NULL,NULL,NULL,NULL),(17,'vaa',121,NULL,NULL,NULL,NULL,NULL,NULL),(18,'123',123,NULL,NULL,NULL,NULL,NULL,NULL),(19,'1',2,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo1`
--

DROP TABLE IF EXISTS `demo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo1`
--

LOCK TABLES `demo1` WRITE;
/*!40000 ALTER TABLE `demo1` DISABLE KEYS */;
INSERT INTO `demo1` VALUES (1,123,'2018-02-15');
/*!40000 ALTER TABLE `demo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo111`
--

DROP TABLE IF EXISTS `demo111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo111` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `gfg` int(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo111`
--

LOCK TABLES `demo111` WRITE;
/*!40000 ALTER TABLE `demo111` DISABLE KEYS */;
INSERT INTO `demo111` VALUES (1,121),(2,124);
/*!40000 ALTER TABLE `demo111` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo1234`
--

DROP TABLE IF EXISTS `demo1234`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo1234` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` int(5) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo1234`
--

LOCK TABLES `demo1234` WRITE;
/*!40000 ALTER TABLE `demo1234` DISABLE KEYS */;
INSERT INTO `demo1234` VALUES (1,12,'saffro'),(3,13,'bhadresh'),(4,14,'parth'),(5,15,'DipeshSoni'),(6,16,'SunilVaghela'),(7,17,'GautamPatel'),(8,18,'DharmeshPatel'),(9,2,'saffron');
/*!40000 ALTER TABLE `demo1234` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo2`
--

DROP TABLE IF EXISTS `demo2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `id1` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo2`
--

LOCK TABLES `demo2` WRITE;
/*!40000 ALTER TABLE `demo2` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo2102`
--

DROP TABLE IF EXISTS `demo2102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo2102` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `aadhar` varchar(1000) DEFAULT NULL,
  `pan` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo2102`
--

LOCK TABLES `demo2102` WRITE;
/*!40000 ALTER TABLE `demo2102` DISABLE KEYS */;
INSERT INTO `demo2102` VALUES (1,1,'022320181359007980_demo2102.txt','022320181359007991_demo2102.txt'),(2,2,'02212018184038369_demo2102.txt','02212018184038369_demo2102.txt'),(15,112,NULL,NULL),(12,3,'022220181412147530_demo2102.txt|022220181412147541_demo2102.txt','022220181412147542_demo2102.txt'),(13,111,'022220181546459990_demo2102.txt','0222201815464601_demo2102.txt'),(8,8,NULL,NULL),(9,9,'022220181027028560_demo2102.txt','022220181027028851_demo2102.txt'),(14,4,NULL,NULL),(16,5,'90','91'),(17,6,'92|93','94');
/*!40000 ALTER TABLE `demo2102` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo3`
--

DROP TABLE IF EXISTS `demo3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` double DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo3`
--

LOCK TABLES `demo3` WRITE;
/*!40000 ALTER TABLE `demo3` DISABLE KEYS */;
INSERT INTO `demo3` VALUES (1,1,'female'),(2,2,'male'),(3,3,'female'),(4,4,'female'),(5,5,'male'),(6,6,'male'),(7,7,'female'),(8,8,'female'),(9,9,'male'),(10,10,'male'),(11,11,'male'),(12,12,'female');
/*!40000 ALTER TABLE `demo3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo44`
--

DROP TABLE IF EXISTS `demo44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo44` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime DEFAULT NULL,
  `code` int(5) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo44`
--

LOCK TABLES `demo44` WRITE;
/*!40000 ALTER TABLE `demo44` DISABLE KEYS */;
INSERT INTO `demo44` VALUES (3,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(4,'2022-12-12 00:12:00',102,'1912-11-11','Rajuchahatwo'),(5,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(6,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(7,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(8,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(9,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(10,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(11,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(12,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(13,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(14,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(15,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(16,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(17,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(18,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(19,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(20,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(21,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(22,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(23,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(24,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(25,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(26,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(27,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(28,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(29,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(30,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(31,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(32,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(33,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(34,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(35,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(36,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(37,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(38,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(39,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(40,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(41,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(42,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(43,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(44,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(45,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(46,'2022-12-12 00:12:00',101,'1911-11-11','Rajuchaha'),(48,'2022-12-12 00:12:00',102,'1912-11-11','Rajuchahatwo'),(49,'2022-12-12 00:12:00',102,'1912-11-11','Rajuchahatwo'),(54,'2033-12-12 00:12:00',335,'1994-11-11','BhadreshGB'),(51,'2033-12-12 00:12:00',333,'1993-11-11','Bhadresh');
/*!40000 ALTER TABLE `demo44` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demotable`
--

DROP TABLE IF EXISTS `demotable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demotable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `adr` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demotable`
--

LOCK TABLES `demotable` WRITE;
/*!40000 ALTER TABLE `demotable` DISABLE KEYS */;
INSERT INTO `demotable` VALUES (1,'1','2018-01-12 17:08:00','male','2018-01-11','adminAC12@@','talkasdflajksdlfjklasjkdfljksldfjklsdkfl'),(2,'admin','2018-01-01 05:09:00','male','2018-01-18','adminAC12@@','ajksdjfksjdfkghasughejrusie'),(3,'prashant','2018-01-11 17:08:00','male','2018-01-05','abc@#AB12','tashdkfhasdf');
/*!40000 ALTER TABLE `demotable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dt1` float DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `projectname` varchar(49) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dept_name` varchar(15) DEFAULT NULL,
  `number1` int(8) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (20,3.2,'ERT#$er34','projectthree,projectfour','saffron','Male','qwe',156,'2017-12-14'),(19,3.2,'OP#$rt34sza','projectone','saffrondd','Female','TEst fro Test',343435,'2017-12-13');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department2`
--

DROP TABLE IF EXISTS `department2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(12) DEFAULT NULL,
  `projectname` varchar(38) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dept_name` varchar(15) DEFAULT NULL,
  `number1` int(8) DEFAULT NULL,
  `datetime1` datetime DEFAULT NULL,
  `dept_id` int(5) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department2`
--

LOCK TABLES `department2` WRITE;
/*!40000 ALTER TABLE `department2` DISABLE KEYS */;
INSERT INTO `department2` VALUES (1,'abc@#$AB123','project3','asdfasdf','Male','ADMIN',1,'2018-01-12 16:56:00',1,'2017-12-14');
/*!40000 ALTER TABLE `department2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmeo55`
--

DROP TABLE IF EXISTS `dmeo55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmeo55` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmeo55`
--

LOCK TABLES `dmeo55` WRITE;
/*!40000 ALTER TABLE `dmeo55` DISABLE KEYS */;
INSERT INTO `dmeo55` VALUES (1,NULL,NULL),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,NULL,NULL),(6,1,'parthpatel');
/*!40000 ALTER TABLE `dmeo55` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` int(5) DEFAULT NULL,
  `emp_name` varchar(15) DEFAULT NULL,
  `EMP_ID` bigint(20) NOT NULL,
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `DPT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKlmn7q9xtxssbqx76bkwukfjb2` (`DPT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,123,'Bhavik',0,NULL,'',NULL),(2,1,'Bhadresh',0,NULL,'',NULL),(3,2,'JAVA',0,NULL,'',NULL),(4,3,'bhaddu',0,NULL,'',NULL),(5,4,'Alfresco',0,NULL,'',NULL),(6,5,'dspace',0,NULL,'',NULL),(7,1550,'Test',0,NULL,'',NULL),(8,1475,'TestData',0,NULL,'',NULL),(9,14,'this',0,NULL,'',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee0502`
--

DROP TABLE IF EXISTS `employee0502`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee0502` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(10) DEFAULT NULL,
  `code` int(5) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `demofield` varchar(5) DEFAULT NULL,
  `num1` int(5) DEFAULT NULL,
  `box` char(7) DEFAULT NULL,
  `combobox` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee0502`
--

LOCK TABLES `employee0502` WRITE;
/*!40000 ALTER TABLE `employee0502` DISABLE KEYS */;
INSERT INTO `employee0502` VALUES (1,NULL,1,'female','klone',12,'two',NULL),(2,NULL,2,'male','kl',12,'two','two');
/*!40000 ALTER TABLE `employee0502` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee0502_1`
--

DROP TABLE IF EXISTS `employee0502_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee0502_1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(10) DEFAULT NULL,
  `code` int(5) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `demofield` varchar(5) DEFAULT NULL,
  `num1` int(5) DEFAULT NULL,
  `box` char(7) DEFAULT NULL,
  `combobox` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee0502_1`
--

LOCK TABLES `employee0502_1` WRITE;
/*!40000 ALTER TABLE `employee0502_1` DISABLE KEYS */;
INSERT INTO `employee0502_1` VALUES (1,'',132,NULL,'asdf',0,NULL,''),(2,'AS#$12we',111,'male','TESt',0,NULL,''),(3,'AAsds@@123',12,'female','poi',11,'onw','one');
/*!40000 ALTER TABLE `employee0502_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_table`
--

DROP TABLE IF EXISTS `employee_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(12) DEFAULT NULL,
  `code` int(5) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_table`
--

LOCK TABLES `employee_table` WRITE;
/*!40000 ALTER TABLE `employee_table` DISABLE KEYS */;
INSERT INTO `employee_table` VALUES (1,'BH12@#hy',123,'Saffrontower','Male','Bhavik'),(2,'R%4Rt3$JH',159,'panchvati','Male','Parth');
/*!40000 ALTER TABLE `employee_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptemp`
--

DROP TABLE IF EXISTS `emptemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emptemp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `projcet` varchar(18) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptemp`
--

LOCK TABLES `emptemp` WRITE;
/*!40000 ALTER TABLE `emptemp` DISABLE KEYS */;
INSERT INTO `emptemp` VALUES (1,'1','female','Alfresco,CRM','2018-01-03'),(2,'1','female','Alfresco,CRM','2018-01-03'),(3,'1','female','Alfresco,CRM','2018-01-03'),(4,'1','male','HSIDC','2018-01-02'),(5,'1','male','HSIDC','2018-01-02'),(6,'a','male','HSIDC','2018-01-04');
/*!40000 ALTER TABLE `emptemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file2702`
--

DROP TABLE IF EXISTS `file2702`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file2702` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `file2` varchar(1000) DEFAULT NULL,
  `file3` varchar(1000) DEFAULT NULL,
  `file1` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file2702`
--

LOCK TABLES `file2702` WRITE;
/*!40000 ALTER TABLE `file2702` DISABLE KEYS */;
INSERT INTO `file2702` VALUES (1,12,'108','109','107'),(2,1,NULL,NULL,NULL),(3,2,'111','112','110');
/*!40000 ALTER TABLE `file2702` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_demo`
--

DROP TABLE IF EXISTS `file_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_demo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_demo`
--

LOCK TABLES `file_demo` WRITE;
/*!40000 ALTER TABLE `file_demo` DISABLE KEYS */;
INSERT INTO `file_demo` VALUES (1,123),(2,123),(3,1563),(4,153),(5,147),(6,18159),(7,18155),(8,15),(9,1),(10,2),(11,3),(12,6);
/*!40000 ALTER TABLE `file_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_demo1`
--

DROP TABLE IF EXISTS `file_demo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_demo1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_demo1`
--

LOCK TABLES `file_demo1` WRITE;
/*!40000 ALTER TABLE `file_demo1` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_demo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_demo3`
--

DROP TABLE IF EXISTS `file_demo3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_demo3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_demo3`
--

LOCK TABLES `file_demo3` WRITE;
/*!40000 ALTER TABLE `file_demo3` DISABLE KEYS */;
INSERT INTO `file_demo3` VALUES (1,1,'02132018114332174_File_demo3.txt');
/*!40000 ALTER TABLE `file_demo3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_demo4`
--

DROP TABLE IF EXISTS `file_demo4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_demo4` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_code` int(5) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_demo4`
--

LOCK TABLES `file_demo4` WRITE;
/*!40000 ALTER TABLE `file_demo4` DISABLE KEYS */;
INSERT INTO `file_demo4` VALUES (1,1,'0213201812544283_File_demo4.txt'),(2,2,'02132018155821498_file_demo4.txt'),(3,3,'02132018160011880_file_demo4.txt'),(4,4,'02142018185056449_file_demo4.txt'),(5,6,'02152018150806525_file_demo4.txt'),(6,5,'02152018151313248_file_demo4.txt'),(7,5,'0215201815174649_file_demo4.txt'),(8,5,'02152018151925922_file_demo4.txt'),(9,7,'02152018152217769_file_demo4.txt'),(10,7,'02152018152406763_file_demo4.txt'),(11,8,'0215201815263041_file_demo4.txt'),(12,9,NULL),(13,10,NULL),(14,11,NULL),(15,12,'02152018163634415_file_demo4.txt'),(16,6,'02152018180751116_file_demo4.txt'),(17,6,'0215201818105210_file_demo4.txt'),(18,6,'02152018181302806_file_demo4.txt'),(19,6,'02152018181451947_file_demo4.txt'),(20,150,'02152018181609356_file_demo4.txt'),(21,151,'02152018182629189_file_demo4.txt'),(22,152,'02152018182721545_file_demo4.txt'),(23,1341,'02152018184648925_file_demo4.txt'),(24,132,'02202018180315236_file_demo4.txt'),(25,1111,'02202018180441690_file_demo4.txt');
/*!40000 ALTER TABLE `file_demo4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_test`
--

DROP TABLE IF EXISTS `file_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `all_files` varchar(1024) DEFAULT NULL,
  `documents` varchar(1024) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `aadhar` varchar(1024) DEFAULT NULL,
  `pan` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_test`
--

LOCK TABLES `file_test` WRITE;
/*!40000 ALTER TABLE `file_test` DISABLE KEYS */;
INSERT INTO `file_test` VALUES (1,'104|105|106','101|102|103','sttl','99','100');
/*!40000 ALTER TABLE `file_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload`
--

DROP TABLE IF EXISTS `file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `originalName` varchar(255) DEFAULT NULL,
  `fileType` varchar(100) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `fileData` tinyblob,
  `tableId` int(11) DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload`
--

LOCK TABLES `file_upload` WRITE;
/*!40000 ALTER TABLE `file_upload` DISABLE KEYS */;
INSERT INTO `file_upload` VALUES (1,'D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image//01252018164105280_1empTemp.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(2,'D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image//0125201816431432_2empTemp.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(3,'D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image//01252018165843843_3empTemp.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(4,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02122018135134601_0file_demo.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(5,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02122018140819306_9file_demo.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(6,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02122018150757769_12file_demo.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(7,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018100352961_1file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(8,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018100809913_2file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(9,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018101555524_3file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(10,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018102920201_4file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(11,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018103359827_0file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(12,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018103654559_0file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(13,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105117195_0file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(14,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105148970_0file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(15,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105241769_0file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(16,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105455187_5file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(17,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105653934_6file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(18,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018105846850_7file_demo2.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(19,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018114332484_file_demo3.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(20,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018125255237_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(21,'D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image//02132018125442463_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(22,'02132018155821498_file_demo4.txt',NULL,'image/jpeg','.txt',NULL,NULL,NULL,NULL),(23,'02132018160011880_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(24,'02142018185056449_file_demo4.txt',NULL,'application/x-msdownload','.txt',NULL,NULL,NULL,NULL),(25,'02152018150806525_file_demo4.txt',NULL,'image/jpeg','.txt',NULL,NULL,NULL,NULL),(26,'0215201815174649_file_demo4.txt',NULL,'image/jpeg',NULL,NULL,NULL,NULL,NULL),(27,'02152018151925922_file_demo4.txt',NULL,'image/jpeg',NULL,NULL,NULL,NULL,NULL),(28,'02152018152406763_file_demo4.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(29,'0215201815263041_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(30,'02152018163634415_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(31,'02152018184648925_file_demo4.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(32,'02152018185139224_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(33,'02162018100014740_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(34,'02162018121059151_Gautam_file_TEST.txt',NULL,'application/x-msdownload','.exe',NULL,NULL,NULL,NULL),(35,'02162018121249829_Gautam_file_TEST.txt',NULL,'application/x-msdownload','.exe',NULL,NULL,NULL,NULL),(36,'02162018121309749_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(37,'02162018121647862_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(38,'02162018121709790_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(39,'02162018122721139_Gautam_file_TEST.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(40,'0220201810240461_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(41,'02202018153656351_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(42,'02202018160154405_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(43,'02202018163511187_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(44,'02202018164208251_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(45,'02202018164302644_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(46,'02202018164805245_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(47,'0220201817093975_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(48,'02202018173516816_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(49,'0220201817375468_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(50,'02202018175603324_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(51,'02202018180315236_file_demo4.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(52,'02202018180441690_file_demo4.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(53,'02202018182940976_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(54,'02202018185056457_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(55,'02202018185123539_Gautam_file_TEST.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(56,'02212018124450949_dmeo55.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(57,'02212018124857452_dmeo55.txt',NULL,'image/png','.PNG',NULL,NULL,NULL,NULL),(58,'02212018142356878_dmeo55.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(59,'02212018144702346_dmeo55.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(60,'02212018154133650_dmeo55.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(61,'02212018173033755_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(62,'02212018173304459_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(63,'02212018173445642_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(64,'02212018173612247_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(66,'02212018184038369_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(67,'02212018184038369_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(68,'022120181909032910_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(69,'022120181909032910_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(70,'022120181916471400_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(71,'022120181916471400_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(72,'022120181919325770_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(73,'022120181919325771_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(74,'',NULL,'application/octet-stream','',NULL,NULL,NULL,NULL),(75,'',NULL,'application/octet-stream','',NULL,NULL,NULL,NULL),(76,'022220181027028560_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(77,'022220181027028851_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(78,'0',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(79,'2',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(80,'0',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(81,'022220181412147530_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(82,'022220181412147541_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(83,'022220181412147542_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(84,'022220181546459990_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(85,'0222201815464601_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(86,'022220181822455790_demo2102.txt',NULL,'image/png','.png',NULL,NULL,NULL,NULL),(87,'022220181822455961_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(88,'022320181359007980_demo2102.txt',NULL,'image/jpeg','.jpg',NULL,NULL,NULL,NULL),(89,'022320181359007991_demo2102.txt',NULL,'application/pdf','.pdf',NULL,NULL,NULL,NULL),(91,'022620181453001181_demo2102.txt','JPA + Hibernate - Basic Auditing by using Entity Callback Listeners.pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(90,'022620181453001180_demo2102.txt','34ac52a0-6d5b-4e68-9e77-19b3fcfbd311.png','image/png','.png','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(93,'022620181519225381_demo2102.txt','Lighthouse.jpg','image/jpeg','.jpg','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(92,'022620181519225380_demo2102.txt','Lighthouse - Copy.jpg','image/jpeg','.jpg','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(94,'022620181519225382_demo2102.txt','2016SEP06992.pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(99,'022720181231585150_File_test.txt','Bug listing of formutility.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','.docx','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(98,'0226201819322453_tets_file.txt','document(1).pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(95,'0226201819322450_tets_file.txt','Tulips.jpg','image/jpeg','.jpg','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(96,'0226201819322451_tets_file.txt','Divwise_Empwise_CPF_Report(1).pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(97,'0226201819322452_tets_file.txt','Divwise_Empwise_CPF_Report.pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(100,'022720181231585151_File_test.txt','2014JUN00463.pdf','application/pdf','.pdf','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(101,'022720181231585152_File_test.txt','Copy of IT Declaration Form_FY 2016-17.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(102,'022720181231585153_File_test.txt','Kajal.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(103,'022720181231585154_File_test.txt','Parth Patel.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(104,'022720181231585155_File_test.txt','022220181412147530_demo2102 (1).png','image/png','.png','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(105,'022720181231585156_File_test.txt','022220181412147530_demo2102.png','image/png','.png','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(106,'022720181231585157_File_test.txt','022220181412147541_demo2102.jpg','image/jpeg','.jpg','D:\\PARTH DATA\\FormGeneratorUtility\\FormUtility SVN WORKSPACE\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(107,'022720181423451560_file2702.txt','Dark%20Fantasy%20Cookies01.jpg','image/jpeg','.jpg','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(108,'022720181423451561_file2702.txt','Important Links.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','.docx','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(109,'022720181423451562_file2702.txt','WorkingHoursFormGenUtility.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(110,'022720181425307070_file2702.txt','silver-touch-technologies-pvt-ltd-1-638.jpg','image/jpeg','.jpg','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(111,'022720181425307071_file2702.txt','Utility Excel.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL),(112,'022720181425307072_file2702.txt','CAS_CLC.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','.xlsx','D:\\java\\DynamicFormCreation_WorkSpace\\FormGeneratorUtility\\WebContent\\image',NULL,NULL,NULL);
/*!40000 ALTER TABLE `file_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gautam_file_test`
--

DROP TABLE IF EXISTS `gautam_file_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gautam_file_test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(10) DEFAULT NULL,
  `file` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gautam_file_test`
--

LOCK TABLES `gautam_file_test` WRITE;
/*!40000 ALTER TABLE `gautam_file_test` DISABLE KEYS */;
INSERT INTO `gautam_file_test` VALUES (1,1341,'02152018185139224_Gautam_file_TEST.txt'),(2,2,NULL),(3,1,'02162018100014740_Gautam_file_TEST.txt'),(4,3,NULL),(5,4,'02162018110102872_Gautam_file_TEST.txt'),(7,6,'02162018121249829_Gautam_file_TEST.txt'),(8,7,'02162018121309749_Gautam_file_TEST.txt'),(9,8,'02162018121647862_Gautam_file_TEST.txt'),(10,9,'02162018121709790_Gautam_file_TEST.txt'),(11,10,'02162018122721139_Gautam_file_TEST.txt'),(12,12,'0220201810240461_Gautam_file_TEST.txt'),(13,5,'02202018153656351_Gautam_file_TEST.txt'),(15,35,'02202018163511187_Gautam_file_TEST.txt'),(17,1,'02202018164302644_Gautam_file_TEST.txt'),(18,2,'02202018173516816_Gautam_file_TEST.txt'),(19,3,'0220201817375468_Gautam_file_TEST.txt'),(20,1,'02202018175603324_Gautam_file_TEST.txt'),(21,4,'02202018182940976_Gautam_file_TEST.txt'),(22,111,'02202018185056457_Gautam_file_TEST.txt'),(23,222,'02202018185123539_Gautam_file_TEST.txt');
/*!40000 ALTER TABLE `gautam_file_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghfgh`
--

DROP TABLE IF EXISTS `ghfgh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghfgh` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fghfgh` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghfgh`
--

LOCK TABLES `ghfgh` WRITE;
/*!40000 ALTER TABLE `ghfgh` DISABLE KEYS */;
INSERT INTO `ghfgh` VALUES (1,'165'),(2,'1'),(3,'1'),(4,'121'),(5,'121123'),(6,'23423'),(7,'12'),(8,'123'),(9,'123'),(10,'234'),(11,'12312'),(12,'12312'),(13,'123123'),(14,'123123'),(15,'123123'),(16,'1231'),(17,'133'),(18,'344'),(19,'564');
/*!40000 ALTER TABLE `ghfgh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `govtemployee`
--

DROP TABLE IF EXISTS `govtemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `govtemployee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_mar_status` varchar(8) DEFAULT NULL,
  `emp_hobby` varchar(23) DEFAULT NULL,
  `emp_pwd` varchar(15) DEFAULT NULL,
  `emp_exp` int(2) DEFAULT NULL,
  `emp_nm` varchar(50) DEFAULT NULL,
  `emp_type` varchar(11) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `emp_addr` varchar(100) DEFAULT NULL,
  `info` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `govtemployee`
--

LOCK TABLES `govtemployee` WRITE;
/*!40000 ALTER TABLE `govtemployee` DISABLE KEYS */;
INSERT INTO `govtemployee` VALUES (1,'Married','Reading,Music','TEst@@123',1,'BhadreshBajariya','On','2018-01-02','This is address','a,c'),(2,'Married','Reading,Music','TEst@@123',1,'BhadreshBajariya','On','2018-01-02','This is address','a,c'),(3,'Married','Reading,Music','12@@qwQW',1,'BhadreshBajariya','On','2018-01-02','This is address','a,c');
/*!40000 ALTER TABLE `govtemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (139);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `html_elements`
--

DROP TABLE IF EXISTS `html_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `html_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `html_elements`
--

LOCK TABLES `html_elements` WRITE;
/*!40000 ALTER TABLE `html_elements` DISABLE KEYS */;
INSERT INTO `html_elements` VALUES (1,'<input type=\"text\"  class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" maxlength=\":maxlength\" title=\":title\"'),(2,'<textarea name=\":name\" id=\":id\"  class=\"form-control\" placeholder=\"Enter text...\" rows=\"5\" cols=\"30\" tabindex=\":tabindex\" maxlength=\":maxlength\" title=\":title\" '),(3,'<input type=\"radio\" name=\":name\" id=\":id\" tabindex=\":tabindex\" title=\":title\" '),(4,'<input type=\"checkbox\" name=\":name\" id=\":id\" tabindex=\":tabindex\" title=\":title\" '),(5,'<select class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" title=\":title\"  '),(6,'<input type=\"date\" id=\":id\" name=\":name\" tabindex=\":tabindex\" title=\":title\" '),(7,'<input type=\"password\"  class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" maxlength=\":maxlength\" title=\":title\" '),(8,'<input type=\"text\"  class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" onkeypress=\"return false;\" readonly title=\":title\" '),(9,'<input type=\"number\"  class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" step=\":step\" title=\":title\" '),(10,'<input type=\"file\"  class=\"form-control\" name=\":name\" id=\":id\" tabindex=\":tabindex\" title=\":title\" accept=\":accept\" ');
/*!40000 ALTER TABLE `html_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_master`
--

DROP TABLE IF EXISTS `menu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_master` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_master`
--

LOCK TABLES `menu_master` WRITE;
/*!40000 ALTER TABLE `menu_master` DISABLE KEYS */;
INSERT INTO `menu_master` VALUES (1,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(2,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(3,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(4,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(5,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(6,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL),(7,'menu1',0,'#',1,'2018-02-20 00:35:00',NULL);
/*!40000 ALTER TABLE `menu_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oktable`
--

DROP TABLE IF EXISTS `oktable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oktable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `oktextarea` varchar(100) DEFAULT NULL,
  `okradio` varchar(6) DEFAULT NULL,
  `okcheckbox` varchar(10) DEFAULT NULL,
  `okid` int(10) DEFAULT NULL,
  `okselect` varchar(4) DEFAULT NULL,
  `oktt` datetime DEFAULT NULL,
  `okmobile` double DEFAULT NULL,
  `okpass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oktable`
--

LOCK TABLES `oktable` WRITE;
/*!40000 ALTER TABLE `oktable` DISABLE KEYS */;
INSERT INTO `oktable` VALUES (1,NULL,'ok',NULL,1,'ok','2018-08-15 16:41:00',555,NULL);
/*!40000 ALTER TABLE `oktable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_mapping`
--

DROP TABLE IF EXISTS `page_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(45) DEFAULT NULL,
  `fromContext` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_mapping`
--

LOCK TABLES `page_mapping` WRITE;
/*!40000 ALTER TABLE `page_mapping` DISABLE KEYS */;
INSERT INTO `page_mapping` VALUES (86,'Department2',NULL),(128,'Department','help'),(157,'employee_table',NULL),(160,'empTemp','This is emp temp form.'),(163,'Employee',NULL),(164,'GovtEmployee',NULL),(166,'TblOprXyz',NULL),(167,'Table_one',NULL),(168,'auditCheck',NULL),(176,'testTableToday',NULL),(179,'demoTable','tttttt'),(180,'SunilTest','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus '),(181,'testContext','This is context demo form 1111'),(210,'test_employee','Context help for Test Employee'),(211,'temp','help for temp'),(213,'Demo','demo'),(216,'testDouble','test'),(217,'oktable','This is Tehst'),(218,'testokTable2','Context Help'),(219,'ghfgh','fghfghfghfghfgh'),(220,'demo1','help for demo1'),(221,'demo3','help demo2'),(222,'developertest_02022018','test audit'),(226,'employee0502_1','help demo4'),(227,'employee0502','help demo4'),(228,'temp1','help'),(229,'DEMO111','sdsd'),(231,'date_validation','help date validation'),(232,'date_validation1','help date validation'),(233,'file_demo','file demo'),(234,'file_demo1','file demo'),(236,'file_demo3','file demo'),(237,'demo1234','help for demo1234'),(238,'file_demo4','help for file_demo4'),(239,'Gautam_file_TEST','This form for test'),(240,'demo44','help demo4'),(241,'TEst111','Hello TEST 111'),(242,'dmeo55','file'),(243,'demo2102','demo2102'),(244,'File_test','Testing of file upload'),(245,'tets_file','tets'),(246,'file2702','context file2702');
/*!40000 ALTER TABLE `page_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=525 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Gautam','Bhavnagar','Bhavnagar','Gujarat',123456789),(2,'Sunil','Ahmedabad','Ahmedabad','Gujarat',123456789),(3,'Bhadresh','Surat','Surat','Gujarat',123456789),(4,'Laurel','Houston','66 Ridge Oak Road','Texas',123456789),(5,'Miguela','Lincoln','7987 Shopko Pass','Nebraska',123456789),(6,'Winn','Saint Louis','80 Mcbride Way','Missouri',123456789),(7,'Giraud','Dallas','93 Lakewood Gardens Street','Texas',123456789),(8,'Latia','San Diego','8 Myrtle Drive','California',123456789),(9,'Netty','Mobile','1 Acker Park','Alabama',123456789),(10,'Corrina','Harrisburg','20128 Onsgard Junction','Pennsylvania',123456789),(11,'Miran','Silver Spring','45200 Nancy Lane','Maryland',123456789),(12,'Livia','Lexington','80 Center Avenue','Kentucky',123456789),(13,'Candra','Saint Paul','4179 Dottie Junction','Minnesota',123456789),(14,'Cart','Alexandria','4 Loomis Center','Virginia',123456789),(15,'Nettie','Independence','49 Sugar Circle','Missouri',123456789),(16,'Minnnie','Levittown','51701 Butternut Trail','Pennsylvania',123456789),(17,'Crista','Prescott','6 Michigan Terrace','Arizona',123456789),(18,'Silvanus','Richmond','7 Comanche Terrace','California',123456789),(19,'Corabel','Harrisburg','30 Merchant Way','Pennsylvania',123456789),(20,'Cherish','Yonkers','47 Autumn Leaf Trail','New York',123456789),(21,'Dorena','Jacksonville','44 Almo Alley','Florida',123456789),(22,'Viv','Birmingham','9621 Spenser Parkway','Alabama',123456789),(23,'Tommie','Independence','03432 Sullivan Park','Missouri',123456789),(24,'Neddy','Tallahassee','287 Hazelcrest Lane','Florida',123456789),(25,'Bryce','Pittsburgh','10 Ludington Center','Pennsylvania',123456789),(26,'Truman','Fort Lauderdale','71 Russell Road','Florida',123456789),(27,'Alfie','Jamaica','75944 Cascade Circle','New York',123456789),(28,'Winfred','New York City','32124 Oak Valley Circle','New York',123456789),(29,'Osgood','Denton','4 East Plaza','Texas',123456789),(30,'Murielle','Atlanta','77911 Kennedy Place','Georgia',123456789),(31,'Miof mela','Los Angeles','75662 Rigney Trail','California',123456789),(32,'Deanne','Lexington','9 Warrior Road','Kentucky',123456789),(33,'Terri','El Paso','45 Loomis Drive','Texas',123456789),(34,'Quincey','Garland','6 Tony Crossing','Texas',123456789),(35,'Meryl','Lexington','6146 Kennedy Trail','Kentucky',123456789),(36,'Kellia','San Angelo','01154 Pankratz Avenue','Texas',123456789),(37,'Natala','Lynchburg','89 Almo Crossing','Virginia',123456789),(38,'Kassie','Rockford','6 Stoughton Avenue','Illinois',123456789),(39,'Etheline','Los Angeles','0846 Esch Crossing','California',123456789),(40,'Nat','Phoenix','71 Carioca Lane','Arizona',123456789),(41,'Natividad','Arlington','61 Mallard Circle','Texas',123456789),(42,'Paul','Frederick','83846 Autumn Leaf Junction','Maryland',123456789),(43,'Ivar','Indianapolis','7049 Tomscot Circle','Indiana',123456789),(44,'Vasily','Scottsdale','34 Springview Street','Arizona',123456789),(45,'Walliw','Saint Petersburg','95405 Straubel Point','Florida',123456789),(46,'Fitzgerald','Washington','79 Nova Pass','District of Columbia',123456789),(47,'Bartholomeo','Racine','8 Loeprich Drive','Wisconsin',123456789),(48,'Neysa','Chicago','17 Kings Alley','Illinois',123456789),(49,'Feliks','Dayton','69 Petterle Park','Ohio',123456789),(50,'Charisse','Dallas','5035 Muir Circle','Texas',123456789),(51,'Marty','Colorado Springs','15 Eagle Crest Way','Colorado',123456789),(52,'Foss','Dallas','2 Morning Crossing','Texas',123456789),(53,'Griz','Phoenix','63310 Ronald Regan Parkway','Arizona',123456789),(54,'Sissie','Salt Lake City','0210 Carpenter Alley','Utah',123456789),(55,'Dorey','Washington','52 Anderson Park','District of Columbia',123456789),(56,'Gabie','Maple Plain','2817 Thompson Avenue','Minnesota',123456789),(57,'Ethelda','San Francisco','57 Little Fleur Crossing','California',123456789),(58,'Taylor','Portsmouth','35 Main Crossing','New Hampshire',123456789),(59,'Shane','Dayton','1 Commercial Circle','Ohio',123456789),(60,'Augustina','Denver','7362 Arrowood Circle','Colorado',123456789),(61,'Leonelle','Dallas','8708 Sutteridge Junction','Texas',123456789),(62,'Antonella','Pittsburgh','4 Longview Parkway','Pennsylvania',123456789),(63,'Ada','Monticello','4546 Spohn Circle','Minnesota',123456789),(64,'Sofie','San Diego','0 Packers Avenue','California',123456789),(65,'Datha','Denver','247 Schurz Street','Colorado',123456789),(66,'Granny','El Paso','8785 Fairfield Avenue','Texas',123456789),(67,'Malchy','Cleveland','081 Kingsford Lane','Ohio',123456789),(68,'Lauritz','Escondido','1 Brickson Park Point','California',123456789),(69,'Cristal','Anchorage','7 Red Cloud Drive','Alaska',123456789),(70,'Mendel','Reston','86450 Brickson Park Hill','Virginia',123456789),(71,'Catherin','Hialeah','03 Sycamore Junction','Florida',123456789),(72,'Bibby','Orlando','61 Loomis Parkway','Florida',123456789),(73,'Charlot','Lincoln','6516 Ridgeview Alley','Nebraska',123456789),(74,'Kizzie','Santa Monica','8 Elgar Circle','California',123456789),(75,'Richard','New Orleans','7905 Sauthoff Hill','Louisiana',123456789),(76,'Ursala','Saint Louis','0 Westend Junction','Missouri',123456789),(77,'Gabe','Saint Paul','88 Shasta Avenue','Minnesota',123456789),(78,'Carolus','Denver','89213 Grasskamp Drive','Colorado',123456789),(79,'Sasha','Dayton','5 Cottonwood Way','Ohio',123456789),(80,'Christal','Miami','47948 Grasskamp Alley','Florida',123456789),(81,'Arturo','San Jose','815 Lake View Parkway','California',123456789),(82,'Bibby','New Orleans','29927 Luster Terrace','Louisiana',123456789),(83,'Pauly','Salt Lake City','0280 Sunnyside Crossing','Utah',123456789),(84,'Ashli','Saint Louis','40 Bayside Hill','Missouri',123456789),(85,'Roth','Houston','1873 Linden Park','Texas',123456789),(86,'Marley','Richmond','2 Spenser Hill','Virginia',123456789),(87,'Kaila','San Antonio','43 Melrose Trail','Texas',123456789),(88,'Hurley','Dayton','5 Doe Crossing Crossing','Ohio',123456789),(89,'Lacie','Trenton','7 Lighthouse Bay Avenue','New Jersey',123456789),(90,'Kimmie','Nashville','4233 Hoffman Trail','Tennessee',123456789),(91,'Nollie','Savannah','0643 Alpine Place','Georgia',123456789),(92,'Manny','Anchorage','55149 Talmadge Terrace','Alaska',123456789),(93,'Raddy','Sterling','89975 Carberry Alley','Virginia',123456789),(94,'Marrilee','Saint Paul','57 Northwestern Trail','Minnesota',123456789),(95,'Stephani','Las Vegas','8281 Erie Street','Nevada',123456789),(96,'Myrwyn','Birmingham','74078 Brown Road','Alabama',123456789),(97,'Nelli','Columbus','836 Becker Trail','Ohio',123456789),(98,'Prue','Little Rock','08 Lerdahl Lane','Arkansas',123456789),(99,'Agnes','Ashburn','2635 Roth Center','Virginia',123456789),(100,'Dollie','Daytona Beach','96591 Nelson Street','Florida',123456789),(101,'Ethelin','Zephyrhills','96944 6th Avenue','Florida',123456789),(102,'Betta','Irvine','183 Eastlawn Trail','California',123456789),(103,'Waylin','Honolulu','41 Dryden Center','Hawaii',123456789),(104,'Brody','New Orleans','9 Pepper Wood Plaza','Louisiana',123456789),(105,'Edyth','Beaumont','80 Dennis Circle','Texas',123456789),(106,'Geralda','Sioux Falls','93 Mockingbird Plaza','South Dakota',123456789),(107,'Nikos','Fullerton','53 Jenifer Pass','California',123456789),(108,'Hiram','Dallas','26021 Aberg Avenue','Texas',123456789),(109,'Erroll','Knoxville','80 Debra Alley','Tennessee',123456789),(110,'Layne','Baltimore','2 Lunder Drive','Maryland',123456789),(111,'Karalynn','Denton','7 Petterle Parkway','Texas',123456789),(112,'Inna','Seattle','6157 Lakeland Parkway','Washington',123456789),(113,'Clark','El Paso','903 Maywood Circle','Texas',123456789),(114,'Yolanda','Austin','70466 Forster Parkway','Texas',123456789),(115,'Beth','Temple','0 Manley Junction','Texas',123456789),(116,'Kassia','Huntington','360 Pierstorff Avenue','West Virginia',123456789),(117,'Donalt','Anaheim','3098 Bashford Circle','California',123456789),(118,'Mandy','Honolulu','70 Stuart Place','Hawaii',123456789),(119,'Kellby','San Diego','37 Hallows Alley','California',123456789),(120,'Leoine','Richmond','86874 Stang Avenue','California',123456789),(121,'Pyotr','El Paso','52 Derek Place','Texas',123456789),(122,'Corey','Philadelphia','56 Cascade Pass','Pennsylvania',123456789),(123,'Clem','Baton Rouge','465 7th Trail','Louisiana',123456789),(124,'Viv','Raleigh','24015 3rd Hill','North Carolina',123456789),(125,'Livia','Louisville','5134 Jackson Hill','Kentucky',123456789),(126,'Dalston','Tampa','36 Starling Alley','Florida',123456789),(127,'Clareta','Sioux Falls','001 Northland Circle','South Dakota',123456789),(128,'Yule','Sarasota','43 Lindbergh Park','Florida',123456789),(129,'Bertine','San Jose','2 Iowa Terrace','California',123456789),(130,'Dollie','Oakland','5 Bultman Parkway','California',123456789),(131,'Eloisa','Corpus Christi','3204 Lakeland Parkway','Texas',123456789),(132,'Moishe','Cincinnati','789 Holmberg Street','Ohio',123456789),(133,'Ronny','El Paso','42 Russell Place','Texas',123456789),(134,'Ardys','Colorado Springs','3874 Mcbride Road','Colorado',123456789),(135,'Cassaundra','Fort Worth','7 Fuller Circle','Texas',123456789),(136,'Toni','Valdosta','45 Almo Drive','Georgia',123456789),(137,'Antony','New York City','6 Pennsylvania Parkway','New York',123456789),(138,'Delinda','Santa Monica','52 Burrows Lane','California',123456789),(139,'Olivier','Iowa City','40 Manley Road','Iowa',123456789),(140,'Cahra','Santa Monica','4287 Harper Drive','California',123456789),(141,'Karlie','Boston','5241 Shelley Way','Massachusetts',123456789),(142,'Barry','Daytona Beach','86 Mosinee Street','Florida',123456789),(143,'Ilyse','Rochester','0328 Kim Court','Minnesota',123456789),(144,'Evin','Memphis','50596 Arizona Parkway','Tennessee',123456789),(145,'Florette','Atlanta','0 Almo Road','Georgia',123456789),(146,'Tabina','Jamaica','5341 Sullivan Alley','New York',123456789),(147,'Mavra','Boston','00 Troy Trail','Massachusetts',123456789),(148,'Gibbie','Palmdale','1 Service Court','California',123456789),(149,'Maude','Sioux Falls','4 Toban Junction','South Dakota',123456789),(150,'Franciskus','Reston','45219 Dwight Place','Virginia',123456789),(151,'Reilly','Dallas','58951 Basil Lane','Texas',123456789),(152,'Calida','Tulsa','4 Hintze Point','Oklahoma',123456789),(153,'Elysia','Oklahoma City','95228 Farmco Pass','Oklahoma',123456789),(154,'Corilla','Raleigh','7 Melvin Plaza','North Carolina',123456789),(155,'Lissi','San Diego','2947 Waywood Point','California',123456789),(156,'Lucienne','Wilmington','1 Badeau Avenue','Delaware',123456789),(157,'Timmi','Minneapolis','1706 Dayton Trail','Minnesota',123456789),(158,'Ira','Bakersfield','997 Atwood Terrace','California',123456789),(159,'Pennie','Atlanta','98058 Elmside Park','Georgia',123456789),(160,'Felicio','Anchorage','38 Hovde Point','Alaska',123456789),(161,'Addy','San Antonio','26 Swallow Drive','Texas',123456789),(162,'Hillery','Newark','8113 Morrow Avenue','New Jersey',123456789),(163,'Jeanie','Des Moines','8 Tony Junction','Iowa',123456789),(164,'Jermaine','Montgomery','8518 Stoughton Hill','Alabama',123456789),(165,'Gram','Athens','333 Shelley Junction','Georgia',123456789),(166,'Judd','Los Angeles','3 Mendota Street','California',123456789),(167,'Garvy','Escondido','43 Parkside Trail','California',123456789),(168,'Abeu','Anchorage','8620 Buell Place','Alaska',123456789),(169,'Beilul','Pittsburgh','73 Thompson Place','Pennsylvania',123456789),(170,'Beverlie','Duluth','3 Nancy Circle','Minnesota',123456789),(171,'Jaine','Oklahoma City','1541 Victoria Terrace','Oklahoma',123456789),(172,'Breanne','Tampa','86528 Barnett Road','Florida',123456789),(173,'Emlyn','Portland','94 Straubel Circle','Maine',123456789),(174,'Valma','Fort Worth','5621 Crowley Plaza','Texas',123456789),(175,'Cacilia','Pompano Beach','8 4th Road','Florida',123456789),(176,'Elsa','Arlington','74 Fairfield Alley','Virginia',123456789),(177,'Petronille','Washington','141 1st Way','District of Columbia',123456789),(178,'Marianne','Green Bay','081 Walton Plaza','Wisconsin',123456789),(179,'Parrnell','Seattle','55 Thompson Avenue','Washington',123456789),(180,'Brendis','San Francisco','21805 Nova Street','California',123456789),(181,'Kessiah','Austin','309 Susan Crossing','Texas',123456789),(182,'Ody','Odessa','6365 Messerschmidt Place','Texas',123456789),(183,'Rosina','San Diego','367 Barnett Junction','California',123456789),(184,'Edwin','Toledo','9713 Bunker Hill Circle','Ohio',123456789),(185,'Euphemia','Manassas','77554 Derek Point','Virginia',123456789),(186,'Erasmus','Tampa','00141 Manufacturers Alley','Florida',123456789),(187,'Catriona','Stamford','4667 Heffernan Avenue','Connecticut',123456789),(188,'Cecilla','Fresno','27 Springs Alley','California',123456789),(189,'Lulu','Norfolk','59 Anniversary Trail','Virginia',123456789),(190,'Bettye','Lexington','9 Bobwhite Crossing','Kentucky',123456789),(191,'Lothaire','Topeka','2 Rusk Place','Kansas',123456789),(192,'Ty','Boca Raton','88 Messerschmidt Circle','Florida',123456789),(193,'Pryce','San Diego','5 Dahle Terrace','California',123456789),(194,'Stella','Tampa','2 Clarendon Road','Florida',123456789),(195,'Dyanne','Irvine','1 Lerdahl Lane','California',123456789),(196,'Callean','Baltimore','073 Pearson Parkway','Maryland',123456789),(197,'Valina','Mc Keesport','98397 Rowland Park','Pennsylvania',123456789),(198,'Meryl','New Bedford','751 Atwood Court','Massachusetts',123456789),(199,'Tamarah','Odessa','8738 Lyons Road','Texas',123456789),(200,'Manolo','Philadelphia','3136 Butternut Way','Pennsylvania',123456789),(201,'Si','Carson City','09862 Londonderry Avenue','Nevada',123456789),(202,'Kali','Baton Rouge','08411 School Center','Louisiana',123456789),(203,'Ailyn','Washington','4 Roxbury Lane','District of Columbia',123456789),(204,'Aurie','Van Nuys','8701 Moose Hill','California',123456789),(205,'Jeniffer','Seattle','106 Vera Drive','Washington',123456789),(206,'Kassie','Stamford','302 Sauthoff Parkway','Connecticut',123456789),(207,'Ilise','Fresno','11 Ridgeway Court','California',123456789),(208,'Avrit','Decatur','38 Ridgeview Hill','Georgia',123456789),(209,'Axe','Salem','9 Everett Alley','Oregon',123456789),(210,'Angus','San Diego','5714 Westerfield Park','California',123456789),(211,'Sharai','Springfield','6 Alpine Drive','Missouri',123456789),(212,'Tiebout','Lexington','594 Hansons Circle','Kentucky',123456789),(213,'Harp','Houston','7376 Talmadge Pass','Texas',123456789),(214,'Wally','Washington','9359 Grover Plaza','District of Columbia',123456789),(215,'Shaylynn','New Orleans','4909 Dorton Hill','Louisiana',123456789),(216,'Eunice','El Paso','98653 Packers Pass','Texas',123456789),(217,'Patty','Provo','32 Eastlawn Plaza','Utah',123456789),(218,'Chelsae','Amarillo','349 Columbus Pass','Texas',123456789),(219,'Nero','Washington','9 Trailsway Court','District of Columbia',123456789),(220,'Laureen','Richmond','040 Chinook Hill','Virginia',123456789),(221,'Montague','Nashville','50 Ronald Regan Road','Tennessee',123456789),(222,'Eliot','Fort Worth','82 Bashford Terrace','Texas',123456789),(223,'Marika','Chattanooga','49049 Lakewood Pass','Tennessee',123456789),(224,'Annemarie','Honolulu','2 Welch Circle','Hawaii',123456789),(225,'Marsiella','Annapolis','26 Colorado Street','Maryland',123456789),(226,'Sib','Dallas','3 Chive Drive','Texas',123456789),(227,'Donal','San Francisco','761 Troy Lane','California',123456789),(228,'Marillin','Kansas City','24 Talisman Lane','Kansas',123456789),(229,'Brad','San Diego','9014 Jay Terrace','California',123456789),(230,'Gerrie','Columbus','01 Buena Vista Crossing','Ohio',123456789),(231,'Mavis','Dallas','52 Southridge Trail','Texas',123456789),(232,'Sigvard','Nashville','136 Redwing Plaza','Tennessee',123456789),(233,'Hadley','Flint','68 Summer Ridge Crossing','Michigan',123456789),(234,'Winnie','Cincinnati','4 Jay Junction','Ohio',123456789),(235,'Titos','Pensacola','1 Acker Center','Florida',123456789),(236,'Ninnetta','Spokane','815 Caliangt Alley','Washington',123456789),(237,'Karin','Little Rock','5 Hansons Circle','Arkansas',123456789),(238,'Neil','Boston','9991 Thierer Terrace','Massachusetts',123456789),(239,'Wyatt','Denver','84 Spenser Street','Colorado',123456789),(240,'Jo','Van Nuys','3106 Mifflin Park','California',123456789),(241,'Bride','Punta Gorda','328 Eggendart Drive','Florida',123456789),(242,'Keen','Vancouver','8 Spohn Way','Washington',123456789),(243,'Brandyn','Saint Paul','818 Doe Crossing Drive','Minnesota',123456789),(244,'Ebony','Oklahoma City','19 Delladonna Parkway','Oklahoma',123456789),(245,'Wayland','Salt Lake City','2808 Buell Alley','Utah',123456789),(246,'Clemence','Houston','496 Forest Dale Court','Texas',123456789),(247,'Vladimir','Danbury','92 Ronald Regan Avenue','Connecticut',123456789),(248,'Corty','Henderson','90791 Nobel Trail','Nevada',123456789),(249,'Korney','Young America','8452 Lindbergh Junction','Minnesota',123456789),(250,'Arvie','New York City','3059 Trailsway Court','New York',123456789),(251,'Addie','Marietta','13170 Dunning Circle','Georgia',123456789),(252,'Gaultiero','Vancouver','42149 Hansons Terrace','Washington',123456789),(253,'Isidora','Little Rock','1 Oneill Alley','Arkansas',123456789),(254,'Mateo','Minneapolis','7564 Warrior Center','Minnesota',123456789),(255,'Paton','San Jose','3967 Main Avenue','California',123456789),(256,'Joye','Dayton','5 Maple Hill','Ohio',123456789),(257,'Arlene','New Orleans','74284 Morningstar Center','Louisiana',123456789),(258,'Mattias','Salt Lake City','3711 Daystar Point','Utah',123456789),(259,'Birdie','Saint Louis','3 Goodland Junction','Missouri',123456789),(260,'Kathe','Maple Plain','64 Thackeray Court','Minnesota',123456789),(261,'Gael','Philadelphia','6008 Dwight Junction','Pennsylvania',123456789),(262,'Luce','Brooklyn','7057 Dixon Lane','New York',123456789),(263,'Rees','Watertown','67468 Hoard Junction','Massachusetts',123456789),(264,'Stinky','Cape Coral','46 Crowley Crossing','Florida',123456789),(265,'Lorette','Fort Smith','61652 Russell Parkway','Arkansas',123456789),(266,'Raven','San Jose','76492 Elgar Point','California',123456789),(267,'Ramsay','Austin','4 Drewry Trail','Texas',123456789),(268,'Ossie','Austin','041 Hanson Terrace','Texas',123456789),(269,'Pavla','Knoxville','80387 Badeau Park','Tennessee',123456789),(270,'Jehu','New York City','7832 Canary Lane','New York',123456789),(271,'Addison','Herndon','5 Waxwing Crossing','Virginia',123456789),(272,'Charline','Torrance','40 Dapin Junction','California',123456789),(273,'Alyson','Fairbanks','435 Rockefeller Pass','Alaska',123456789),(274,'Pauli','Gainesville','732 8th Point','Florida',123456789),(275,'Nedi','Myrtle Beach','95246 Vahlen Court','South Carolina',123456789),(276,'Joelle','Roanoke','821 Clyde Gallagher Crossing','Virginia',123456789),(277,'Latisha','Mobile','8 Onsgard Drive','Alabama',123456789),(278,'Eduino','Van Nuys','39242 Myrtle Road','California',123456789),(279,'Carla','Englewood','6 Towne Parkway','Colorado',123456789),(280,'Sela','Jeffersonville','10 Eggendart Junction','Indiana',123456789),(281,'Perice','Los Angeles','373 North Avenue','California',123456789),(282,'Algernon','Boise','932 Stuart Pass','Idaho',123456789),(283,'Naoma','Oklahoma City','8372 Oxford Park','Oklahoma',123456789),(284,'Hope','San Antonio','8966 Wayridge Park','Texas',123456789),(285,'Patton','Santa Ana','10 Bonner Alley','California',123456789),(286,'Dino','Akron','1 Briar Crest Parkway','Ohio',123456789),(287,'Alta','Kansas City','2626 Glacier Hill Lane','Missouri',123456789),(288,'Vallie','Gadsden','0028 Oakridge Center','Alabama',123456789),(289,'Cathee','Jefferson City','3668 Carberry Junction','Missouri',123456789),(290,'De','Tulsa','84366 Manitowish Road','Oklahoma',123456789),(291,'Rebecca','Columbus','24 Shopko Crossing','Ohio',123456789),(292,'Astrix','Sioux City','4 Waubesa Park','Iowa',123456789),(293,'Hubie','Mobile','74467 Esker Trail','Alabama',123456789),(294,'Kit','Albuquerque','24 Ohio Trail','New Mexico',123456789),(295,'Asia','Garland','7285 Dennis Avenue','Texas',123456789),(296,'Brander','Irvine','577 Spenser Park','California',123456789),(297,'Leupold','Richmond','0357 Havey Center','Virginia',123456789),(298,'Kellen','Fresno','94 Merchant Place','California',123456789),(299,'Frederico','El Paso','84253 Lakewood Gardens Drive','Texas',123456789),(300,'Morie','San Jose','8 Basil Avenue','California',123456789),(301,'Rosy','Memphis','74 Sage Drive','Tennessee',123456789),(302,'Merrielle','San Diego','1 Rieder Park','California',123456789),(303,'Law','Sacramento','86853 Comanche Place','California',123456789),(304,'Frazer','Denver','812 Arrowood Pass','Colorado',123456789),(305,'Joellyn','Great Neck','218 Merchant Way','New York',123456789),(306,'Thibaud','Stockton','62 Burning Wood Alley','California',123456789),(307,'Cristy','Asheville','54 Schlimgen Point','North Carolina',123456789),(308,'Heddi','Kansas City','5194 Grayhawk Hill','Missouri',123456789),(309,'Joyann','Santa Ana','30 Autumn Leaf Lane','California',123456789),(310,'Isabella','Anaheim','78671 Garrison Street','California',123456789),(311,'Nat','Memphis','34 Clarendon Hill','Tennessee',123456789),(312,'Maxy','Birmingham','97950 Mcbride Street','Alabama',123456789),(313,'Deva','Miami','722 Burning Wood Trail','Florida',123456789),(314,'Nicky','Houston','2628 Susan Point','Texas',123456789),(315,'Tate','Mc Keesport','634 Karstens Lane','Pennsylvania',123456789),(316,'Anna-diana','Kansas City','39852 Moulton Hill','Missouri',123456789),(317,'Odessa','Roanoke','86 Hayes Lane','Virginia',123456789),(318,'Tess','Louisville','0 Reinke Parkway','Kentucky',123456789),(319,'Daniele','Las Vegas','00747 Longview Terrace','Nevada',123456789),(320,'Randall','New Orleans','7161 Bowman Point','Louisiana',123456789),(321,'Sayer','Philadelphia','520 Hoepker Avenue','Pennsylvania',123456789),(322,'Auberon','Long Beach','292 Ohio Point','California',123456789),(323,'Glenda','Roanoke','9 Harbort Plaza','Virginia',123456789),(324,'Jacinta','Charlotte','971 Hudson Terrace','North Carolina',123456789),(325,'Noel','Denver','751 Crownhardt Hill','Colorado',123456789),(326,'Mitchell','Columbus','955 Cambridge Park','Georgia',123456789),(327,'Blanche','Shreveport','5 Sundown Trail','Louisiana',123456789),(328,'Prentice','Amarillo','9538 Knutson Hill','Texas',123456789),(329,'Jeffy','Charlotte','2 Kenwood Alley','North Carolina',123456789),(330,'Roger','Sacramento','13420 Merrick Alley','California',123456789),(331,'Nerty','Amarillo','09 Rusk Way','Texas',123456789),(332,'Lida','Boston','4880 Paget Point','Massachusetts',123456789),(333,'Elisabeth','Springfield','363 Swallow Junction','Illinois',123456789),(334,'Katha','Gulfport','49977 Northwestern Alley','Mississippi',123456789),(335,'Karoline','New York City','349 Calypso Park','New York',123456789),(336,'Maynord','West Palm Beach','079 Duke Street','Florida',123456789),(337,'Cullan','New Orleans','17307 Montana Park','Louisiana',123456789),(338,'Payton','Gadsden','24907 Eggendart Drive','Alabama',123456789),(339,'Clare','Phoenix','694 Scoville Circle','Arizona',123456789),(340,'Willy','Jefferson City','2197 Mallory Park','Missouri',123456789),(341,'Nessie','Orlando','9 Melby Park','Florida',123456789),(342,'Robb','Austin','3 Lake View Pass','Texas',123456789),(343,'Sybil','Arlington','79 Scott Park','Texas',123456789),(344,'Briant','Montgomery','298 Novick Center','Alabama',123456789),(345,'Jose','San Antonio','46 Oxford Plaza','Texas',123456789),(346,'Juliana','New York City','5153 Ludington Parkway','New York',123456789),(347,'Christine','San Diego','0160 David Park','California',123456789),(348,'Dante','Oklahoma City','1155 North Alley','Oklahoma',123456789),(349,'Howey','Albuquerque','71 Sommers Plaza','New Mexico',123456789),(350,'Bab','Melbourne','1311 Toban Park','Florida',123456789),(351,'Charlton','Daytona Beach','600 Parkside Avenue','Florida',123456789),(352,'Annabal','Johnson City','08 Forster Junction','Tennessee',123456789),(353,'Lucia','Houston','73 Chinook Circle','Texas',123456789),(354,'Franciskus','Albany','0 Twin Pines Trail','New York',123456789),(355,'Peter','Fairfax','8 Melrose Street','Virginia',123456789),(356,'Blinny','El Paso','7 Ridgeview Street','Texas',123456789),(357,'Ema','Washington','6852 Loeprich Parkway','District of Columbia',123456789),(358,'Kean','Houston','2 Loftsgordon Junction','Texas',123456789),(359,'Damita','Indianapolis','37490 Sullivan Drive','Indiana',123456789),(360,'Ginni','Gastonia','23879 Lakewood Gardens Plaza','North Carolina',123456789),(361,'Homerus','Fort Lauderdale','266 Harbort Terrace','Florida',123456789),(362,'Elyse','Denton','2182 Chive Parkway','Texas',123456789),(363,'Cello','Oklahoma City','424 Corscot Park','Oklahoma',123456789),(364,'Rhodie','Farmington','031 Pawling Circle','Michigan',123456789),(365,'Tan','Saint Petersburg','5 Artisan Parkway','Florida',123456789),(366,'Flint','Birmingham','7752 Barnett Junction','Alabama',123456789),(367,'Kara-lynn','Detroit','5579 Onsgard Drive','Michigan',123456789),(368,'Eustacia','Atlanta','82923 Northland Circle','Georgia',123456789),(369,'Peder','Indianapolis','260 Elgar Crossing','Indiana',123456789),(370,'Dedra','San Jose','77506 Mendota Point','California',123456789),(371,'Beckie','Newport Beach','7366 Hermina Hill','California',123456789),(372,'Marsh','Birmingham','44 Center Trail','Alabama',123456789),(373,'Kora','Baltimore','92 Stephen Road','Maryland',123456789),(374,'Joane','Waco','71519 Lakewood Circle','Texas',123456789),(375,'Salomo','Tuscaloosa','5 Chinook Terrace','Alabama',123456789),(376,'Nada','Ann Arbor','19682 Bowman Park','Michigan',123456789),(377,'Dita','Lancaster','87 Menomonie Way','California',123456789),(378,'Sully','Denver','682 Fisk Place','Colorado',123456789),(379,'Ana','Chicago','0323 Northview Court','Illinois',123456789),(380,'Sander','Evanston','35035 Golf Course Pass','Illinois',123456789),(381,'Saxon','Washington','63 Pearson Crossing','District of Columbia',123456789),(382,'Mellisent','San Diego','1 Utah Point','California',123456789),(383,'Scotti','Tempe','7 Cardinal Court','Arizona',123456789),(384,'Ricki','Baltimore','77597 Mifflin Pass','Maryland',123456789),(385,'Natty','Syracuse','95450 Kennedy Hill','New York',123456789),(386,'Jodi','Shreveport','58 Butterfield Point','Louisiana',123456789),(387,'Charity','Louisville','98 Merchant Plaza','Kentucky',123456789),(388,'Ezequiel','Jackson','251 Waywood Hill','Tennessee',123456789),(389,'Zorana','Baton Rouge','92 Sheridan Circle','Louisiana',123456789),(390,'Amelia','Atlanta','1742 Oxford Way','Georgia',123456789),(391,'Cam','Chico','9752 Lindbergh Pass','California',123456789),(392,'Gerik','Buffalo','0017 Texas Junction','New York',123456789),(393,'Rosanne','Mobile','05391 Shelley Terrace','Alabama',123456789),(394,'Elyssa','Fresno','90 Cambridge Terrace','California',123456789),(395,'Belia','Charleston','01937 Lillian Crossing','West Virginia',123456789),(396,'Babette','Indianapolis','4723 Ronald Regan Road','Indiana',123456789),(397,'Howie','Saint Louis','06605 Blackbird Avenue','Missouri',123456789),(398,'Filia','Ann Arbor','80576 American Ash Place','Michigan',123456789),(399,'Hedda','Farmington','416 Porter Junction','Michigan',123456789),(400,'Maye','Jackson','34 Bobwhite Circle','Tennessee',123456789),(401,'Minnie','Atlanta','589 Annamark Plaza','Georgia',123456789),(402,'Hedvige','Wilmington','04555 Maple Wood Place','Delaware',123456789),(403,'Josee','New Haven','3423 Boyd Trail','Connecticut',123456789),(404,'Catharine','Jersey City','90 Spaight Point','New Jersey',123456789),(405,'Karrah','Danbury','08 Ryan Center','Connecticut',123456789),(406,'Alec','Denver','53 Stone Corner Plaza','Colorado',123456789),(407,'Jean','New York City','72123 Lien Road','New York',123456789),(408,'Delphinia','Fort Worth','79926 La Follette Point','Texas',123456789),(409,'Gertruda','Decatur','38837 Paget Way','Illinois',123456789),(410,'Bettye','New York City','18 Transport Point','New York',123456789),(411,'Dona','Elmira','48 5th Hill','New York',123456789),(412,'Danie','Memphis','852 Eliot Center','Tennessee',123456789),(413,'Ada','Tucson','5 Fieldstone Avenue','Arizona',123456789),(414,'Mandi','Mesquite','6 Bay Street','Texas',123456789),(415,'Mommy','Colorado Springs','93 Kinsman Pass','Colorado',123456789),(416,'Franny','Allentown','74085 Basil Plaza','Pennsylvania',123456789),(417,'Dorice','New Orleans','0 Burning Wood Street','Louisiana',123456789),(418,'Ingeborg','Gastonia','837 Myrtle Alley','North Carolina',123456789),(419,'Even','Tulsa','74475 Talmadge Point','Oklahoma',123456789),(420,'Amie','Joliet','79622 American Ash Junction','Illinois',123456789),(421,'Gerrie','Bakersfield','211 2nd Terrace','California',123456789),(422,'Jerrilee','Boise','794 Mallory Drive','Idaho',123456789),(423,'Regen','San Bernardino','1913 Corscot Terrace','California',123456789),(424,'Loralyn','Los Angeles','94 Longview Place','California',123456789),(425,'Arnie','Macon','5 Melody Way','Georgia',123456789),(426,'Garrek','Alexandria','6335 Magdeline Trail','Virginia',123456789),(427,'Worden','Lawrenceville','2 Corben Court','Georgia',123456789),(428,'Kristofor','Chicago','3943 Buell Pass','Illinois',123456789),(429,'Melamie','Midland','10045 Bartelt Center','Michigan',123456789),(430,'Brock','Providence','9094 Scott Way','Rhode Island',123456789),(431,'Cirilo','Montgomery','0 Sage Crossing','Alabama',123456789),(432,'Bone','New York City','9 Nelson Parkway','New York',123456789),(433,'Lianna','New York City','7 Briar Crest Pass','New York',123456789),(434,'Cori','Houston','2 Welch Way','Texas',123456789),(435,'Lowell','New York City','8790 Oriole Trail','New York',123456789),(436,'Mickie','Denver','9476 Dottie Trail','Colorado',123456789),(437,'Evania','Dallas','752 Chive Street','Texas',123456789),(438,'Ingaberg','El Paso','55 Montana Parkway','Texas',123456789),(439,'Annalise','Orlando','8 Blue Bill Park Center','Florida',123456789),(440,'Shepherd','West Palm Beach','47 Annamark Street','Florida',123456789),(441,'Dunc','Salt Lake City','63 Ridgeview Parkway','Utah',123456789),(442,'Gilberta','Shreveport','2 Blue Bill Park Road','Louisiana',123456789),(443,'Lucinda','Virginia Beach','395 Little Fleur Plaza','Virginia',123456789),(444,'Pearla','Washington','516 Kedzie Court','District of Columbia',123456789),(445,'Brodie','Miami','050 Village Terrace','Florida',123456789),(446,'Liliane','Eugene','88 Hanson Road','Oregon',123456789),(447,'Tonya','Washington','6 Northfield Pass','District of Columbia',123456789),(448,'Clerc','Naples','32835 Springview Junction','Florida',123456789),(449,'Sheryl','Silver Spring','60 Summerview Court','Maryland',123456789),(450,'Louise','Irvine','0 Hoard Center','California',123456789),(451,'Melessa','Chicago','53 Ludington Point','Illinois',123456789),(452,'Antonino','Roanoke','0188 Kipling Center','Virginia',123456789),(453,'Stanislaus','Houston','8 Bashford Lane','Texas',123456789),(454,'Garvin','Norwalk','4 North Terrace','Connecticut',123456789),(455,'Margaux','Sioux Falls','263 Crownhardt Terrace','South Dakota',123456789),(456,'Nev','Columbus','3274 Bluejay Trail','Ohio',123456789),(457,'Willetta','Topeka','18 Crowley Place','Kansas',123456789),(458,'Sharon','Tampa','8 Spaight Point','Florida',123456789),(459,'Kleon','Brooklyn','84 Norway Maple Drive','New York',123456789),(460,'Cynthia','Springfield','88357 Village Drive','Missouri',123456789),(461,'Harlene','Tacoma','202 Center Road','Washington',123456789),(462,'Avis','Naperville','3 Goodland Parkway','Illinois',123456789),(463,'Etta','Detroit','82490 Morning Pass','Michigan',123456789),(464,'Augustine','New York City','01973 Orin Hill','New York',123456789),(465,'Brunhilda','Cleveland','507 Brickson Park Alley','Ohio',123456789),(466,'Carlynn','Madison','7 Northport Place','Wisconsin',123456789),(467,'Lela','Pittsburgh','9592 Spenser Circle','Pennsylvania',123456789),(468,'Fayre','Sioux City','96 Kensington Pass','Iowa',123456789),(469,'Flore','Greeley','87 Meadow Valley Plaza','Colorado',123456789),(470,'Kit','Saint Paul','15160 4th Drive','Minnesota',123456789),(471,'Sioux','Erie','72581 Carey Avenue','Pennsylvania',123456789),(472,'Alix','Fresno','5 Anhalt Circle','California',123456789),(473,'Marnia','Louisville','4049 Delladonna Place','Kentucky',123456789),(474,'Ken','New Haven','49 Bluejay Alley','Connecticut',123456789),(475,'Noell','Danbury','7199 Fulton Terrace','Connecticut',123456789),(476,'Bayard','Danbury','99984 Welch Point','Connecticut',123456789),(477,'Leah','Miami','984 Sloan Parkway','Florida',123456789),(478,'Guilbert','San Antonio','94 Steensland Parkway','Texas',123456789),(479,'Cecelia','Knoxville','99280 Bellgrove Way','Tennessee',123456789),(480,'Benton','Falls Church','982 Hagan Road','Virginia',123456789),(481,'Scott','Oklahoma City','9 Talisman Way','Oklahoma',123456789),(482,'Zane','El Paso','20901 Graedel Crossing','Texas',123456789),(483,'Morly','El Paso','1680 Riverside Alley','Texas',123456789),(484,'Mellisa','Lincoln','55 Marcy Avenue','Nebraska',123456789),(485,'Nessi','Baltimore','0 Colorado Junction','Maryland',123456789),(486,'Lonnard','Portland','791 Southridge Way','Oregon',123456789),(487,'Shay','South Bend','40871 Old Shore Circle','Indiana',123456789),(488,'Townsend','Fort Smith','734 Clove Plaza','Arkansas',123456789),(489,'Hedda','Syracuse','55578 Northland Terrace','New York',123456789),(490,'Dilly','Lubbock','06248 4th Circle','Texas',123456789),(491,'Casie','Lexington','50244 Briar Crest Plaza','Kentucky',123456789),(492,'Caryn','Peoria','7641 Atwood Trail','Illinois',123456789),(493,'Mead','Jamaica','473 Lukken Drive','New York',123456789),(494,'Connie','Greensboro','78336 Lawn Junction','North Carolina',123456789),(495,'Carolina','Las Vegas','8710 Mitchell Circle','Nevada',123456789),(496,'Zolly','Huntington Beach','661 Artisan Drive','California',123456789),(497,'Blanca','Albany','1618 Fulton Alley','New York',123456789),(498,'Deena','Pueblo','7064 Stephen Parkway','Colorado',123456789),(499,'Reade','Albuquerque','72 Eastlawn Alley','New Mexico',123456789),(500,'Chandler','Decatur','8405 Arapahoe Park','Illinois',123456789),(501,'Hartley','Anaheim','3 Carpenter Street','California',123456789),(502,'Balduin','Minneapolis','83317 Bluestem Court','Minnesota',123456789),(503,'Michail','Naperville','382 Division Avenue','Illinois',123456789),(504,'Mandy','Port Saint Lucie','2 Dexter Park','Florida',123456789),(505,'Rowan','Charlotte','43 Walton Parkway','North Carolina',123456789),(506,'Melloney','San Jose','899 Trailsway Center','California',123456789),(507,'Rodge','Springfield','69326 Oxford Parkway','Illinois',123456789),(508,'Burt','Lawrenceville','97 Trailsway Place','Georgia',123456789),(509,'Glennis','Reading','95 Del Sol Junction','Pennsylvania',123456789),(510,'Robina','Fort Lauderdale','5 Tomscot Circle','Florida',123456789),(511,'Menard','Young America','20167 Karstens Terrace','Minnesota',123456789),(512,'Storm','San Antonio','25 Stephen Terrace','Texas',123456789),(513,'Nealson','Sioux Falls','69 Boyd Court','South Dakota',123456789),(514,'Antoni','Alexandria','9 Londonderry Lane','Virginia',123456789),(515,'Alex','Virginia Beach','55 Eastlawn Park','Virginia',123456789),(516,'Harriett','Vancouver','215 Northfield Way','Washington',123456789),(517,'Charmian','Springfield','361 Columbus Way','Massachusetts',123456789),(518,'Jackelyn','Des Moines','14358 Eggendart Alley','Iowa',123456789),(519,'Gilligan','Des Moines','31101 Mesta Place','Iowa',123456789),(520,'Blanca','Dallas','82 Hudson Avenue','Texas',123456789),(521,'Raf','Minneapolis','40 Annamark Street','Minnesota',123456789),(522,'Tamar','Richmond','32801 Kedzie Circle','Virginia',123456789),(523,'Kakalina','Dayton','84 Declaration Point','Ohio',123456789),(524,'Mattias','Tampa','08048 Sutteridge Junction','Florida',123456789);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regex_pattern`
--

DROP TABLE IF EXISTS `regex_pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regex_pattern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `pattern` varchar(100) DEFAULT NULL,
  `massage` varchar(100) DEFAULT NULL,
  `module` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regex_pattern`
--

LOCK TABLES `regex_pattern` WRITE;
/*!40000 ALTER TABLE `regex_pattern` DISABLE KEYS */;
INSERT INTO `regex_pattern` VALUES (1,'Required','(.*)','This field is required','SelectModule,CheckboxModule,RadioModule,DateModule'),(2,'Aplha numeric','^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','Only alphanumeric allow.','TextModule'),(3,'Digit Only','^[1-9]{1,}[0-9]{0,}$','Only digit allow, first character must be not Zero.','NumberModule,TextModule'),(4,'Password','(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','Password must be, 2 Letter Capital,2 special char ,and any letter and any digit','PasswordModule'),(5,'Only aplha','^[A-Za-z]{0,}$','Only alphabets allow.','TextModule'),(6,'Custom','Custom',NULL,''),(7,'Date Validation','Date Validation',NULL,'DateModule'),(9,'Cap only','[A-Z]{0,}','Cap Only',NULL),(11,'Capital only','^[A-Z]{0,}$','Enter capital latter only',NULL),(12,'Small characters','^[a-z]{1,}$','Please enter small characters...','TextModule'),(20,'Address Validation','^[A-Za-z0-9,/-]{1,}$','Please enter proper address...','TextModule'),(21,'PAN','[A-Z]{5}[0-9]{4}[A-Z]{1}','INVALID FORMAT','TextModule'),(22,'Custome Password Format','^[a-zA-Z]\\w{3,14}$','INVALID PASSWORD FORMAT','PasswordModule'),(26,'School adress validation','^[A-Z]{1,}$','Please enter only capitals','TextModule'),(27,'Float Validation','^[0-9.]{1,}$','Enter Valid Number','NumberModule'),(28,'Temp','^[0-9]$','Temp...','TextModule'),(29,'pwd','pwd','^[a-z]{0,10}','PasswordModule'),(30,'Org validation','^[a-z]$','Please provide proper validation','TextModule'),(31,'digit','^[0-9]{1,3}$','digit max length is 3','NumberModule'),(32,'reg','\\s','reg','TextModule'),(33,'fghfgh','\\s','fghfgh','TextModule'),(34,'rtyrty','\\s','rtyrty','TextModule'),(35,'/s','/s','/s','TextModule');
/*!40000 ALTER TABLE `regex_pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suniltest`
--

DROP TABLE IF EXISTS `suniltest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suniltest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `sunil` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_1_idx` (`sunil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suniltest`
--

LOCK TABLES `suniltest` WRITE;
/*!40000 ALTER TABLE `suniltest` DISABLE KEYS */;
INSERT INTO `suniltest` VALUES (2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,'Java'),(7,'Java'),(1,'Sunil'),(8,'Sunil');
/*!40000 ALTER TABLE `suniltest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_one`
--

DROP TABLE IF EXISTS `table_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_one` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `number` float(5,2) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `projectname` varchar(6) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `datetime1` datetime DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `hobby` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_one`
--

LOCK TABLES `table_one` WRITE;
/*!40000 ALTER TABLE `table_one` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_one` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_form_schema`
--

DROP TABLE IF EXISTS `tbl_form_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_form_schema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk` int(11) DEFAULT NULL,
  `field_label` varchar(45) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `size` varchar(9) DEFAULT NULL,
  `field_controller` varchar(45) DEFAULT NULL,
  `field_value` varchar(255) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `field_index` int(11) DEFAULT NULL,
  `regex` varchar(255) DEFAULT NULL,
  `start_date` varchar(45) DEFAULT NULL,
  `end_date` varchar(45) DEFAULT NULL,
  `date_format` varchar(45) DEFAULT NULL,
  `date_all` varchar(45) DEFAULT NULL,
  `date_past` varchar(45) DEFAULT NULL,
  `date_future` varchar(45) DEFAULT NULL,
  `required` varchar(4) DEFAULT NULL,
  `tooltip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_form_schema`
--

LOCK TABLES `tbl_form_schema` WRITE;
/*!40000 ALTER TABLE `tbl_form_schema` DISABLE KEYS */;
INSERT INTO `tbl_form_schema` VALUES (482,86,'Password','password','12','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(483,86,'Project name','projectname','38','checkBox','project1, project2, project3, project4','VARCHAR',7,'(.*)','','','','','','',NULL,NULL),(484,86,'Address','address','150','textarea',NULL,'VARCHAR',4,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(485,86,'Gender','gender','6','radio','Male, Female, Other','VARCHAR',5,'(.*)','','','','','','',NULL,NULL),(486,86,'Dept Name','dept_name','15','textbox',NULL,'VARCHAR',2,'[A-Z]{0,}','','','','','','',NULL,NULL),(487,86,'Number','number1','8','number',NULL,'INT',9,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(488,86,'Date Time','datetime1','0','date',NULL,'DATETIME',8,'Date Validation','2018-01-11 16:56','2018-01-12 16:56','H:i Y/m/d','false','true','false',NULL,NULL),(489,86,'Alert','alert box...','0','alert','Save, Cancel','Custom',10,'No validation','','','','','','',NULL,NULL),(490,86,'Dept Id','dept_id','5','textbox',NULL,'INT',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(491,86,'Date1','date1','0','date',NULL,'DATE',6,'Date Validation','2017-12-13 16:55','2017-12-15 16:55','H:i d.m.Y','false','false','true',NULL,NULL),(492,86,'Hyperlink','https://www.google.co.in/','0','hyperlink',NULL,'Link',11,'No validation','','','','','','',NULL,NULL),(749,157,'Password','password','12','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(750,157,'Code','code','5','textbox',NULL,'INT',2,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(751,157,'Address','address','250','textarea',NULL,'VARCHAR',4,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(752,157,'Gender','gender','6','radio','Male,Female','VARCHAR',5,'(.*)','','','','','','',NULL,NULL),(753,157,'Name','name','15','textbox',NULL,'VARCHAR',1,'^[A-Za-z]{0,}$','','','','','','',NULL,NULL),(805,164,'Marrital Status','emp_mar_status','8','comboBox','Single, Married, Divorcee, Widow','VARCHAR',5,'(.*)','','','','','','',NULL,NULL),(806,164,'Hobbby','emp_hobby','23','checkBox','Reading, Music, Cricket','VARCHAR',4,'(.*)','','','','','','',NULL,NULL),(807,164,'Company website','http://www.silvertouch.com/','0','hyperlink',NULL,'Link',9,'No validation','','','','','','',NULL,NULL),(808,164,'Experience','emp_exp','2','number',NULL,'INT',7,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(809,164,'Password','emp_pwd','15','password',NULL,'VARCHAR',10,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(810,164,'Name','emp_nm','50','textbox',NULL,'VARCHAR',1,'^[A-Za-z]{0,}$','','','','','','',NULL,NULL),(811,164,'Employment Type','emp_type','11','radio','On Payroll, On Contract','VARCHAR',3,'(.*)','','','','','','',NULL,NULL),(812,164,'Birthdate','emp_dob','0','date',NULL,'DATE',6,'Date Validation','','','d.m.Y H:i','false','true','false',NULL,NULL),(813,164,'Age Message','your age must be above 18.','0','alert','20, 25, 30','Custom',8,'No validation','','','','','','',NULL,NULL),(814,164,'Address','emp_addr','100','textarea',NULL,'VARCHAR',2,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(815,164,'info','info','7','checkBox','a,b,c,d','CHAR',11,'(.*)','','','','','','',NULL,NULL),(820,163,'Emp Code','emp_code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(821,163,'Emp Name','emp_name','15','textbox',NULL,'VARCHAR',2,'^[A-Za-z]{0,}$','','','','','','',NULL,NULL),(826,166,'Table Name','tbname','150','textarea',NULL,'VARCHAR',2,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(827,166,'Table Id','tbid','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(839,167,'Hyperlink','https://www.google.com','00','hyperlink',NULL,'Link',12,'No validation','','','','','','',NULL,NULL),(840,167,'Number','number','5,2','number',NULL,'FLOAT',11,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(841,167,'Password','password','10','password',NULL,'VARCHAR',2,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(842,167,'Project name','projectname','6','comboBox','HSIIDC, CRM','VARCHAR',7,'(.*)','','','','','','',NULL,NULL),(843,167,'Code','code','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(844,167,'Address','address','150','textarea',NULL,'VARCHAR',4,'(.*)','','','','','','',NULL,NULL),(845,167,'Gender','gender','6','radio','Male, Female','VARCHAR',3,'(.*)','','','','','','',NULL,NULL),(846,167,'Date Time','datetime1','0','date',NULL,'DATETIME',9,'Date Validation','2017-12-13 12:25','2017-12-28 12:25','H:i Y/m/d','false','true','false',NULL,NULL),(847,167,'Name','hello world','0','alert','Ok,Cancel','Custom',10,'No validation','','','','','','',NULL,NULL),(848,167,'Date','date1','0','date',NULL,'DATE',8,'Date Validation','2018-01-09 12:24','2018-01-20 12:24','d.m.Y H:i','false','false','true',NULL,NULL),(849,167,'Hobby','hobby','15','checkBox','Cricket, Hockey','CHAR',5,'(.*)','','','','','','',NULL,NULL),(850,168,'code','code','10','textbox',NULL,'VARCHAR',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(851,168,'pwd','pwd','8','password',NULL,'VARCHAR',2,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(872,176,'address','address','50','textbox',NULL,'VARCHAR',6,'(.*)','','','','','','',NULL,NULL),(873,176,'gender','gender','6','radio','Male,Female,Other','VARCHAR',5,'(.*)','','','','','','',NULL,NULL),(874,176,'city','city','9','comboBox','ahmedabad,baroda,mumbai,surat','VARCHAR',7,'(.*)','','','','','','',NULL,NULL),(875,176,'dob','dob','0','date',NULL,'DATE',9,'Date Validation','2017-12-12 18:18','2017-12-21 18:18','','false','true','false',NULL,NULL),(876,176,'alertbox','alertbox','0','alert','Yes,No','Custom',10,'No validation','','','','','','',NULL,NULL),(877,176,'Name','name','12','textbox',NULL,'VARCHAR',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','2017-12-12 18:17','2017-12-14 18:17','d.m.Y H:i','false','false','false',NULL,NULL),(878,176,'Department ID','deptid','5','textbox',NULL,'INT',3,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(879,176,'department','dept','8','checkBox','IT,HR,BA','VARCHAR',4,'(.*)','','','','','','',NULL,NULL),(880,176,'Department Project','deptproject','20','textbox',NULL,'VARCHAR',2,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(881,176,'password','pwd','20','password',NULL,'VARCHAR',12,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','',NULL,NULL),(882,176,'AGE','age','2','number',NULL,'INT',8,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(883,176,'Link','https://www.google.co.in/','0','hyperlink',NULL,'Link',11,'No validation','','','','','','',NULL,NULL),(888,166,'Table Name','tbname','150','textarea',NULL,'VARCHAR',2,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(889,166,'Table Id','tbid','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','',NULL,NULL),(959,181,'code','code','5','textbox',NULL,'VARCHAR',12,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes',NULL),(973,180,'Sunil','sunil','5','radio','Sunil,Java','VARCHAR',1,'','','','','','','','no',NULL),(997,160,'code','code','5','textbox',NULL,'VARCHAR',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','',NULL,NULL),(998,160,'gender','gender','6','radio','male,female','VARCHAR',2,'(.*)','','','','','','',NULL,NULL),(999,160,'project','projcet','18','checkBox','HSIDC,Alfresco,CRM','VARCHAR',3,'(.*)','','','','','','',NULL,NULL),(1000,160,'dob','dob','0','date',NULL,'DATE',4,'Date Validation','','','','false','true','false',NULL,NULL),(1009,210,'Date','dt','0','date',NULL,'DATE',7,'','2018-01-10 12:15','2018-01-22 12:15','H:i d.m.Y','false','false','false','no',NULL),(1010,210,'Password','password','10','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','no',NULL),(1011,210,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','no',NULL),(1012,210,'Gender','gender','6','radio','Male,Female','VARCHAR',4,'','','','','','','','no',NULL),(1013,210,'Number','num','5,2','number',NULL,'FLOAT',8,'^[0-9.]{1,}$','','','','','','','yes',NULL),(1014,210,'Name','name','15','textbox',NULL,'VARCHAR',2,'^[A-Za-z]{0,}$','','','','','','','no',NULL),(1015,210,'Project','project','10','checkBox','HSIIDC,FGU','VARCHAR',5,'','','','','','','','no',NULL),(1016,210,'Department','dept','7','comboBox','JAVA,DOT NET,PHP','VARCHAR',6,'','','','','','','','no',NULL),(1035,211,'INt','intnujm','3','number',NULL,'INT',5,'^[0-9]{1,3}$','','','','','','','yes','Enter number.'),(1036,211,'Link','hyperlink7','0','hyperlink','https://www.google.com','Link',7,'No validation','','','','','','','','LInk.'),(1037,211,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','enter code'),(1038,211,'Float','floatnum','5,2','number',NULL,'FLOAT',4,'^[0-9.]{1,}$','','','','','','','yes','Enter float value'),(1039,211,'Alert','alert...','0','alert','OK,cancel','Custom',6,'No validation','','','','','','','','Alert.'),(1040,211,'Datetime','datetime1','0','date',NULL,'DATETIME',3,'','','','','false','false','true','yes','Select date'),(1041,211,'Date','date1','0','date',NULL,'DATE',2,'','','','','false','true','false','yes','select date.'),(1096,218,'oktextArea','oktextarea','100','textarea',NULL,'VARCHAR',3,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','no','Text Area'),(1097,218,'okRadio','okradio','6','radio','ok,cancel','VARCHAR',4,'','','','','','','','yes','Radio'),(1098,218,'okCheck','okcheckbox','10','checkBox','ok,payment','VARCHAR',5,'','','','','','','','no','Checkbox'),(1099,218,'okid','okid','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','Number'),(1100,218,'okSelectt','okselect','4','comboBox','ok,pass','VARCHAR',6,'','','','','','','','no','Select'),(1101,218,'Link','hyperlink10','0','hyperlink','Hyper link','Link',10,'No validation','','','','','','','','HyperLink'),(1102,218,'okdatetimetable','oktt','0','date',NULL,'DATETIME',7,'','','','','false','false','true','yes','Future Validation'),(1103,218,'okmobile','okmobile','10','number',NULL,'DOUBLE',8,'^[0-9.]{1,}$','','','','','','','no','Mobile'),(1104,218,'Popup','opoup','0','alert','Ok,Cancel','Custom',9,'No validation','','','','','','','','Custom Popup'),(1105,218,'okpass','okpass','10','password',NULL,'VARCHAR',2,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','yes','Password'),(1106,217,'oktextArea','oktextarea','100','textarea',NULL,'VARCHAR',3,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','no','Text Area'),(1107,217,'okRadio','okradio','6','radio','ok,cancel','VARCHAR',4,'','','','','','','','yes','Radio'),(1108,217,'okCheck','okcheckbox','10','checkBox','ok,payment','VARCHAR',5,'','','','','','','','no','Checkbox'),(1109,217,'okid','okid','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','Number'),(1110,217,'okSelectt','okselect','4','comboBox','ok,pass','VARCHAR',6,'','','','','','','','no','Select'),(1111,217,'Link','hyperlink10','0','hyperlink','Hyper link','Link',10,'No validation','','','','','','','','HyperLink'),(1112,217,'okdatetimetable','oktt','0','date',NULL,'DATETIME',7,'','','','','false','false','true','yes','Future Validation'),(1113,217,'okmobile','okmobile','10','number',NULL,'DOUBLE',8,'^[0-9.]{1,}$','','','','','','','no','Mobile'),(1114,217,'Popup','opoup','0','alert','Ok,Cancel','Custom',9,'No validation','','','','','','','','Custom Popup'),(1115,217,'okpass','okpass','10','password',NULL,'VARCHAR',2,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','no','Password'),(1116,218,'oktextarea','oktextarea','100','textarea',NULL,'VARCHAR',3,'^[A-Za-z0-9,/-]{1,}$','','','','','','','yes','Text Area'),(1117,218,'okradio','okradio','3','radio','1.5,2.5','FLOAT',4,'','','','','','','','no','radio '),(1118,218,'okselect','okseklect','1','comboBox','1,2,3,4,8','INT',5,'','','','','','','','yes','Select'),(1119,218,'oksala','oksalalrty','10','number',NULL,'DOUBLE',7,'^[0-9.]{1,}$','','','','','','','yes','Number Float validation'),(1120,218,'okid','okid','10','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','Textbox'),(1121,218,'okdatetime','okdafe','0','date',NULL,'DATETIME',6,'','','','','false','false','true','yes','DateTime'),(1122,218,'okcheckbox','okcheckboc','5','checkBox','ch,ch','VARCHAR',4,'','','','','','','','yes','CheckBox'),(1123,218,'Hi','ok popup','0','alert','ok,cancal','Custom',8,'No validation','','','','','','','','popup'),(1124,218,'okpass','okpass','10','password',NULL,'VARCHAR',2,'pwd','','','','','','','yes','PassWord'),(1125,216,'test','test','10,2','number',NULL,'DOUBLE',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','test'),(1131,219,'fgh','fghfgh','6','textbox',NULL,'VARCHAR',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','fghfgh'),(1132,213,'code','code','10','textbox',NULL,'VARCHAR',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes','Enter Code'),(1133,213,'num','num','4','textbox',NULL,'INT',2,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','Enter Number.'),(1134,220,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1135,220,'date','date1','0','date',NULL,'DATE',2,'','','','','false','false','true','yes','date'),(1140,221,'code','code','5','number',NULL,'DOUBLE',1,'^[0-9.]{1,}$','','','','','','','yes','code'),(1141,221,'Gender','gender','6','radio','male,female','VARCHAR',2,'','','','','','','','yes','gender'),(1157,226,'password','password','10','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','yes','psw'),(1158,226,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1159,226,'Gender','gender','6','radio','male,female','VARCHAR',4,'','','','','','','','yes','gender'),(1160,226,'demoField','demofield','5','textbox',NULL,'VARCHAR',2,'^[A-Za-z]{0,}$','','','','','','','yes','demoField'),(1161,226,'number','num1','5','number',NULL,'INT',8,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','num'),(1162,226,'check','box','7','checkBox','onw,two','CHAR',5,'','','','','','','','yes','check box'),(1163,226,'select','combobox','3','comboBox','one,two','VARCHAR',6,'','','','','','','','yes','combobox'),(1184,227,'password','password','10','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','no','psw'),(1185,227,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1186,227,'Gender','gender','6','radio','male,female','VARCHAR',4,'','','','','','','','yes','gender'),(1187,227,'demoField','demofield','5','textbox',NULL,'VARCHAR',2,'^[A-Za-z]{0,}$','','','','','','','yes','demoField'),(1188,227,'number','num1','5','number',NULL,'INT',8,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','num'),(1189,227,'check','box','7','checkBox','onw,two','CHAR',5,'','','','','','','','yes','check box'),(1190,227,'select','combobox','3','comboBox','one,two','VARCHAR',6,'','','','','','','','no','combobox'),(1218,179,'code','code','10','textbox',NULL,'VARCHAR',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','null','code'),(1219,179,'check in','checkin','0','date',NULL,'DATETIME',12,'Date Validation','2018-01-01 17:08','2018-01-31 17:08','H:i d.m.Y','false','false','false','null','dfd'),(1220,179,'Gender','gender','6','radio','male,female','VARCHAR',3,'(.*)','','','','','','','null','kgh'),(1221,179,'dob','dob','0','date',NULL,'DATE',11,'Date Validation','','','d.m.Y H:i','false','true','false','null','jhjgh'),(1222,179,'pwd','pwd','20','password',NULL,'VARCHAR',2,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','null','Please Enter'),(1223,179,'address','adr','40','textarea',NULL,'VARCHAR',4,'^[A-Za-z0-9,/-]{1,}$','','','','','','','null','gh'),(1236,232,'datetime','datetime1','0','date',NULL,'DATETIME',2,'','2018-02-05 17:41','2018-02-24 17:41','','false','false','false','yes','datetime'),(1237,232,'date','date1','0','date',NULL,'DATE',1,'','2018-02-06 17:41','2018-02-15 17:41','','false','false','false','yes','date'),(1252,229,'dfd1','gfg','15','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','int'),(1257,233,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1258,233,'File','file','150','file',NULL,'FILE',2,'single','','','','','','','yes','file'),(1263,234,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1264,234,'File','filename','150','file',NULL,'FILE',2,'single','','','','','','','yes','file'),(1267,236,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1268,236,'File','file','150','file',NULL,'VARCHAR',2,'single','','','','','','','yes','file'),(1271,128,'data','dt1','3','comboBox','1.2,2.1,3.2,4.2,5.2','FLOAT',12,'No validation','','','','','','','yes','null'),(1272,128,'Password','password','12','password',NULL,'VARCHAR',3,'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=//S+$).{8,}','','','','','','','yes','null'),(1273,128,'Project name','projectname','49','checkBox','projectone, projecttwo, projectthree, projectfour','VARCHAR',7,'','','','','','','','yes','null'),(1274,128,'Alert','alert_box...','0','alert','Save, Cancel','Custom',10,'No validation','','','','','','','null','null'),(1275,128,'Address','address','150','textarea',NULL,'VARCHAR',4,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes','null'),(1276,128,'Gender','gender','6','radio','Male, Female, Other','VARCHAR',5,'','','','','','','','yes','null'),(1277,128,'link','hyperlink10','0','hyperlink','https://www.google.com','Link',11,'No validation','','','','','','','','link.'),(1278,128,'Dept Name','dept_name','15','textbox',NULL,'VARCHAR',2,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes','null'),(1279,128,'Number','number1','8','number',NULL,'INT',9,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','null'),(1280,128,'Date1','date1','0','date',NULL,'DATE',6,'Date Validation','2017-12-13 16:55','2017-12-15 16:55','Y-m-d H:i','false','false','false','yes','null'),(1281,237,'code','emp_code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','emp code'),(1282,237,'address','address','250','textarea',NULL,'VARCHAR',2,'^[A-Za-z0-9,/-]{1,}$','','','','','','','yes','emp address'),(1293,240,'dt','dt','0','date',NULL,'DATETIME',3,'','','','','false','false','true','yes','date and time'),(1294,240,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1295,240,'date of birth','dob','0','date',NULL,'DATE',4,'','','','','false','true','false','yes','Date of birth'),(1296,240,'name','name','15','textbox',NULL,'VARCHAR',1,'^[A-Za-z]{0,}$','','','','','','','yes','name'),(1297,239,'CODE','code','10','textbox',NULL,'INT',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes','Test'),(1298,239,'INput File','file','1000','file',NULL,'VARCHAR',2,'single','','','','','','','yes','file test'),(1299,241,'Radio','gender','6','radio','Male, Female','VARCHAR',1,'','','','','','','','yes','select'),(1300,241,'code','test','10','textbox',NULL,'INT',2,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','qas'),(1301,241,'Hobbies','hob','22','checkBox','Cricket, swim, Reading','VARCHAR',3,'','','','','','','','yes','Select '),(1302,241,'HI','hello','0','alert','OK, Cancel','Custom',4,'No validation','','','','','','','','Test'),(1303,231,'datetime','datetime1','0','date',NULL,'DATETIME',2,'','2018-02-05 17:41','2018-02-24 17:41','','false','false','false','yes','datetime'),(1304,231,'date','date1','0','date',NULL,'DATE',1,'','2018-02-06 17:41','2018-02-15 17:41','','false','false','false','yes','date'),(1307,238,'emp code','emp_code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','emp code'),(1308,238,'File name','file','250','file',NULL,'VARCHAR',2,'single','','','','','','','yes','file name'),(1309,228,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1310,228,'Gender','gender','6','radio','male,female','VARCHAR',2,'','','','','','','','yes','gender'),(1331,242,'code','code','5','textbox',NULL,'INT',1,'^[A-Za-z0-9]{1}[A-Za-z0-9//s]{0,}$','','','','','','','yes','code'),(1332,242,'name','name','15','textbox',NULL,'VARCHAR',2,'^[A-Za-z]{0,}$','','','','','','','yes','name'),(1341,243,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1342,243,'Aadhar','aadhar','1000','file','Image','VARCHAR',2,'multiple','','','','','','','yes','aadhar'),(1343,243,'Pan','pan','1000','file','pdf','VARCHAR',3,'single','','','','','','','yes','Pan'),(1349,245,'code','code','11','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code i.e 101'),(1350,245,'pan','pan','2048','file','Image','VARCHAR',2,'single','','','','','','','no','pan'),(1351,245,'uuid','uuid','2048','file','Pdf','VARCHAR',3,'multiple','','','','','','','yes','uuid'),(1352,244,'all files','all_files','1024','file','Image','VARCHAR',5,'multiple','','','','','','','yes','images'),(1353,244,'documents','documents','1024','file','xlsx,xls','VARCHAR',4,'multiple','','','','','','','yes','docs'),(1354,244,'Name','name','45','textbox',NULL,'VARCHAR',1,'^[A-Za-z]{0,}$','','','','','','','yes','Name'),(1355,244,'uuid','aadhar','1024','file','doc,docx','VARCHAR',2,'single','','','','','','','yes','aadhar'),(1356,244,'pan','pan','1024','file','pdf','VARCHAR',3,'single','','','','','','','yes','pan'),(1357,246,'code','code','5','textbox',NULL,'INT',1,'^[1-9]{1,}[0-9]{0,}$','','','','','','','yes','code'),(1358,246,'file2','file2','1000','file','Office','VARCHAR',3,'multiple','','','','','','','no','office files'),(1359,246,'file3','file3','1000','file','xls,xlsx','VARCHAR',4,'multiple','','','','','','','no','pdf files'),(1360,246,'file1','file1','1000','file','jpg,jpeg','VARCHAR',2,'multiple','','','','','','','no','jpg files');
/*!40000 ALTER TABLE `tbl_form_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloprxyz`
--

DROP TABLE IF EXISTS `tbloprxyz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloprxyz` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tbname` varchar(150) DEFAULT NULL,
  `tbid` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloprxyz`
--

LOCK TABLES `tbloprxyz` WRITE;
/*!40000 ALTER TABLE `tbloprxyz` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbloprxyz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `intnujm` int(3) DEFAULT NULL,
  `floatnum` float(5,2) DEFAULT NULL,
  `datetime1` datetime DEFAULT NULL,
  `date1` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES (1,123,NULL,NULL,NULL,NULL),(2,132,153,0.05,'2018-01-30 12:58:00','2018-01-03'),(3,195,651,152.32,'2018-01-31 15:01:00','2018-01-27');
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp1`
--

DROP TABLE IF EXISTS `temp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp1`
--

LOCK TABLES `temp1` WRITE;
/*!40000 ALTER TABLE `temp1` DISABLE KEYS */;
INSERT INTO `temp1` VALUES (1,123,'female'),(2,2,'female'),(4,1,'female'),(5,3,'female'),(6,4,'female'),(7,5,'male'),(8,6,'female'),(9,7,'male'),(10,8,'male'),(11,9,'female'),(12,10,'male'),(14,1,'female'),(15,102,'male'),(16,2,'male'),(17,3,'male');
/*!40000 ALTER TABLE `temp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_emp`
--

DROP TABLE IF EXISTS `temp_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_emp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(9) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_emp`
--

LOCK TABLES `temp_emp` WRITE;
/*!40000 ALTER TABLE `temp_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_emp1`
--

DROP TABLE IF EXISTS `temp_emp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_emp1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(9) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_emp1`
--

LOCK TABLES `temp_emp1` WRITE;
/*!40000 ALTER TABLE `temp_emp1` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_emp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_emp2`
--

DROP TABLE IF EXISTS `temp_emp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_emp2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(9) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_emp2`
--

LOCK TABLES `temp_emp2` WRITE;
/*!40000 ALTER TABLE `temp_emp2` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_emp2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tes`
--

DROP TABLE IF EXISTS `tes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `test` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tes`
--

LOCK TABLES `tes` WRITE;
/*!40000 ALTER TABLE `tes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test111`
--

DROP TABLE IF EXISTS `test111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test111` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) DEFAULT NULL,
  `test` int(10) DEFAULT NULL,
  `hob` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test111`
--

LOCK TABLES `test111` WRITE;
/*!40000 ALTER TABLE `test111` DISABLE KEYS */;
INSERT INTO `test111` VALUES (1,'Male',10,'Cricket,Reading'),(3,'Male',1,'Cricket,Reading');
/*!40000 ALTER TABLE `test111` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcontext`
--

DROP TABLE IF EXISTS `testcontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcontext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcontext`
--

LOCK TABLES `testcontext` WRITE;
/*!40000 ALTER TABLE `testcontext` DISABLE KEYS */;
INSERT INTO `testcontext` VALUES (1,'dfgdf');
/*!40000 ALTER TABLE `testcontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdouble`
--

DROP TABLE IF EXISTS `testdouble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdouble` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `test` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdouble`
--

LOCK TABLES `testdouble` WRITE;
/*!40000 ALTER TABLE `testdouble` DISABLE KEYS */;
INSERT INTO `testdouble` VALUES (1,1.00);
/*!40000 ALTER TABLE `testdouble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testoktable2`
--

DROP TABLE IF EXISTS `testoktable2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testoktable2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `oktextarea` varchar(100) DEFAULT NULL,
  `okradio` float DEFAULT NULL,
  `okseklect` int(1) DEFAULT NULL,
  `oksalalrty` double DEFAULT NULL,
  `okid` int(10) DEFAULT NULL,
  `okdafe` datetime DEFAULT NULL,
  `okcheckboc` varchar(5) DEFAULT NULL,
  `okpass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testoktable2`
--

LOCK TABLES `testoktable2` WRITE;
/*!40000 ALTER TABLE `testoktable2` DISABLE KEYS */;
/*!40000 ALTER TABLE `testoktable2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tets_file`
--

DROP TABLE IF EXISTS `tets_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tets_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `pan` varchar(2048) DEFAULT NULL,
  `uuid` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tets_file`
--

LOCK TABLES `tets_file` WRITE;
/*!40000 ALTER TABLE `tets_file` DISABLE KEYS */;
INSERT INTO `tets_file` VALUES (1,101,'95','96|97|98');
/*!40000 ALTER TABLE `tets_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textbox`
--

DROP TABLE IF EXISTS `textbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textbox` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `jhg` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textbox`
--

LOCK TABLES `textbox` WRITE;
/*!40000 ALTER TABLE `textbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `textbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user1`
--

DROP TABLE IF EXISTS `user1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user1` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user1`
--

LOCK TABLES `user1` WRITE;
/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_tracker`
--

DROP TABLE IF EXISTS `user_activity_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity_tracker` (
  `activity_id` bigint(20) NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_tracker`
--

LOCK TABLES `user_activity_tracker` WRITE;
/*!40000 ALTER TABLE `user_activity_tracker` DISABLE KEYS */;
INSERT INTO `user_activity_tracker` VALUES (1,'INSERT','2018-02-19 13:11:54'),(2,'UPDATE','2018-02-19 13:11:54'),(3,'INSERT','2018-02-19 13:12:01'),(4,'UPDATE','2018-02-19 13:12:01'),(109,'INSERT','2018-02-20 16:43:32'),(110,'UPDATE','2018-02-20 16:43:32'),(111,'INSERT','2018-02-20 16:43:50'),(112,'UPDATE','2018-02-20 16:43:50'),(113,'INSERT','2018-02-20 16:48:34'),(114,'INSERT','2018-02-20 16:48:34'),(115,'UPDATE','2018-02-20 16:48:34'),(116,'UPDATE','2018-02-20 16:48:34'),(117,'INSERT','2018-02-20 16:52:59'),(118,'UPDATE','2018-02-20 16:52:59'),(119,'INSERT','2018-02-20 17:14:23'),(120,'UPDATE','2018-02-20 17:14:24'),(121,'INSERT','2018-02-20 17:15:03'),(122,'UPDATE','2018-02-20 17:15:03'),(123,'INSERT','2018-02-20 17:29:02'),(124,'UPDATE','2018-02-20 17:29:02'),(125,'INSERT','2018-02-20 17:30:25'),(126,'UPDATE','2018-02-20 17:30:25'),(127,'INSERT','2018-02-20 17:30:57'),(128,'UPDATE','2018-02-20 17:30:57'),(129,'INSERT','2018-02-20 17:31:24'),(130,'UPDATE','2018-02-20 17:31:24'),(131,'INSERT','2018-02-21 10:24:13'),(132,'UPDATE','2018-02-21 10:24:13');
/*!40000 ALTER TABLE `user_activity_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `auditlog_view`
--

/*!50001 DROP VIEW IF EXISTS `auditlog_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `auditlog_view` AS select `auditlog`.`AUDIT_LOG_ID` AS `AUDIT_LOG_ID`,`auditlog`.`ACTIONs` AS `ACTIONs`,`auditlog`.`CREATED_DATE` AS `CREATED_DATE`,`auditlog`.`DETAIL` AS `DETAIL`,`auditlog`.`ENTITY_ID` AS `ENTITY_ID`,`auditlog`.`ENTITY_NAME` AS `ENTITY_NAME`,`auditlog`.`IP_ADDRESS` AS `IP_ADDRESS`,`auditlog`.`MAC_ADDRESS` AS `MAC_ADDRESS` from `auditlog` union select `auditlog_formgeneration`.`AUDIT_LOG_ID` AS `AUDIT_LOG_ID`,`auditlog_formgeneration`.`ACTIONs` AS `ACTIONs`,`auditlog_formgeneration`.`CREATED_DATE` AS `CREATED_DATE`,`auditlog_formgeneration`.`DETAIL` AS `DETAIL`,`auditlog_formgeneration`.`ENTITY_ID` AS `ENTITY_ID`,`auditlog_formgeneration`.`ENTITY_NAME` AS `ENTITY_NAME`,`auditlog_formgeneration`.`IP_ADDRESS` AS `IP_ADDRESS`,`auditlog_formgeneration`.`MAC_ADDRESS` AS `MAC_ADDRESS` from `auditlog_formgeneration` */;
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

-- Dump completed on 2018-03-29 16:52:10
