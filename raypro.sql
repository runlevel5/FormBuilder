-- MySQL dump 10.11
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.0.85-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alignments`
--

DROP TABLE IF EXISTS `alignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alignments` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `value` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alignments`
--

LOCK TABLES `alignments` WRITE;
/*!40000 ALTER TABLE `alignments` DISABLE KEYS */;
INSERT INTO `alignments` VALUES (1,'Center','center'),(2,'Left','left'),(3,'Right','right');
/*!40000 ALTER TABLE `alignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `value` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'red','red'),(2,'blue','blue'),(3,'green','green'),(4,'black','black'),(5,'yellow','yellow');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fonts`
--

DROP TABLE IF EXISTS `fonts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonts`
--

LOCK TABLES `fonts` WRITE;
/*!40000 ALTER TABLE `fonts` DISABLE KEYS */;
INSERT INTO `fonts` VALUES (1,'AvantGarde-Book'),(2,'AvantGarde-BookOblique'),(3,'AvantGarde-Demi'),(4,'AvantGarde-DemiOblique'),(5,'Bookman-Demi'),(6,'Bookman-DemiItalic'),(7,'Bookman-Light'),(8,'Bookman-LightItalic'),(9,'Courier'),(10,'Courier-Bold'),(11,'Courier-BoldOblique'),(12,'Courier-Oblique'),(13,'Helvetica'),(14,'Helvetica-Bold'),(15,'Helvetica-BoldOblique'),(16,'Helvetica-Narrow'),(17,'Helvetica-Narrow-Bold');
/*!40000 ALTER TABLE `fonts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papersizes`
--

DROP TABLE IF EXISTS `papersizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papersizes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `inch_x` float default NULL,
  `inch_y` float default NULL,
  `mm_x` int(11) default NULL,
  `mm_y` int(11) default NULL,
  `point_x` int(11) default NULL,
  `point_y` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papersizes`
--

LOCK TABLES `papersizes` WRITE;
/*!40000 ALTER TABLE `papersizes` DISABLE KEYS */;
INSERT INTO `papersizes` VALUES (1,'11x17',11,17,279,432,792,1224),(2,'ledger',17,11,432,279,1224,792),(3,'legal',8.5,14,216,356,612,1008),(4,'letter',8.5,11,216,279,612,792),(5,'lettersmall',8.5,11,216,279,612,792),(6,'archE',36,48,914,1219,2592,3456),(7,'archD',24,36,610,914,1728,2592),(8,'archC',18,24,457,610,1296,1728),(9,'archB',12,18,305,457,864,1296),(10,'archA',9,12,229,305,648,864),(11,'a0',33.1,46.8,841,1189,2384,3370),(12,'a1',23.4,33.1,594,841,1684,2384),(13,'a2',16.5,23.4,420,594,1191,1684),(14,'a3',11.7,16.5,297,420,842,1191),(15,'a4',8.3,11.7,210,297,595,842),(16,'a4small',8.3,11.7,210,297,595,842),(17,'a5',5.8,8.3,148,210,420,595),(18,'a6',4.1,5.8,105,148,297,420),(19,'a7',2.9,4.1,74,105,210,297),(20,'a8',2.1,2.9,52,74,148,210),(21,'a9',1.5,2.1,37,52,105,148),(22,'a10',1,1.5,26,37,73,105),(23,'isob0',39.4,55.7,1000,1414,2835,4008),(24,'isob1',27.8,39.4,707,1000,2004,2835),(25,'isob2',19.7,27.8,500,707,1417,2004),(26,'isob3',13.9,19.7,353,500,1001,1417),(27,'isob4',9.8,13.9,250,353,709,1001),(28,'isob5',6.9,9.8,176,250,499,709),(29,'isob6',4.9,6.9,125,176,354,499),(30,'c0',36.1,51.1,917,1297,2599,3677),(31,'c1',25.5,36.1,648,917,1837,2599),(32,'c2',18,25.5,458,648,1298,1837),(33,'c3',12.8,18,324,458,918,1298),(34,'c4',9,12.8,229,324,649,918),(35,'c5',6.4,9,162,229,459,649),(36,'c6',4.5,6.4,114,162,323,459);
/*!40000 ALTER TABLE `papersizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `author` varchar(255) default 'Anonymous',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'swimming is good','test','2011-06-10 00:37:50','2011-06-10 00:37:50','Anonymous');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rows`
--

DROP TABLE IF EXISTS `rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rows` (
  `id` int(11) NOT NULL auto_increment,
  `value` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rows`
--

LOCK TABLES `rows` WRITE;
/*!40000 ALTER TABLE `rows` DISABLE KEYS */;
INSERT INTO `rows` VALUES (1,5),(2,8),(3,10),(4,12),(5,16),(6,18),(7,20),(8,2);
/*!40000 ALTER TABLE `rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110610001950'),('20110610004321');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sizes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'6'),(2,'8'),(3,'10'),(4,'12'),(5,'14'),(6,'16'),(7,'18'),(8,'20'),(10,'22'),(11,'24'),(12,'26'),(13,'28'),(14,'30'),(15,'32'),(16,'34');
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_assets`
--

DROP TABLE IF EXISTS `template_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_assets` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `content` text,
  `asset_type_id` int(11) default NULL,
  `column` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_assets`
--

LOCK TABLES `template_assets` WRITE;
/*!40000 ALTER TABLE `template_assets` DISABLE KEYS */;
INSERT INTO `template_assets` VALUES (1,'RTO Name','JOBREADY',1,NULL),(2,'Student Name','Raymond Mo',1,NULL),(3,'Certificate Name','Certificate III Of Computer Engineering',1,NULL),(4,'End Date','value = Time.now',2,NULL),(5,'Certificate No.','123456',1,NULL),(6,'Student Units','values = [\r\n[\"BSB1\",\"Develop treatment plans\", \"Competent\"],\r\n[\"BSB2\",\"Use electric file equipment for nails\", \"Competent\"],\r\n[\"BSB3\",\"Design and apply make-up for photography\", \"Competent\"],\r\n[\"BSB4\",\"Provide manicure and pedicare services\", \"Competent\"],\r\n[\"BSB5\",\"Apply temporary hair colour and remove residual colour products\", \"Competent\"],\r\n[\"BSB6\",\"Design and apply long hair design finishes\", \"Competent\"],\r\n[\"BSB7\",\"Design and apply make-up for photography\", \"Competent\"],\r\n[\"BSB8\",\"Facilitate continuous improvement\", \"Competent\"],\r\n[\"BSB9\",\"Apply safe working practices\", \"Competent\"],\r\n[\"BSB10\",\"Apply knowledge of nail science to nail services\", \"Competent\"]\r\n]',3,3),(7,'1 + 1 = ?','value = 1 + 1',2,NULL);
/*!40000 ALTER TABLE `template_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_fields`
--

DROP TABLE IF EXISTS `template_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_fields` (
  `id` int(11) NOT NULL auto_increment,
  `template_page_id` int(11) NOT NULL,
  `template_asset_id` int(11) NOT NULL,
  `pos_x` int(11) default NULL,
  `pos_y` int(11) default NULL,
  `eps_x` int(11) default NULL,
  `eps_y` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `font` varchar(100) default NULL,
  `color` varchar(45) default NULL,
  `size` varchar(45) default NULL,
  `grid` varchar(100) default NULL,
  `num_rows` int(11) default NULL,
  `borders` int(11) default NULL,
  `align` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `template_page_id` (`template_page_id`),
  KEY `template_asset_id` (`template_asset_id`),
  CONSTRAINT `template_fields_ibfk_1` FOREIGN KEY (`template_page_id`) REFERENCES `template_pages` (`id`),
  CONSTRAINT `template_fields_ibfk_2` FOREIGN KEY (`template_asset_id`) REFERENCES `template_assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_fields`
--

LOCK TABLES `template_fields` WRITE;
/*!40000 ALTER TABLE `template_fields` DISABLE KEYS */;
INSERT INTO `template_fields` VALUES (1016,64,1,226,139,190,470,126,13,'','','','',NULL,NULL,''),(1099,69,1,243,91,145,780,148,48,'','','','',NULL,NULL,''),(1100,69,6,103,206,61,711,472,18,'Helvetica','blue','8','0,13,90',5,NULL,'left'),(1148,79,1,410,273,244,671,89,10,'','','','',NULL,NULL,''),(1149,79,2,445,510,265,530,89,10,'','blue','','',NULL,NULL,''),(1150,79,4,274,939,163,274,89,10,'','','','',NULL,NULL,''),(1151,79,5,598,268,356,674,89,10,'','','','',NULL,NULL,''),(1152,79,6,151,732,90,398,440,14,'','','6','0,15,87',5,NULL,'');
/*!40000 ALTER TABLE `template_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_pages`
--

DROP TABLE IF EXISTS `template_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_pages` (
  `id` int(11) NOT NULL auto_increment,
  `template_id` int(11) NOT NULL,
  `name` varchar(50) default NULL,
  `png_location` varchar(255) default NULL,
  `eps_location` varchar(255) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `template_pages_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_pages`
--

LOCK TABLES `template_pages` WRITE;
/*!40000 ALTER TABLE `template_pages` DISABLE KEYS */;
INSERT INTO `template_pages` VALUES (64,33,'PPOFN511237706_0001.png','c:/blog/public/template/PPOFN511237706_0001.png','c:/blog/public/template/PPOFN511237706_0001.eps',842,595),(65,33,'PPOFN511237706_0002.png','c:/blog/public/template/PPOFN511237706_0002.png','c:/blog/public/template/PPOFN511237706_0002.eps',842,595),(66,33,'PPOFN511237706_0003.png','c:/blog/public/template/PPOFN511237706_0003.png','c:/blog/public/template/PPOFN511237706_0003.eps',842,595),(67,33,'PPOFN511237706_0004.png','c:/blog/public/template/PPOFN511237706_0004.png','c:/blog/public/template/PPOFN511237706_0004.eps',842,595),(68,33,'PPOFN511237706_0005.png','c:/blog/public/template/PPOFN511237706_0005.png','c:/blog/public/template/PPOFN511237706_0005.eps',842,595),(69,34,'blank_0001.png','c:/blog/public/template/blank_0001.png','c:/blog/public/template/blank_0001.eps',596,842),(70,35,'training_plan_0001.png','c:/blog/public/template/training_plan_0001.png','c:/blog/public/template/training_plan_0001.eps',842,595),(71,35,'training_plan_0002.png','c:/blog/public/template/training_plan_0002.png','c:/blog/public/template/training_plan_0002.eps',842,595),(72,35,'training_plan_0003.png','c:/blog/public/template/training_plan_0003.png','c:/blog/public/template/training_plan_0003.eps',842,595),(73,35,'training_plan_0004.png','c:/blog/public/template/training_plan_0004.png','c:/blog/public/template/training_plan_0004.eps',842,595),(74,35,'training_plan_0005.png','c:/blog/public/template/training_plan_0005.png','c:/blog/public/template/training_plan_0005.eps',842,595),(79,38,'template_0001.png','c:/blog/public/template/template_0001.png','c:/blog/public/template/template_0001.eps',596,842),(80,38,'template_0002.png','c:/blog/public/template/template_0002.png','c:/blog/public/template/template_0002.eps',596,842);
/*!40000 ALTER TABLE `template_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `location` varchar(200) default NULL,
  `paper_size` varchar(45) default NULL,
  `landscape` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (33,'PPOFN511237706','c:/blog/public/template/PPOFN511237706.pdf','a4',1),(34,'blank','c:/blog/public/template/blank.pdf','a4',0),(35,'training_plan','c:/blog/public/template/training_plan.pdf','a4',0),(38,'template','c:/blog/public/template/template.pdf','a4',0);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog'
--
DELIMITER ;;
DELIMITER ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-23  9:06:21
