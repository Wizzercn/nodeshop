/*
SQLyog Ultimate v8.32 
MySQL - 5.6.0-m4 : Database - nodeshop
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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/task','data-pjax','','system:task:job',0,0,0,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','配置',NULL,'',NULL,'','config',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,12,'00020001','商店配置',NULL,NULL,NULL,'ti-settings','config:shop',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000200010001','商店设置',NULL,NULL,NULL,NULL,'config:shop:setting',0,0,0,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000200010002','邮件短信设置',NULL,NULL,NULL,NULL,'config:shop:mailsms',0,0,0,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,NULL,NULL,NULL,'order:list:orders',0,0,0,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,NULL,NULL,NULL,'order:list:cashs',0,0,0,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,NULL,NULL,NULL,'order:list:sends',0,0,0,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,0,0,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,NULL,NULL,NULL,'order:list:refunds',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,NULL,NULL,NULL,'goods:manage',0,0,1,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,NULL,NULL,NULL,'goods:manage:list',0,0,0,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,NULL,NULL,NULL,'goods:manage:setting',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,NULL,NULL,NULL,'goods:manage:class',0,0,0,30,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,NULL,NULL,NULL,'goods:manage:type',0,0,0,31,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,NULL,NULL,NULL,'goods:manage:format',0,0,0,32,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (31,27,'000400020004','商品品牌',NULL,NULL,NULL,NULL,'goods:manage:brand',0,0,0,33,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (32,27,'000400020005','虚拟分类',NULL,NULL,NULL,NULL,'goods:manage:vmclass',0,0,0,34,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,NULL,NULL,NULL,'member:manage',0,0,1,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,NULL,NULL,NULL,'member:manage:list',0,0,0,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,NULL,NULL,NULL,'member:manage:level',0,0,0,23,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (37,34,'000500010003','注册协议',NULL,NULL,NULL,NULL,'member:manage:reg',0,0,0,24,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (38,34,'000500010004','隐私保护',NULL,NULL,NULL,NULL,'member:manage:hide',0,0,0,25,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,NULL,NULL,NULL,'member:msg',0,0,1,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,NULL,NULL,NULL,'member:msg:faq',0,0,0,26,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,NULL,NULL,NULL,'member:msg:review',0,0,0,27,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (42,39,'000500020003','站内消息',NULL,NULL,NULL,NULL,'member:msg:site',0,0,0,28,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (43,39,'000500020004','消息设置',NULL,NULL,NULL,NULL,'member:msg:setting',0,0,0,29,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','站点',NULL,NULL,NULL,NULL,'site',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (45,44,'00060001','站点管理',NULL,NULL,NULL,NULL,'site:manage',0,0,1,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (46,45,'000600010001','导航菜单',NULL,NULL,NULL,NULL,'site:manage:menu',0,0,0,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (47,45,'000600010002','站点配置',NULL,NULL,NULL,NULL,'site:manage:setting',0,0,0,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,NULL,NULL,NULL,'site:cms',0,0,1,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,NULL,NULL,NULL,'site:cms:column',0,0,0,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,NULL,NULL,NULL,'site:cms:article',0,0,0,16,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','友情链接',NULL,NULL,NULL,NULL,'site:link',0,0,1,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','友情链接',NULL,NULL,NULL,NULL,'site:link:list',0,0,0,17,1,NULL);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;

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
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (257,12,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (258,14,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (259,13,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (260,15,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (285,7,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (286,1,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (287,2,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (288,9,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (289,7,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (290,1,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (291,2,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (292,9,20);

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unitid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (1,0,'公共角色','public',0,1,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (2,0,'系统管理','sysadmin',0,2,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (15,1,'11','11',0,0,1,1445233076);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (19,4,'1','1',1,0,1,1445562940);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (20,5,'ttt','ttt',1,0,1,1445563073);

/*Table structure for table `sys_role_users__sys_user_roles` */

CREATE TABLE `sys_role_users__sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_role_users` int(11) DEFAULT NULL,
  `sys_user_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_users__sys_user_roles` */

insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (3,2,3);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (4,2,4);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (10,2,10);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (11,2,11);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (12,2,12);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (13,2,13);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (28,2,1);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (32,1,1);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (33,1,2);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (34,1,3);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (35,1,4);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (38,1,7);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (41,1,11);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (42,1,9);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (43,1,8);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (44,1,6);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (45,1,5);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (49,20,8);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (50,20,14);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (51,20,9);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (52,20,7);

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
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统管理','请勿删除','安徽省合肥市蜀山区','13359011952','0551-63506223',1,1,1,1442391167);
insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','oooooooooooo','','','','',1,0,1,1444619252);
insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,1,'00010002','uuu','','','','',0,0,1,1444619254);

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `lastIp` varchar(20) DEFAULT NULL,
  `loginAt` int(11) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `loginTheme` varchar(20) DEFAULT NULL,
  `loginSidebar` tinyint(1) DEFAULT NULL,
  `loginScroll` tinyint(1) DEFAULT NULL,
  `loginBoxed` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (1,'superadmin','超级管理员','wizzer@qq.com','$2a$10$VHurQGznw79I8lKA86PJgOyOWX91cCQBG/HDSs..B4Lp.JGQNMy4a',0,1,'::ffff:192.168.1.11',1445587761,185,'palette.css',0,0,0,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (2,'rrrrrr!!!!','2','2@qq.com','2',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (3,'3333','333',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (4,'44444','444',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (5,'55555','555',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (6,'66666','666',NULL,'$2a$10$ry0AekD/cXKYzPWAmAo5S.gO13hFMMMTVJuRwNq0st1UJiSSnR02G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (7,'77777','777',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (8,'88888','888',NULL,'$2a$10$QxhrmtKzNt8Md3XRsUmNVODj6sciAq6dgkZM.qGRPMW7ijzsF9Hjq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (9,'9999','999','','$2a$10$yuHpyQDd/zYimhBbsypn/e5C8eoF.u9ZU/nxjszqMDKVVTudtefy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (11,'11111','1111',NULL,'$2a$10$6xyBA02aM.FRrcZyVc/1n.LN9ra8f8N.PiZRZi1MeNZUnh1DJ.opW',NULL,1,'::ffff:192.168.1.11',1444804958,2,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (12,'121212','12121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (13,'yyyy','yyy','6@q.com','$2a$10$t.KDX1ntJTRGKVglyP1yl.UPvDCY.0P8Do.Bst2WfE4sWG.GAF5JC',0,0,NULL,1444815191,0,NULL,0,0,0,1,1444815191,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (14,'ddd','ddd','','$2a$10$VcOoldmGUKohaz3Xte1RNeoT.LgoypPzO/RX371VZDJQifVOOD4Ym',0,0,NULL,1444815321,0,NULL,0,0,0,1,1444815321,2);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (15,'1','2','','$2a$10$h5ikeK2UEVkBJH9iSV9jROGqBB9k0UA2W9QuHhyyiWfa0zPnll8Oe',1,0,NULL,1445562925,0,NULL,0,0,0,1,1445562925,0);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (16,'tt','tt','','$2a$10$Ah8r0ZufypphHvPgeVr3zuK/eOZcSR.1NGjqJenKilsb8PrFnrQqe',1,0,NULL,1445563059,0,NULL,0,0,0,1,1445563059,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
