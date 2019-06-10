/*
SQLyog Ultimate v8.32 
MySQL - 5.5.5-10.3.10-MariaDB : Database - nodeshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `nodeshop`;

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `client` varchar(10) DEFAULT NULL,
  `publishAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `seo_title` varchar(100) DEFAULT NULL,
  `seo_keywords` varchar(100) DEFAULT NULL,
  `seo_description` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `channelId` int(11) DEFAULT NULL,
  `contentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channelId` (`channelId`),
  KEY `contentId` (`contentId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (1,0,'NodeShop','NodeShop创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。 ','admin','pc',1457337778,0,'/upload/image/20160307/7178538f-89d4-40fc-8867-64d3f5b5f170.jpg','','','',1,1457337864,12,1);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (2,0,'有机会员的日常生活：策马奔腾！','策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！','超级管理员',NULL,1457339797,0,'/upload/image/20160307/479f164a-2824-4880-b5a3-b5e1e3ac3564.jpg','','','',1,1457339823,16,2);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (3,0,'我不推广产品 我推广健康','进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。','超级管理员',NULL,1457339853,0,'/upload/image/20160307/e8def416-c655-486e-9fac-bdecf7a00c25.jpg','','','',1,1457339891,16,3);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (4,0,'家庭环保：小厨房的大环保','在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。','超级管理员',NULL,1457339896,0,'/upload/image/20160307/4d4106db-aa82-4b94-bbcb-5ab83e691676.jpg','','','',1,1457339927,16,4);

/*Table structure for table `cms_article_content` */

DROP TABLE IF EXISTS `cms_article_content`;

