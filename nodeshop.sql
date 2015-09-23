/*
SQLyog Ultimate v8.32 
MySQL - 5.5.40 : Database - nodeshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `sys_config` */

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) DEFAULT NULL,
  `config_val` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

/*Table structure for table `sys_log` */

CREATE TABLE `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` varchar(50) DEFAULT NULL,
  `createdIp` varchar(20) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (1,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442385400);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (2,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442385474);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (3,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442385689);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (4,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442385805);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (5,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442386156);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (6,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442386212);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (7,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442386256);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (8,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442387852);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (9,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442387906);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (10,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442387939);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (11,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442387960);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (12,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442390995);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (13,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442391167);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (14,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442396897);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (15,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442397351);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (16,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442414353);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (17,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442414447);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (18,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442414960);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (19,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442415010);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (20,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442415130);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (21,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442416740);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (22,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442416987);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (23,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442417529);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (24,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442417957);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (25,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442418105);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (26,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442418672);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (27,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442418732);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (28,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442418784);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (29,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442418832);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (30,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442419083);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (31,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442419143);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (32,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442451690);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (33,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442458639);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (34,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442458703);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (35,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459175);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (36,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459261);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (37,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459540);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (38,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459641);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (39,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459660);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (40,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459762);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (41,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442459825);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (42,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442460546);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (43,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442460667);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (44,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442460776);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (45,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442468440);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (46,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442468516);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (47,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442469335);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (48,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442469431);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (49,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442469945);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (50,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442470014);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (51,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442470866);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (52,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442470963);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (53,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471020);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (54,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471085);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (55,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471167);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (56,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471399);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (57,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471642);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (58,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471682);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (59,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442471812);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (60,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442472182);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (61,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442472366);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (62,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442472420);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (63,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442475096);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (64,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442476137);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (65,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442478939);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (66,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442478960);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (67,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442479080);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (68,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442480022);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (69,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554263);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (70,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554306);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (71,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554421);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (72,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554606);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (73,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554663);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (74,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442554993);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (75,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442555900);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (76,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556042);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (77,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556122);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (78,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556319);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (79,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556413);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (80,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556585);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (81,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442556699);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (82,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442558502);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (83,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442559418);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (84,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442561009);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (85,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442561092);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (86,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442562406);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (87,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442566127);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (88,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442566805);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (89,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442567120);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (90,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442567125);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (91,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442568100);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (92,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442568121);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (93,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442568123);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (94,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442568503);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (95,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442569340);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (96,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442570343);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (97,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442813585);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (98,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442895293);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (99,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442896824);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (100,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442901743);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (101,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442903795);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (102,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442903843);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (103,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442903845);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (104,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442905803);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (105,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442906344);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (106,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442906345);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (107,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442906874);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (108,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442908583);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (109,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442909482);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (110,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442910210);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (111,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442911564);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (112,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442911565);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (113,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442912314);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (114,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442912350);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (115,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442912351);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (116,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442912380);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (117,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442912381);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (118,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442913001);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (119,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442913002);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (120,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442913666);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (121,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442913667);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (122,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442913786);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (123,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442913787);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (124,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442913804);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (125,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442913805);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (126,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442914096);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (127,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442914098);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (128,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442914275);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (129,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442914276);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (130,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442914462);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (131,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442914463);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (132,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442914590);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (133,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442914592);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (134,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442915148);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (135,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442917584);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (136,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442970116);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (137,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442975110);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (138,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442975211);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (139,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442975212);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (140,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442975800);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (141,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442978670);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (142,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979129);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (143,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979407);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (144,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979408);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (145,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979473);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (146,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979474);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (147,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979629);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (148,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979631);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (149,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979658);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (150,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979662);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (151,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979887);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (152,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979889);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (153,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979891);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (154,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979893);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (155,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979895);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (156,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979896);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (157,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979898);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (158,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979899);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (159,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442979902);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (160,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442979903);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (161,'system','/private/login/logout','退出系统',NULL,NULL,NULL,1442980070);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (162,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442980071);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (163,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1442983982);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (164,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1443001123);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (165,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1443001427);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (166,'system','/private/login/doLogin','登陆成功',1,'超级管理员','::ffff:192.168.1.11',1443001879);

/*Table structure for table `sys_menu` */

CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'/private/sys/unit',NULL,'ti-settings','system:sys',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit',NULL,NULL,'system:sys:unit',0,0,0,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user',NULL,NULL,'system:sys:user',0,0,0,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role',NULL,NULL,'system:sys:role',0,0,0,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu',NULL,NULL,'system:sys:menu',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/task',NULL,NULL,'system:task:job',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','配置',NULL,'',NULL,'','config',0,0,1,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,12,'00020001','商店配置',NULL,NULL,NULL,'ti-settings','config:shop',0,0,1,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000200010001','商店设置',NULL,NULL,NULL,NULL,'config:shop:setting',0,0,0,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000200010002','邮件短信设置',NULL,NULL,NULL,NULL,'config:shop:mailsms',0,0,0,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,16,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,NULL,NULL,NULL,'order:list:orders',0,0,0,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,NULL,NULL,NULL,'order:list:cashs',0,0,0,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,NULL,NULL,NULL,'order:list:sends',0,0,0,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,0,0,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,0,0,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,NULL,NULL,NULL,'order:list:refunds',0,0,0,23,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,24,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,NULL,NULL,NULL,'goods:manage',0,0,1,25,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,NULL,NULL,NULL,'goods:manage:list',0,0,0,26,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,NULL,NULL,NULL,'goods:manage:setting',0,0,1,27,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,NULL,NULL,NULL,'goods:manage:class',0,0,0,28,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,NULL,NULL,NULL,'goods:manage:type',0,0,0,29,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,NULL,NULL,NULL,'goods:manage:format',0,0,0,30,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (31,27,'000400020004','商品品牌',NULL,NULL,NULL,NULL,'goods:manage:brand',0,0,0,31,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (32,27,'000400020005','虚拟分类',NULL,NULL,NULL,NULL,'goods:manage:vmclass',0,0,0,32,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,33,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,NULL,NULL,NULL,'member:manage',0,0,1,34,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,NULL,NULL,NULL,'member:manage:list',0,0,0,35,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,NULL,NULL,NULL,'member:manage:level',0,0,0,36,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (37,34,'000500010003','注册协议',NULL,NULL,NULL,NULL,'member:manage:reg',0,0,0,37,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (38,34,'000500010004','隐私保护',NULL,NULL,NULL,NULL,'member:manage:hide',0,0,0,38,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,NULL,NULL,NULL,'member:msg',0,0,1,39,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,NULL,NULL,NULL,'member:msg:faq',0,0,0,40,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,NULL,NULL,NULL,'member:msg:review',0,0,0,41,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (42,39,'000500020003','站内消息',NULL,NULL,NULL,NULL,'member:msg:site',0,0,0,42,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (43,39,'000500020004','消息设置',NULL,NULL,NULL,NULL,'member:msg:setting',0,0,0,43,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','站点',NULL,NULL,NULL,NULL,'site',0,0,1,44,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (45,44,'00060001','站点管理',NULL,NULL,NULL,NULL,'site:manage',0,0,1,45,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (46,45,'000600010001','导航菜单',NULL,NULL,NULL,NULL,'site:manage:menu',0,0,0,46,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (47,45,'000600010002','站点配置',NULL,NULL,NULL,NULL,'site:manage:setting',0,0,0,47,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,NULL,NULL,NULL,'site:cms',0,0,1,48,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,NULL,NULL,NULL,'site:cms:column',0,0,0,49,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,NULL,NULL,NULL,'site:cms:article',0,0,0,50,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','友情链接',NULL,NULL,NULL,NULL,'site:link',0,0,1,51,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','友情链接',NULL,NULL,NULL,NULL,'site:link:list',0,0,0,52,1,NULL);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_roles__sys_role_menus` */

insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (1,1,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (2,2,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (3,3,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (4,4,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (5,5,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (6,6,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (7,7,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (8,8,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (9,9,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (10,10,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (11,11,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (12,12,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (13,13,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (14,14,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (15,15,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (16,16,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (17,17,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (18,18,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (19,19,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (20,20,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (21,21,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (22,22,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (23,23,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (24,24,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (25,25,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (26,26,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (27,27,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (28,28,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (29,29,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (30,30,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (31,31,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (32,32,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (33,33,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (34,34,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (35,35,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (36,36,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (37,37,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (38,38,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (39,39,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (40,40,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (41,41,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (42,42,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (43,43,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (44,44,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (45,45,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (46,46,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (47,47,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (48,48,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (49,49,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (50,50,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (51,51,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (52,52,2);

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unitId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`unitId`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (1,0,'公共角色','public',0,1,1,NULL);
insert  into `sys_role`(`id`,`unitId`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (2,0,'系统管理','sysadmin',0,2,1,NULL);

/*Table structure for table `sys_role_users__sys_user_roles` */

CREATE TABLE `sys_role_users__sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_role_users` int(11) DEFAULT NULL,
  `sys_user_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_users__sys_user_roles` */

insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (1,2,1);

/*Table structure for table `sys_unit` */

CREATE TABLE `sys_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统管理','请勿删除',NULL,NULL,NULL,1,1,NULL);

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `lastIp` varchar(20) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `loginTheme` varchar(20) DEFAULT NULL,
  `loginSidebar` tinyint(1) DEFAULT NULL,
  `loginScroll` tinyint(1) DEFAULT NULL,
  `loginBoxed` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`lastIp`,`loginCount`,`disabled`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`) values (1,'superadmin','超级管理员','wizzer@qq.com','$2a$10$VHurQGznw79I8lKA86PJgOyOWX91cCQBG/HDSs..B4Lp.JGQNMy4a','::ffff:192.168.1.11',47,0,'palette.css',0,1,1,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
