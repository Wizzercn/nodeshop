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
/*Table structure for table `cms_article` */

CREATE TABLE `cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publishAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `seo_title` varchar(100) DEFAULT NULL,
  `seo_keywords` varchar(100) DEFAULT NULL,
  `seo_description` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `content` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `content` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_article` */

/*Table structure for table `cms_article_content` */

CREATE TABLE `cms_article_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `article` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article` (`article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_article_content` */

/*Table structure for table `cms_channel` */

CREATE TABLE `cms_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `seo_title` varchar(100) DEFAULT NULL,
  `seo_keywords` varchar(100) DEFAULT NULL,
  `seo_description` varchar(100) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `homepage` tinyint(1) DEFAULT NULL,
  `content` longtext,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_channel` */

/*Table structure for table `cms_link` */

CREATE TABLE `cms_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_link` */

/*Table structure for table `cms_linkclass` */

CREATE TABLE `cms_linkclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cms_linkclass` */

insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (2,'文字广告',1,1446790960);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (3,'图片广告',1,1446790967);

/*Table structure for table `cms_site` */

CREATE TABLE `cms_site` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `icp` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `weibo_name` varchar(100) DEFAULT NULL,
  `weibo_qrcode` varchar(255) DEFAULT NULL,
  `wechat_name` varchar(100) DEFAULT NULL,
  `wechat_qrcode` varchar(255) DEFAULT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `footer_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`shopid`,`name`,`domain`,`icp`,`qq`,`email`,`weibo_name`,`weibo_qrcode`,`wechat_name`,`wechat_qrcode`,`telphone`,`seo_title`,`seo_keywords`,`seo_description`,`footer_content`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/task','data-pjax','','system:task:job',0,0,0,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','配置',NULL,'',NULL,'','config',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,12,'00020001','商店配置',NULL,NULL,NULL,'ti-settings','config:shop',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000200010001','商店设置',NULL,NULL,NULL,NULL,'config:shop:setting',0,0,0,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000200010002','邮件短信设置',NULL,NULL,NULL,NULL,'config:shop:mailsms',0,0,0,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,NULL,NULL,NULL,'order:list:orders',0,0,0,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,NULL,NULL,NULL,'order:list:cashs',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,NULL,NULL,NULL,'order:list:sends',0,0,0,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,0,0,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,NULL,NULL,NULL,'order:list:refunds',0,0,0,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,NULL,NULL,NULL,'goods:manage',0,0,1,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,NULL,NULL,NULL,'goods:manage:list',0,0,0,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,NULL,NULL,NULL,'goods:manage:setting',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,NULL,NULL,NULL,'goods:manage:class',0,0,0,29,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,NULL,NULL,NULL,'goods:manage:type',0,0,0,30,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,NULL,NULL,NULL,'goods:manage:format',0,0,0,31,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (31,27,'000400020004','商品品牌',NULL,NULL,NULL,NULL,'goods:manage:brand',0,0,0,32,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (32,27,'000400020005','虚拟分类',NULL,NULL,NULL,NULL,'goods:manage:vmclass',0,0,0,33,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,NULL,NULL,NULL,'member:manage',0,0,1,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,NULL,NULL,NULL,'member:manage:list',0,0,0,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,NULL,NULL,NULL,'member:manage:level',0,0,0,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (37,34,'000500010003','注册协议',NULL,NULL,NULL,NULL,'member:manage:reg',0,0,0,16,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (38,34,'000500010004','隐私保护',NULL,NULL,NULL,NULL,'member:manage:hide',0,0,0,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,NULL,NULL,NULL,'member:msg',0,0,1,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,NULL,NULL,NULL,'member:msg:faq',0,0,0,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,NULL,NULL,NULL,'member:msg:review',0,0,0,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (42,39,'000500020003','站内消息',NULL,NULL,NULL,NULL,'member:msg:site',0,0,0,23,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (43,39,'000500020004','消息设置',NULL,NULL,NULL,NULL,'member:msg:setting',0,0,0,24,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','站点',NULL,NULL,NULL,NULL,'site',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (45,44,'00060001','站点管理',NULL,'','','ti-world','site:manage',0,0,1,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (47,45,'000600010002','站点配置',NULL,'/private/cms/site','data-pjax','','site:manage:setting',0,0,0,37,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,'','','ti-pencil-alt','site:cms',0,0,1,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,'/private/cms/channel','data-pjax','','site:cms:channel',0,0,0,38,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,'/private/cms/article','data-pjax','','site:cms:article',0,0,0,39,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','友情链接',NULL,'','','ti-link','site:link',0,0,1,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','友情链接',NULL,'/private/cms/link','data-pjax','','site:link:list',0,0,0,40,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (53,0,'0007','微信',NULL,'',NULL,'','weixin',0,0,1,2,1,1445825925);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (54,53,'00070001','微信配置',NULL,'',NULL,'fa fa-weixin','weixin:manage',0,0,1,12,1,1445826142);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (55,54,'000700010001','帐号配置',NULL,'/private/wx/config','data-pjax','','weixin:manage:config',0,0,0,34,1,1445826178);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (56,54,'000700010002','菜单配置',NULL,'/private/wx/menu','data-pjax','','weixin:manage:menu',0,0,0,35,1,1445830074);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (57,53,'00070002','消息管理',NULL,'','','ti-pencil-alt','weixin:msg',0,0,1,10,1,1445843697);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (58,57,'000700020001','文字消息',NULL,'/private/wx/txt','data-pjax','','weixin:msg:txt',0,0,0,25,1,1445843720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (59,57,'000700020002','图文消息',NULL,'/private/wx/news','data-pjax','','weixin:msg:news',0,0,0,26,1,1445843889);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (60,53,'00070003','自动回复',NULL,'',NULL,'ti-back-left','weixin:reply',0,0,1,11,1,1445929792);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (61,60,'000700030001','关注自动回复',NULL,'/private/wx/reply?type=follow','data-pjax','','weixin:reply:follow',0,0,0,27,1,1445929848);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (62,60,'000700030002','关键词回复',NULL,'/private/wx/reply?type=keyword','data-pjax','','weixin:reply:keyword',0,0,0,28,1,1445929868);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (63,51,'000600030002','链接分类',NULL,'/private/cms/linkclass','data-pjax','','site:link:class',0,0,0,0,1,1446788018);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_roles__sys_role_menus` */

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
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (293,53,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (294,3,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (295,54,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (296,55,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (297,1,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (298,2,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (299,4,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (300,5,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (301,6,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (302,7,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (303,8,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (304,9,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (305,10,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (306,11,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (307,12,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (308,13,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (309,14,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (310,15,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (311,16,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (312,17,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (313,18,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (314,19,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (315,20,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (316,21,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (317,22,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (318,23,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (319,24,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (320,25,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (321,26,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (322,27,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (323,28,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (324,29,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (325,30,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (326,31,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (327,32,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (328,33,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (329,34,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (330,35,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (331,36,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (332,37,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (333,38,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (334,39,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (335,40,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (336,41,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (337,42,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (338,43,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (339,44,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (340,45,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (342,47,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (343,48,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (344,49,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (345,51,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (346,52,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (347,50,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (348,56,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (349,57,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (350,58,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (351,59,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (352,60,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (353,61,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (354,62,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (355,63,2);

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
  UNIQUE KEY `loginname` (`loginname`),
  KEY `nickname` (`nickname`),
  KEY `unitid` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (1,'superadmin','超级管理员','wizzer@qq.com','$2a$10$VHurQGznw79I8lKA86PJgOyOWX91cCQBG/HDSs..B4Lp.JGQNMy4a',0,1,'::ffff:192.168.1.11',1446794861,225,'palette.css',0,0,0,NULL,NULL,1);
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
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (13,'yyyy','yyy','6@q.com','$2a$10$p3v5yjYZb/Vgx1rkel2bAO/KnqmFxLJl83IrWebnZE5WdAq5UwkoC',0,0,NULL,1444815191,0,NULL,0,0,0,1,1444815191,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (14,'ddd','ddd','','$2a$10$VcOoldmGUKohaz3Xte1RNeoT.LgoypPzO/RX371VZDJQifVOOD4Ym',1,0,NULL,1444815321,0,NULL,0,0,0,1,1444815321,2);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (15,'1','2','','$2a$10$h5ikeK2UEVkBJH9iSV9jROGqBB9k0UA2W9QuHhyyiWfa0zPnll8Oe',1,0,NULL,1445562925,0,NULL,0,0,0,1,1445562925,0);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (16,'tt','tt','','$2a$10$Ah8r0ZufypphHvPgeVr3zuK/eOZcSR.1NGjqJenKilsb8PrFnrQqe',1,0,NULL,1445563059,0,NULL,0,0,0,1,1445563059,0);

/*Table structure for table `wx_config` */

CREATE TABLE `wx_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appname` varchar(255) DEFAULT NULL,
  `ghid` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `encodingAESKey` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ghid` (`ghid`),
  UNIQUE KEY `appid` (`appid`),
  UNIQUE KEY `appsecret` (`appsecret`),
  UNIQUE KEY `encodingAESKey` (`encodingAESKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wx_config` */

insert  into `wx_config`(`id`,`appname`,`ghid`,`appid`,`appsecret`,`encodingAESKey`,`token`,`access_token`,`expire_time`,`createdBy`,`createdAt`) values (1,'微数据','gh_ebe6545f95cc','wx477d239c3e0a80ab','f1b8f6d26856eef97d08d5735c8fd431','VMMB8PICkJGUKqbsLs7BFimIzybSMUDxBwvyvO92TEy','wizzer','AncQh8p9bkauYW0byTigRRDpwRcT3zBXWOgdQT7d5YMviOlG3rSTxvKn1kcpxiwJpuupTDlEvgHUa2k2rTL2IalopGqdb2fNA6225B9VidsFOKhAGAUDZ',1446188782,1,1445828740);
insert  into `wx_config`(`id`,`appname`,`ghid`,`appid`,`appsecret`,`encodingAESKey`,`token`,`access_token`,`expire_time`,`createdBy`,`createdAt`) values (2,'sun','gh_c8c3f92c1b2f','wx17fe71227e1577d9','190550dda42029b952ee4273b8d4aec1','IEcfKeAWngE5vzgrPuFwBtNAtES9urJhVF2XuwABvPd','wizzer','tiQariSZeU9KDPuttMzjElnzlCNn3iRlwOQOjPH3ahn0MtNprnocHq0fgo5xXvvuERIK0jP0UnHPrdXLJg4BaIsBEIuogV6mqbKqaKS3li8NOXbADASTC',1446192776,1,1446104003);

/*Table structure for table `wx_menu` */

CREATE TABLE `wx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `wx_menu` */

insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (1,0,'0001','菜单1','view',NULL,'',1,1,1,NULL,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (2,1,'00010001','菜单1-1','click','d',NULL,0,3,1,NULL,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (3,0,'0002','2',NULL,NULL,NULL,1,2,NULL,NULL,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (4,0,'0003','3',NULL,NULL,NULL,1,3,NULL,NULL,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (24,3,'00020001','百度','view','','http://www.baidu.com',0,1,1,1446110125,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (25,3,'00020002','关键词','click','MENU_CLICK_1','',0,2,1,1446110144,1);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (26,0,'0004','菜单1','','','',1,0,1,1446110661,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (27,0,'0005','菜单2','','','',1,0,1,1446191595,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (28,26,'00040001','链接1','view','','http://www.baidu.com',0,0,1,1446191624,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (29,26,'00040002','事件1','click','MENU_CLICK_1','',0,0,1,1446191675,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (30,27,'00050001','链接2','view','','http://www.wizzer.cn',0,0,1,1446191696,2);

/*Table structure for table `wx_news` */

CREATE TABLE `wx_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wx_news` */

insert  into `wx_news`(`id`,`title`,`description`,`picUrl`,`url`,`createdBy`,`createdAt`) values (1,'测试1','百度','https://www.baidu.com/img/bd_logo1.png','https://www.baidu.com',1,1445935192);
insert  into `wx_news`(`id`,`title`,`description`,`picUrl`,`url`,`createdBy`,`createdAt`) values (2,'测试2','Nutz','http://imglf.nosdn.127.net/img/YTk1a21YVE9xOVZTNlhnVzlwVkMxQmI4akErVkg0MlAwMmJEa2NneE5acmYrRU5uU1BCVGZBPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg','https://nutz.cn/yvr/t/48lqu7vp4kja8qoverokm4e5of',1,1446015092);

/*Table structure for table `wx_reply` */

CREATE TABLE `wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `msgtype` varchar(10) DEFAULT NULL,
  `keyword` varchar(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wx_reply` */

insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (1,'follow','txt',NULL,'4',1,1446020979,1);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (3,'keyword','txt','a','4',1,1446022793,1);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (4,'keyword','news','b','1',1,1446022817,1);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (5,'keyword','news','c','2,1',1,1446022835,1);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (8,'keyword','news','d','2,1',1,1446024971,1);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (9,'keyword','news','MENU_CLICK_1','2,1',1,1446106371,2);

/*Table structure for table `wx_txt` */

CREATE TABLE `wx_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wx_txt` */

insert  into `wx_txt`(`id`,`title`,`content`,`createdBy`,`createdAt`) values (4,'关注自动回复','Node.js Test...',1,1446020591);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