CREATE TABLE `cms_article_content` (
  `content` longtext DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  `channelId` int(11) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cms_article_content` */

insert  into `cms_article_content`(`content`,`articleId`,`channelId`,`id`) values ('<p>上城（SunCHN），创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。&nbsp;</p><p><br/></p><p>上城是一个聚焦于电商，专注于技术研发的技术性团队。凭借多年以来长期扎根在电商领域的研究与服务经验，着眼于最前沿的技术线路，着重于中小微企业用户群体，依照中小微企业现状特征量身制定敏捷高效的电商售卖解决方案。横向整合第三方支付、物流信息、客服通讯等接口环节，纵向打通目前主流ERP、CRM等系统产品，为企业打造一个电商时代售卖一体化的开放式技术平台。&nbsp;</p><p><br/></p><p>未来，上城继续在电商研发领域深耕细作，坚持以客户需求为中心，以最大化客户电商产投性价比为思维导向，坚守品质，追求卓越，和更多的合作伙伴携手与共，助力企业轻松开创电商时代。</p>',1,12,1);
insert  into `cms_article_content`(`content`,`articleId`,`channelId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></span></p>',2,12,2);
insert  into `cms_article_content`(`content`,`articleId`,`channelId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></span></p>',3,12,3);
insert  into `cms_article_content`(`content`,`articleId`,`channelId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></span></p>',4,12,4);

/*Table structure for table `cms_channel` */

DROP TABLE IF EXISTS `cms_channel`;

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
  `homepage` tinyint(1) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `model` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `cms_channel` */

insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (1,0,0,'0001','新手上路','',NULL,NULL,NULL,0,'',0,1,0,1,1457332529,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (2,0,0,'0002','支付/配送','',NULL,NULL,NULL,0,'',0,1,0,1,1457332535,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (3,0,0,'0003','公司信息','',NULL,NULL,NULL,0,'',0,1,0,1,1457332539,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (4,0,0,'0004','新闻资讯','',NULL,NULL,NULL,0,'',0,1,0,1,1457332544,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (5,0,0,'0005','帮助中心','',NULL,NULL,NULL,0,'',0,1,0,1,1457332550,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (6,0,1,'00010001','新用户注册','',NULL,NULL,NULL,0,'',0,0,0,1,1457332561,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (7,0,1,'00010002','预订流程','',NULL,NULL,NULL,0,'',0,0,0,1,1457332568,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (8,0,1,'00010003','购物保障','',NULL,NULL,NULL,0,'',0,0,0,1,1457332574,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (9,0,2,'00020001','支付方式','',NULL,NULL,NULL,0,'',0,0,0,1,1457332584,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (10,0,2,'00020002','配送方式','',NULL,NULL,NULL,0,'',0,0,0,1,1457332591,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (11,0,2,'00020003','配送时间及运费','',NULL,NULL,NULL,0,'',0,0,0,1,1457332599,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (12,0,3,'00030001','关于我们','',NULL,NULL,NULL,0,'',0,0,0,1,1457332610,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (13,0,3,'00030002','用户协议','',NULL,NULL,NULL,0,'',0,0,0,1,1457332616,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (14,0,3,'00030003','隐私声明','',NULL,NULL,NULL,0,'',0,0,0,1,1457332623,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (15,0,4,'00040001','站内公告','',NULL,NULL,NULL,0,'',0,0,0,1,1457332634,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (16,0,4,'00040002','活动资讯','',NULL,NULL,NULL,0,'',0,0,0,1,1457332641,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (17,0,4,'00040003','公司动态','',NULL,NULL,NULL,0,'',0,0,0,1,1457332646,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (18,0,5,'00050001','常见问题','',NULL,NULL,NULL,0,'',0,0,0,1,1457332655,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (19,0,5,'00050002','找回密码','',NULL,NULL,NULL,0,'',0,0,0,1,1457332660,NULL);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`,`model`) values (20,0,5,'00050003','联系我们','',NULL,NULL,NULL,0,'',0,0,0,1,1457332665,NULL);

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (8,'新品热卖1','img','/upload/image/20190610/fb50fe40-1a6d-42ad-9470-7e1a3e195824.jpg','/hot','_blank',1,1457332270,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (9,'新品热卖2','img','/upload/image/20190610/d37a849c-fccb-4ae1-a44b-cdabdcba3133.jpg','/hot','_blank',1,1457332274,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (10,'公测','img','/upload/image/20160504/d1d9e6a2-ba1d-4e07-b25f-55e487dccc2f.jpg','javascript:;','_self',1,1457573796,5);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (11,'登录页背景图','img','/upload/image/20160309/b5dd34b1-b364-4f0f-b9e8-391e799efd40.jpg','javascript:;','_self',1,1457573838,6);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (12,'01','img','/upload/image/20160405/9ac035e4-f06b-47db-bdc5-d838017dcbcf.jpg','javascript:;','_self',1,1459394120,7);

/*Table structure for table `cms_linkclass` */

DROP TABLE IF EXISTS `cms_linkclass`;

CREATE TABLE `cms_linkclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `cms_linkclass` */

insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (4,'首页Banner',1,1457332232);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (5,'商品列表Banner',1,1457573644);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (6,'登录页背景',1,1457573664);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (7,'手机版首页Banner',1,1459394065);

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_domain` varchar(255) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_wap_logo` varchar(255) DEFAULT NULL,
  `site_qq` varchar(20) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_tel` varchar(20) DEFAULT NULL,
  `weibo_name` varchar(100) DEFAULT NULL,
  `weibo_url` varchar(100) DEFAULT NULL,
  `weibo_qrcode` varchar(255) DEFAULT NULL,
  `wechat_name` varchar(100) DEFAULT NULL,
  `wechat_id` varchar(100) DEFAULT NULL,
  `wechat_qrcode` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `footer_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`shopid`,`site_name`,`site_domain`,`site_icp`,`site_logo`,`site_wap_logo`,`site_qq`,`site_email`,`site_tel`,`weibo_name`,`weibo_url`,`weibo_qrcode`,`wechat_name`,`wechat_id`,`wechat_qrcode`,`seo_title`,`seo_keywords`,`seo_description`,`footer_content`) values (1,NULL,'电子商城演示系统','','','/upload/image/20190610/d47e7c3b-a5f8-4bce-a002-99c15c318557.png','/upload/image/20190610/39115006-8f37-4c37-ba3e-36204c7a56df.png','11624317','','4008-448-008','','','','','','/upload/image/20160306/abf3f5e1-176f-42fc-b14d-07774be9b498.jpg','','','','©2016 NodeShop');

/*Table structure for table `img_config` */

DROP TABLE IF EXISTS `img_config`;

CREATE TABLE `img_config` (
  `id` varchar(255) NOT NULL,
  `s_width` int(11) DEFAULT NULL,
  `s_height` int(11) DEFAULT NULL,
  `m_width` int(11) DEFAULT NULL,
  `m_height` int(11) DEFAULT NULL,
  `wk_url` varchar(255) DEFAULT NULL,
  `wk_type` int(11) DEFAULT NULL,
  `wk_txt` varchar(255) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_config` */

insert  into `img_config`(`id`,`s_width`,`s_height`,`m_width`,`m_height`,`wk_url`,`wk_type`,`wk_txt`,`updatedAt`) values ('1',260,260,420,420,'',0,'',1458704444);

/*Table structure for table `img_image` */

DROP TABLE IF EXISTS `img_image`;

CREATE TABLE `img_image` (
  `id` varchar(50) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `m_src` varchar(255) DEFAULT NULL,
  `s_src` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_image` */

insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('03e6fd7202784a1891086c080b603d66','13.jpg','/upload/image/20160504/f51f8c63-d240-4bad-9bc7-d19fef224cff.jpg','/open/image/file/03e6fd7202784a1891086c080b603d66.jpg','/upload/image/20160504/f51f8c63-d240-4bad-9bc7-d19fef224cff_m.jpg','/upload/image/20160504/f51f8c63-d240-4bad-9bc7-d19fef224cff_s.jpg',300,300,0,1462353313);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('08e3f7304d3341eb9384ac5fd0d951e4','2-2.jpg','/upload/image/20160504/fc6662ef-2294-4b18-9877-6a6e97030f10.jpg','/open/image/file/08e3f7304d3341eb9384ac5fd0d951e4.jpg','/upload/image/20160504/fc6662ef-2294-4b18-9877-6a6e97030f10_m.jpg','/upload/image/20160504/fc6662ef-2294-4b18-9877-6a6e97030f10_s.jpg',300,300,0,1462348235);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('0a7b520b43774ac699a70387698ca757','3.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99.jpg','/open/image/file/0a7b520b43774ac699a70387698ca757.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_m.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('0f5daea9c0b94f3bb89b3d9798ad432a','i1.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af.jpg','/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_m.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_s.jpg',430,430,0,1457334101);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('115935ffeec344eb86ff436b3c288409','2.jpg','/upload/image/20160504/08f5c193-daa4-4db7-9e9e-072b190173e8.jpg','/open/image/file/115935ffeec344eb86ff436b3c288409.jpg','/upload/image/20160504/08f5c193-daa4-4db7-9e9e-072b190173e8_m.jpg','/upload/image/20160504/08f5c193-daa4-4db7-9e9e-072b190173e8_s.jpg',300,300,0,1462347909);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('11ff343dbeda4ff3a9b0e2d962c7766b','5.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad.jpg','/open/image/file/11ff343dbeda4ff3a9b0e2d962c7766b.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_m.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('12fe51046d114027bf481680d1cd72c5','5.jpg','/upload/image/20160504/fb7a4c11-0836-4936-98bc-067c50ec702a.jpg','/open/image/file/12fe51046d114027bf481680d1cd72c5.jpg','/upload/image/20160504/fb7a4c11-0836-4936-98bc-067c50ec702a_m.jpg','/upload/image/20160504/fb7a4c11-0836-4936-98bc-067c50ec702a_s.jpg',300,300,0,1462349571);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('14eb2a9f930a457eb81757db5c20bdf9','4-.jpg','/upload/image/20160504/4a08faf6-c1c8-47c8-9f0a-639372dc839b.jpg','/open/image/file/14eb2a9f930a457eb81757db5c20bdf9.jpg','/upload/image/20160504/4a08faf6-c1c8-47c8-9f0a-639372dc839b_m.jpg','/upload/image/20160504/4a08faf6-c1c8-47c8-9f0a-639372dc839b_s.jpg',800,800,0,1462349265);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('17274ea8a11e46b88c6d8a7967c7a976','3.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528.jpg','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_m.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_s.jpg',720,720,0,1457404284);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('1a5a51ae331a4c4dad8bb16fb64d68c0','14.jpg','/upload/image/20160504/b979f946-3a8a-46b5-917d-ecd0c36654f0.jpg','/open/image/file/1a5a51ae331a4c4dad8bb16fb64d68c0.jpg','/upload/image/20160504/b979f946-3a8a-46b5-917d-ecd0c36654f0_m.jpg','/upload/image/20160504/b979f946-3a8a-46b5-917d-ecd0c36654f0_s.jpg',300,300,0,1462354141);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('1c2799a956154059a826f06c230cd967','5.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4.jpg','/open/image/file/1c2799a956154059a826f06c230cd967.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_m.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('1c86bd35838945ebbac690075f141b49','7-.jpg','/upload/image/20160504/8e6ad1a5-b96d-4934-b0b0-4349983b0756.jpg','/open/image/file/1c86bd35838945ebbac690075f141b49.jpg','/upload/image/20160504/8e6ad1a5-b96d-4934-b0b0-4349983b0756_m.jpg','/upload/image/20160504/8e6ad1a5-b96d-4934-b0b0-4349983b0756_s.jpg',300,300,0,1462350612);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('1d2f0fc0181d4fbcba98a15b209fe344','7.jpg','/upload/image/20160504/318db307-e260-4a07-bef4-d16fdd0227b2.jpg','/open/image/file/1d2f0fc0181d4fbcba98a15b209fe344.jpg','/upload/image/20160504/318db307-e260-4a07-bef4-d16fdd0227b2_m.jpg','/upload/image/20160504/318db307-e260-4a07-bef4-d16fdd0227b2_s.jpg',300,300,0,1462350169);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('20f16a08b4684d5cad73749001bcbb65','201602122052502802.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca.jpg','/open/image/file/20f16a08b4684d5cad73749001bcbb65.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_m.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_s.jpg',600,600,0,1457598090);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('24aa7d9a50694693a5387fe66a92383a','04.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b.jpg','/open/image/file/24aa7d9a50694693a5387fe66a92383a.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_m.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_s.jpg',600,600,0,1457403271);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2a16c0a6e63a4d95bcf07ed1180595c9','5.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351.jpg','/open/image/file/2a16c0a6e63a4d95bcf07ed1180595c9.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_m.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2cb01917077741a18fa9f9aed511a244','1.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de.jpg','/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_m.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_s.jpg',800,800,0,1457403550);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2f4bdf8a0d884426ac9440cb7b446fdb','01.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266.jpg','/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_m.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_s.jpg',640,640,0,1457403270);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('344297a4c21a48a78ef7439866ddf8dd','10.jpg','/upload/image/20160504/9d5dfac3-5c7e-41ce-b822-7d37c787a8cc.jpg','/open/image/file/344297a4c21a48a78ef7439866ddf8dd.jpg','/upload/image/20160504/9d5dfac3-5c7e-41ce-b822-7d37c787a8cc_m.jpg','/upload/image/20160504/9d5dfac3-5c7e-41ce-b822-7d37c787a8cc_s.jpg',300,300,0,1462352613);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('35cf105466034f8782e60444820a4024','7004f7368f854052b560777d0cb54226.jpg','/upload/image/20190610/31ee6070-6a9f-4728-897c-e3250d65f7fa.jpg','/open/image/file/35cf105466034f8782e60444820a4024.jpg','/upload/image/20190610/31ee6070-6a9f-4728-897c-e3250d65f7fa_m.jpg','/upload/image/20190610/31ee6070-6a9f-4728-897c-e3250d65f7fa_s.jpg',600,600,0,1560142008);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('38b675d5ad904792aaa9bfc37a38ca09','03.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59.jpg','/open/image/file/38b675d5ad904792aaa9bfc37a38ca09.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_m.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_s.jpg',600,600,0,1457403270);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('39f39a074b554b46815b1f86c83b7668','8.jpg','/upload/image/20160504/f138d711-e18c-40a3-83ba-b9f261a425f5.jpg','/open/image/file/39f39a074b554b46815b1f86c83b7668.jpg','/upload/image/20160504/f138d711-e18c-40a3-83ba-b9f261a425f5_m.jpg','/upload/image/20160504/f138d711-e18c-40a3-83ba-b9f261a425f5_s.jpg',300,300,0,1462350795);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('3ab11d172c25468fb4cda84b45a18e06','5.jpg','/upload/image/20160504/5fcb4e4f-328c-40fd-be42-f61dc185dd7c.jpg','/open/image/file/3ab11d172c25468fb4cda84b45a18e06.jpg','/upload/image/20160504/5fcb4e4f-328c-40fd-be42-f61dc185dd7c_m.jpg','/upload/image/20160504/5fcb4e4f-328c-40fd-be42-f61dc185dd7c_s.jpg',300,300,0,1462349568);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('3df0a8042f0747b89fdcaea1884b9d1d','7-.jpg','/upload/image/20160504/5fb7c1fd-d785-439c-86f8-83c5ceff2198.jpg','/open/image/file/3df0a8042f0747b89fdcaea1884b9d1d.jpg','/upload/image/20160504/5fb7c1fd-d785-439c-86f8-83c5ceff2198_m.jpg','/upload/image/20160504/5fb7c1fd-d785-439c-86f8-83c5ceff2198_s.jpg',1000,914,0,1462350510);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('3f5326303f564cb3af4c6d357a68f0ff','3.jpg','/upload/image/20160504/4297f368-105a-439e-9d71-d132bd8ad015.jpg','/open/image/file/3f5326303f564cb3af4c6d357a68f0ff.jpg','/upload/image/20160504/4297f368-105a-439e-9d71-d132bd8ad015_m.jpg','/upload/image/20160504/4297f368-105a-439e-9d71-d132bd8ad015_s.jpg',300,300,0,1462348619);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('44ef4c06af124317915e2b8c4d371483','4.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f.jpg','/open/image/file/44ef4c06af124317915e2b8c4d371483.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_m.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_s.jpg',800,800,0,1457403550);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('46ca947ea8654b6883e4220f335234bc','13.jpg','/upload/image/20160504/78dd7dc3-1fd4-447c-9916-0a61f83940d2.jpg','/open/image/file/46ca947ea8654b6883e4220f335234bc.jpg','/upload/image/20160504/78dd7dc3-1fd4-447c-9916-0a61f83940d2_m.jpg','/upload/image/20160504/78dd7dc3-1fd4-447c-9916-0a61f83940d2_s.jpg',300,300,0,1462353311);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('49898d94c8244b5c94534dd3bc3911c9','4.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2.jpg','/open/image/file/49898d94c8244b5c94534dd3bc3911c9.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_m.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('4a799a201c7245c095e6d96f5c967bd8','3.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147.jpg','/open/image/file/4a799a201c7245c095e6d96f5c967bd8.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147_m.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147_s.jpg',3652,3648,0,1459492178);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('4b065c46c696446695976d9866128035','7-.jpg','/upload/image/20160504/b06eefe4-493f-41b5-a6e0-4d032464eb24.jpg','/open/image/file/4b065c46c696446695976d9866128035.jpg','/upload/image/20160504/b06eefe4-493f-41b5-a6e0-4d032464eb24_m.jpg','/upload/image/20160504/b06eefe4-493f-41b5-a6e0-4d032464eb24_s.jpg',300,300,0,1462350617);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('52ce1880b3384aec89a854394cb68978','pic_m.jpg','/upload/image/20160119/a1e61e1f-d652-430f-afef-38100cb2dc6b.jpg','/open/image/52ce1880b3384aec89a854394cb68978.jpg',NULL,NULL,180,72,0,1453190985);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('551860e3ef97462ca2f2bc27d1c79533','1.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59.jpg','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_m.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('5c7e75fc65524649bc35a6cba507b291','1.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150.jpg','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_m.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_s.jpg',400,400,0,1457404968);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('64c03356c56a4681b3660c8b0ad1d1ba','1.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd.jpg','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd_m.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd_s.jpg',3646,3648,0,1459492178);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('668cc99b91224caa820eef8525dee6fa','11.jpg','/upload/image/20160504/5abb4681-b077-41be-97c1-46d00f3bd5d9.jpg','/open/image/file/668cc99b91224caa820eef8525dee6fa.jpg','/upload/image/20160504/5abb4681-b077-41be-97c1-46d00f3bd5d9_m.jpg','/upload/image/20160504/5abb4681-b077-41be-97c1-46d00f3bd5d9_s.jpg',300,300,0,1462352825);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('699ed33635164f8cb101e787d1d7d774','2.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5.jpg','/open/image/file/699ed33635164f8cb101e787d1d7d774.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_m.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_s.jpg',350,350,0,1457333152);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('6ada2f0791ff4f31964f782ed80ccba9','4-.jpg','/upload/image/20160504/f9e9a317-705e-4dad-91c2-34d27758b62c.jpg','/open/image/file/6ada2f0791ff4f31964f782ed80ccba9.jpg','/upload/image/20160504/f9e9a317-705e-4dad-91c2-34d27758b62c_m.jpg','/upload/image/20160504/f9e9a317-705e-4dad-91c2-34d27758b62c_s.jpg',800,800,0,1462349263);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('6cac523104ac4737a7a9ce937b3c09f7','6.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939.jpg','/open/image/file/6cac523104ac4737a7a9ce937b3c09f7.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_m.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_s.jpg',800,1200,0,1457333153);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('6f963b00383449ae87e674fdba40be29','201601051454487968.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd.png','/open/image/file/6f963b00383449ae87e674fdba40be29.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_m.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_s.png',418,418,0,1457598009);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7007f78c53d3400dbcf6af14cf036a6c','7-.jpg','/upload/image/20160504/c5e2dbf7-933c-4a0c-93fe-55f0b2991b5f.jpg','/open/image/file/7007f78c53d3400dbcf6af14cf036a6c.jpg','/upload/image/20160504/c5e2dbf7-933c-4a0c-93fe-55f0b2991b5f_m.jpg','/upload/image/20160504/c5e2dbf7-933c-4a0c-93fe-55f0b2991b5f_s.jpg',1000,914,0,1462350520);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7245859fe5e74edd9bfc63043b097eef','3.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300.jpg','/open/image/file/7245859fe5e74edd9bfc63043b097eef.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_m.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_s.jpg',600,600,0,1457403758);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('771880c741d24fa1bcc08b986f7844b5','2.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c.jpg','/open/image/file/771880c741d24fa1bcc08b986f7844b5.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_m.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7860010a476e4a8e83d4c771f288f3ba','未标题-1.jpg','/upload/image/20160504/5b3e1416-24f1-4a12-be04-1ed72ed4a43f.jpg','/open/image/file/7860010a476e4a8e83d4c771f288f3ba.jpg','/upload/image/20160504/5b3e1416-24f1-4a12-be04-1ed72ed4a43f_m.jpg','/upload/image/20160504/5b3e1416-24f1-4a12-be04-1ed72ed4a43f_s.jpg',300,300,0,1462347384);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7871160e5eb14b46a3f5c3db4491e48e','3.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97.jpg','/open/image/file/7871160e5eb14b46a3f5c3db4491e48e.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_m.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7a0bfa3f08024ce0a97f879e0f343e27','10.jpg','/upload/image/20160504/a2514ce5-f391-4876-bdb7-3861a14b5d07.jpg','/open/image/file/7a0bfa3f08024ce0a97f879e0f343e27.jpg','/upload/image/20160504/a2514ce5-f391-4876-bdb7-3861a14b5d07_m.jpg','/upload/image/20160504/a2514ce5-f391-4876-bdb7-3861a14b5d07_s.jpg',300,300,0,1462352611);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7ae441f3add44b488d50277b8ec23abf','1.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48.jpg','/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_m.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_s.jpg',400,400,0,1457404361);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7d8f312e85d44e47a4729039adc9db16','1.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0.jpg','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_m.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7dbe07a44ec34cd9bb09f748cd6ee492','6.jpg','/upload/image/20160504/8cc82b91-5fe5-45c8-9a4b-d5a195629cad.jpg','/open/image/file/7dbe07a44ec34cd9bb09f748cd6ee492.jpg','/upload/image/20160504/8cc82b91-5fe5-45c8-9a4b-d5a195629cad_m.jpg','/upload/image/20160504/8cc82b91-5fe5-45c8-9a4b-d5a195629cad_s.jpg',300,300,0,1462349866);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('8050f2cf794b438d8c62e12c7a1d945a','3.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658.jpg','/open/image/file/8050f2cf794b438d8c62e12c7a1d945a.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_m.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_s.jpg',640,640,0,1457405118);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('849347a037c64db78a88fbae9a96835d','792a83eac9f94ae6bece07b81972b526.jpg','/upload/image/20190610/2800dbda-b354-456c-81f0-2cdc809b973d.jpg','/open/image/file/849347a037c64db78a88fbae9a96835d.jpg','/upload/image/20190610/2800dbda-b354-456c-81f0-2cdc809b973d_m.jpg','/upload/image/20190610/2800dbda-b354-456c-81f0-2cdc809b973d_s.jpg',600,600,0,1560142008);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('854830f165c54850bea26f9e6ac9f26f','20151010092555.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1.jpg','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_m.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_s.jpg',600,600,0,1457598082);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('86ddadded33f4c83b3e48e168f9a8738','14.jpg','/upload/image/20160504/17c90645-9b8a-4700-9e74-aea07bc1573f.jpg','/open/image/file/86ddadded33f4c83b3e48e168f9a8738.jpg','/upload/image/20160504/17c90645-9b8a-4700-9e74-aea07bc1573f_m.jpg','/upload/image/20160504/17c90645-9b8a-4700-9e74-aea07bc1573f_s.jpg',300,300,0,1462354146);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('8939de7dc4d94d80bd513a5bec2e224b','12.jpg','/upload/image/20160504/92252897-c2ac-49e1-8f53-bd6a733fb250.jpg','/open/image/file/8939de7dc4d94d80bd513a5bec2e224b.jpg','/upload/image/20160504/92252897-c2ac-49e1-8f53-bd6a733fb250_m.jpg','/upload/image/20160504/92252897-c2ac-49e1-8f53-bd6a733fb250_s.jpg',300,300,0,1462353103);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('896723809b9449f481fd2e8ba87eeaf1','2.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325.jpg','/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_m.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_s.jpg',640,640,0,1457405118);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('8a866224eb1f40509bf1a916a07e29d7','12.jpg','/upload/image/20160504/d63cbc4b-3511-4f0b-8f9e-92b1553676ed.jpg','/open/image/file/8a866224eb1f40509bf1a916a07e29d7.jpg','/upload/image/20160504/d63cbc4b-3511-4f0b-8f9e-92b1553676ed_m.jpg','/upload/image/20160504/d63cbc4b-3511-4f0b-8f9e-92b1553676ed_s.jpg',300,300,0,1462353105);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('8f7aff0e6a3d4329820c93fb148c153f','7.jpg','/upload/image/20160504/3b6928aa-d645-4dfe-89c8-2e8eae667e6a.jpg','/open/image/file/8f7aff0e6a3d4329820c93fb148c153f.jpg','/upload/image/20160504/3b6928aa-d645-4dfe-89c8-2e8eae667e6a_m.jpg','/upload/image/20160504/3b6928aa-d645-4dfe-89c8-2e8eae667e6a_s.jpg',300,300,0,1462350164);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('9145518ce21d418db8aef27665cba657','pic_m.jpg','/upload/image/20160119/754ad334-4de5-44ad-98cf-d1fd4fb0648c.jpg','/open/image/file/9145518ce21d418db8aef27665cba657.jpg',NULL,NULL,180,72,0,1453191632);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('94167c39909c4035ac6d09088c170037','3.jpg','/upload/image/20160504/780f7954-0629-4cee-9f45-ebf533a2b959.jpg','/open/image/file/94167c39909c4035ac6d09088c170037.jpg','/upload/image/20160504/780f7954-0629-4cee-9f45-ebf533a2b959_m.jpg','/upload/image/20160504/780f7954-0629-4cee-9f45-ebf533a2b959_s.jpg',300,300,0,1462348621);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('95c2403e60e24b4989016a43bfa26c4b','2.jpg','/upload/image/20160504/acfc2ead-5aba-4b4e-a6c0-b120003be050.jpg','/open/image/file/95c2403e60e24b4989016a43bfa26c4b.jpg','/upload/image/20160504/acfc2ead-5aba-4b4e-a6c0-b120003be050_m.jpg','/upload/image/20160504/acfc2ead-5aba-4b4e-a6c0-b120003be050_s.jpg',300,300,0,1462347902);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('95f25b05b8f44157a10a63fb757b2744','未标题-1.jpg','/upload/image/20160504/3890bd3f-d458-4a8e-b086-0e1e2ddc211b.jpg','/open/image/file/95f25b05b8f44157a10a63fb757b2744.jpg','/upload/image/20160504/3890bd3f-d458-4a8e-b086-0e1e2ddc211b_m.jpg','/upload/image/20160504/3890bd3f-d458-4a8e-b086-0e1e2ddc211b_s.jpg',300,300,0,1462347387);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('9ee2884997814a8f8d6c2d4e0f92f15c','9.jpg','/upload/image/20160504/c714bfc3-174a-49c9-b3c1-05f4fca2349e.jpg','/open/image/file/9ee2884997814a8f8d6c2d4e0f92f15c.jpg','/upload/image/20160504/c714bfc3-174a-49c9-b3c1-05f4fca2349e_m.jpg','/upload/image/20160504/c714bfc3-174a-49c9-b3c1-05f4fca2349e_s.jpg',300,300,0,1462352306);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('a3bfff58a4e346769b62eb66b41b8bb9','7.jpg','/upload/image/20160504/54bb53c5-d710-4d7d-866e-73107bc2d015.jpg','/open/image/file/a3bfff58a4e346769b62eb66b41b8bb9.jpg','/upload/image/20160504/54bb53c5-d710-4d7d-866e-73107bc2d015_m.jpg','/upload/image/20160504/54bb53c5-d710-4d7d-866e-73107bc2d015_s.jpg',300,300,0,1462350167);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('a6939a21b6b64764aace28ea0ea3cfeb','10.jpg','/upload/image/20160504/16145590-a6d4-496d-8e36-6dfecc2d858f.jpg','/open/image/file/a6939a21b6b64764aace28ea0ea3cfeb.jpg','/upload/image/20160504/16145590-a6d4-496d-8e36-6dfecc2d858f_m.jpg','/upload/image/20160504/16145590-a6d4-496d-8e36-6dfecc2d858f_s.jpg',300,300,0,1462352608);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('a70e408880f74d0aa6d547b43b437982','11.jpg','/upload/image/20160504/97b5cd91-8720-4404-a891-c957e359b284.jpg','/open/image/file/a70e408880f74d0aa6d547b43b437982.jpg','/upload/image/20160504/97b5cd91-8720-4404-a891-c957e359b284_m.jpg','/upload/image/20160504/97b5cd91-8720-4404-a891-c957e359b284_s.jpg',300,300,0,1462352830);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('a7bc0eec68d7421e8e208700ce8cfb9f','7-.jpg','/upload/image/20160504/67ddc358-fe1f-4c35-ad6d-b4cd52b2622c.jpg','/open/image/file/a7bc0eec68d7421e8e208700ce8cfb9f.jpg','/upload/image/20160504/67ddc358-fe1f-4c35-ad6d-b4cd52b2622c_m.jpg','/upload/image/20160504/67ddc358-fe1f-4c35-ad6d-b4cd52b2622c_s.jpg',300,300,0,1462350615);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('a82fa23a73cd493998aae46f9c1946df','未标题-1.jpg','/upload/image/20160504/cd9cec36-8b3e-44b4-9091-e0f97e410660.jpg','/open/image/file/a82fa23a73cd493998aae46f9c1946df.jpg','/upload/image/20160504/cd9cec36-8b3e-44b4-9091-e0f97e410660_m.jpg','/upload/image/20160504/cd9cec36-8b3e-44b4-9091-e0f97e410660_s.jpg',300,300,0,1462347319);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('aba2abf648f5469c9440c55fe9869a4a','7-.jpg','/upload/image/20160504/b0837388-9b83-4a6b-81cd-5845a844a9e2.jpg','/open/image/file/aba2abf648f5469c9440c55fe9869a4a.jpg','/upload/image/20160504/b0837388-9b83-4a6b-81cd-5845a844a9e2_m.jpg','/upload/image/20160504/b0837388-9b83-4a6b-81cd-5845a844a9e2_s.jpg',1000,914,0,1462350517);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('ae7fd5bb939e4c14a611b449a40bed08','3.jpg','/upload/image/20160504/c17127da-0ddb-4535-94e7-202bd8d1bc52.jpg','/open/image/file/ae7fd5bb939e4c14a611b449a40bed08.jpg','/upload/image/20160504/c17127da-0ddb-4535-94e7-202bd8d1bc52_m.jpg','/upload/image/20160504/c17127da-0ddb-4535-94e7-202bd8d1bc52_s.jpg',300,300,0,1462348616);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('b135fb0dabb04b968dd4398e9199f404','13.jpg','/upload/image/20160504/9678f63a-f6f9-432d-acb1-f5eb1617b54b.jpg','/open/image/file/b135fb0dabb04b968dd4398e9199f404.jpg','/upload/image/20160504/9678f63a-f6f9-432d-acb1-f5eb1617b54b_m.jpg','/upload/image/20160504/9678f63a-f6f9-432d-acb1-f5eb1617b54b_s.jpg',300,300,0,1462353315);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('b4954f3cb20d40b6bce84297458f57d1','8.jpg','/upload/image/20160504/c4176d3b-977f-433d-afb5-4edfe9e6c023.jpg','/open/image/file/b4954f3cb20d40b6bce84297458f57d1.jpg','/upload/image/20160504/c4176d3b-977f-433d-afb5-4edfe9e6c023_m.jpg','/upload/image/20160504/c4176d3b-977f-433d-afb5-4edfe9e6c023_s.jpg',300,300,0,1462350790);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('c18148388fcd46bcab307d6d80de8370','5.jpg','/upload/image/20160504/74f2fbb4-112c-43ac-a4fc-bc0583d7ff52.jpg','/open/image/file/c18148388fcd46bcab307d6d80de8370.jpg','/upload/image/20160504/74f2fbb4-112c-43ac-a4fc-bc0583d7ff52_m.jpg','/upload/image/20160504/74f2fbb4-112c-43ac-a4fc-bc0583d7ff52_s.jpg',300,300,0,1462349566);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('c2c662540c504f57a3eda04ecd7fa17c','6.jpg','/upload/image/20160504/dcc21923-ceee-4006-9664-aee75148d635.jpg','/open/image/file/c2c662540c504f57a3eda04ecd7fa17c.jpg','/upload/image/20160504/dcc21923-ceee-4006-9664-aee75148d635_m.jpg','/upload/image/20160504/dcc21923-ceee-4006-9664-aee75148d635_s.jpg',300,300,0,1462349863);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('c34335c226704822bed204aa3cad4926','7-.jpg','/upload/image/20160504/e739583b-ae0b-4fb6-b648-d8567de36656.jpg','/open/image/file/c34335c226704822bed204aa3cad4926.jpg','/upload/image/20160504/e739583b-ae0b-4fb6-b648-d8567de36656_m.jpg','/upload/image/20160504/e739583b-ae0b-4fb6-b648-d8567de36656_s.jpg',300,300,0,1462350601);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('c7bca66af25745449ad3387a70dc2d64','12.jpg','/upload/image/20160504/d414de76-283f-456f-9940-98309b76718f.jpg','/open/image/file/c7bca66af25745449ad3387a70dc2d64.jpg','/upload/image/20160504/d414de76-283f-456f-9940-98309b76718f_m.jpg','/upload/image/20160504/d414de76-283f-456f-9940-98309b76718f_s.jpg',300,300,0,1462353101);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('cafc0a10a3654cce84b70606474bfcba','11.jpg','/upload/image/20160504/51516771-2da4-4e90-87ce-746259a18757.jpg','/open/image/file/cafc0a10a3654cce84b70606474bfcba.jpg','/upload/image/20160504/51516771-2da4-4e90-87ce-746259a18757_m.jpg','/upload/image/20160504/51516771-2da4-4e90-87ce-746259a18757_s.jpg',300,300,0,1462352827);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('cdafd3aa37444c929ee492224bd3a726','4-.jpg','/upload/image/20160504/46ddb702-a76c-4835-be21-10ec3f1f7d35.jpg','/open/image/file/cdafd3aa37444c929ee492224bd3a726.jpg','/upload/image/20160504/46ddb702-a76c-4835-be21-10ec3f1f7d35_m.jpg','/upload/image/20160504/46ddb702-a76c-4835-be21-10ec3f1f7d35_s.jpg',800,800,0,1462349259);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('d6e7767307764869b8ac1284cb650578','2.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d.jpg','/open/image/file/d6e7767307764869b8ac1284cb650578.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d_m.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d_s.jpg',3652,3648,0,1459492178);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('d86ccfd7a0094b9badff6256313a1933','14.jpg','/upload/image/20160504/e77e8d9a-4473-4d84-8d91-36a4764d16af.jpg','/open/image/file/d86ccfd7a0094b9badff6256313a1933.jpg','/upload/image/20160504/e77e8d9a-4473-4d84-8d91-36a4764d16af_m.jpg','/upload/image/20160504/e77e8d9a-4473-4d84-8d91-36a4764d16af_s.jpg',300,300,0,1462354144);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('d8dbc3a51d2f4fdda00c471a1918d029','20160413111630.png','/upload/image/20160415/feffc5f8-b9c0-4483-b191-726e384d4812.png','/open/image/file/d8dbc3a51d2f4fdda00c471a1918d029.png','/upload/image/20160415/feffc5f8-b9c0-4483-b191-726e384d4812_m.png','/upload/image/20160415/feffc5f8-b9c0-4483-b191-726e384d4812_s.png',500,500,0,1460684461);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('d9ad652f3074461799324b98f9d0f81e','9.jpg','/upload/image/20160504/ecee3b27-048d-402e-a96b-04df5a840ed1.jpg','/open/image/file/d9ad652f3074461799324b98f9d0f81e.jpg','/upload/image/20160504/ecee3b27-048d-402e-a96b-04df5a840ed1_m.jpg','/upload/image/20160504/ecee3b27-048d-402e-a96b-04df5a840ed1_s.jpg',300,300,0,1462352311);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('dcb199d9cc7b4f59b929095cf573e4cf','6.jpg','/upload/image/20160504/2f49928b-81f9-4ecc-8450-8777e40534c8.jpg','/open/image/file/dcb199d9cc7b4f59b929095cf573e4cf.jpg','/upload/image/20160504/2f49928b-81f9-4ecc-8450-8777e40534c8_m.jpg','/upload/image/20160504/2f49928b-81f9-4ecc-8450-8777e40534c8_s.jpg',300,300,0,1462349854);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('e25371e45267492b8d4ce1c7a9572dd3','2.jpg','/upload/image/20160504/775d71c9-d99b-43ff-b091-edd36d012017.jpg','/open/image/file/e25371e45267492b8d4ce1c7a9572dd3.jpg','/upload/image/20160504/775d71c9-d99b-43ff-b091-edd36d012017_m.jpg','/upload/image/20160504/775d71c9-d99b-43ff-b091-edd36d012017_s.jpg',300,300,0,1462347906);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('e832933e7d0746668ea82a7e1bdbad76','8.jpg','/upload/image/20160504/f867fcff-aded-4ae0-8815-c949b60f4f77.jpg','/open/image/file/e832933e7d0746668ea82a7e1bdbad76.jpg','/upload/image/20160504/f867fcff-aded-4ae0-8815-c949b60f4f77_m.jpg','/upload/image/20160504/f867fcff-aded-4ae0-8815-c949b60f4f77_s.jpg',300,300,0,1462350792);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('eaef3cc8c59e489ab0ab3dfbe02a2007','201601051454487968.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103.png','/open/image/file/eaef3cc8c59e489ab0ab3dfbe02a2007.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_m.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_s.png',418,418,0,1457598085);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('f0c71e49118e468da65c74b5e0d0f3ad','9.jpg','/upload/image/20160504/11080e75-efb7-4e97-8eaa-08cbfab73232.jpg','/open/image/file/f0c71e49118e468da65c74b5e0d0f3ad.jpg','/upload/image/20160504/11080e75-efb7-4e97-8eaa-08cbfab73232_m.jpg','/upload/image/20160504/11080e75-efb7-4e97-8eaa-08cbfab73232_s.jpg',300,300,0,1462352309);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('fba865467ef747759f32ee7b95fb46fa','792a83eac9f94ae6bece07b81972b526.jpg','/upload/image/20190610/1fb5ed93-556e-48d2-8802-f643bef509a5.jpg','/open/image/file/fba865467ef747759f32ee7b95fb46fa.jpg','/upload/image/20190610/1fb5ed93-556e-48d2-8802-f643bef509a5_m.jpg','/upload/image/20190610/1fb5ed93-556e-48d2-8802-f643bef509a5_s.jpg',600,600,0,1560142066);

/*Table structure for table `img_image_id__shop_goods_images` */

DROP TABLE IF EXISTS `img_image_id__shop_goods_images`;

CREATE TABLE `img_image_id__shop_goods_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_image_id__shop_goods_images` */

/*Table structure for table `img_image_id__shop_goods_lv_price_images` */

DROP TABLE IF EXISTS `img_image_id__shop_goods_lv_price_images`;

CREATE TABLE `img_image_id__shop_goods_lv_price_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_lv_price_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_image_id__shop_goods_lv_price_images` */

/*Table structure for table `shop_area` */

DROP TABLE IF EXISTS `shop_area`;

CREATE TABLE `shop_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `shop_area` */

insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (1,0,'0001','安徽省',NULL,0,1,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (2,1,'00010001','合肥市',NULL,0,1,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (3,2,'000100010001','庐阳区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (4,2,'000100010002','瑶海区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (5,2,'000100010003','蜀山区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (6,2,'000100010004','包河区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (7,2,'000100010005','经开区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (8,2,'000100010006','政务区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (9,2,'000100010007','高新区',NULL,0,0,0);
insert  into `shop_area`(`id`,`parentId`,`path`,`name`,`code`,`disabled`,`hasChildren`,`location`) values (10,2,'000100010008','滨湖新区',NULL,0,0,0);

/*Table structure for table `shop_config` */

DROP TABLE IF EXISTS `shop_config`;

CREATE TABLE `shop_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_templet` varchar(20) DEFAULT NULL,
  `shop_css` varchar(20) DEFAULT NULL,
  `shop_stock` int(11) DEFAULT NULL,
  `list_load_type` varchar(20) DEFAULT NULL,
  `list_page_size` int(11) DEFAULT NULL,
  `list_quick_buy` tinyint(1) DEFAULT NULL,
  `freight_disabled` tinyint(1) DEFAULT NULL,
  `freight_type` varchar(20) DEFAULT NULL,
  `freight_price` int(11) DEFAULT NULL,
  `freight_num` int(11) DEFAULT NULL,
  `tax_disabled` tinyint(1) DEFAULT NULL,
  `tax_price` int(11) DEFAULT NULL,
  `pay_cash` tinyint(1) DEFAULT NULL,
  `pay_money` tinyint(1) DEFAULT NULL,
  `pay_alipay` tinyint(1) DEFAULT NULL,
  `pay_alipay_info` longtext DEFAULT NULL,
  `pay_wxpay` tinyint(1) DEFAULT NULL,
  `pay_wxpay_info` longtext DEFAULT NULL,
  `member_sorce_open` tinyint(1) DEFAULT NULL,
  `member_reg_coupon` int(11) DEFAULT NULL,
  `member_reg_score` int(11) DEFAULT NULL,
  `member_weixinreg_auto` tinyint(1) DEFAULT NULL,
  `member_weixinreg_coupon` int(11) DEFAULT NULL,
  `member_weixinreg_score` int(11) DEFAULT NULL,
  `oauth_open` tinyint(1) DEFAULT NULL,
  `oauth_weixin` tinyint(1) DEFAULT NULL,
  `oauth_qq` tinyint(1) DEFAULT NULL,
  `oauth_qq_info` longtext DEFAULT NULL,
  `logistics_open` tinyint(1) DEFAULT NULL,
  `logistics_info` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_config` */

insert  into `shop_config`(`id`,`shop_templet`,`shop_css`,`shop_stock`,`list_load_type`,`list_page_size`,`list_quick_buy`,`freight_disabled`,`freight_type`,`freight_price`,`freight_num`,`tax_disabled`,`tax_price`,`pay_cash`,`pay_money`,`pay_alipay`,`pay_alipay_info`,`pay_wxpay`,`pay_wxpay_info`,`member_sorce_open`,`member_reg_coupon`,`member_reg_score`,`member_weixinreg_auto`,`member_weixinreg_coupon`,`member_weixinreg_score`,`oauth_open`,`oauth_weixin`,`oauth_qq`,`oauth_qq_info`,`logistics_open`,`logistics_info`) values (1,'default','green',50,'page',4,1,1,'price',8,1000,0,200,1,1,1,'{\"alipay_parter\":\"2088411890520875\",\"alipay_key\":\"fmo0y0t56k541itec79qt65x4oscmugj\",\"alipay_email\":\"chenggz@sunchn.com\"}',1,'{\"wxpay_appid\":\"wx17fe71227e1577d9\",\"wxpay_mchid\":\"1310090901\",\"wxpay_key\":\"SunChn8878dhdhd72hdvASdyxyyd3713\",\"wxpay_appsecret\":\"190550dda42029b952ee4273b8d4aec1\"}',1,1,600,1,2,500,1,1,1,'{\"qq_appid\":\"101308523\",\"qq_appkey\":\"6b9d3fc1d4856dcbc5b3dd96d7eef5f2\",\"qq_appcontent\":\"765754250763563070636\"}',NULL,NULL);

/*Table structure for table `shop_goods` */

DROP TABLE IF EXISTS `shop_goods`;

CREATE TABLE `shop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gn` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `priceMarket` int(11) DEFAULT NULL,
  `priceCost` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `buyMin` int(11) DEFAULT NULL,
  `buyMax` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `upAt` int(11) DEFAULT NULL,
  `downAt` int(11) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `prop` longtext DEFAULT NULL,
  `spec` longtext DEFAULT NULL,
  `is_spec` tinyint(1) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `buy_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gn` (`gn`),
  KEY `classid` (`classid`),
  KEY `updatedAt` (`updatedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods` */

insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (4,'G1603000001','有机蔬菜—香菇','绿色无公害',3800,4500,0,1000,'箱',43,0,1,0,14,0,0,'/open/image/file/849347a037c64db78a88fbae9a96835d.jpg',0,1560142018,NULL,'<p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160504/f2cca37c-12fc-43ee-934d-7a20aea1a29e.jpg\" title=\"1-1.jpg\" alt=\"1-1.jpg\"/></p><p><br/></p>','[]','[]',0,62,31,0,9,1,1560142018);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (6,'G1603000003','有机蔬菜—韭菜','单袋独立包装 清新爽口',300,500,0,1000,'袋',97,0,1,0,14,0,0,'/open/image/file/fba865467ef747759f32ee7b95fb46fa.jpg',0,1560142073,NULL,'<p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160504/e761e322-e6f5-416c-9b63-18eac4895488.jpg\" title=\"4-4.jpg\" alt=\"4-4.jpg\"/></p><p><br/></p>','[]','[]',0,6,3,0,0,1,1560142073);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (9,'G1603000006','有机蔬菜-苋菜','清晨采摘，当天配送，绿色健康，口感自然',1800,3500,0,1000,'袋',98,0,1,0,14,0,0,'/open/image/file/115935ffeec344eb86ff436b3c288409.jpg',0,1462355316,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/upload/image/20160504/07307a22-d63a-42be-b0f4-2ade9613705e.jpg\" title=\"2-2.jpg\" alt=\"2-2.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><hr style=\"margin: 20px 0px; padding: 0px; box-sizing: border-box; border-right-width: 0px; border-left-width: 0px; border-top-style: solid; border-top-color: rgb(238, 238, 238); border-bottom-style: solid; border-bottom-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p>','[]','[]',0,17,3,0,0,1,1462355316);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (10,'G1603000007','有机蔬菜-生菜','基地直采，新鲜直达，新品预售',800,1000,0,1000,'袋',97,0,1,0,14,0,0,'/open/image/file/ae7fd5bb939e4c14a611b449a40bed08.jpg',0,1462355306,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/upload/image/20160504/65861444-88d2-4465-b7d9-cce52820b0f2.jpg\" title=\"3-3.jpg\" alt=\"3-3.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p>','[]','[]',0,10,1,0,0,1,1462355306);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (11,'G1603000008','咸鸭蛋','2016年2月4日前订单，均年后配送！',2000,2200,0,1000,'袋',99,0,1,0,16,0,0,'/open/image/file/b4954f3cb20d40b6bce84297458f57d1.jpg',0,1462355294,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/ce32bb3f-ca72-4fdd-95c3-2eb4a72aa984.jpg\" title=\"8-8.jpg\" alt=\"8-8.jpg\"/></p>','[]','[]',0,0,1,0,0,1,1462355294);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (12,'G1603000009','有机黑木耳','2016年2月4日前订单，均年后配送',1800,1980,0,500,'盒',100,0,1,0,15,0,0,'/open/image/file/1c86bd35838945ebbac690075f141b49.jpg',0,1462355268,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/34b0691f-cf37-42a4-a41f-087dbc8e4cd5.jpg\" title=\"7-7.jpg\" alt=\"7-7.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462355268);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (13,'G1603000010','有机蔬菜—奶白菜','单袋独立包装 清新爽口',1200,1400,0,1000,'袋',99,0,1,0,14,0,0,'/open/image/file/dcb199d9cc7b4f59b929095cf573e4cf.jpg',0,1462355250,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/upload/image/20160504/6dbfdbb9-d60c-492a-86c7-66c82d0ea176.jpg\" title=\"6-6.jpg\" alt=\"6-6.jpg\"/></p>','[]','[]',0,1,1,0,0,1,1462355250);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (14,'G1603000011','有机蔬菜—西芹','基地直采，新鲜直达，新品预售',1200,1500,0,1000,'盒',100,0,1,0,14,0,0,'/open/image/file/c18148388fcd46bcab307d6d80de8370.jpg',0,1462355234,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/0567bf92-c495-4c00-a6ae-d051973168b1.jpg\" title=\"5-5.jpg\" alt=\"5-5.jpg\"/></p>','[]','[]',0,1,0,0,0,1,1462355234);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (16,'G1605000001','富硒米礼盒','有机富硒大米 富硒宝宝粥米',7500,8500,0,4000,'',0,0,1,100,13,0,0,'/open/image/file/9ee2884997814a8f8d6c2d4e0f92f15c.jpg',0,1462354962,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/d8eebfff-d06c-46ef-b925-ce302f40181b.jpg\" title=\"9-9.jpg\" alt=\"9-9.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462354962);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (17,'G1605000002','有机蔬菜-优加生活','有机蔬菜-优加生活',82900,99900,0,0,'',99,0,1,100,14,0,0,'/open/image/file/a6939a21b6b64764aace28ea0ea3cfeb.jpg',0,1462355224,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/e6345e2d-8740-4422-89b3-c47add13e1f5.jpg\" title=\"10-10.jpg\" alt=\"10-10.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462355224);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (18,'G1605000003','有机蔬菜-优加生活','有机蔬菜-优加生活',82900,99900,0,0,'',99,0,1,100,14,0,0,'/open/image/file/668cc99b91224caa820eef8525dee6fa.jpg',0,1462355214,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/2fd8812f-bffa-4fd1-a9df-4ea3413f449e.jpg\" title=\"11-11.jpg\" alt=\"11-11.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462355214);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (19,'G1605000004','有机蔬菜体验套餐','有机蔬菜体验套餐',13800,28800,0,0,'',99,0,1,100,14,0,0,'/open/image/file/c7bca66af25745449ad3387a70dc2d64.jpg',0,1462355204,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/a72a48bc-2d7f-489f-8956-3057d76aba50.jpg\" title=\"12-12.jpg\" alt=\"12-12.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462355204);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (20,'G1605000005','有机鸡蛋','有机鸡蛋',9800,12800,0,0,'箱',99,0,1,100,16,0,0,'/open/image/file/46ca947ea8654b6883e4220f335234bc.jpg',0,1462355171,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/e46211f1-1feb-4c23-a337-14ad4e621cef.jpg\" title=\"13-13.jpg\" alt=\"13-13.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462355171);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (21,'G1605000006','杂粮礼盒','杂粮礼盒',15800,18800,0,2850,'',0,0,1,100,13,0,0,'/open/image/file/1a5a51ae331a4c4dad8bb16fb64d68c0.jpg',0,1462354946,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160504/302704f8-c504-4f18-b583-d9422069b3ce.jpg\" title=\"14-14.jpg\" alt=\"14-14.jpg\"/></p>','[]','[]',0,0,0,0,0,1,1462354946);

/*Table structure for table `shop_goods_brand` */

DROP TABLE IF EXISTS `shop_goods_brand`;

CREATE TABLE `shop_goods_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_brand` */

insert  into `shop_goods_brand`(`id`,`name`,`note`,`alias`,`domain`,`picurl`,`location`) values (3,'苹果','<p>苹果</p>','苹果公司','http://www.apple.com','',NULL);

/*Table structure for table `shop_goods_class` */

DROP TABLE IF EXISTS `shop_goods_class`;

CREATE TABLE `shop_goods_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `is_index` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_class` */

insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (8,0,'0003','充值卡',NULL,1,0,0,3,1,1457333050,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (13,0,'0004','精品礼盒',NULL,0,0,1,0,1,1462354913,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (14,0,'0005','田园果蔬',NULL,0,0,1,0,1,1462355077,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (15,0,'0006','粮油干杂',NULL,0,0,1,0,1,1462355102,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (16,0,'0007','肉禽蛋品',NULL,0,0,0,0,1,1462355120,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (17,0,'0008','新鲜水果',NULL,0,0,0,0,1,1462355137,0);

/*Table structure for table `shop_goods_lv_price` */

DROP TABLE IF EXISTS `shop_goods_lv_price`;

CREATE TABLE `shop_goods_lv_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `lvid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_lv_price` */

insert  into `shop_goods_lv_price`(`id`,`goodsid`,`productid`,`lvid`,`price`) values (17,4,80,1,1);
insert  into `shop_goods_lv_price`(`id`,`goodsid`,`productid`,`lvid`,`price`) values (18,4,80,2,1);

/*Table structure for table `shop_goods_products` */

DROP TABLE IF EXISTS `shop_goods_products`;

CREATE TABLE `shop_goods_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gn` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `priceMarket` int(11) DEFAULT NULL,
  `priceCost` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `buyMin` int(11) DEFAULT NULL,
  `buyMax` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `upAt` int(11) DEFAULT NULL,
  `downAt` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gn` (`gn`),
  KEY `goodsid` (`goodsid`),
  KEY `classid` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_products` */

insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (78,'P1605000006','杂粮礼盒','',15800,18800,0,2850,'',0,0,1,100,21,13,0,0,NULL,0,1,1462354946,NULL,0,1,1462354946);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (79,'P1605000001','富硒米礼盒','',7500,8500,0,4000,'',0,0,1,100,16,13,0,0,NULL,0,1,1462354962,NULL,0,1,1462354962);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (80,'P1603000001','有机蔬菜—香菇','',3800,4500,0,1000,'箱',43,0,1,0,4,14,0,0,NULL,0,1,1560142018,NULL,0,1,1560142018);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (81,'P1605000005','有机鸡蛋','',9800,12800,0,0,'箱',99,0,1,100,20,16,0,0,NULL,0,1,1462355171,NULL,0,1,1462355171);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (82,'P1605000004','有机蔬菜体验套餐','',13800,28800,0,0,'',99,0,1,100,19,14,0,0,NULL,0,1,1462355204,NULL,0,1,1462355204);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (83,'P1605000003','有机蔬菜-优加生活','',82900,99900,0,0,'',99,0,1,100,18,14,0,0,NULL,0,1,1462355214,NULL,0,1,1462355214);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (84,'P1605000002','有机蔬菜-优加生活','',82900,99900,0,0,'',99,0,1,100,17,14,0,0,NULL,0,1,1462355224,NULL,0,1,1462355224);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (85,'P1603000011','有机蔬菜—西芹','',1200,1500,0,1000,'盒',100,0,1,0,14,14,0,0,NULL,0,1,1462355234,NULL,0,1,1462355234);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (86,'P1603000010','有机蔬菜—奶白菜','',1200,1400,0,1000,'袋',99,0,1,0,13,14,0,0,NULL,0,1,1462355250,NULL,0,1,1462355250);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (87,'P1603000009','有机黑木耳','',1800,1980,0,500,'盒',100,0,1,0,12,15,0,0,NULL,0,1,1462355268,NULL,0,1,1462355268);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (88,'P1603000008','咸鸭蛋','',2000,2200,0,1000,'袋',99,0,1,0,11,16,0,0,NULL,0,1,1462355294,NULL,0,1,1462355294);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (89,'P1603000007','有机蔬菜-生菜','',800,1000,0,1000,'袋',97,0,1,0,10,14,0,0,NULL,0,1,1462355306,NULL,0,1,1462355306);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (90,'P1603000006','有机蔬菜-苋菜','',1800,3500,0,1000,'袋',98,0,1,0,9,14,0,0,NULL,0,1,1462355316,NULL,0,1,1462355316);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (91,'P1603000003','有机蔬菜—韭菜','',300,500,0,1000,'袋',97,0,1,0,6,14,0,0,NULL,0,1,1560142073,NULL,0,1,1560142073);

/*Table structure for table `shop_goods_spec` */

DROP TABLE IF EXISTS `shop_goods_spec`;

CREATE TABLE `shop_goods_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_spec` */

insert  into `shop_goods_spec`(`id`,`name`,`type`,`memo`,`alias`,`location`) values (6,'存储大小',0,'','',0);
insert  into `shop_goods_spec`(`id`,`name`,`type`,`memo`,`alias`,`location`) values (7,'颜色',0,'','',0);

/*Table structure for table `shop_goods_spec_values` */

DROP TABLE IF EXISTS `shop_goods_spec_values`;

CREATE TABLE `shop_goods_spec_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spec_value` varchar(100) DEFAULT NULL,
  `spec_alias` varchar(10) DEFAULT NULL,
  `spec_picurl` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `specid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specid` (`specid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_spec_values` */

insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (9,'16G',NULL,NULL,0,6);
insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (10,'32G',NULL,NULL,1,6);
insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (11,'64G',NULL,NULL,2,6);
insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (12,'灰色',NULL,NULL,0,7);
insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (13,'银色',NULL,NULL,1,7);
insert  into `shop_goods_spec_values`(`id`,`spec_value`,`spec_alias`,`spec_picurl`,`location`,`specid`) values (14,'金色',NULL,NULL,2,7);

/*Table structure for table `shop_goods_type` */

DROP TABLE IF EXISTS `shop_goods_type`;

CREATE TABLE `shop_goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `is_physical` tinyint(1) DEFAULT NULL,
  `use_spec` tinyint(1) DEFAULT NULL,
  `use_props` tinyint(1) DEFAULT NULL,
  `use_params` tinyint(1) DEFAULT NULL,
  `use_tabs` tinyint(1) DEFAULT NULL,
  `params` longtext DEFAULT NULL,
  `tabs` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type` */

insert  into `shop_goods_type`(`id`,`name`,`alias`,`is_physical`,`use_spec`,`use_props`,`use_params`,`use_tabs`,`params`,`tabs`) values (14,'手机','',1,1,1,0,0,NULL,NULL);

/*Table structure for table `shop_goods_type_props` */

DROP TABLE IF EXISTS `shop_goods_type_props`;

CREATE TABLE `shop_goods_type_props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type_props` */

insert  into `shop_goods_type_props`(`id`,`name`,`type`,`location`,`typeid`) values (16,'网络制式','select',0,14);
insert  into `shop_goods_type_props`(`id`,`name`,`type`,`location`,`typeid`) values (17,'出厂年份','select',1,14);
insert  into `shop_goods_type_props`(`id`,`name`,`type`,`location`,`typeid`) values (18,'特性','input',2,14);

/*Table structure for table `shop_goods_type_props_values` */

DROP TABLE IF EXISTS `shop_goods_type_props_values`;

CREATE TABLE `shop_goods_type_props_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `propsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type_props_values` */

insert  into `shop_goods_type_props_values`(`id`,`name`,`location`,`propsid`) values (24,'3G',0,16);
insert  into `shop_goods_type_props_values`(`id`,`name`,`location`,`propsid`) values (25,'4G',1,16);
insert  into `shop_goods_type_props_values`(`id`,`name`,`location`,`propsid`) values (26,'2015',0,17);
insert  into `shop_goods_type_props_values`(`id`,`name`,`location`,`propsid`) values (27,'2016',1,17);
insert  into `shop_goods_type_props_values`(`id`,`name`,`location`,`propsid`) values (28,'2017',2,17);

/*Table structure for table `shop_goods_type_spec` */

DROP TABLE IF EXISTS `shop_goods_type_spec`;

CREATE TABLE `shop_goods_type_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `specid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`),
  KEY `specid` (`specid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type_spec` */

insert  into `shop_goods_type_spec`(`id`,`location`,`typeid`,`specid`) values (9,0,14,6);
insert  into `shop_goods_type_spec`(`id`,`location`,`typeid`,`specid`) values (10,1,14,7);

/*Table structure for table `shop_history_payments` */

DROP TABLE IF EXISTS `shop_history_payments`;

CREATE TABLE `shop_history_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `payNo` varchar(100) DEFAULT NULL,
  `payType` varchar(10) DEFAULT NULL,
  `payAt` int(11) DEFAULT NULL,
  `payName` varchar(100) DEFAULT NULL,
  `payAccount` varchar(100) DEFAULT NULL,
  `payIp` varchar(100) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `finishAt` int(11) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `memberId` (`memberId`),
  KEY `payAt` (`payAt`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `shop_history_payments` */

insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (1,'160327202852441',2,11690,NULL,'pay_money',1459135693,'余额支付','139****0212','::ffff:192.168.1.11',NULL,'余额支付:￥116.90',1459135693,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (2,'160327193950522',2,2490,NULL,'pay_money',1459136702,'余额支付','139****0212','::ffff:192.168.1.11',NULL,'余额支付:￥24.90',1459136702,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (3,'160328000796109',2,490,NULL,'pay_money',1459148877,'余额支付','139****0212','::ffff:192.168.1.11',NULL,'余额支付:￥4.90',1459148877,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (4,'160328000914081',2,490,NULL,'pay_money',1459148946,'余额支付','139****0212','::ffff:192.168.1.11',NULL,'余额支付:￥4.90',1459148946,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (5,'160328002284127',2,1,NULL,'pay_money',1459149768,'余额支付','139****0212','::ffff:192.168.1.11',NULL,'余额支付:￥0.01',1459149768,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (6,'160328234824432',2,3290,NULL,'pay_money',1459234101,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥32.90',1459234101,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (7,'160328234829558',2,18600,NULL,'pay_money',1459234116,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥186.00',1459234116,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (8,'160328235237573',2,1100,NULL,'pay_money',1459238399,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥11.00',1459238399,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (9,'160329012021935',2,16600,NULL,'pay_money',1459239613,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥166.00',1459239613,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (10,'160329012391966',2,16600,NULL,'pay_money',1459239834,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥166.00',1459239834,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (11,'160329201332257',2,2490,NULL,'pay_money',1459307606,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥24.90',1459307606,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (12,'160329201466512',2,34400,NULL,'pay_money',1459307646,'余额支付','大鲨鱼','::ffff:192.168.1.11',NULL,'余额支付:￥344.00',1459307646,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (13,'160329231792604',10,10251,NULL,'pay_money',1459318745,'余额支付','Wizzer','::ffff:192.168.1.11',NULL,'余额支付:￥102.51',1459318745,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (14,'160330020642016',10,2241,NULL,'pay_money',1459328775,'余额支付','Wizzer','::ffff:192.168.1.11',NULL,'余额支付:￥22.41',1459328775,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (15,'160409095692228',24,1,NULL,'pay_wxpay',1460166976,'微信网页支付','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','127.0.0.1',NULL,'微信网页支付:￥0.01',1460166976,'4005772001201604094671800815',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (16,'160410224325821',24,1,NULL,'pay_wxpay',1460299437,'微信网页支付','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','127.0.0.1',NULL,'微信网页支付:￥0.01',1460299437,'4005772001201604104724723468',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (17,'160427224824928',24,1,NULL,'pay_money',1461768537,'余额支付','Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>','114.97.194.70',NULL,'余额支付:￥0.01',1461768537,NULL,0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (18,'160429174146508',24,1,NULL,'pay_wxpay',1461922920,'微信网页支付','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','101.226.103.69',NULL,'微信网页支付:￥0.01',1461922920,'4005772001201604295344485348',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (19,'160503171606208',57,1,NULL,'pay_wxpay',1462267017,'微信扫码支付','oFTcHj4ohbc6MILbDaKtCGBSFjOI','101.226.103.61',NULL,'微信扫码支付:￥0.01',1462267017,'4002162001201605035473036170',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (20,'160503182633970',57,1,NULL,'pay_wxpay',1462271197,'微信扫码支付','oFTcHj4ohbc6MILbDaKtCGBSFjOI','101.226.103.61',NULL,'微信扫码支付:￥0.01',1462271197,'4002162001201605035474224393',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (21,'160503182784880',57,1,NULL,'pay_wxpay',1462271251,'微信扫码支付','oFTcHj4ohbc6MILbDaKtCGBSFjOI','101.226.103.61',NULL,'微信扫码支付:￥0.01',1462271251,'4002162001201605035475514572',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (22,'160503182734627',57,1,NULL,'pay_wxpay',1462271277,'微信扫码支付','oFTcHj4ohbc6MILbDaKtCGBSFjOI','101.226.103.61',NULL,'微信扫码支付:￥0.01',1462271277,'4002162001201605035474250991',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (23,'160503182850926',57,1,NULL,'pay_wxpay',1462271341,'微信扫码支付','oFTcHj4ohbc6MILbDaKtCGBSFjOI','101.226.103.61',NULL,'微信扫码支付:￥0.01',1462271341,'4002162001201605035474272043',0);
insert  into `shop_history_payments`(`id`,`orderId`,`memberId`,`money`,`payNo`,`payType`,`payAt`,`payName`,`payAccount`,`payIp`,`return_url`,`memo`,`finishAt`,`trade_no`,`disabled`) values (24,'160504133153723',57,1,NULL,'pay_alipay',1462339897,'支付宝支付','13956934521','110.75.225.241',NULL,'支付宝支付:￥0.01',1462339897,'2016050421001004120241576580',0);

/*Table structure for table `shop_history_refunds` */

DROP TABLE IF EXISTS `shop_history_refunds`;

CREATE TABLE `shop_history_refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `payNo` varchar(100) DEFAULT NULL,
  `payType` varchar(10) DEFAULT NULL,
  `payAt` int(11) DEFAULT NULL,
  `payName` varchar(100) DEFAULT NULL,
  `payAccount` varchar(100) DEFAULT NULL,
  `payIp` varchar(100) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `finishAt` int(11) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `memberId` (`memberId`),
  KEY `payAt` (`payAt`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_history_refunds` */

/*Table structure for table `shop_images` */

DROP TABLE IF EXISTS `shop_images`;

CREATE TABLE `shop_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

/*Data for the table `shop_images` */

insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (177,'/open/image/file/1a5a51ae331a4c4dad8bb16fb64d68c0.jpg',21);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (178,'/open/image/file/d86ccfd7a0094b9badff6256313a1933.jpg',21);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (179,'/open/image/file/86ddadded33f4c83b3e48e168f9a8738.jpg',21);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (180,'/open/image/file/9ee2884997814a8f8d6c2d4e0f92f15c.jpg',16);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (181,'/open/image/file/f0c71e49118e468da65c74b5e0d0f3ad.jpg',16);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (182,'/open/image/file/d9ad652f3074461799324b98f9d0f81e.jpg',16);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (186,'/open/image/file/46ca947ea8654b6883e4220f335234bc.jpg',20);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (187,'/open/image/file/03e6fd7202784a1891086c080b603d66.jpg',20);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (188,'/open/image/file/b135fb0dabb04b968dd4398e9199f404.jpg',20);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (189,'/open/image/file/c7bca66af25745449ad3387a70dc2d64.jpg',19);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (190,'/open/image/file/8939de7dc4d94d80bd513a5bec2e224b.jpg',19);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (191,'/open/image/file/8a866224eb1f40509bf1a916a07e29d7.jpg',19);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (192,'/open/image/file/668cc99b91224caa820eef8525dee6fa.jpg',18);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (193,'/open/image/file/cafc0a10a3654cce84b70606474bfcba.jpg',18);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (194,'/open/image/file/a70e408880f74d0aa6d547b43b437982.jpg',18);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (195,'/open/image/file/a6939a21b6b64764aace28ea0ea3cfeb.jpg',17);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (196,'/open/image/file/7a0bfa3f08024ce0a97f879e0f343e27.jpg',17);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (197,'/open/image/file/344297a4c21a48a78ef7439866ddf8dd.jpg',17);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (198,'/open/image/file/c18148388fcd46bcab307d6d80de8370.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (199,'/open/image/file/3ab11d172c25468fb4cda84b45a18e06.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (200,'/open/image/file/12fe51046d114027bf481680d1cd72c5.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (201,'/open/image/file/dcb199d9cc7b4f59b929095cf573e4cf.jpg',13);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (202,'/open/image/file/c2c662540c504f57a3eda04ecd7fa17c.jpg',13);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (203,'/open/image/file/7dbe07a44ec34cd9bb09f748cd6ee492.jpg',13);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (204,'/open/image/file/1c86bd35838945ebbac690075f141b49.jpg',12);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (205,'/open/image/file/a7bc0eec68d7421e8e208700ce8cfb9f.jpg',12);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (206,'/open/image/file/4b065c46c696446695976d9866128035.jpg',12);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (207,'/open/image/file/b4954f3cb20d40b6bce84297458f57d1.jpg',11);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (208,'/open/image/file/e832933e7d0746668ea82a7e1bdbad76.jpg',11);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (209,'/open/image/file/39f39a074b554b46815b1f86c83b7668.jpg',11);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (210,'/open/image/file/ae7fd5bb939e4c14a611b449a40bed08.jpg',10);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (211,'/open/image/file/3f5326303f564cb3af4c6d357a68f0ff.jpg',10);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (212,'/open/image/file/94167c39909c4035ac6d09088c170037.jpg',10);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (213,'/open/image/file/95c2403e60e24b4989016a43bfa26c4b.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (214,'/open/image/file/08e3f7304d3341eb9384ac5fd0d951e4.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (215,'/open/image/file/115935ffeec344eb86ff436b3c288409.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (219,'/open/image/file/849347a037c64db78a88fbae9a96835d.jpg',4);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (220,'/open/image/file/35cf105466034f8782e60444820a4024.jpg',4);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (221,'/open/image/file/fba865467ef747759f32ee7b95fb46fa.jpg',6);

/*Table structure for table `shop_member` */

DROP TABLE IF EXISTS `shop_member`;

CREATE TABLE `shop_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lv_id` int(11) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `b_year` int(11) DEFAULT NULL,
  `b_month` int(11) DEFAULT NULL,
  `b_day` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `money_freeze` int(11) DEFAULT NULL,
  `money_password` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `reg_ip` varchar(255) DEFAULT NULL,
  `reg_time` int(11) DEFAULT NULL,
  `reg_source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv_id` (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member` */

insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (2,2,'大鲨鱼','大鲨鱼',NULL,'安徽省','合肥市','瑶海区','瑶海区12122','13359011952',NULL,'',0,2016,3,1,2,429909,NULL,NULL,654,'::ffff:192.168.1.11',1457597717,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (23,1,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>','','http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0','安徽省','合肥市','蜀山区','',NULL,NULL,'',0,0,0,0,1,200000,0,NULL,0,'::ffff:192.168.1.11',1459845052,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (24,1,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',NULL,'http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0','安徽省','合肥市','蜀山区',NULL,'13359011952',NULL,NULL,2,0,0,0,1,200000,0,NULL,300,'127.0.0.1',1459848852,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (25,2,'Veaver 程恭囸',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchTlbveDJ1PM2kThqDjxf2Ull2uvuKSYK4Z4AoIZrf5cCiaLWbfM4ev4ibmM3kbCxI2d0VMv1NvXtIj/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,1000000,0,NULL,500,'127.0.0.1',1460116266,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (26,2,'一一',NULL,'http://wx.qlogo.cn/mmopen/PiajxSqBRaELTVy5TEVQwZ88tOxGXTRF8R8cQwAvfbaG4r6ibmlkutelzkXibJiaEKMFIwHZ3sXUml2xcvrWiahu15w/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460116330,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (27,2,'ShoutLeaf',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchdOghibTb1tyMFWjNzXGQcJYaJsG1wPggbO5R5UOKgibWHn8JEpW3ukFsiax6ZEE5QyMAbX0AItyoL7/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460116366,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (28,2,'cheney',NULL,'http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKXv6NhR3Flccu6qE1yriawDDPlGGB15u7bs7DAhAwGySDkTZXvO81sAQ5VVBRp5mPe5TBkSbXo7ys/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,0,'127.0.0.1',1460116396,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (29,2,'陌上',NULL,'http://wx.qlogo.cn/mmopen/SYeWkon6C6IkHGDKsBx31moWicJynpEb3hzicSicWicgltNLWkPcobUU09nVmEF8pj4ialhib7klVvddxicFiciaeBUyMvw/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460116404,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (30,2,'草下的云',NULL,'http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKVbyMIusync4DibVNmHOwo4jDSxtypce1G6sNjQxSFpIcreIOyia5bxkRbgI4Zibsh9URnA3EdickgEF/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460116410,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (31,2,'小鱼宮主',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchUUlibn7w4bkMDnU2Wva6Rq4GYfZk8MCBIZ6QVxZT9LuhH69nfJmU6lTQianUl8mdqcEU9TogPgJbX/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460117357,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (32,2,'朵朵',NULL,'http://wx.qlogo.cn/mmopen/2ns9cM4KERz7BJQo1b4zdZbWx2hna3Hc0gbGbw8lxDzKryvTeAib3MKojZmVsX3j0btWK4D6HL4VPSwMRxdnteHTEmUoE0bGG/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,NULL,500,'127.0.0.1',1460117377,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (33,2,'dzy',NULL,'http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY1gRRpGPgpibqO33XmdYLvq5v7rVXSkssZdc1lMafBO1x5ZQkXrR6bdW0yrS7RBicTxy4a07orZQf7/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460117626,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (34,2,'QFish',NULL,'http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY7feiciaCTExKstf3X5HYLMeZ1q0Vvre1DxPV6yjzwdUykwBPOOYibJJnJAdyDN0MicgxtpF3GCkZTc4/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460117634,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (35,2,'宋磊',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OMV2KujgcK0o5cNYsJXDFx3DcVvtPreicEoG8tKSvt1AaupW8xJogXxfKlVhHpug3sZgERAldicwRhY50EZ0rUtMQ/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460117727,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (36,2,'天涯',NULL,'http://wx.qlogo.cn/mmopen/ajR8G6R65SKv5CbiaEKWq8Eu1O4kkFpRSMOE1OEW6CkHFu8GW4HfZ5tPcXQlXntIw6eURro0SgK9tAqGb2Kp1ry43laG3u7fR/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460121890,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (37,2,'JING<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',NULL,'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAxfTIy3rMcv2en1AubBV2YkvvQr5C4uFzdmPnKqxPaJEMItticAg6FM0K66jl8TfUX3RNr19sNDgA/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460122002,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (38,2,'132****2559',NULL,NULL,NULL,NULL,NULL,NULL,'13269362559',NULL,NULL,0,0,0,0,0,0,0,NULL,600,'127.0.0.1',1460124137,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (39,2,'跨越七海的风',NULL,'http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H8pIpHfRmEoVMYI2tMkLfWUziaeI7TUGYFbhQ9bIySme5ud62ZIrYhpS8zMYk6CGkHKwG9Ru8dFfh/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460170611,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (40,2,'<span class=\"emoji emoji1f49c\" title=\"purple heart\"></span>',NULL,'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7UNuictRaV29hcBMtQwGwBeu2wBo61ibr87VZ3jnuDYrYqwiauL5a5iahykynUaZovuG99MOiaSLTtCPg/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460190058,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (41,2,'瑞瑞<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',NULL,'http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKciaL3gUyeTWtsL6S88Jr84GkzvWDKuZblOXG5DzD8Wlr0DkJrhK9OibS44nibRMLXYGyFBBUBds4GT/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460300085,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (42,2,'不动·峰',NULL,'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKoIbzYeupKwSsdibSdJ4M8YTw16Pj4hwMuIOKPE1VxJHrR3MVMPmaCAUYDiasDItPEJAnDcIiad71yg/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460384065,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (43,2,'AA<span class=\"emoji emoji1f47c\" title=\"baby angel\"></span><span class=\"emoji emoji2601\" title=\"clou',NULL,'http://wx.qlogo.cn/mmopen/SYeWkon6C6JjrFwGdtVTfbz0icLCXbrvjtSz2vYJ88k8szjl4MggMKDAAibs0Vzav77snChlh0dsK370Vws1zvSg/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,2,0,0,NULL,500,'127.0.0.1',1460385597,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (44,2,'九天',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchbsPib3jU3zscUs4rfKSm5IpjvBIGCDcjsv3OmSMAzulSVaMo0vmBKxtwESTyrtDEZodsa3E5GKhX/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1460387137,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (45,2,'138****8316',NULL,NULL,NULL,NULL,NULL,NULL,'13816938316',NULL,NULL,0,0,0,0,0,0,0,NULL,100,'127.0.0.1',1460422262,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (46,2,'137****1091',NULL,NULL,NULL,NULL,NULL,NULL,'13771931091',NULL,NULL,0,0,0,0,0,0,0,NULL,600,'127.0.0.1',1460600103,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (47,2,'YXH',NULL,'http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchfOzmciaYyn3I0fyxaTibaORfI5V8HumDnlyKHX6xAmQtXLjwWMLcPhlEwfn9fibSNqWzYYJEhfoJ1y/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'127.0.0.1',1461328687,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (48,2,'186****3178',NULL,NULL,NULL,NULL,NULL,NULL,'18656133178',NULL,NULL,0,0,0,0,0,0,0,NULL,600,'127.0.0.1',1461719679,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (49,2,'Pepsi Cole',NULL,'http://wx.qlogo.cn/mmopen/SYeWkon6C6LEFOMspQH1FVnOmuZzTgjc2Hunbd4dPO7ibWdU8qo6fex31dBmpqShWAvQXyShjOLZyhJYQicdnCpA/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,50000,0,NULL,600,'112.25.224.126',1461842276,'oauth_weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (50,2,'大鲨鱼',NULL,'http://q.qlogo.cn/qqapp/101308523/ACF252EEAD6C6D60B2DA9EF69510DBA1/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'60.168.95.96',1462244815,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (51,2,'上城_陈全来',NULL,'http://q.qlogo.cn/qqapp/101308523/508E6AECC04B5B593D6561AFDB1FF0F6/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'60.168.95.96',1462244857,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (52,2,'你妈妈',NULL,'http://q.qlogo.cn/qqapp/101308523/8530653CFE01D047E00E16FCE13F43CF/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'14.17.22.35',1462257323,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (53,2,'春风化雨',NULL,'http://q.qlogo.cn/qqapp/101308523/60D9F42BE4E652F15A52ACDAD55911F2/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'183.12.170.135',1462258279,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (54,2,'丢丢',NULL,'http://q.qlogo.cn/qqapp/101308523/C79C45891799ACB388B69A3BC2BA2ADA/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'223.240.105.213',1462258336,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (55,2,'朱礼明',NULL,'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6QMdKtFITwGCDgUL8Na5ichucL088OCqFjuib4anBd94YRkicicoAnHic6XLsMPIgGNcrHFPrgfATjosA/0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,500,'101.226.62.82',1462258482,'weixin');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (56,2,'上城-陈伟光',NULL,'http://q.qlogo.cn/qqapp/101308523/6C9512B7E32D937B0B44B663ADB2DBA4/40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,NULL,600,'223.240.105.213',1462260360,'oauth_qq');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (57,2,'139****4521',NULL,NULL,NULL,NULL,NULL,NULL,'13956934521',NULL,NULL,6,0,0,0,0,0,0,NULL,600,'223.240.105.213',1462266900,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (58,2,'133****3631',NULL,NULL,NULL,NULL,NULL,NULL,'13365693631',NULL,NULL,0,0,0,0,0,10000000,0,NULL,600,'221.130.129.138',1462352292,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (59,2,'cheney',NULL,'http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKXv6NhR3Flccu6qE1yriawDDPlGGB15u7bs7DAhAwGySDkTZXvO81sAQ5VVBRp5mPe5TBkSbXo7ys/0',NULL,NULL,NULL,NULL,'15705607680',NULL,NULL,0,0,0,0,1,25000,0,NULL,1100,'60.168.87.124',1462352319,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (60,2,'180****0696',NULL,NULL,NULL,NULL,NULL,NULL,'18055150696',NULL,NULL,0,0,0,0,0,25000,0,NULL,600,'61.190.92.179',1462352406,'pc');

/*Table structure for table `shop_member_account` */

DROP TABLE IF EXISTS `shop_member_account`;

CREATE TABLE `shop_member_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `login_name` varchar(100) DEFAULT NULL,
  `login_password` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `loginIp` varchar(100) DEFAULT NULL,
  `loginAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_account` */

insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (2,23,'13956990212','w72ec67793cb0ae09d501831267a3a9f',0,1457597717,'127.0.0.1',1460618739);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (9,24,'13359011952','w309549e3f1a024f366310b2d4e87bcb',0,1459848852,'::ffff:127.0.0.1',1560142769);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (10,38,'13269362559','waaccfa8a8e7851d253e31b05c4b2073',0,1460124137,NULL,0);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (11,45,'13816938316','w926582bc8d843f1112fc3171b3695f1',0,1460422262,'127.0.0.1',1460422443);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (12,46,'13771931091','wcb1d83c8ac766fb2661bbc32d5097bf',0,1460600103,'127.0.0.1',1461030308);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (13,48,'18656133178','w9eb6657b333dd0fe7107bcd3db56fd4',0,1461719679,'60.168.87.124',1462331318);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (14,57,'13956934521','we401dbe8a24ae1ee29d1fc55287f643',0,1462266900,'60.168.87.124',1462339839);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (15,58,'13365693631','wb19fa989c1dbd6ed473548f88b450fd',0,1462352292,NULL,0);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (16,59,'15705607680','waa50ddb518c202364b5d9f32353222d',0,1462352319,NULL,0);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (17,60,'18055150696','w139f6b2a3b51224eb0d811c03283a43',0,1462352406,NULL,0);

/*Table structure for table `shop_member_addr` */

DROP TABLE IF EXISTS `shop_member_addr`;

CREATE TABLE `shop_member_addr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `postcode` varchar(6) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_addr` */

insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (1,24,'大鲨鱼','13359011952','安徽省','合肥市','蜀山区','黄山路南京啊','',1,1460113579);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (2,35,'后哦','17862967060','安徽省','合肥市','包河区','是哈哈哈哈了','，喝',0,1460118362);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (3,35,'后哦','17862967060','安徽省','合肥市','包河区','是哈哈哈哈了','，喝',1,1460118363);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (4,24,'陈全来','13359011952','安徽省','合肥市','蜀山区','合作化南路与','',1,1460166951);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (5,45,'Xu','13816938316','安徽省','合肥市','高新区','科学大道888号','',1,1460422359);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (6,46,'桂芬','13771931091','安徽省','合肥市','蜀山区','黄山路599号时代数码港1202室','',1,1460600196);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (7,30,'董丹丹','13665448671','安徽省','合肥市','蜀山区','时代数码港','',1,1461211686);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (8,59,'啊啊啊','15705607682','安徽省','合肥市','包河区','高铁站南边','',1,1462243624);
insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (9,57,'测试收货人1号','13956934521','安徽省','合肥市','蜀山区','时代数码港','444444',1,1462266992);

/*Table structure for table `shop_member_bind` */

DROP TABLE IF EXISTS `shop_member_bind`;

CREATE TABLE `shop_member_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `bind_type` varchar(20) DEFAULT NULL,
  `bind_openid` varchar(100) DEFAULT NULL,
  `bind_nickname` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `binded` tinyint(1) DEFAULT NULL,
  `bindedAt` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bind_openid` (`bind_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_bind` */

insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (3,24,'weixin','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',0,1,NULL,1459845052);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (4,25,'weixin','oFTcHjzXKRfN1fSC_JNKxxeWUa74','Veaver 程恭囸',0,0,NULL,1460116266);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (5,26,'weixin','oFTcHj6RHWas-H1AVZauQEPpSMzE','一一',0,0,NULL,1460116330);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (6,27,'weixin','oFTcHj4ohbc6MILbDaKtCGBSFjOI','ShoutLeaf',0,0,NULL,1460116366);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (7,59,'weixin','oFTcHjxqM7QNpFO5M98vsPrCCnV8','cheney',0,1,NULL,1460116396);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (8,29,'weixin','oFTcHj7fxfVIztyBExCdgsonz9iE','陌上',0,0,NULL,1460116404);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (9,30,'weixin','oFTcHj1dQYvR-oc6T4xBPmTdsDf8','草下的云',0,0,NULL,1460116410);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (10,31,'weixin','oFTcHj0YrNElJvfT-SNtOfhTymW8','小鱼宮主',0,0,NULL,1460117357);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (11,32,'weixin','oFTcHj-sb7d-omx3Oa6nki5UbctU','朵朵',0,0,NULL,1460117377);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (12,33,'weixin','oFTcHjz7fsizTTQMyfo3PlhW_9Xc','dzy',0,0,NULL,1460117626);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (13,34,'weixin','oFTcHj_pYIVZbZ3To64jiMFDPYtg','QFish',0,0,NULL,1460117634);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (14,35,'weixin','oFTcHj2oTtsNHnGhMQjm4stN0jtw','宋磊',0,0,NULL,1460117727);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (15,36,'weixin','oFTcHj5tbqhtlJQ3aih1QZgeIFCo','天涯',0,0,NULL,1460121890);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (16,37,'weixin','oFTcHj_Jy1uObYDe29ek6C5NqAhs','JING<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',0,0,NULL,1460122002);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (17,39,'weixin','oFTcHjxSYXJHN1B5hfbC3Ssj4zGA','跨越七海的风',1,0,NULL,1460170611);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (18,40,'weixin','oFTcHj2m7RrTjYUHulby-viG08hs','<span class=\"emoji emoji1f49c\" title=\"purple heart\"></span><span class=\"emoji emoji1f49c\" title=\"pur',0,0,NULL,1460190058);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (19,41,'weixin','oFTcHj_AZtAgnoTuOGlyUSwedHWk','瑞瑞<span class=\"emoji emoji1f60a\" title=\"smiling face with smiling eyes\"></span>',0,0,NULL,1460300085);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (20,42,'weixin','oFTcHjzBfpxS7ckD5SeaI0AP32u8','不动·峰',0,0,NULL,1460384065);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (21,43,'weixin','oFTcHjxt5f3rdqcdhRK777J5hRIM','AA<span class=\"emoji emoji1f47c\" title=\"baby angel\"></span><span class=\"emoji emoji2601\" title=\"clou',0,0,NULL,1460385597);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (22,44,'weixin','oFTcHjyEwQinc9d2W9CAmCgyMLOU','九天',0,0,NULL,1460387137);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (23,47,'weixin','oFTcHj-FFo9NlHk8qnUFJ4dZ_OTk','YXH',0,0,NULL,1461328687);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (24,49,'weixin','oFTcHj0yw4SSfg_A7jSllkbq3TSg','Pepsi Cole',0,0,NULL,1461842276);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (25,50,'qq','ACF252EEAD6C6D60B2DA9EF69510DBA1','大鲨鱼',0,0,NULL,1462244815);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (26,51,'qq','508E6AECC04B5B593D6561AFDB1FF0F6','上城_陈全来',0,0,NULL,1462244857);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (27,52,'qq','8530653CFE01D047E00E16FCE13F43CF','你妈妈',0,0,NULL,1462257323);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (28,53,'qq','60D9F42BE4E652F15A52ACDAD55911F2','春风化雨',0,0,NULL,1462258279);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (29,54,'qq','C79C45891799ACB388B69A3BC2BA2ADA','丢丢',0,0,NULL,1462258336);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (30,55,'weixin','oFTcHj7NoeCpa2A4e84-mouuVjVc','朱礼明',0,0,NULL,1462258482);
insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (31,56,'qq','6C9512B7E32D937B0B44B663ADB2DBA4','上城-陈伟光',0,0,NULL,1462260360);

/*Table structure for table `shop_member_cart` */

DROP TABLE IF EXISTS `shop_member_cart`;

CREATE TABLE `shop_member_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_buy` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `goodsId` (`goodsId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_cart` */

insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (2,10,4,30,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1,2241,1000,1,1459330921);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (3,10,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',17,4320,1200,0,1459412536);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (4,10,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',9,8010,3000,0,1459412542);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (5,10,14,26,'阿根廷红虾L4 (2kg)','','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',7,21150,800,0,1459413785);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (6,10,6,27,'即食木耳（中辣）45g','','/open/image/file/6f963b00383449ae87e674fdba40be29.png',2,270,45,0,1459414216);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (7,11,6,27,'即食木耳（中辣）45g','','/open/image/file/6f963b00383449ae87e674fdba40be29.png',7,270,45,0,1459484189);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (9,11,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',11,4560,1200,0,1459488489);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (10,11,14,26,'阿根廷红虾L4 (2kg)','','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',12,21150,800,0,1459488489);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (11,11,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',11,8455,3000,0,1459488489);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (12,11,15,42,'秭归血橙新鲜预售（礼盒装）','','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',3,3610,2250,0,1459499455);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (13,11,8,15,'独头黑蒜（礼盒装）20枚','','/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',3,9405,260,0,1459499963);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (14,11,12,19,'乌鸡蛋（6枚装）','','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',1,1710,500,0,1459501176);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (15,11,4,41,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1,2365,1000,0,1459502359);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (16,13,4,41,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',6,2490,1000,0,1459506552);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (17,13,15,42,'秭归血橙新鲜预售（礼盒装）','','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',1,3800,2250,0,1459506552);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (18,14,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',68,4320,1200,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (19,14,12,19,'乌鸡蛋（6枚装）','','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',3,1620,500,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (20,14,14,26,'阿根廷红虾L4 (2kg)','','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',54,21150,800,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (21,14,4,30,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',6,2241,1000,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (22,14,4,41,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',16,2241,1000,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (23,14,6,27,'即食木耳（中辣）45g','','/open/image/file/6f963b00383449ae87e674fdba40be29.png',51,270,45,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (24,14,11,18,'竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','','/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',2,15120,1500,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (25,14,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',69,8010,3000,0,1459827987);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (28,25,4,44,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1,1,1000,1,1460116449);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (30,29,4,44,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',2,1,1000,1,1460116522);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (32,36,6,27,'即食木耳（中辣）45g','','/open/image/file/6f963b00383449ae87e674fdba40be29.png',1,270,45,1,1460121947);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (34,59,12,19,'乌鸡蛋（6枚装）','','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',2,1620,500,0,1460123538);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (35,38,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',34,8010,3000,1,1460124314);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (36,38,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1,4320,1200,1,1460124320);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (37,38,4,44,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',30,1,1000,1,1460124322);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (38,38,13,25,'五常稻花香龙稻尚品大米2.5kg','','/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',28,4410,1000,1,1460124340);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (39,38,14,26,'阿根廷红虾L4 (2kg)','','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',10,21150,800,1,1460124350);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (45,45,14,26,'阿根廷红虾L4 (2kg)','','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',14,21150,800,0,1460424674);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (47,48,4,44,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1,1,1000,0,1461719688);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (48,48,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',2,8010,3000,1,1461720630);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (53,24,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',3,8455,3000,0,1461839612);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (54,24,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',2,4560,1200,0,1461839612);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (61,50,9,29,'绿格自然栽培果蔬包6~8斤','','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1,8010,3000,0,1462261132);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (70,59,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1,4320,1200,0,1462352319);
insert  into `shop_member_cart`(`id`,`memberId`,`goodsId`,`productId`,`name`,`spec`,`imgurl`,`num`,`price`,`weight`,`is_buy`,`createdAt`) values (73,58,12,64,'有机黑木耳','','/open/image/file/1c86bd35838945ebbac690075f141b49.jpg',1,1620,500,0,1462352564);

/*Table structure for table `shop_member_comment` */

DROP TABLE IF EXISTS `shop_member_comment`;

CREATE TABLE `shop_member_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  `memberNickname` varchar(100) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `orderId` varchar(20) DEFAULT NULL,
  `createIp` varchar(255) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `replyId` int(11) DEFAULT NULL,
  `replyNickname` varchar(100) DEFAULT NULL,
  `replyNote` varchar(500) DEFAULT NULL,
  `replyAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `goodsId` (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_comment` */

insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (1,1,3,'嘎嘎嘎',NULL,10,'Wizzer',4,30,'2147483647','::ffff:192.168.1.11',1459326655,0,NULL,NULL,NULL,0);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (2,1,3,'嘎嘎嘎嘎',NULL,10,'Wizzer',4,30,'160329231792604','::ffff:192.168.1.11',1459326819,0,NULL,NULL,NULL,0);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (3,1,2,'低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒',NULL,10,'Wizzer',9,29,'160329231792604','::ffff:192.168.1.11',1459327733,0,NULL,NULL,NULL,0);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (4,1,1,'产品还行吧~~不是我的菜',NULL,10,'Wizzer',4,30,'160330015380732','::ffff:192.168.1.11',1459328116,0,NULL,NULL,NULL,0);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (5,1,2,'',NULL,10,'Wizzer',10,28,'160330020153694','::ffff:192.168.1.11',1459328555,0,NULL,NULL,NULL,1);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (6,1,1,'一般般~~',NULL,10,'Wizzer',4,30,'160330020153694','::ffff:192.168.1.11',1459328560,0,NULL,NULL,NULL,1);
insert  into `shop_member_comment`(`id`,`type`,`score`,`comment`,`contact`,`memberId`,`memberNickname`,`goodsId`,`productId`,`orderId`,`createIp`,`createdAt`,`replyId`,`replyNickname`,`replyNote`,`replyAt`,`disabled`) values (7,1,3,'@！！！！\'\"\",\'\'\\\\//',NULL,10,'Wizzer',4,30,'160330020642016','::ffff:192.168.1.11',1459328812,0,NULL,NULL,NULL,1);

/*Table structure for table `shop_member_coupon` */

DROP TABLE IF EXISTS `shop_member_coupon`;

CREATE TABLE `shop_member_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `couponId` int(11) DEFAULT NULL,
  `couponName` varchar(100) DEFAULT NULL,
  `couponPrice` int(11) DEFAULT NULL,
  `orderId` varchar(20) DEFAULT NULL,
  `orderAt` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `couponId` (`couponId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_coupon` */

insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (3,10,2,'10元',1000,NULL,NULL,0,1459316570);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (4,11,2,'10元',1000,NULL,NULL,0,1459476227);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (5,11,2,'10元',1000,NULL,NULL,0,1459488524);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (6,13,1,'20元',2000,NULL,NULL,0,1459506552);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (7,14,1,'20元',2000,NULL,NULL,0,1459827987);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (8,15,1,'20元',2000,NULL,NULL,0,1459828439);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (9,16,1,'20元',2000,NULL,NULL,0,1459828677);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (10,17,1,'20元',2000,NULL,NULL,0,1459828888);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (11,18,2,'10元',1000,NULL,NULL,0,1459844395);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (12,19,2,'10元',1000,NULL,NULL,0,1459844453);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (13,21,2,'10元',1000,NULL,NULL,0,1459844887);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (14,22,2,'10元',1000,NULL,NULL,0,1459845015);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (15,24,2,'10元',1000,'160426165496064',1461660848,1,1459845052);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (16,25,2,'10元',1000,NULL,NULL,0,1460116266);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (17,24,2,'10元',1000,NULL,NULL,0,1460116329);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (18,26,2,'10元',1000,NULL,NULL,0,1460116330);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (19,27,2,'10元',1000,NULL,NULL,0,1460116366);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (20,59,2,'10元',1000,NULL,NULL,0,1460116396);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (21,29,2,'10元',1000,NULL,NULL,0,1460116404);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (22,30,2,'10元',1000,NULL,NULL,0,1460116410);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (23,31,2,'10元',1000,NULL,NULL,0,1460117357);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (24,32,2,'10元',1000,NULL,NULL,0,1460117378);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (25,33,2,'10元',1000,NULL,NULL,0,1460117626);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (26,34,2,'10元',1000,NULL,NULL,0,1460117634);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (27,35,2,'10元',1000,NULL,NULL,0,1460117727);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (28,36,2,'10元',1000,NULL,NULL,0,1460121890);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (29,37,2,'10元',1000,NULL,NULL,0,1460122002);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (30,38,1,'20元',2000,NULL,NULL,0,1460124137);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (31,39,2,'10元',1000,NULL,NULL,0,1460170611);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (32,40,2,'10元',1000,NULL,NULL,0,1460190058);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (33,41,2,'10元',1000,NULL,NULL,0,1460300085);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (34,42,2,'10元',1000,NULL,NULL,0,1460384065);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (35,43,2,'10元',1000,NULL,NULL,0,1460385597);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (36,44,2,'10元',1000,NULL,NULL,0,1460387137);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (37,45,1,'20元',2000,'160412085820566',1460422684,1,1460422262);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (38,45,1,'20元',2000,NULL,NULL,0,1460422527);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (39,46,1,'20元',2000,'160414101648905',1460600200,1,1460600103);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (40,47,2,'10元',1000,NULL,NULL,0,1461328687);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (41,48,1,'20元',2000,NULL,NULL,0,1461719679);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (42,49,1,'20元',2000,NULL,NULL,0,1461842276);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (43,50,1,'20元',2000,NULL,NULL,0,1462244815);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (44,51,1,'20元',2000,NULL,NULL,0,1462244857);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (45,52,1,'20元',2000,NULL,NULL,0,1462257323);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (46,53,1,'20元',2000,NULL,NULL,0,1462258279);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (47,54,1,'20元',2000,NULL,NULL,0,1462258336);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (48,55,2,'10元',1000,NULL,NULL,0,1462258482);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (49,56,1,'20元',2000,NULL,NULL,0,1462260360);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (50,57,1,'20元',2000,NULL,NULL,0,1462266900);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (51,58,1,'20元',2000,NULL,NULL,0,1462352292);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (52,59,1,'20元',2000,NULL,NULL,0,1462352319);
insert  into `shop_member_coupon`(`id`,`memberId`,`couponId`,`couponName`,`couponPrice`,`orderId`,`orderAt`,`status`,`createdAt`) values (53,60,1,'20元',2000,NULL,NULL,0,1462352406);

/*Table structure for table `shop_member_lv` */

DROP TABLE IF EXISTS `shop_member_lv`;

CREATE TABLE `shop_member_lv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lv_type` varchar(20) DEFAULT NULL,
  `lv_logo` varchar(255) DEFAULT NULL,
  `dis_count` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `expiretime` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_lv` */

insert  into `shop_member_lv`(`id`,`name`,`lv_type`,`lv_logo`,`dis_count`,`point`,`expiretime`,`disabled`) values (1,'一级会员','member',NULL,95,300,NULL,0);
insert  into `shop_member_lv`(`id`,`name`,`lv_type`,`lv_logo`,`dis_count`,`point`,`expiretime`,`disabled`) values (2,'二级会员','member',NULL,90,500,NULL,0);

/*Table structure for table `shop_member_money_log` */

DROP TABLE IF EXISTS `shop_member_money_log`;

CREATE TABLE `shop_member_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `orderId` varchar(20) DEFAULT NULL,
  `oldMoney` int(11) DEFAULT NULL,
  `newMoney` int(11) DEFAULT NULL,
  `diffMoney` int(11) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_money_log` */

insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (1,2,'160327202852441',500000,488310,11690,NULL,'支付订单:160327202852441',0,1459135693);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (2,2,'160327193950522',488310,485820,2490,NULL,'支付订单:160327193950522',0,1459136702);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (3,2,'160327193950522',485820,488310,2490,NULL,'取消订单:160327193950522',0,1459140221);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (4,2,'160328000796109',488310,487820,490,NULL,'支付订单:160328000796109',0,1459148877);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (5,2,'160328000796109',487820,488310,490,NULL,'取消订单:160328000796109',0,1459148882);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (6,2,'160328000914081',488310,487820,490,NULL,'支付订单:160328000914081',0,1459148946);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (7,2,'160328000914081',487820,488310,490,NULL,'取消订单:160328000914081',0,1459148973);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (8,2,'160328002284127',488310,488309,1,NULL,'支付订单:160328002284127',0,1459149768);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (9,2,'160327202852441',488309,499999,11690,NULL,'取消订单:160327202852441',0,1459234055);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (10,2,'160328234824432',499999,496709,3290,NULL,'支付订单:160328234824432',0,1459234101);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (11,2,'160328234829558',496709,478109,18600,NULL,'支付订单:160328234829558',0,1459234116);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (12,2,'160328234829558',478109,496709,18600,NULL,'取消订单:160328234829558',0,1459234124);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (13,2,'160328234824432',496709,499999,3290,NULL,'取消订单:160328234824432',0,1459234126);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (14,2,'160328235237573',499999,498899,1100,NULL,'支付订单:160328235237573',0,1459238400);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (15,2,'160328235237573',498899,499999,1100,NULL,'取消订单:160328235237573',0,1459239181);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (16,2,'160329012021935',499999,483399,16600,NULL,'支付订单:160329012021935',0,1459239613);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (17,2,'160329012391966',483399,466799,16600,NULL,'支付订单:160329012391966',0,1459239834);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (18,2,'160329201332257',466799,464309,2490,NULL,'支付订单:160329201332257',0,1459307606);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (19,2,'160329201466512',464309,429909,34400,NULL,'支付订单:160329201466512',0,1459307646);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (20,10,'160329231792604',200000,189749,10251,NULL,'支付订单:160329231792604',0,1459318745);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (21,10,'160330020642016',189749,187508,2241,NULL,'支付订单:160330020642016',0,1459328775);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (22,25,'0',0,1000000,1000000,'','管理员操作:+10000',1,1461660501);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (23,24,'0',0,200000,200000,'','管理员操作:',1,1461734650);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (24,23,'0',0,200000,200000,'','管理员操作:',1,1461734656);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (25,24,'0',200000,200001,1,'4005772001201604275275346456','余额充值(微信网页支付)',0,1461743334);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (26,24,'160427224824928',200001,200000,1,NULL,'支付订单:160427224824928',0,1461768537);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (27,49,'0',0,50000,50000,'','管理员操作:',1,1461847239);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (28,58,'0',0,10000000,10000000,'','管理员操作:打赏',1,1462352501);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (29,59,'0',0,25000,25000,'','管理员操作:打赏',1,1462352887);
insert  into `shop_member_money_log`(`id`,`memberId`,`orderId`,`oldMoney`,`newMoney`,`diffMoney`,`trade_no`,`note`,`createdBy`,`createdAt`) values (30,60,'0',0,25000,25000,'','管理员操作:打赏',1,1462352897);

/*Table structure for table `shop_member_score_log` */

DROP TABLE IF EXISTS `shop_member_score_log`;

CREATE TABLE `shop_member_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `orderId` varchar(20) DEFAULT NULL,
  `oldScore` int(11) DEFAULT NULL,
  `newScore` int(11) DEFAULT NULL,
  `diffScore` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_score_log` */

insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (3,10,NULL,0,500,500,'微信注册赠送',0,1459316570);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (4,10,'160329231792604',500,602,102,'订单:160329231792604',0,1459318745);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (5,10,'160330020642016',602,624,22,'订单:160330020642016',0,1459328775);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (6,11,NULL,0,500,500,'微信注册赠送',0,1459476227);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (7,11,NULL,500,300,200,'兑换优惠券:10元',NULL,1459488524);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (8,13,NULL,0,600,600,'注册会员赠送',0,1459506552);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (9,14,NULL,0,600,600,'注册会员赠送',0,1459827987);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (10,15,NULL,0,600,600,'注册会员赠送',0,1459828439);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (11,16,NULL,0,600,600,'注册会员赠送',0,1459828677);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (12,17,NULL,0,600,600,'注册会员赠送',0,1459828888);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (13,18,NULL,0,500,500,'微信注册赠送',0,1459844395);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (14,19,NULL,0,500,500,'微信注册赠送',0,1459844453);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (15,21,NULL,0,500,500,'微信注册赠送',0,1459844887);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (16,22,NULL,0,500,500,'微信注册赠送',0,1459845015);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (17,23,NULL,0,500,500,'微信注册赠送',0,1459845052);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (18,25,NULL,0,500,500,'微信注册赠送',0,1460116266);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (19,23,NULL,500,300,200,'兑换优惠券:10元',NULL,1460116329);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (20,26,NULL,0,500,500,'微信注册赠送',0,1460116330);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (21,27,NULL,0,500,500,'微信注册赠送',0,1460116366);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (22,28,NULL,0,500,500,'微信注册赠送',0,1460116396);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (23,29,NULL,0,500,500,'微信注册赠送',0,1460116404);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (24,30,NULL,0,500,500,'微信注册赠送',0,1460116410);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (25,31,NULL,0,500,500,'微信注册赠送',0,1460117357);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (26,32,NULL,0,500,500,'微信注册赠送',0,1460117378);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (27,33,NULL,0,500,500,'微信注册赠送',0,1460117626);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (28,34,NULL,0,500,500,'微信注册赠送',0,1460117634);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (29,35,NULL,0,500,500,'微信注册赠送',0,1460117727);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (30,36,NULL,0,500,500,'微信注册赠送',0,1460121890);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (31,37,NULL,0,500,500,'微信注册赠送',0,1460122002);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (32,38,NULL,0,600,600,'注册会员赠送',0,1460124137);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (33,39,NULL,0,500,500,'微信注册赠送',0,1460170611);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (34,40,NULL,0,500,500,'微信注册赠送',0,1460190058);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (35,41,NULL,0,500,500,'微信注册赠送',0,1460300085);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (36,24,'0',0,300,300,'帐号绑定积分转入',0,1460357722);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (37,23,'0',300,0,300,'帐号绑定积分转出',0,1460357722);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (38,42,NULL,0,500,500,'微信注册赠送',0,1460384065);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (39,43,NULL,0,500,500,'微信注册赠送',0,1460385597);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (40,44,NULL,0,500,500,'微信注册赠送',0,1460387137);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (41,45,NULL,0,600,600,'注册会员赠送',0,1460422262);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (42,45,NULL,600,100,500,'兑换优惠券:20元',NULL,1460422527);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (43,46,NULL,0,600,600,'注册会员赠送',0,1460600103);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (44,47,NULL,0,500,500,'微信注册赠送',0,1461328687);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (45,48,NULL,0,600,600,'注册会员赠送',0,1461719679);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (46,49,NULL,0,600,600,'微信信任登录注册赠送',0,1461842276);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (47,50,NULL,0,600,600,'QQ信任登录注册赠送',0,1462244815);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (48,51,NULL,0,600,600,'QQ信任登录注册赠送',0,1462244857);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (49,52,NULL,0,600,600,'QQ信任登录注册赠送',0,1462257323);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (50,53,NULL,0,600,600,'QQ信任登录注册赠送',0,1462258279);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (51,54,NULL,0,600,600,'QQ信任登录注册赠送',0,1462258336);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (52,55,NULL,0,500,500,'微信注册赠送',0,1462258482);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (53,56,NULL,0,600,600,'QQ信任登录注册赠送',0,1462260360);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (54,57,NULL,0,600,600,'注册会员赠送',0,1462266900);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (55,58,NULL,0,600,600,'注册会员赠送',0,1462352292);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (56,59,NULL,0,600,600,'注册会员赠送',0,1462352319);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (57,59,'0',600,1100,500,'帐号绑定积分转入',0,1462352330);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (58,28,'0',500,0,500,'帐号绑定积分转出',0,1462352330);
insert  into `shop_member_score_log`(`id`,`memberId`,`orderId`,`oldScore`,`newScore`,`diffScore`,`note`,`createdBy`,`createdAt`) values (59,60,NULL,0,600,600,'注册会员赠送',0,1462352407);

/*Table structure for table `shop_order` */

DROP TABLE IF EXISTS `shop_order`;

CREATE TABLE `shop_order` (
  `id` varchar(20) NOT NULL,
  `cityId` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `goodsAmount` int(11) DEFAULT NULL,
  `freightAmount` int(11) DEFAULT NULL,
  `discountAmount` int(11) DEFAULT NULL,
  `finishAmount` int(11) DEFAULT NULL,
  `payAmount` int(11) DEFAULT NULL,
  `payStatus` int(11) DEFAULT NULL,
  `payType` varchar(100) DEFAULT NULL,
  `payAt` int(11) DEFAULT NULL,
  `shipStatus` int(11) DEFAULT NULL,
  `shiptypeId` int(11) DEFAULT NULL,
  `shiptypeName` varchar(100) DEFAULT NULL,
  `shiptypeNo` varchar(100) DEFAULT NULL,
  `addrId` int(11) DEFAULT NULL,
  `addrProvince` varchar(30) DEFAULT NULL,
  `addrCity` varchar(30) DEFAULT NULL,
  `addrArea` varchar(30) DEFAULT NULL,
  `addrAddr` varchar(255) DEFAULT NULL,
  `addrName` varchar(100) DEFAULT NULL,
  `addrMobile` varchar(20) DEFAULT NULL,
  `addrTime` varchar(100) DEFAULT NULL,
  `taxType` int(11) DEFAULT NULL,
  `taxNo` varchar(100) DEFAULT NULL,
  `taxTitle` varchar(100) DEFAULT NULL,
  `taxCentent` varchar(255) DEFAULT NULL,
  `createdIp` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `receivedTime` int(11) DEFAULT NULL,
  `receivedStatus` int(11) DEFAULT NULL,
  `receivedAt` int(11) DEFAULT NULL,
  `updateAt` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `source` varchar(10) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `payStatus` (`payStatus`),
  KEY `shipStatus` (`shipStatus`),
  KEY `createdAt` (`createdAt`),
  KEY `receivedStatus` (`receivedStatus`),
  KEY `receivedAt` (`receivedAt`),
  KEY `updateAt` (`updateAt`),
  KEY `memberId` (`memberId`),
  KEY `disabled` (`disabled`),
  KEY `payAt` (`payAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order` */

insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160322203797104',0,'dead',1000,24,2490,0,0,2490,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1458704265,NULL,0,NULL,1459135704,2,'','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160327193950522',0,'dead',1000,24,2490,0,0,2490,2490,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459132751,NULL,0,NULL,1459140221,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160327202852441',0,'dead',4045,116,11690,0,0,11690,11690,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459135688,NULL,0,NULL,1459234055,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160327210330139',0,'dead',3000,69,8900,0,2000,6900,0,0,'pay_cash',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459137798,NULL,0,NULL,1459238365,2,'大鲨鱼','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328000796109',0,'dead',1000,4,2490,0,2000,490,490,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459148871,NULL,0,NULL,1459148882,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328000914081',0,'dead',1000,4,2490,0,2000,490,490,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459148941,NULL,0,NULL,1459148973,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328002284127',0,'active',6245,0,18980,800,50000,1,1,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459149754,NULL,0,NULL,1459149768,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328003475427',0,'dead',3000,79,8900,800,1000,8700,0,0,'pay_alipay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','','::ffff:192.168.1.11',1459150482,NULL,0,NULL,1459241485,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328234824432',0,'dead',1000,24,2490,800,0,3290,3290,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234083,NULL,0,NULL,1459234126,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328234829558',0,'dead',6000,178,17800,800,0,18600,18600,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234113,NULL,0,NULL,1459234124,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328234837547',0,'dead',1000,24,2490,800,0,3290,0,0,'pay_cash',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234138,NULL,0,NULL,1459237730,2,'','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328235202722',0,'active',3000,89,8900,800,0,9700,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234339,NULL,0,NULL,NULL,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328235208145',0,'active',1000,24,2490,800,0,3290,0,0,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234347,NULL,0,NULL,NULL,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328235237573',0,'dead',45,3,300,800,0,1100,1100,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234353,NULL,0,NULL,1459239181,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160328235269437',0,'active',1000,24,2490,800,0,3290,0,0,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459234332,NULL,0,NULL,NULL,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329012021935',0,'active',6000,158,17800,800,2000,16600,16600,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459239608,NULL,0,NULL,1459239613,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329012391966',0,'active',6000,138,17800,800,2000,16600,16600,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459239820,NULL,0,NULL,1459239834,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329015027571',0,'active',1000,24,2490,800,0,3290,0,0,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459241453,NULL,0,NULL,NULL,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329015065072',0,'dead',1200,48,4800,800,0,5600,0,0,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459241419,NULL,0,NULL,1459241430,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329015089243',0,'dead',3000,89,8900,800,0,9700,0,0,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459241401,NULL,0,NULL,1459241436,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329015185191',0,'active',1000,24,2490,800,0,3290,0,0,'pay_cash',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459241468,NULL,0,NULL,NULL,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329201332257',0,'active',1000,24,2490,0,0,2490,2490,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459307601,NULL,0,NULL,1459307606,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329201466512',0,'active',3500,334,35400,0,1000,34400,34400,1,'pay_money',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','蜀山区','11212121221','大1333','13331212331',NULL,0,'','','','::ffff:192.168.1.11',1459307641,NULL,0,NULL,1459307646,2,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329203219571',0,'active',1200,43,4320,0,0,4320,0,0,'pay_money',NULL,0,0,NULL,NULL,10,'安徽省','合肥市','蜀山区','12121212','121221','13312131331',NULL,0,'','','','::ffff:192.168.1.11',1459308754,NULL,0,NULL,NULL,4,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329204177822',0,'active',3000,80,8010,0,0,8010,0,0,'pay_cash',NULL,0,0,NULL,NULL,10,'安徽省','合肥市','蜀山区','12121212','121221','13312131331',NULL,0,'','','','::ffff:192.168.1.11',1459309319,NULL,0,NULL,NULL,4,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329204206013',0,'active',3000,40,8010,0,2000,6010,0,0,'pay_cash',NULL,0,0,NULL,NULL,10,'安徽省','合肥市','蜀山区','12121212','121221','13312131331',NULL,0,'','','','::ffff:192.168.1.11',1459309341,NULL,0,NULL,NULL,4,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160329231792604',0,'finish',4000,102,10251,0,0,10251,10251,1,'pay_money',NULL,1,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459318663,NULL,0,NULL,1459318745,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160330005000357',0,'active',1000,22,2241,0,0,2241,0,0,'pay_cash',NULL,0,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459324219,NULL,0,NULL,NULL,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160330005099644',0,'active',1000,22,2241,0,0,2241,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459324232,NULL,0,NULL,NULL,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160330015380732',0,'finish',1000,22,2241,0,0,2241,0,0,'pay_cash',NULL,1,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459328033,NULL,1,1459328094,1459328094,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160330020153694',0,'finish',4600,152,15201,0,0,15201,0,0,'pay_cash',NULL,1,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459328503,NULL,1,1459328543,1459328543,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160330020642016',0,'finish',1000,22,2241,0,0,2241,2241,1,'pay_money',NULL,1,0,NULL,NULL,11,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13359011952',NULL,0,'','','','::ffff:192.168.1.11',1459328771,NULL,1,1459328804,1459328804,10,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160401021696856',0,'active',1000,23,2365,0,0,2365,0,0,'pay_alipay',NULL,0,0,NULL,NULL,12,'安徽省','合肥市','瑶海区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311111111',NULL,0,'','','','::ffff:192.168.1.11',1459502167,NULL,0,NULL,NULL,11,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160408190617261',0,'active',5210,372,37290,800,0,38090,0,0,'pay_cash',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460113588,1,0,NULL,1460113612,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160408193234493',0,'active',1000,0,1,800,0,801,0,0,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460115125,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160408202625081',0,'dead',1000,0,1,800,0,801,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,3,'安徽省','合肥市','包河区','是哈哈哈哈了','后哦','17862967060',NULL,0,'','','','127.0.0.1',1460118376,1,0,NULL,1460118807,35,'','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160409002511781',0,'dead',0,0,0,0,0,1,0,0,'pay_cash',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460132705,1,0,NULL,1460132721,24,'','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160409025357776',0,'dead',4000,0,4,0,0,4,0,0,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460141627,1,0,NULL,1460357751,24,'','pc',1);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160409095692228',0,'dead',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,4,'安徽省','合肥市','蜀山区','合作化南路与','陈全来','13359011952',NULL,0,'','','','127.0.0.1',1460166969,2,0,NULL,1460211025,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160410224325821',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,4,'安徽省','合肥市','蜀山区','合作化南路与','陈全来','13359011952',NULL,0,'','','','127.0.0.1',1460299419,1,0,NULL,1460299437,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160411154676948',0,'active',10500,159,15969,0,0,15969,0,0,'pay_alipay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460360812,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160411224502288',0,'active',1000,0,1,0,0,1,0,0,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460385902,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160412085371789',0,'dead',6000,160,16020,0,0,16020,0,0,'pay_alipay',NULL,0,0,NULL,NULL,5,'安徽省','合肥市','高新区','科学大道888号','Xu','13816938316',NULL,0,'','','','127.0.0.1',1460422395,1,0,NULL,1460422558,45,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160412085820566',0,'active',1780,271,31140,0,2000,29140,0,0,'pay_alipay',NULL,0,0,NULL,NULL,5,'安徽省','合肥市','高新区','科学大道888号','Xu','13816938316',NULL,0,'','','','127.0.0.1',1460422684,1,0,NULL,NULL,45,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160414101648905',0,'active',1000,0,1,0,2000,1,0,0,'pay_alipay',NULL,0,0,NULL,NULL,6,'安徽省','合肥市','蜀山区','黄山路599号时代数码港1202室','桂芬','13771931091',NULL,0,'','','','127.0.0.1',1460600200,1,0,NULL,NULL,46,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160415160978109',0,'active',24000,0,24,0,0,24,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1460707763,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160419094504227',0,'dead',1000,0,1,0,0,1,0,0,'pay_cash',NULL,0,0,NULL,NULL,6,'安徽省','合肥市','蜀山区','黄山路599号时代数码港1202室','桂芬','13771931091',NULL,0,'','','','127.0.0.1',1461030330,1,0,NULL,1461030398,46,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160421120825450',0,'active',3000,80,8010,0,0,8010,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,7,'安徽省','合肥市','蜀山区','时代数码港','董丹丹','13665448671',NULL,0,'','','','127.0.0.1',1461211689,1,0,NULL,NULL,30,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160423172461952',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1461403498,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160426165496064',0,'dead',45,0,285,0,1000,1,0,0,'pay_cash',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','127.0.0.1',1461660848,1,0,NULL,1461743541,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160427155193276',0,'active',260,94,9405,0,0,9405,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','223.215.42.2',1461743507,1,0,NULL,NULL,24,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160427155457501',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,7,'安徽省','合肥市','蜀山区','时代数码港','董丹丹','13665448671',NULL,0,'','','','223.215.42.2, 101.226.125.121',1461743676,1,0,NULL,NULL,30,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160427155480837',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,7,'安徽省','合肥市','蜀山区','时代数码港','董丹丹','13665448671',NULL,0,'','','','223.215.42.2, 101.226.125.121',1461743685,1,0,NULL,NULL,30,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160427224824928',0,'active',1000,0,1,0,0,1,1,1,'pay_money',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','114.97.194.70',1461768533,1,0,NULL,1461768537,24,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160429174146508',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','223.240.98.210',1461922913,1,0,NULL,1461922920,24,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160429174485545',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','223.240.98.210',1461923084,1,0,NULL,NULL,24,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160502195119033',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路南京啊','大鲨鱼','13359011952',NULL,0,'','','','114.96.109.91',1462189893,1,0,NULL,NULL,24,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503104750679',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','包河区','高铁站南边','啊啊啊','15705607682',NULL,0,'','','','117.136.101.145, 101.226.125.118',1462243631,1,0,NULL,NULL,59,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503145929288',0,'active',3000,80,8010,0,0,8010,0,0,'pay_cash',NULL,0,0,NULL,NULL,7,'安徽省','合肥市','蜀山区','时代数码港','董丹丹','13665448671',NULL,0,'','','','223.240.105.213, 101.226.125.121',1462258762,1,0,NULL,1462258783,30,'','weixin',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503171606208',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','223.240.105.213',1462266996,1,0,NULL,1462267017,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503182633970',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','223.240.105.213',1462271179,1,0,NULL,1462271197,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503182734627',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','223.240.105.213',1462271268,1,0,NULL,1462271277,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503182784880',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','223.240.105.213',1462271235,1,0,NULL,1462271251,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160503182850926',0,'active',1000,0,1,0,0,1,1,1,'pay_wxpay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','223.240.105.213',1462271325,1,0,NULL,1462271341,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504133153723',0,'active',1000,0,1,0,0,1,1,1,'pay_alipay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','60.168.87.124',1462339866,1,0,NULL,1462339897,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504135364898',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','60.168.87.124',1462341233,1,0,NULL,NULL,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504135416127',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','60.168.87.124',1462341271,1,0,NULL,NULL,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504135425379',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',NULL,0,0,NULL,NULL,9,'安徽省','合肥市','蜀山区','时代数码港','测试收货人1号','13956934521',NULL,0,'','','','60.168.87.124',1462341260,1,0,NULL,NULL,57,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504165949926',0,'active',1000,2,270,0,0,270,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','包河区','高铁站南边','啊啊啊','15705607682',NULL,0,'','','','60.168.87.124',1462352347,1,0,NULL,NULL,59,'','pc',0);
insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`payAt`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`createdIp`,`createdAt`,`receivedTime`,`receivedStatus`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160504170027767',0,'active',1000,0,1,0,0,1,0,0,'pay_wxpay',NULL,0,0,NULL,NULL,8,'安徽省','合肥市','包河区','高铁站南边','啊啊啊','15705607682',NULL,0,'','','','60.168.87.124, 101.226.125.118',1462352453,1,0,NULL,NULL,59,'','weixin',0);

/*Table structure for table `shop_order_goods` */

DROP TABLE IF EXISTS `shop_order_goods`;

CREATE TABLE `shop_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gn` varchar(100) DEFAULT NULL,
  `spec` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `gprice` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `sendNum` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `createAt` int(11) DEFAULT NULL,
  `is_comment` tinyint(1) DEFAULT NULL,
  `commentAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_goods` */

insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (1,'160322203797104',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,NULL,1458704265,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (2,'160327193950522',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459132751,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (3,'160327202852441',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459135688,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (4,'160327202852441',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459135688,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (5,'160327202852441',6,27,'即食木耳（中辣）45g','P1603000003','',300,300,1,0,300,3,45,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',1459135688,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (6,'160327210330139',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459137798,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (7,'160328000796109',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459148871,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (8,'160328000914081',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459148941,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (9,'160328002284127',6,27,'即食木耳（中辣）45g','P1603000003','',300,300,1,0,300,3,45,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',1459149754,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (10,'160328002284127',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,2,0,4980,49,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459149754,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (11,'160328002284127',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459149754,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (12,'160328002284127',10,28,'寿西湖红颜草莓1.2kg（火热预售）','P1603000007','',4800,4800,1,0,4800,48,1200,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1459149754,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (13,'160328003475427',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459150482,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (14,'160328234824432',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459234083,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (15,'160328234829558',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,2,0,17800,178,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459234113,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (16,'160328234837547',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459234138,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (17,'160328235269437',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459234332,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (18,'160328235202722',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459234339,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (19,'160328235208145',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459234347,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (20,'160328235237573',6,27,'即食木耳（中辣）45g','P1603000003','',300,300,1,0,300,3,45,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',1459234353,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (21,'160329012021935',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,2,0,17800,178,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459239608,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (22,'160329012391966',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,2,0,17800,178,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459239820,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (23,'160329015089243',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8900,8900,1,0,8900,89,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459241401,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (24,'160329015065072',10,28,'寿西湖红颜草莓1.2kg（火热预售）','P1603000007','',4800,4800,1,0,4800,48,1200,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1459241419,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (25,'160329015027571',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459241453,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (26,'160329015185191',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459241468,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (27,'160329201332257',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459307601,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (28,'160329201466512',11,18,'竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','P1603000008','',16800,16800,2,0,33600,336,1500,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',1459307641,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (29,'160329201466512',12,19,'乌鸡蛋（6枚装）','P1603000009','',1800,1800,1,0,1800,18,500,'/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',1459307641,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (30,'160329203219571',10,28,'寿西湖红颜草莓1.2kg（火热预售）','P1603000007','',4320,4800,1,0,4320,43,1200,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1459308754,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (31,'160329204177822',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,1,0,8010,80,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459309319,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (32,'160329204206013',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,1,0,8010,80,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459309341,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (33,'160329231792604',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459318663,1,1459326819);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (34,'160329231792604',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,1,0,8010,80,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1459318663,1,1459327733);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (35,'160330005000357',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459324219,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (36,'160330005099644',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459324232,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (37,'160330015380732',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459328033,1,1459328116);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (38,'160330020153694',10,28,'寿西湖红颜草莓1.2kg（火热预售）','P1603000007','',4320,4800,3,0,12960,129,1200,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1459328503,1,1459328555);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (39,'160330020153694',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459328503,1,1459328560);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (40,'160330020642016',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2241,2490,1,0,2241,22,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459328771,1,1459328812);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (41,'160401021696856',4,41,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2365,2490,1,0,2365,23,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1459502167,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (42,'160408190617261',4,41,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460113588,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (43,'160408190617261',6,27,'即食木耳（中辣）45g','P1603000003','',300,300,2,0,600,6,45,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',1460113588,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (44,'160408190617261',8,15,'独头黑蒜（礼盒装）20枚','P1603000005','',9900,9900,2,0,19800,198,260,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',1460113588,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (45,'160408190617261',10,28,'寿西湖红颜草莓1.2kg（火热预售）','P1603000007','',4800,4800,3,0,14400,144,1200,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1460113588,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (46,'160408193234493',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460115125,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (47,'160408202625081',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460118376,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (48,'160409025357776',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,4,0,4,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460141627,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (49,'160409095692228',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460166969,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (50,'160410224325821',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460299419,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (51,'160411154676948',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,9,0,9,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460360812,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (52,'160411154676948',11,18,'竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','P1603000008','',15960,16800,1,0,15960,159,1500,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',1460360812,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (53,'160411224502288',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460385902,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (54,'160412085371789',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,2,0,16020,160,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1460422395,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (55,'160412085820566',8,15,'独头黑蒜（礼盒装）20枚','P1603000005','',8910,9900,3,0,26730,267,260,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',1460422684,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (56,'160412085820566',13,25,'五常稻花香龙稻尚品大米2.5kg','P1603000010','',4410,4900,1,0,4410,44,1000,'/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',1460422684,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (57,'160414101648905',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460600200,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (58,'160415160978109',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,24,0,24,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460707763,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (59,'160419094504227',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461030330,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (60,'160421120825450',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,1,0,8010,80,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1461211689,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (61,'160423172461952',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461403498,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (62,'160426165496064',6,27,'即食木耳（中辣）45g','P1603000003','',285,300,1,0,285,2,45,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',1461660848,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (63,'160427155193276',8,15,'独头黑蒜（礼盒装）20枚','P1603000005','',9405,9900,1,0,9405,94,260,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',1461743507,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (64,'160427155457501',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461743676,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (65,'160427155480837',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461743685,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (66,'160427224824928',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461768533,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (67,'160429174146508',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461922913,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (68,'160429174485545',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1461923084,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (69,'160502195119033',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462189893,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (70,'160503104750679',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462243631,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (71,'160503145929288',9,29,'绿格自然栽培果蔬包6~8斤','P1603000006','',8010,8900,1,0,8010,80,3000,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',1462258762,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (72,'160503171606208',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462266996,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (73,'160503182633970',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462271179,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (74,'160503182784880',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462271235,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (75,'160503182734627',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462271268,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (76,'160503182850926',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462271325,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (77,'160504133153723',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462339866,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (78,'160504135364898',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462341233,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (79,'160504135425379',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462341260,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (80,'160504135416127',4,44,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,1,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1462341271,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (81,'160504165949926',6,67,'有机蔬菜—韭菜','P1603000003','',270,300,1,0,270,2,1000,'/open/image/file/cdafd3aa37444c929ee492224bd3a726.jpg',1462352347,0,NULL);
insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`imgurl`,`createAt`,`is_comment`,`commentAt`) values (82,'160504170027767',4,53,'有机蔬菜—香菇','P1603000001','',1,3800,1,0,1,0,1000,'/open/image/file/a82fa23a73cd493998aae46f9c1946df.jpg',1462352453,0,NULL);

/*Table structure for table `shop_order_log` */

DROP TABLE IF EXISTS `shop_order_log`;

CREATE TABLE `shop_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `opTag` varchar(100) DEFAULT NULL,
  `opContent` varchar(255) DEFAULT NULL,
  `opType` varchar(10) DEFAULT NULL,
  `opId` int(11) DEFAULT NULL,
  `opNickname` varchar(100) DEFAULT NULL,
  `opAt` int(11) DEFAULT NULL,
  `opResult` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `opType` (`opType`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_log` */

insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (1,'160322203797104','create','创建订单','member',2,'139****0212',1458704265,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (2,'160327193950522','create','创建订单','member',2,'139****0212',1459132751,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (3,'160327202852441','create','创建订单','member',2,'139****0212',1459135688,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (4,'160327202852441','payment','订单付款:余额支付','member',2,'139****0212',1459135693,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (5,'160322203797104','cancel','取消订单','member',2,'139****0212',1459135701,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (6,'160322203797104','delete','删除订单','member',2,'139****0212',1459135704,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (7,'160327193950522','payment','订单付款:余额支付','member',2,'139****0212',1459136702,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (8,'160327210330139','create','创建订单','member',2,'139****0212',1459137798,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (9,'160327193950522','cancel','取消订单','member',2,'139****0212',1459140221,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (10,'160328000796109','create','创建订单','member',2,'139****0212',1459148871,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (11,'160328000796109','payment','订单付款:余额支付','member',2,'139****0212',1459148877,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (12,'160328000796109','cancel','取消订单','member',2,'139****0212',1459148882,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (13,'160328000914081','create','创建订单','member',2,'139****0212',1459148941,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (14,'160328000914081','payment','订单付款:余额支付','member',2,'139****0212',1459148946,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (15,'160328000914081','cancel','取消订单','member',2,'139****0212',1459148973,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (16,'160328002284127','create','创建订单','member',2,'139****0212',1459149754,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (17,'160328002284127','payment','订单付款:余额支付','member',2,'139****0212',1459149768,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (18,'160328003475427','create','创建订单','member',2,'139****0212',1459150482,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (19,'160327202852441','cancel','取消订单','member',2,'大鲨鱼',1459234055,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (20,'160328234824432','create','创建订单','member',2,'大鲨鱼',1459234083,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (21,'160328234824432','payment','订单付款:余额支付','member',2,'大鲨鱼',1459234101,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (22,'160328234829558','create','创建订单','member',2,'大鲨鱼',1459234113,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (23,'160328234829558','payment','订单付款:余额支付','member',2,'大鲨鱼',1459234116,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (24,'160328234829558','cancel','取消订单','member',2,'大鲨鱼',1459234124,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (25,'160328234824432','cancel','取消订单','member',2,'大鲨鱼',1459234126,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (26,'160328234837547','create','创建订单','member',2,'大鲨鱼',1459234138,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (27,'160328234837547','cancel','取消订单','member',2,'大鲨鱼',1459234144,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (28,'160328235269437','create','创建订单','member',2,'大鲨鱼',1459234332,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (29,'160328235202722','create','创建订单','member',2,'大鲨鱼',1459234339,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (30,'160328235208145','create','创建订单','member',2,'大鲨鱼',1459234347,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (31,'160328235237573','create','创建订单','member',2,'大鲨鱼',1459234353,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (32,'160328234837547','delete','删除订单','member',2,'大鲨鱼',1459237730,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (33,'160327210330139','cancel','取消订单','member',2,'大鲨鱼',1459237772,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (34,'160327210330139','delete','删除订单','member',2,'大鲨鱼',1459238365,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (35,'160328235237573','payment','订单付款:余额支付','member',2,'大鲨鱼',1459238400,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (36,'160328235237573','cancel','取消订单','member',2,'大鲨鱼',1459239181,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (37,'160329012021935','create','创建订单','member',2,'大鲨鱼',1459239608,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (38,'160329012021935','payment','订单付款:余额支付','member',2,'大鲨鱼',1459239613,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (39,'160329012391966','create','创建订单','member',2,'大鲨鱼',1459239820,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (40,'160329012391966','payment','订单付款:余额支付','member',2,'大鲨鱼',1459239834,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (41,'160329015089243','create','创建订单','member',2,'大鲨鱼',1459241401,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (42,'160329015065072','create','创建订单','member',2,'大鲨鱼',1459241419,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (43,'160329015065072','cancel','取消订单','member',2,'大鲨鱼',1459241430,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (44,'160329015089243','cancel','取消订单','member',2,'大鲨鱼',1459241436,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (45,'160329015027571','create','创建订单','member',2,'大鲨鱼',1459241453,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (46,'160329015185191','create','创建订单','member',2,'大鲨鱼',1459241468,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (47,'160328003475427','cancel','取消订单','member',2,'大鲨鱼',1459241485,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (48,'160329201332257','create','创建订单','member',2,'大鲨鱼',1459307601,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (49,'160329201332257','payment','订单付款:余额支付','member',2,'大鲨鱼',1459307606,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (50,'160329201466512','create','创建订单','member',2,'大鲨鱼',1459307641,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (51,'160329201466512','payment','订单付款:余额支付','member',2,'大鲨鱼',1459307646,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (52,'160329203219571','create','创建订单','member',4,'133****1234',1459308754,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (53,'160329204177822','create','创建订单','member',4,'133****1234',1459309319,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (54,'160329204206013','create','创建订单','member',4,'133****1234',1459309341,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (55,'160329231792604','create','创建订单','member',10,'Wizzer',1459318663,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (56,'160329231792604','payment','订单付款:余额支付','member',10,'Wizzer',1459318745,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (57,'160330005000357','create','创建订单','member',10,'Wizzer',1459324219,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (58,'160330005099644','create','创建订单','member',10,'Wizzer',1459324232,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (59,'160330015380732','create','创建订单','member',10,'Wizzer',1459328033,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (60,'160330015380732','receive','确认收货','member',10,'Wizzer',1459328094,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (61,'160330020153694','create','创建订单','member',10,'Wizzer',1459328503,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (62,'160330020153694','receive','确认收货','member',10,'Wizzer',1459328543,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (63,'160330020642016','create','创建订单','member',10,'Wizzer',1459328771,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (64,'160330020642016','payment','订单付款:余额支付','member',10,'Wizzer',1459328775,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (65,'160330020642016','receive','确认收货','member',10,'Wizzer',1459328804,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (66,'160401021696856','create','创建订单','member',11,'Wizzer',1459502167,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (67,'160408190617261','create','创建订单','member',24,'133****1952',1460113588,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (68,'160408190617261','update','变更支付方式为:货到付款','member',24,'133****1952',1460113612,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (69,'160408193234493','create','创建订单','member',24,'133****1952',1460115125,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (70,'160408202625081','create','创建订单','member',35,'宋磊',1460118376,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (71,'160408202625081','cancel','取消订单','member',35,'宋磊',1460118794,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (72,'160408202625081','delete','删除订单','member',35,'宋磊',1460118807,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (73,'160409002511781','create','创建订单','member',24,'133****1952',1460132705,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (74,'160409002511781','cancel','取消订单','member',24,'133****1952',1460132713,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (75,'160409002511781','delete','删除订单','member',24,'133****1952',1460132721,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (76,'160409025357776','create','创建订单','member',24,'133****1952',1460141627,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (77,'160409025357776','cancel','取消订单','member',24,'133****1952',1460141741,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (78,'160409095692228','create','创建订单','member',24,'Wizzer',1460166969,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (79,'160409095692228','payment','订单付款:微信网页支付','member',24,'Wizzer',1460166977,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (80,'160409095692228','cancel','取消订单','member',24,'Wizzer',1460211025,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (81,'160410224325821','create','创建订单','member',24,'Wizzer',1460299419,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (82,'160410224325821','payment','订单付款:微信网页支付','member',24,'Wizzer',1460299437,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (83,'160409025357776','delete','删除订单','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1460357751,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (84,'160411154676948','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1460360812,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (85,'160411224502288','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1460385902,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (86,'160412085371789','create','创建订单','member',45,'138****8316',1460422395,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (87,'160412085371789','cancel','取消订单','member',45,'138****8316',1460422558,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (88,'160412085820566','create','创建订单','member',45,'138****8316',1460422684,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (89,'160414101648905','create','创建订单','member',46,'137****1091',1460600200,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (90,'160415160978109','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1460707763,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (91,'160419094504227','create','创建订单','member',46,'137****1091',1461030330,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (92,'160419094504227','cancel','取消订单','member',46,'137****1091',1461030398,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (93,'160421120825450','create','创建订单','member',30,'草下的云',1461211689,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (94,'160423172461952','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461403498,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (95,'160426165496064','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1461660848,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (96,'160426165496064','update','变更支付方式为:货到付款','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1461660856,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (97,'160427155193276','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461743507,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (98,'160426165496064','cancel','取消订单','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1461743541,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (99,'160427155457501','create','创建订单','member',30,'草下的云',1461743676,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (100,'160427155480837','create','创建订单','member',30,'草下的云',1461743685,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (101,'160427224824928','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461768533,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (102,'160427224824928','payment','订单付款:余额支付','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461768537,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (103,'160429174146508','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461922913,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (104,'160429174146508','payment','订单付款:微信网页支付','member',24,'Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1461922920,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (105,'160429174485545','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1461923084,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (106,'160502195119033','create','创建订单','member',24,'Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',1462189893,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (107,'160503104750679','create','创建订单','member',59,'cheney',1462243631,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (108,'160503145929288','create','创建订单','member',30,'草下的云',1462258762,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (109,'160503145929288','update','变更支付方式为:货到付款','member',30,'草下的云',1462258783,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (110,'160503171606208','create','创建订单','member',57,'139****4521',1462266996,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (111,'160503171606208','payment','订单付款:微信扫码支付','member',57,'139****4521',1462267017,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (112,'160503182633970','create','创建订单','member',57,'139****4521',1462271179,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (113,'160503182633970','payment','订单付款:微信扫码支付','member',57,'139****4521',1462271197,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (114,'160503182784880','create','创建订单','member',57,'139****4521',1462271235,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (115,'160503182784880','payment','订单付款:微信扫码支付','member',57,'139****4521',1462271251,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (116,'160503182734627','create','创建订单','member',57,'139****4521',1462271268,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (117,'160503182734627','payment','订单付款:微信扫码支付','member',57,'139****4521',1462271277,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (118,'160503182850926','create','创建订单','member',57,'139****4521',1462271325,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (119,'160503182850926','payment','订单付款:微信扫码支付','member',57,'139****4521',1462271341,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (120,'160504133153723','create','创建订单','member',57,'139****4521',1462339866,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (121,'160504133153723','payment','订单付款:支付宝支付','member',57,'139****4521',1462339897,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (122,'160504135364898','create','创建订单','member',57,'139****4521',1462341233,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (123,'160504135425379','create','创建订单','member',57,'139****4521',1462341260,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (124,'160504135416127','create','创建订单','member',57,'139****4521',1462341271,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (125,'160504165949926','create','创建订单','member',59,'157****7680',1462352347,'ok');
insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (126,'160504170027767','create','创建订单','member',59,'cheney',1462352453,'ok');

/*Table structure for table `shop_order_ship` */

DROP TABLE IF EXISTS `shop_order_ship`;

CREATE TABLE `shop_order_ship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bn` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_ship` */

/*Table structure for table `shop_order_ship_log` */

DROP TABLE IF EXISTS `shop_order_ship_log`;

CREATE TABLE `shop_order_ship_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `shiptypeNo` varchar(100) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `createAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `shiptypeNo` (`shiptypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_ship_log` */

/*Table structure for table `shop_sales_coupon` */

DROP TABLE IF EXISTS `shop_sales_coupon`;

CREATE TABLE `shop_sales_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `maxNum` int(11) DEFAULT NULL,
  `hasNum` int(11) DEFAULT NULL,
  `is_score` tinyint(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shop_sales_coupon` */

insert  into `shop_sales_coupon`(`id`,`name`,`price`,`maxNum`,`hasNum`,`is_score`,`score`,`createBy`,`createdAt`,`disabled`) values (1,'20元',2000,1000,27,1,500,1,NULL,0);
insert  into `shop_sales_coupon`(`id`,`name`,`price`,`maxNum`,`hasNum`,`is_score`,`score`,`createBy`,`createdAt`,`disabled`) values (2,'10元',1000,800,15,1,200,1,NULL,0);
insert  into `shop_sales_coupon`(`id`,`name`,`price`,`maxNum`,`hasNum`,`is_score`,`score`,`createBy`,`createdAt`,`disabled`) values (3,'500元',50000,4,3,1,7000,1,NULL,0);

/*Table structure for table `sms_config` */

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` varchar(10) DEFAULT NULL,
  `app_key` varchar(20) DEFAULT NULL,
  `app_secret` varchar(50) DEFAULT NULL,
  `sms_sign_name` varchar(10) DEFAULT NULL,
  `sms_reg_template` varchar(20) DEFAULT NULL,
  `sms_check_template` varchar(20) DEFAULT NULL,
  `sms_login_template` varchar(20) DEFAULT NULL,
  `sms_password_template` varchar(20) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sms_config` */

insert  into `sms_config`(`id`,`app_type`,`app_key`,`app_secret`,`sms_sign_name`,`sms_reg_template`,`sms_check_template`,`sms_login_template`,`sms_password_template`,`updatedAt`) values (1,'top','23273074','201646c2c8ff6f42c47bc599203a1d26','Nbshop','SMS_2675019','SMS_2675022','SMS_2675021','SMS_2675017',1457518406);

/*Table structure for table `sms_log` */

DROP TABLE IF EXISTS `sms_log`;

CREATE TABLE `sms_log` (
  `id` varchar(255) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `sms` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sms_log` */

insert  into `sms_log`(`id`,`mobile`,`code`,`sms`,`createdAt`) values ('1','13359011952','457855','注册验证',1457594894);

/*Table structure for table `sys_backup` */

DROP TABLE IF EXISTS `sys_backup`;

CREATE TABLE `sys_backup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `createdBy` (`createdBy`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `sys_backup` */

insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (10,'db','/node/sunshop/backup/db/20160503021000.zip','20160503021000.zip',0,1462212601);
insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (11,'db','/node/sunshop/backup/db/20160503182953.zip','20160503182953.zip',1,1462271393);
insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (12,'db','/node/sunshop/backup/db/20160504021000.zip','20160504021000.zip',0,1462299000);
insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (13,'db','/node/sunshop/backup/db/20160504133252.zip','20160504133252.zip',1,1462339973);
insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (14,'db','/node/sunshop/backup/db/20160505021000.zip','20160505021000.zip',0,1462385400);
insert  into `sys_backup`(`id`,`type`,`path`,`name`,`createdBy`,`createdAt`) values (15,'db','/node/sunshop/backup/db/20160505113627.zip','20160505113627.zip',1,1462419387);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) DEFAULT NULL,
  `config_val` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (1,'system.AppName','电子商城系统',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (2,'system.AppDomain','nodeshop.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (3,'system.AppShrotName','NodeShop',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (4,'system.AppCopyright','nodeshop.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (5,'system.AppIp','127.0.0.1',1458703898);

/*Table structure for table `sys_ip` */

DROP TABLE IF EXISTS `sys_ip`;

CREATE TABLE `sys_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_ip` */

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cron` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `updateTxt` varchar(255) DEFAULT NULL,
  `updateStatus` tinyint(1) DEFAULT NULL,
  `updateAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_job` */

insert  into `sys_job`(`id`,`name`,`cron`,`note`,`disabled`,`updateTxt`,`updateStatus`,`updateAt`) values (1,'backupDb','10 2 * * *','数据库备份',0,'',1,1462385400);
insert  into `sys_job`(`id`,`name`,`cron`,`note`,`disabled`,`updateTxt`,`updateStatus`,`updateAt`) values (2,'deleteLog','0 2 * * *','清空三个月前后台日志',0,'',1,1462384800);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (142,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1560154451);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (143,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1560156315);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

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
  KEY `path` (`path`),
  KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/job','data-pjax','','system:task:job',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','营销',NULL,'','','','marketing',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,1,'00010004','商店配置',NULL,'','','ti-shopping-cart','system:config:shop',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000100040001','商店设置',NULL,'/private/conf/shop','data-pjax',NULL,'system:config:shop:setting',0,0,0,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000100040002','短信设置',NULL,'/private/conf/sms','data-pjax',NULL,'system:config:shop:sms',0,0,0,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,'/private/shop/order/order','data-pjax','','order:list:orders',0,0,0,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,'/private/shop/order/payment','data-pjax','','order:list:cashs',0,0,0,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,'/private/shop/order/ship','data-pjax','','order:list:sends',0,0,0,16,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,1,0,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,1,0,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,'/private/shop/order/refund','data-pjax','','order:list:refunds',0,0,0,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,'','','ti-shopping-cart','goods:manage',0,0,1,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,'/private/shop/goods/goods','data-pjax','','goods:manage:list',0,0,0,52,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,'','','ti-settings','goods:setting',0,0,1,23,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,'/private/shop/goods/class','data-pjax','','goods:setting:class',0,0,0,53,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,'/private/shop/goods/type','data-pjax','','goods:setting:type',0,0,0,54,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,'/private/shop/goods/spec','data-pjax','','goods:setting:spec',0,0,0,55,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,'','','ti-user','member:manage',0,0,1,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,'/private/shop/member/member','data-pjax','','member:manage:list',0,0,0,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,'/private/shop/member/level','data-pjax','','member:manage:level',0,0,0,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,'','','ti-comment','member:msg',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,'/private/shop/member/comment?type=2','data-pjax','','member:msg:faq',0,0,0,36,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,'/private/shop/member/comment?type=1','data-pjax','','member:msg:review',0,0,0,37,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','CMS',NULL,'','','','site',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (45,44,'00060001','站点管理',NULL,'','','ti-world','site:manage',0,0,1,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (47,45,'000600010002','站点配置',NULL,'/private/cms/site','data-pjax','','site:manage:setting',0,0,0,49,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,'','','ti-pencil-alt','site:cms',0,0,1,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,'/private/cms/channel','data-pjax','','site:cms:channel',0,0,0,47,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,'/private/cms/article','data-pjax','','site:cms:article',0,0,0,48,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','广告及链接',NULL,'','','ti-link','site:link',0,0,1,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','友情链接',NULL,'/private/cms/link','data-pjax','','site:link:list',0,0,0,51,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (53,0,'0007','微信',NULL,'',NULL,'','weixin',0,0,1,4,1,1445825925);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (54,53,'00070001','微信配置',NULL,'',NULL,'fa fa-weixin','weixin:manage',0,0,1,12,1,1445826142);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (55,54,'000700010001','帐号配置',NULL,'/private/wx/config','data-pjax','','weixin:manage:config',0,0,0,32,1,1445826178);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (56,54,'000700010002','菜单配置',NULL,'/private/wx/menu','data-pjax','','weixin:manage:menu',0,0,0,33,1,1445830074);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (57,53,'00070002','消息管理',NULL,'','','ti-pencil-alt','weixin:msg',0,0,1,10,1,1445843697);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (58,57,'000700020001','会员消息',NULL,'/private/wx/msg/user','data-pjax','','weixin:msg:txt',0,0,0,28,1,1445843720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (59,57,'000700020002','群发消息',NULL,'/private/wx/msg/mass','data-pjax','','weixin:msg:news',0,0,0,29,1,1445843889);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (60,53,'00070003','自动回复',NULL,'',NULL,'ti-back-left','weixin:reply',0,0,1,11,1,1445929792);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (61,60,'000700030001','关注自动回复',NULL,'/private/wx/reply?type=follow','data-pjax','','weixin:reply:follow',0,0,0,30,1,1445929848);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (62,60,'000700030002','关键词回复',NULL,'/private/wx/reply?type=keyword','data-pjax','','weixin:reply:keyword',0,0,0,31,1,1445929868);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (63,51,'000600030002','链接分类',NULL,'/private/cms/linkclass','data-pjax','','site:link:class',0,0,0,50,1,1446788018);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (64,27,'000400020004','商品品牌',NULL,'/private/shop/goods/brand','data-pjax','','goods:setting:brand',0,0,0,56,1,1450253034);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (65,53,'00070004','营销活动',NULL,'','','fa fa-credit-card','weixin:sales',0,1,1,9,1,1451438619);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (66,65,'000700040001','活动管理',NULL,'/private/wx/sales/manage','data-pjax','','weixin:sales:manage',0,1,0,26,1,1451438974);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (67,65,'000700040002','活动详情',NULL,'/private/wx/sales/result','data-pjax','','weixin:sales:result',0,1,0,27,1,1451439283);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (68,53,'00070005','微信会员',NULL,'','data-pjax','fa fa-user','weixin:user',0,0,1,8,1,1451986421);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (69,68,'000700050001','会员列表',NULL,'/private/wx/user','data-pjax','','weixin:user:list',0,0,0,25,1,1451986453);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (72,0,'0008','统计',NULL,'','','','count',0,0,1,6,1,1453858438);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (73,72,'00080001','销售统计',NULL,'','','ti-shopping-cart-full','count:shopsale',0,0,1,17,1,1453858640);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (74,73,'000800010001','销售收入',NULL,'','data-pjax','','count:shopsale:income',0,0,0,45,1,1453858718);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (75,73,'000800010002','商品销量',NULL,'','data-pjax','','count:shopsale:sales',0,0,0,46,1,1453858771);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (76,72,'00080002','站点统计',NULL,'','','ti-world','count:site',0,1,1,18,1,1453858917);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (77,76,'000800020001','网站访问量',NULL,'','data-pjax','','count:site:pv',0,1,0,24,1,1453858986);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (78,12,'00020001','促销管理',NULL,'','','ti-stats-up','marketing:promotion',0,1,1,13,1,1453859141);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (79,78,'000200010001','订单促销',NULL,'','data-pjax','','marketing:promotion:order',0,1,0,34,1,1453859226);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (80,78,'000200010002','商品促销',NULL,'','data-pjax','','marketing:promotion:goods',0,1,0,35,1,1453859244);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (81,12,'00020002','优惠券',NULL,'','','ti-credit-card','marketing:coupon',0,0,1,14,1,1453859500);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (82,81,'000200020001','优惠券管理',NULL,'/private/shop/sales/coupon','data-pjax','','marketing:coupon:list',0,0,0,40,1,1453859559);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (83,81,'000200020002','优惠券使用记录',NULL,'/private/shop/sales/coupon/history','data-pjax','','marketing:coupon:history',0,0,0,41,1,1453859710);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (85,12,'00020003','注册营销',NULL,'','','ti-id-badge','marketing:register',0,0,1,15,1,1453859864);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (86,85,'000200030001','注册营销配置',NULL,'/private/shop/sales/register','data-pjax','','marketing:register:setting',0,0,0,43,1,1453859929);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (87,12,'00020004','赠品营销',NULL,'','','ti-gift','marketing:gift',0,1,1,16,1,1453859999);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (88,87,'000200040001','赠品管理',NULL,'','data-pjax','','marketing:gift:list',0,1,0,44,1,1453860035);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (89,13,'000100040003','图片配置',NULL,'/private/conf/img','data-pjax','','system:config:shop:img',0,0,0,4,1,1458703650);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (90,13,'000100040004','区域管理',NULL,'/private/shop/area','data-pjax','','system:config:shop:area',0,0,0,3,1,1458703720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (91,2,'000100010005','系统参数',NULL,'/private/sys/conf','data-pjax','','system:sys:conf',0,0,0,5,1,1458703756);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (92,9,'000100030003','数据备份',NULL,'/private/sys/backup','data-pjax','','system:safe:backup',0,0,0,11,1,1461659175);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (93,60,'000700030003','文字内容',NULL,'/private/wx/txt','data-pjax','','weixin:reply:txt',0,0,0,0,1,1462504991);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (94,60,'000700030004','图文内容',NULL,'/private/wx/news','data-pjax','','weixin:reply:news',0,0,0,0,1,1462505023);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

DROP TABLE IF EXISTS `sys_menu_roles__sys_role_menus`;

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_roles__sys_role_menus` */

insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (257,12,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (258,14,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (259,13,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (260,15,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (289,7,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (290,1,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (291,2,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (292,9,20);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (437,60,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (438,53,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (439,68,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (440,69,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (441,65,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (442,66,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (443,67,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (444,57,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (445,58,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (446,59,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (447,61,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (448,62,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (449,54,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (450,55,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (451,56,19);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (725,21,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (726,20,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (727,16,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (728,18,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (729,19,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (730,17,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (731,22,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (732,23,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (733,33,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (734,34,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (735,40,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (736,35,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (737,36,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (738,39,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (739,41,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (740,24,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (741,25,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (742,26,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (743,27,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (744,28,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (745,29,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (746,64,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (747,30,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (748,53,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (749,69,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (750,68,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (751,65,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (752,66,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (753,67,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (754,57,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (755,58,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (756,59,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (757,61,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (758,94,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (759,54,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (760,93,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (761,62,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (762,60,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (763,55,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (764,12,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (765,56,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (766,78,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (767,80,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (768,79,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (769,81,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (770,82,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (771,86,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (772,85,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (773,83,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (774,77,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (775,45,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (776,76,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (777,75,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (778,74,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (779,73,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (780,87,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (781,44,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (782,88,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (783,72,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (784,48,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (785,47,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (786,49,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (787,13,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (788,1,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (789,51,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (790,63,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (791,52,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (792,14,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (793,50,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (794,6,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (795,90,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (796,5,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (797,91,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (798,89,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (799,4,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (800,15,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (801,3,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (802,2,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (803,7,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (804,8,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (805,10,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (806,9,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (807,92,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (808,11,2);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (1,0,'公共角色','public',0,1,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (2,0,'系统管理','sysadmin',0,2,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (19,4,'袭人花店角色','xiren',1,0,1,1445562940);

/*Table structure for table `sys_role_users__sys_user_roles` */

DROP TABLE IF EXISTS `sys_role_users__sys_user_roles`;

CREATE TABLE `sys_role_users__sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_role_users` int(11) DEFAULT NULL,
  `sys_user_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_users__sys_user_roles` */

insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (10,2,10);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (28,2,1);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (32,1,1);

/*Table structure for table `sys_unit` */

DROP TABLE IF EXISTS `sys_unit`;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统管理','请勿删除','安徽省合肥市蜀山区','13359011952','0551-63506223',0,1,1,1442391167);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `lastIp` varchar(20) DEFAULT NULL,
  `loginAt` int(11) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `loginTheme` varchar(20) DEFAULT NULL,
  `loginSidebar` tinyint(1) DEFAULT NULL,
  `loginScroll` tinyint(1) DEFAULT NULL,
  `loginBoxed` tinyint(1) DEFAULT NULL,
  `customMenus` longtext DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  KEY `nickname` (`nickname`),
  KEY `unitid` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`customMenus`,`createdBy`,`createdAt`,`unitid`) values (1,'superadmin','超级管理员','wizzer@qq.com','w308aa01db0f163e8f0eb82df40590e2',0,1,'::ffff:127.0.0.1',1560156315,670,'palette.2.css',0,1,0,'[\"18\",\"35\",\"40\",\"41\"]',1,1452828989,1);

/*Table structure for table `wx_config` */

DROP TABLE IF EXISTS `wx_config`;

CREATE TABLE `wx_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appname` varchar(255) DEFAULT NULL,
  `ghid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `encodingAESKey` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `jsapi_ticket` varchar(255) DEFAULT NULL,
  `jsapi_time` int(11) DEFAULT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ghid` (`ghid`),
  UNIQUE KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wx_config` */

insert  into `wx_config`(`id`,`appname`,`ghid`,`appid`,`appsecret`,`encodingAESKey`,`token`,`access_token`,`expire_time`,`jsapi_ticket`,`jsapi_time`,`qrcode`,`createdBy`,`createdAt`) values (2,'sun','gh_c8c3f92c1b2f','wx17fe71227e1577d9','190550dda42029b952ee4273b8d4aec1','IEcfKeAWngE5vzgrPuFwBtNAtES9urJhVF2XuwABvPd','wizzer','{\"accessToken\":\"6ijC5vetM4agMtsBlPRrQm_YYZ2cH61z4w0D-bq4SEXVU2eMbL8bXnCqcOJl9z1VrOO4enAyw7o4r1ZFhte4nxFu8WCT_9gF6Tu-E6ix-4m2jtstRCD7NcJXacwx2DpPFIMiAHAXAE\",\"expireTime\":1462359582703}',1462352392,'{\"ticket\":\"bxLdikRXVbTPdHSM05e5u5qWFhRRus1fubH4C8teRcNdy7vljHKKUB3iJt2D3dSA_cgbA0rLrA6vUjmQVuDyCA\",\"expireTime\":1462359582769}',1462352392,'/upload/image/20160112/9c941345-d4ab-49cb-96a8-9aafbf1b5152.jpg',1,1446104003);

/*Table structure for table `wx_menu` */

DROP TABLE IF EXISTS `wx_menu`;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `wx_menu` */

insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (29,0,'0006','商城首页','view','','http://www.sunshop.cn/wap/wechat/oauth?goto_url=http://www.sunshop.cn/wap/',0,1,1,1459409356,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (30,0,'0007','会员中心','','','',1,2,1,1459409564,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (31,30,'00070001','会员中心','view','','http://www.sunshop.cn/wap/wechat/oauth?goto_url=http://www.sunshop.cn/wap/member',0,1,1,1460113274,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (32,30,'00070002','我的订单','view','','http://www.sunshop.cn/wap/wechat/oauth?goto_url=http://www.sunshop.cn/wap/member/order',0,2,1,1460113288,2);

/*Table structure for table `wx_msg` */

DROP TABLE IF EXISTS `wx_msg`;

CREATE TABLE `wx_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wx_msg` */

insert  into `wx_msg`(`id`,`uid`,`openid`,`nickname`,`type`,`content`,`createdAt`,`wxid`) values (1,49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer','text','猪头',1462513351,2);
insert  into `wx_msg`(`id`,`uid`,`openid`,`nickname`,`type`,`content`,`createdAt`,`wxid`) values (2,49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer','text','<span class=\"emoji emoji1f437\" title=\"pig face\"></span><span class=\"emoji emoji1f416\" title=\"pig\"></span>你好',1462514497,2);
insert  into `wx_msg`(`id`,`uid`,`openid`,`nickname`,`type`,`content`,`createdAt`,`wxid`) values (3,49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer','text','你才是<span class=\"emoji emoji1f604\" title=\"smiling face with open mouth and smiling eyes\"></span><span class=\"emoji emoji1f21a\" title=\"squared cjk unified ideograph-7121\"></span>️',1462515044,2);
insert  into `wx_msg`(`id`,`uid`,`openid`,`nickname`,`type`,`content`,`createdAt`,`wxid`) values (4,49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer','text','你啊……',1462515540,2);
insert  into `wx_msg`(`id`,`uid`,`openid`,`nickname`,`type`,`content`,`createdAt`,`wxid`) values (5,49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer','text','哎呀<span class=\"emoji emoji1f618\" title=\"face throwing a kiss\"></span>',1462515926,2);

/*Table structure for table `wx_news` */

DROP TABLE IF EXISTS `wx_news`;

CREATE TABLE `wx_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wx_news` */

insert  into `wx_news`(`id`,`title`,`description`,`picUrl`,`url`,`createdBy`,`createdAt`) values (3,'测试','测试','http://wizzer.wicp.net/upload/image/20160131/9b7d34cc-c507-4006-a821-fca0e62e89b4.png','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx17fe71227e1577d9&redirect_uri=http%3A%2F%2Fwizzer.wicp.net%2Fpublic%2Fwx%2Fsales%2Fxiren%2Fmy%2F1&response_type=code&scope=snsapi_base&state=11624317#wechat_redirect',1,1454301746);

/*Table structure for table `wx_reply` */

DROP TABLE IF EXISTS `wx_reply`;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wx_reply` */

insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (9,'keyword','txt','MENU_CLICK_1','4',1,1446106371,2);
insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (10,'follow','txt',NULL,'4',1,1459316448,2);

/*Table structure for table `wx_sales` */

DROP TABLE IF EXISTS `wx_sales`;

CREATE TABLE `wx_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `audiourl` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `sendType` int(11) DEFAULT NULL,
  `joinType` int(11) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `hasMoney` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `moneyMin` int(11) DEFAULT NULL,
  `moneyMax` int(11) DEFAULT NULL,
  `startTime` int(11) DEFAULT NULL,
  `endTime` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wx_sales` */

insert  into `wx_sales`(`id`,`name`,`code`,`type`,`picurl`,`audiourl`,`note`,`rule`,`sendType`,`joinType`,`budget`,`hasMoney`,`money`,`moneyMin`,`moneyMax`,`startTime`,`endTime`,`disabled`,`createdBy`,`createdAt`,`wxid`) values (1,'袭人花店',NULL,'1',NULL,'/upload/audio/20160114/b7ecc802-6762-4645-ae52-9a6c6e127cfe.mp3','1、红包领取时间为2016年1月1日到2月28日<br>\n2、红包使用时间为2月28日00：00至3月31日24：00<br>\n3、店铺红包无门槛，购买任何商品即可使用<br>\n4、关注公众号后，在“新年花语”-“我的红包”菜单中查看红包',NULL,1,0,10000,3697,50,5,50,1451946247,1454737207,0,1,1451888662,2);

/*Table structure for table `wx_sales_info` */

DROP TABLE IF EXISTS `wx_sales_info`;

CREATE TABLE `wx_sales_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  `salesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_sales_info` */

/*Table structure for table `wx_sales_log` */

DROP TABLE IF EXISTS `wx_sales_log`;

CREATE TABLE `wx_sales_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  `salesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_sales_log` */

/*Table structure for table `wx_sales_user` */

DROP TABLE IF EXISTS `wx_sales_user`;

CREATE TABLE `wx_sales_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `fromId` int(11) DEFAULT NULL,
  `share` int(11) DEFAULT NULL,
  `subscribe` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `usedAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  `salesid` int(11) DEFAULT NULL,
  `infoid` int(11) DEFAULT NULL,
  `logid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_sales_user` */

/*Table structure for table `wx_txt` */

DROP TABLE IF EXISTS `wx_txt`;

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

/*Table structure for table `wx_user` */

DROP TABLE IF EXISTS `wx_user`;

CREATE TABLE `wx_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `unionid` varchar(50) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `subscribe` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `wx_user` */

insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc',NULL,'Wizzer',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',1459845051,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (50,'oFTcHjzXKRfN1fSC_JNKxxeWUa74',NULL,'Veaver 程恭囸',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchTlbveDJ1PM2kThqDjxf2Ull2uvuKSYK4Z4AoIZrf5cCiaLWbfM4ev4ibmM3kbCxI2d0VMv1NvXtIj/0',1460116265,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (51,'oFTcHj6RHWas-H1AVZauQEPpSMzE',NULL,'一一',1,2,'安庆','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELTVy5TEVQwZ88tOxGXTRF8R8cQwAvfbaG4r6ibmlkutelzkXibJiaEKMFIwHZ3sXUml2xcvrWiahu15w/0',1460116330,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (52,'oFTcHj4ohbc6MILbDaKtCGBSFjOI',NULL,'ShoutLeaf',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchdOghibTb1tyMFWjNzXGQcJYaJsG1wPggbO5R5UOKgibWHn8JEpW3ukFsiax6ZEE5QyMAbX0AItyoL7/0',1460116366,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (53,'oFTcHjxqM7QNpFO5M98vsPrCCnV8',NULL,'cheney',1,1,'','','北马里亚纳群岛','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKXv6NhR3Flccu6qE1yriawDDPlGGB15u7bs7DAhAwGySDkTZXvO81sAQ5VVBRp5mPe5TBkSbXo7ys/0',1460116396,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (54,'oFTcHj7fxfVIztyBExCdgsonz9iE',NULL,'陌上',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6IkHGDKsBx31moWicJynpEb3hzicSicWicgltNLWkPcobUU09nVmEF8pj4ialhib7klVvddxicFiciaeBUyMvw/0',1460116404,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (55,'oFTcHj1dQYvR-oc6T4xBPmTdsDf8',NULL,'草下的云',1,2,'安庆','安徽','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKVbyMIusync4DibVNmHOwo4jDSxtypce1G6sNjQxSFpIcreIOyia5bxkRbgI4Zibsh9URnA3EdickgEF/0',1460116410,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (56,'oFTcHj0YrNElJvfT-SNtOfhTymW8',NULL,'小鱼宮主',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchUUlibn7w4bkMDnU2Wva6Rq4GYfZk8MCBIZ6QVxZT9LuhH69nfJmU6lTQianUl8mdqcEU9TogPgJbX/0',1460117357,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (57,'oFTcHj-sb7d-omx3Oa6nki5UbctU',NULL,'朵朵',1,0,'','','','http://wx.qlogo.cn/mmopen/2ns9cM4KERz7BJQo1b4zdZbWx2hna3Hc0gbGbw8lxDzKryvTeAib3MKojZmVsX3j0btWK4D6HL4VPSwMRxdnteHTEmUoE0bGG/0',1460117377,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (58,'oFTcHjz7fsizTTQMyfo3PlhW_9Xc',NULL,'dzy',1,1,'','','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY1gRRpGPgpibqO33XmdYLvq5v7rVXSkssZdc1lMafBO1x5ZQkXrR6bdW0yrS7RBicTxy4a07orZQf7/0',1460117626,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (59,'oFTcHj_pYIVZbZ3To64jiMFDPYtg',NULL,'QFish',1,1,'朝阳','北京','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY7feiciaCTExKstf3X5HYLMeZ1q0Vvre1DxPV6yjzwdUykwBPOOYibJJnJAdyDN0MicgxtpF3GCkZTc4/0',1460117634,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (60,'oFTcHj2oTtsNHnGhMQjm4stN0jtw',NULL,'宋磊',1,1,'临沂','山东','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OMV2KujgcK0o5cNYsJXDFx3DcVvtPreicEoG8tKSvt1AaupW8xJogXxfKlVhHpug3sZgERAldicwRhY50EZ0rUtMQ/0',1460117727,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (61,'oFTcHj5tbqhtlJQ3aih1QZgeIFCo',NULL,'天涯',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/ajR8G6R65SKv5CbiaEKWq8Eu1O4kkFpRSMOE1OEW6CkHFu8GW4HfZ5tPcXQlXntIw6eURro0SgK9tAqGb2Kp1ry43laG3u7fR/0',1460121890,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (62,'oFTcHj_Jy1uObYDe29ek6C5NqAhs',NULL,'JING<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1,2,'','','埃及','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAxfTIy3rMcv2en1AubBV2YkvvQr5C4uFzdmPnKqxPaJEMItticAg6FM0K66jl8TfUX3RNr19sNDgA/0',1460122002,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (63,'oFTcHjxSYXJHN1B5hfbC3Ssj4zGA',NULL,'跨越七海的风',0,1,'','','北马里亚纳群岛','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H8pIpHfRmEoVMYI2tMkLfWUziaeI7TUGYFbhQ9bIySme5ud62ZIrYhpS8zMYk6CGkHKwG9Ru8dFfh/0',1460170611,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (64,'oFTcHj2m7RrTjYUHulby-viG08hs',NULL,'<span class=\"emoji emoji1f49c\" title=\"purple heart\"></span><span class=\"emoji emoji1f49c\" title=\"purple heart\"></span>♚雲<span class=\"emoji emojiae\" title=\"registered sign\"></span><span class=\"emoji emoji1f497\" title=\"growing heart\"></span><span class=\"emo',1,2,'','','冰岛','http://wx.qlogo.cn/mmopen/Q3auHgzwzM7UNuictRaV29hcBMtQwGwBeu2wBo61ibr87VZ3jnuDYrYqwiauL5a5iahykynUaZovuG99MOiaSLTtCPg/0',1460190058,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (65,'oFTcHj_AZtAgnoTuOGlyUSwedHWk',NULL,'瑞瑞<span class=\"emoji emoji1f60a\" title=\"smiling face with smiling eyes\"></span>',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKciaL3gUyeTWtsL6S88Jr84GkzvWDKuZblOXG5DzD8Wlr0DkJrhK9OibS44nibRMLXYGyFBBUBds4GT/0',1460300085,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (66,'oFTcHjzBfpxS7ckD5SeaI0AP32u8',NULL,'不动·峰',1,1,'长宁','上海','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKoIbzYeupKwSsdibSdJ4M8YTw16Pj4hwMuIOKPE1VxJHrR3MVMPmaCAUYDiasDItPEJAnDcIiad71yg/0',1460384065,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (67,'oFTcHjxt5f3rdqcdhRK777J5hRIM',NULL,'AA<span class=\"emoji emoji1f47c\" title=\"baby angel\"></span><span class=\"emoji emoji2601\" title=\"cloud\"></span>️',1,2,'绍兴','浙江','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6JjrFwGdtVTfbz0icLCXbrvjtSz2vYJ88k8szjl4MggMKDAAibs0Vzav77snChlh0dsK370Vws1zvSg/0',1460385597,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (68,'oFTcHjyEwQinc9d2W9CAmCgyMLOU',NULL,'九天',1,1,'绍兴','浙江','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchbsPib3jU3zscUs4rfKSm5IpjvBIGCDcjsv3OmSMAzulSVaMo0vmBKxtwESTyrtDEZodsa3E5GKhX/0',1460387137,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (69,'oFTcHj-FFo9NlHk8qnUFJ4dZ_OTk',NULL,'YXH',1,1,'台州','浙江','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchfOzmciaYyn3I0fyxaTibaORfI5V8HumDnlyKHX6xAmQtXLjwWMLcPhlEwfn9fibSNqWzYYJEhfoJ1y/0',1461328687,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (70,'oFTcHj0yw4SSfg_A7jSllkbq3TSg',NULL,'Pepsi Cole',0,1,'Suzhou','Jiangsu','China','http://wx.qlogo.cn/mmopen/SYeWkon6C6LEFOMspQH1FVnOmuZzTgjc2Hunbd4dPO7ibWdU8qo6fex31dBmpqShWAvQXyShjOLZyhJYQicdnCpA/0',1461842276,2);
insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (71,'oFTcHj7NoeCpa2A4e84-mouuVjVc',NULL,'朱礼明',1,1,'宜昌','湖北','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6QMdKtFITwGCDgUL8Na5ichucL088OCqFjuib4anBd94YRkicicoAnHic6XLsMPIgGNcrHFPrgfATjosA/0',1462258481,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
