-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.11-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema hrhelpdesk
--

CREATE DATABASE IF NOT EXISTS hrhelpdesk;
USE hrhelpdesk;

--
-- Definition of table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_pers_id` int(10) unsigned NOT NULL,
  `ticket_subject` varchar(45) NOT NULL,
  `ticket_description` varchar(45) NOT NULL,
  `ticket_date` varchar(45) NOT NULL,
  `ticket_cat_id` int(10) unsigned NOT NULL,
  `ticket_status_id` int(10) unsigned NOT NULL,
  `ticket_technician_id` int(10) unsigned DEFAULT NULL,
  `ticket_alloted_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` (`ticket_id`,`user_pers_id`,`ticket_subject`,`ticket_description`,`ticket_date`,`ticket_cat_id`,`ticket_status_id`,`ticket_technician_id`,`ticket_alloted_date`) VALUES 
 (1,2,'first ticket','testing ticket','20/03/2024',1,2,3,'21/03/2024'),
 (2,2,'second ticket','bla bla blaaaaa','21/03/2024',3,1,4,'25/03/2024'),
 (3,2,'null','','25/03/2024',1,2,4,'26/03/2024'),
 (4,5,'test subject','test bla bla blaaaaaa','25/03/2024',3,1,NULL,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;


--
-- Definition of table `ticket_category`
--

DROP TABLE IF EXISTS `ticket_category`;
CREATE TABLE `ticket_category` (
  `ticket_cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_cat_name` varchar(45) NOT NULL,
  `ticket_cat_description` varchar(45) DEFAULT NULL,
  `ticket_cat_status` int(5) unsigned DEFAULT NULL,
  `ticket_cat_creation_date` varchar(45) DEFAULT NULL,
  `ticket_cat_created_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`ticket_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_category`
--

/*!40000 ALTER TABLE `ticket_category` DISABLE KEYS */;
INSERT INTO `ticket_category` (`ticket_cat_id`,`ticket_cat_name`,`ticket_cat_description`,`ticket_cat_status`,`ticket_cat_creation_date`,`ticket_cat_created_by`) VALUES 
 (1,'Tax','salary',1,'19/03/2024',1),
 (2,'Leave','leave',1,'19/03/2024',1),
 (3,'Allowance','Hr Allowance related',1,'21/03/2024',1),
 (4,'travel','TA',1,'21/03/2024',1);
/*!40000 ALTER TABLE `ticket_category` ENABLE KEYS */;


--
-- Definition of table `ticket_resolution`
--

DROP TABLE IF EXISTS `ticket_resolution`;
CREATE TABLE `ticket_resolution` (
  `ticket_resolution_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `user_pers_id` int(10) unsigned NOT NULL,
  `ticket_resolution_date` varchar(45) NOT NULL,
  `ticket_status_id` int(10) unsigned NOT NULL,
  `ticket_resolution_description` varchar(45) NOT NULL,
  PRIMARY KEY (`ticket_resolution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_resolution`
--

/*!40000 ALTER TABLE `ticket_resolution` DISABLE KEYS */;
INSERT INTO `ticket_resolution` (`ticket_resolution_id`,`ticket_id`,`user_pers_id`,`ticket_resolution_date`,`ticket_status_id`,`ticket_resolution_description`) VALUES 
 (1,1,3,'21/03/2024',2,'test resolution'),
 (2,1,3,'21/03/2024',3,'testing in progress');
/*!40000 ALTER TABLE `ticket_resolution` ENABLE KEYS */;


--
-- Definition of table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
CREATE TABLE `ticket_status` (
  `ticket_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_status` varchar(45) NOT NULL,
  `ticket_status_description` varchar(45) NOT NULL,
  PRIMARY KEY (`ticket_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_status`
--

/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` (`ticket_status_id`,`ticket_status`,`ticket_status_description`) VALUES 
 (1,'Not Assigned','Open and not assigned'),
 (2,'Open','Open and assigned to technician'),
 (3,'In progress','In progress'),
 (4,'Resolved','resolved'),
 (5,'Rejected','rejected'),
 (6,'Closed','closed');
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;


--
-- Definition of table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `user_pers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_login_username` varchar(45) NOT NULL,
  `user_login_password` varchar(45) NOT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  `user_dept` varchar(45) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  `user_created_by` varchar(45) DEFAULT NULL,
  `user_contact_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_pers_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_details`
--

/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` (`user_pers_id`,`user_name`,`user_login_username`,`user_login_password`,`user_email`,`user_role`,`user_dept`,`user_status`,`user_created_by`,`user_contact_no`) VALUES 
 (1,'admin','admin','admin','admin@ss.com','admin','hr',1,'1',NULL),
 (2,'anju','anju','anju','anju@ss.com','employee','hr',1,'1','null'),
 (3,'hr -assist user','hrassist','hrassist','hr@ss.com','hr','hr',1,'1','8888'),
 (4,'aswathy','aswathy','aswathy','ashwathy@ss.com','hr','hr',1,'1','234235'),
 (5,'test 1','test1','test1','test@ss.com','employee','remote location',-1,'1','24'),
 (6,'test2','test1213','test2','anju1@ss.com','hr','hr',1,'1','231434');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
