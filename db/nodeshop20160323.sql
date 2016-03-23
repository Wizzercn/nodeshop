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

insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (1,0,'合肥上城信息技术有限公司','上城（SunCHN），创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。 ','admin','pc',1457337778,0,'/upload/image/20160307/7178538f-89d4-40fc-8867-64d3f5b5f170.jpg','','','',1,1457337864,12,1);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (2,0,'有机会员的日常生活：策马奔腾！','策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！','超级管理员',NULL,1457339797,0,'/upload/image/20160307/479f164a-2824-4880-b5a3-b5e1e3ac3564.jpg','','','',1,1457339823,16,2);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (3,0,'我不推广产品 我推广健康','进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。','超级管理员',NULL,1457339853,0,'/upload/image/20160307/e8def416-c655-486e-9fac-bdecf7a00c25.jpg','','','',1,1457339891,16,3);
insert  into `cms_article`(`id`,`shopid`,`title`,`info`,`author`,`client`,`publishAt`,`disabled`,`picurl`,`seo_title`,`seo_keywords`,`seo_description`,`createdBy`,`createdAt`,`channelId`,`contentId`) values (4,0,'家庭环保：小厨房的大环保','在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。','超级管理员',NULL,1457339896,0,'/upload/image/20160307/4d4106db-aa82-4b94-bbcb-5ab83e691676.jpg','','','',1,1457339927,16,4);

/*Table structure for table `cms_article_content` */

CREATE TABLE `cms_article_content` (
  `content` longtext,
  `articleId` int(11) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cms_article_content` */

insert  into `cms_article_content`(`content`,`articleId`,`id`) values ('<p>上城（SunCHN），创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。&nbsp;</p><p><br/></p><p>上城是一个聚焦于电商，专注于技术研发的技术性团队。凭借多年以来长期扎根在电商领域的研究与服务经验，着眼于最前沿的技术线路，着重于中小微企业用户群体，依照中小微企业现状特征量身制定敏捷高效的电商售卖解决方案。横向整合第三方支付、物流信息、客服通讯等接口环节，纵向打通目前主流ERP、CRM等系统产品，为企业打造一个电商时代售卖一体化的开放式技术平台。&nbsp;</p><p><br/></p><p>未来，上城继续在电商研发领域深耕细作，坚持以客户需求为中心，以最大化客户电商产投性价比为思维导向，坚守品质，追求卓越，和更多的合作伙伴携手与共，助力企业轻松开创电商时代。</p>',1,1);
insert  into `cms_article_content`(`content`,`articleId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></span></p>',2,2);
insert  into `cms_article_content`(`content`,`articleId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></span></p>',3,3);
insert  into `cms_article_content`(`content`,`articleId`,`id`) values ('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></span></p>',4,4);

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
  `homepage` tinyint(1) DEFAULT NULL,
  `content` longtext,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `cms_channel` */

insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,0,'0001','新手上路','',NULL,NULL,NULL,0,'',0,1,0,1,1457332529);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,0,0,'0002','支付/配送','',NULL,NULL,NULL,0,'',0,1,0,1,1457332535);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,0,0,'0003','公司信息','',NULL,NULL,NULL,0,'',0,1,0,1,1457332539);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,0,0,'0004','新闻资讯','',NULL,NULL,NULL,0,'',0,1,0,1,1457332544);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,0,0,'0005','帮助中心','',NULL,NULL,NULL,0,'',0,1,0,1,1457332550);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,0,1,'00010001','新用户注册','',NULL,NULL,NULL,0,'',0,0,0,1,1457332561);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,0,1,'00010002','预订流程','',NULL,NULL,NULL,0,'',0,0,0,1,1457332568);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,0,1,'00010003','购物保障','',NULL,NULL,NULL,0,'',0,0,0,1,1457332574);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,0,2,'00020001','支付方式','',NULL,NULL,NULL,0,'',0,0,0,1,1457332584);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,0,2,'00020002','配送方式','',NULL,NULL,NULL,0,'',0,0,0,1,1457332591);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,0,2,'00020003','配送时间及运费','',NULL,NULL,NULL,0,'',0,0,0,1,1457332599);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,3,'00030001','关于我们','',NULL,NULL,NULL,0,'',0,0,0,1,1457332610);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,0,3,'00030002','用户协议','',NULL,NULL,NULL,0,'',0,0,0,1,1457332616);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,0,3,'00030003','隐私声明','',NULL,NULL,NULL,0,'',0,0,0,1,1457332623);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,0,4,'00040001','站内公告','',NULL,NULL,NULL,0,'',0,0,0,1,1457332634);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,4,'00040002','活动资讯','',NULL,NULL,NULL,0,'',0,0,0,1,1457332641);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,0,4,'00040003','公司动态','',NULL,NULL,NULL,0,'',0,0,0,1,1457332646);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,0,5,'00050001','常见问题','',NULL,NULL,NULL,0,'',0,0,0,1,1457332655);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,0,5,'00050002','找回密码','',NULL,NULL,NULL,0,'',0,0,0,1,1457332660);
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,0,5,'00050003','联系我们','',NULL,NULL,NULL,0,'',0,0,0,1,1457332665);

/*Table structure for table `cms_link` */

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (8,'新品热卖1','img','/upload/image/20160306/e247e21a-ee9e-4476-b920-34b33f72247a.jpg','/hot','_blank',1,1457332270,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (9,'新品热卖2','img','/upload/image/20160306/e247e21a-ee9e-4476-b920-34b33f72247a.jpg','/hot','_blank',1,1457332274,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (10,'公测','img','/upload/image/20160309/5efbaed7-1e47-4881-b1e1-0b3d1035f010.jpg','javascript:;','_self',1,1457573796,5);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (11,'登录页背景图','img','/upload/image/20160309/b5dd34b1-b364-4f0f-b9e8-391e799efd40.jpg','javascript:;','_self',1,1457573838,6);

/*Table structure for table `cms_linkclass` */

CREATE TABLE `cms_linkclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `cms_linkclass` */

insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (4,'首页Banner',1,1457332232);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (5,'商品列表Banner',1,1457573644);
insert  into `cms_linkclass`(`id`,`name`,`createdBy`,`createdAt`) values (6,'登录页背景',1,1457573664);

/*Table structure for table `cms_site` */

CREATE TABLE `cms_site` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_domain` varchar(255) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
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

insert  into `cms_site`(`id`,`shopid`,`site_name`,`site_domain`,`site_icp`,`site_logo`,`site_qq`,`site_email`,`site_tel`,`weibo_name`,`weibo_url`,`weibo_qrcode`,`wechat_name`,`wechat_id`,`wechat_qrcode`,`seo_title`,`seo_keywords`,`seo_description`,`footer_content`) values (1,NULL,'电子商城演示系统','','','/upload/image/20160306/5ab3e9c5-975d-47fc-b2fa-949f2846745d.png','11624317','','4008-448-008','','','','','','/upload/image/20160306/abf3f5e1-176f-42fc-b14d-07774be9b498.jpg','','','','&copy;2016 合肥上城信息技术有限公司');

/*Table structure for table `img_config` */

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

insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('0a7b520b43774ac699a70387698ca757','3.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99.jpg','/open/image/file/0a7b520b43774ac699a70387698ca757.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_m.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('0f5daea9c0b94f3bb89b3d9798ad432a','i1.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af.jpg','/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_m.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_s.jpg',430,430,0,1457334101);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('11ff343dbeda4ff3a9b0e2d962c7766b','5.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad.jpg','/open/image/file/11ff343dbeda4ff3a9b0e2d962c7766b.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_m.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('17274ea8a11e46b88c6d8a7967c7a976','3.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528.jpg','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_m.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_s.jpg',720,720,0,1457404284);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('1c2799a956154059a826f06c230cd967','5.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4.jpg','/open/image/file/1c2799a956154059a826f06c230cd967.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_m.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('20f16a08b4684d5cad73749001bcbb65','201602122052502802.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca.jpg','/open/image/file/20f16a08b4684d5cad73749001bcbb65.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_m.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_s.jpg',600,600,0,1457598090);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('24aa7d9a50694693a5387fe66a92383a','04.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b.jpg','/open/image/file/24aa7d9a50694693a5387fe66a92383a.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_m.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_s.jpg',600,600,0,1457403271);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2a16c0a6e63a4d95bcf07ed1180595c9','5.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351.jpg','/open/image/file/2a16c0a6e63a4d95bcf07ed1180595c9.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_m.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2cb01917077741a18fa9f9aed511a244','1.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de.jpg','/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_m.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_s.jpg',800,800,0,1457403550);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('2f4bdf8a0d884426ac9440cb7b446fdb','01.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266.jpg','/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_m.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_s.jpg',640,640,0,1457403270);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('38b675d5ad904792aaa9bfc37a38ca09','03.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59.jpg','/open/image/file/38b675d5ad904792aaa9bfc37a38ca09.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_m.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_s.jpg',600,600,0,1457403270);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('44ef4c06af124317915e2b8c4d371483','4.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f.jpg','/open/image/file/44ef4c06af124317915e2b8c4d371483.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_m.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_s.jpg',800,800,0,1457403550);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('49898d94c8244b5c94534dd3bc3911c9','4.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2.jpg','/open/image/file/49898d94c8244b5c94534dd3bc3911c9.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_m.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('52ce1880b3384aec89a854394cb68978','pic_m.jpg','/upload/image/20160119/a1e61e1f-d652-430f-afef-38100cb2dc6b.jpg','/open/image/52ce1880b3384aec89a854394cb68978.jpg',NULL,NULL,180,72,0,1453190985);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('551860e3ef97462ca2f2bc27d1c79533','1.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59.jpg','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_m.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_s.jpg',350,350,0,1457333832);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('5c7e75fc65524649bc35a6cba507b291','1.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150.jpg','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_m.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_s.jpg',400,400,0,1457404968);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('699ed33635164f8cb101e787d1d7d774','2.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5.jpg','/open/image/file/699ed33635164f8cb101e787d1d7d774.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_m.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_s.jpg',350,350,0,1457333152);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('6cac523104ac4737a7a9ce937b3c09f7','6.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939.jpg','/open/image/file/6cac523104ac4737a7a9ce937b3c09f7.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_m.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_s.jpg',800,1200,0,1457333153);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('6f963b00383449ae87e674fdba40be29','201601051454487968.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd.png','/open/image/file/6f963b00383449ae87e674fdba40be29.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_m.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_s.png',418,418,0,1457598009);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7245859fe5e74edd9bfc63043b097eef','3.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300.jpg','/open/image/file/7245859fe5e74edd9bfc63043b097eef.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_m.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_s.jpg',600,600,0,1457403758);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('771880c741d24fa1bcc08b986f7844b5','2.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c.jpg','/open/image/file/771880c741d24fa1bcc08b986f7844b5.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_m.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_s.jpg',800,800,0,1457403551);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7871160e5eb14b46a3f5c3db4491e48e','3.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97.jpg','/open/image/file/7871160e5eb14b46a3f5c3db4491e48e.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_m.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7ae441f3add44b488d50277b8ec23abf','1.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48.jpg','/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_m.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_s.jpg',400,400,0,1457404361);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('7d8f312e85d44e47a4729039adc9db16','1.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0.jpg','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_m.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_s.jpg',500,500,0,1457405268);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('8050f2cf794b438d8c62e12c7a1d945a','3.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658.jpg','/open/image/file/8050f2cf794b438d8c62e12c7a1d945a.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_m.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_s.jpg',640,640,0,1457405118);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('854830f165c54850bea26f9e6ac9f26f','20151010092555.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1.jpg','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_m.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_s.jpg',600,600,0,1457598082);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('896723809b9449f481fd2e8ba87eeaf1','2.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325.jpg','/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_m.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_s.jpg',640,640,0,1457405118);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('9145518ce21d418db8aef27665cba657','pic_m.jpg','/upload/image/20160119/754ad334-4de5-44ad-98cf-d1fd4fb0648c.jpg','/open/image/file/9145518ce21d418db8aef27665cba657.jpg',NULL,NULL,180,72,0,1453191632);
insert  into `img_image`(`id`,`filename`,`src`,`url`,`m_src`,`s_src`,`width`,`height`,`watermark`,`updatedAt`) values ('eaef3cc8c59e489ab0ab3dfbe02a2007','201601051454487968.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103.png','/open/image/file/eaef3cc8c59e489ab0ab3dfbe02a2007.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_m.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_s.png',418,418,0,1457598085);

/*Table structure for table `img_image_id__shop_goods_images` */

CREATE TABLE `img_image_id__shop_goods_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_image_id__shop_goods_images` */

/*Table structure for table `img_image_id__shop_goods_lv_price_images` */

CREATE TABLE `img_image_id__shop_goods_lv_price_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_lv_price_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `img_image_id__shop_goods_lv_price_images` */

/*Table structure for table `shop_area` */

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

CREATE TABLE `shop_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_templet` varchar(20) DEFAULT NULL,
  `shop_css` varchar(20) DEFAULT NULL,
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
  `pay_alipay_info` longtext,
  `pay_wxpay` tinyint(1) DEFAULT NULL,
  `pay_wxpay_info` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_config` */

insert  into `shop_config`(`id`,`shop_templet`,`shop_css`,`list_load_type`,`list_page_size`,`list_quick_buy`,`freight_disabled`,`freight_type`,`freight_price`,`freight_num`,`tax_disabled`,`tax_price`,`pay_cash`,`pay_money`,`pay_alipay`,`pay_alipay_info`,`pay_wxpay`,`pay_wxpay_info`) values (1,'default','green','ajax',4,1,1,'price',0,0,1,0,1,1,1,'{\"alipay_parter\":\"2088411890520875\",\"alipay_key\":\"fmo0y0t56k541itec79qt65x4oscmugj\",\"alipay_email\":\"chenggz@sunchn.com\"}',1,'{\"wxpay_appid\":\"wx17fe71227e1577d9\",\"wxpay_mchid\":\"1310090901\",\"wxpay_key\":\"SunChn8878dhdhd72hdvASdyxyyd3713\",\"wxpay_appsecret\":\"190550dda42029b952ee4273b8d4aec1\"}');

/*Table structure for table `shop_goods` */

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
  `note` longtext,
  `prop` longtext,
  `spec` longtext,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods` */

insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (4,'G1603000001','山东特产正宗潍县萝卜青萝卜','绿色无公害',2490,3500,0,1000,'箱',100,0,1,0,6,0,0,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',0,1458703521,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ae90a9e2-a9e7-469e-bb07-7a65c00d1400.jpg\" style=\"\" title=\"TB2Ilz5iVXXXXa1XXXXXXXXXXXX_!!2329658969.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/f001f0be-999d-45ed-b06c-94b12985ec44.jpg\" style=\"\" title=\"TB2pNYGiVXXXXbkXpXXXXXXXXXX_!!2329658969.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ffe7382d-ba0f-47cf-8632-fdb00128feb9.jpg\" style=\"\" title=\"TB2VTjIiVXXXXaPXpXXXXXXXXXX_!!2329658969.jpg\"/></p><p><br/></p>','[]','[]',0,4,0,0,9,1,1458703521);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (5,'G1603000002','iPhone6','与众不同',399900,400000,0,500,'个',1000,0,1,0,4,14,3,'/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg',1,1458703530,1458703533,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160306/dfeb74d6-4b9e-45f2-9ffe-0ee58901d928.jpg\" style=\"\" title=\"i5.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ad65c80b-372b-4787-9990-4509c492eb3d.jpg\" style=\"\" title=\"i6.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/897d3e28-681a-44d9-8e6e-0041e1b876c0.jpg\" style=\"\" title=\"i7.jpg\"/></p><p><br/></p>','[{\"name\":\"网络制式\",\"value\":\"4G\"},{\"name\":\"出厂年份\",\"value\":\"2016\"},{\"name\":\"特性\",\"value\":\"漂亮\"}]','[[{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"9\",\"spec_value_name\":\"16G\"},{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"10\",\"spec_value_name\":\"32G\"},{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"11\",\"spec_value_name\":\"64G\"}],[{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"12\",\"spec_value_name\":\"灰色\"},{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"13\",\"spec_value_name\":\"银色\"},{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"14\",\"spec_value_name\":\"金色\"}]]',1,0,0,0,8,1,1458703530);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (6,'G1603000003','即食木耳（中辣）45g','单袋独立包装 清新爽口',300,500,0,45,'袋',100,0,1,0,7,0,0,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',0,1457598016,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/a75d778b-e253-4bce-a72e-2da41baf3c89.jpg\" style=\"\" title=\"000000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/8dc791f5-db68-4374-9026-e5d2bff814ed.jpg\" style=\"\" title=\"0000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/08d7f6c4-e643-41cf-9cf3-56a63ebf1062.jpg\" style=\"\" title=\"000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/9f8ee1f1-3eb6-4981-8624-3ae056073565.jpg\" style=\"\" title=\"00.jpg\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457598016);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (7,'G1603000004','卡侬亚麻籽油250ml','纯自然的亚麻籽为原料，采用先进热榨技术制成',4500,5900,0,50,'瓶',100,0,1,0,7,0,0,'/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg',0,1457403305,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/f59e0c45-12ae-40f2-b534-caa0c64a505d.jpg\" style=\"\" title=\"05.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ab22329c-35b0-41d2-9ec1-8d68c828f471.jpg\" style=\"\" title=\"06.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ecf0a90c-ffec-4e52-ac5c-5503eae74fec.jpg\" style=\"\" title=\"07.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/b39d02e0-712d-4dc3-9b93-6d5abb1eda6a.jpg\" style=\"\" title=\"08.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ae0a9dd7-72aa-4c26-a1dc-4942d5e2193f.jpg\" style=\"\" title=\"09.jpg\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457403305);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (8,'G1603000005','独头黑蒜（礼盒装）20枚','发酵完全，口感醇厚，颗颗粒大饱满，营养丰富全面，260g/盒',9900,11900,0,260,'盒',100,0,1,0,6,0,0,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',0,1457403633,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/8dc65471-8703-4111-bdc3-b347fc2d8ecf.jpg\" style=\"\" title=\"01.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5fe9ab20-7007-4627-ac51-365d30cc30fd.jpg\" style=\"\" title=\"0.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/380c4663-5ad6-41dd-8405-d44ea1370a88.jpg\" style=\"\" title=\"02.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/2f4b0c1f-4e13-4523-b9df-8cc5cccbb645.jpg\" style=\"\" title=\"04.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/27502cf9-0c6b-417d-aed1-94289a493000.jpg\" style=\"\" title=\"03.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5b6a4d46-ab0e-4bec-b783-844f9d2de150.jpg\" style=\"\" title=\"05.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ba7fa5db-451e-4c53-b5fd-0e18da5f2267.jpg\" style=\"\" title=\"06.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/2a61964d-a75d-4d53-a729-e28fc9f549fb.jpg\" style=\"\" title=\"07.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/68fb3b44-90c3-46ba-bd12-f3f0ef0cda0c.jpg\" style=\"\" title=\"08.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5b7b7602-7d9a-4568-8c1d-6e3693d1736b.jpg\" style=\"\" title=\"09.jpg\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457403633);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (9,'G1603000006','绿格自然栽培果蔬包6~8斤','清晨采摘，当天配送，绿色健康，口感自然',8900,15800,0,3000,'袋',100,0,1,0,6,0,0,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',0,1457598094,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎自然栽培果蔬包，仅限售合肥市内，外地请勿下单。<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎因季节限定，目前秋茬蔬菜刚上市，品种只有6种。后期会有更多品种陆续上市。敬请耐心等待！总重量大约8-10斤左右。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎配送时间：周一至周六9：00-17：00</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎运费规则：合肥市区内包邮免费送货上门</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img title=\"1444805074116301.jpg\" alt=\"QQ图片20151009114218.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805074116301.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">◎水果黄瓜</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">水果黄瓜富含蛋白质、糖类、维生素B2、维生素C、维生素E、胡萝卜素、尼克酸、钙、磷、铁等营养成分。多吃可起到延年益寿、降低血糖、抗衰老的作用。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用生食或做水果沙拉。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805113900956.jpg\" alt=\"1444805113900956.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805113900956.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎樱桃萝卜</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">萝卜性甘、凉，味辛，有通气宽胸、健胃消食、止咳化痰、除燥生津、解毒散瘀、止泄、利尿等功效。萝卜汁液可防止胆结石形成，所含的粗纤维和木质素化合物有抗癌作用。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般素炒或凉拌食用。（这里啰嗦一句：不少人只吃萝卜，不吃萝卜叶。殊不知萝卜叶中的维生度A含量是1400IU，是同类花椰菜的3倍。而且萝卜叶中的膳食纤维，能促进肠胃蠕动，防治便秘。）</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805146131462.jpg\" alt=\"1444805146131462.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805146131462.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎紫色青梗菜</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自北京，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">紫色青梗菜营养价值成分与白菜相近似，它含有蛋白质、膳食纤维、钙、铁、胡萝卜素、维生素B1、维生素B2、维生素C等。其中钙的含量较高，几乎等于白菜含量的2～3倍。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般素炒食用</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img title=\"1444805174139646.jpg\" alt=\"QQ图片20151009120159.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805174139646.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎秋葵</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">秋葵含有果胶、牛乳聚糖等，其含有铁、钙及糖类等多种营养成分，有预防贫血的效果。还含有维生素A，有益于视网膜健康、维护视力。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">秋葵可凉拌、热炒、油炸、炖食，做色拉、汤菜等，在凉拌和炒食之前必须在沸水中烫三五分钟以去涩。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805228341414.jpg\" alt=\"1444805228341414.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805228341414.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎辣椒</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自瑞士进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软���黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">每百克辣椒维生素C含量高达198毫克，居蔬菜之首位。维生素B、胡萝卜素以及钙、铁等矿物质含量亦较丰富。对于温胃驱寒都有很大的功效。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用煎炒，煮食，研末服或生食。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"831\" title=\"1444806683102028.jpg\" alt=\"1444806683102028.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444806683102028.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 831px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎豆角</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自南京，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">豆角含丰富维生素B、C和植物蛋白质，能使人头脑宁静.调理消化系统，消除胸膈胀满。可防治急性肠胃炎，呕吐腹泻。有解渴健脾、补肾止泄、益气生津的功效。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用热炒，煮食。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">温馨提示：豆角一定要焯透，以防止中毒。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 24px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">关于基地</span></strong></span></p><hr style=\"margin: 20px 0px; padding: 0px; box-sizing: border-box; border-right-width: 0px; border-left-width: 0px; border-top-style: solid; border-top-color: rgb(238, 238, 238); border-bottom-style: solid; border-bottom-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">绿格牛角大圩种植基地，学专人员全程管理，自然栽培，苛求自然的口感和绿色的品质。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"360\" title=\"1444805521101468.jpg\" alt=\"1444805521101468.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805521101468.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 360px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格全球范围内优选果蔬种源，主要供应商为全球著名的荷兰Bejo和瑞士Syngenta，承诺非转基因，品种独特，外观极具观赏性。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"149\" title=\"1444805635116198.jpg\" alt=\"1444805635116198.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805635116198.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 149px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格进口荷兰Koppert熊蜂，自然授粉，杜绝化学激素。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"346\" title=\"1444805654968774.jpg\" alt=\"1444805654968774.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805654968774.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 346px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格将继续引进更优秀的品种，执行更严格的管理，生产处更好的自然栽培果蔬，助力您及家人品质生活。</p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457598094);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (10,'G1603000007','寿西湖红颜草莓1.2kg（火热预售）','基地直采，新鲜直达，俏丽“红颜”，新品预售，共享“莓”好时光',4800,6000,0,1200,'袋',100,0,1,0,6,0,0,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',0,1457598042,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457140997273639.jpg\" title=\"1457140997273639.jpg\" alt=\"1457140997273639.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">寿西湖红颜草莓</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">产地：寿县寿西湖农场</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">规格：1箱（6盒，200g/盒）</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">专业育种，生态种植</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">新鲜采摘，无膨大剂</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">口感：清甜多汁，柔嫩细腻</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">营养：维生素、矿物质、微量元素、果胶、纤维素</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">储存方法：冰箱冷藏</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">食用方法：</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">1</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">）用淡盐水浸泡草莓前，不要摘掉草莓蒂，以免渗入果肉内造成污染</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">2</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">）草莓自然成熟后采摘，不易长久保存，收到后请冷藏，并尽快食用。</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457141160337584.jpg\" title=\"1457141160337584.jpg\" alt=\"1457141160337584.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457141557126040.jpg\" title=\"1457141557126040.jpg\" alt=\"QQ图片20160305092932_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">甜蜜之源</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">多米农社坚持寻找放心食材，为了找到让人吃的放心的食材，来到草莓源产地——安徽六安寿县寿西湖农场，精挑细选，直到发现真正好吃和健康的红颜草莓。我们用心倾听普通农民的故事，记录每一样食材的来源，最终呈现给顾客一份份充满人情味的礼物。</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142288560488.jpg\" title=\"1457142288560488.jpg\" alt=\"1457142288560488.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142261278286.jpg\" title=\"1457142261278286.jpg\" alt=\"1457142261278286.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">俏丽红颜 唇齿之享</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">寿西湖农场直采，当季新鲜采摘</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142365266581.jpg\" title=\"1457142365266581.jpg\" alt=\"1457142365266581.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142388108917.jpg\" title=\"1457142388108917.jpg\" alt=\"1457142388108917.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">美味俏红颜</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">红颜草莓因其鲜嫩红润，宛如少女娇羞的脸颊，故又称“红颊草莓”</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142442535960.jpg\" title=\"1457142442535960.jpg\" alt=\"1457142442535960.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">共享“莓”好时光</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">果肉柔软细嫩，丰盈汁水弥漫舌尖，果实馥郁芳香，口口新鲜唇齿留香</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">有机种植，真正的草莓味，无任何生长激素，无膨大剂</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457143014106180.jpg\" title=\"1457143014106180.jpg\" alt=\"1457143014106180.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">预售规则：周三下午16:00前下单购买，周四统一安排配送；</span></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457598042);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (11,'G1603000008','竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','2016年2月4日前订单，均年后配送！',16800,19800,0,1500,'袋',100,0,1,0,9,0,0,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',0,1457404416,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品说明 PRODUCT DESCRIPTION</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">本期主题：多米农社禽蛋年货主题周<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\">活动时间：2016年1月23日—2016年1月30日</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\">具体说明：活动仅限一周，时间截止，即刻恢复原价</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 24px;\">活动促销价：原价168元/只 现活动促销128元/只，另：赠送4枚价值12元的绿皮乌鸡蛋</span></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342791308107.jpg\" title=\"1453342791308107.jpg\" alt=\"IMG_4281_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品信息 PRODUCT INFORMATION</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【品名】 ：竹丝乌骨鸡</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【规格】 ：宰杀后1.5-3斤左右</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【鸡龄】 ：<span style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">≥180天</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【喂养方式】：纯粮食古法喂养</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【产地】 ：安徽庐江汤池镇</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【包装】 ：现宰现杀，真空包装装</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">储存方法 STORAGE METHOD</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">冷藏保存</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453341501960942.jpg\" title=\"1453341501960942.jpg\" alt=\"webwxgetmsgimg_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品特色&nbsp;PRODUCT&nbsp;FEATURES</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">自由采食 纯粮喂养<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">温泉之乡林地放养，远离工业污染，水源纯净空气清新；</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">原料喂养，自由觅食昆虫、青草；渴了喝井水，露水，食料天然</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453341826899063.jpg\" title=\"1453341826899063.jpg\" alt=\"IMG_4298_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">散养乌鸡 乌皮乌骨</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">优质鸡种，世界稀有，中国独有，天然食料品质安心</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342081731109.jpg\" title=\"1453342081731109.jpg\" alt=\"1453342081731109.jpg\" width=\"640\" height=\"559\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 559px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">营养丰富 健康美味&nbsp;<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">上海各大月子会所专供滋补佳品</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342272151902.jpg\" title=\"1453342272151902.jpg\" alt=\"1453342272151902.jpg\" width=\"640\" height=\"427\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 427px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342280667422.jpg\" title=\"1453342280667422.jpg\" alt=\"1453342280667422.jpg\" width=\"640\" height=\"494\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 494px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342286484882.jpg\" title=\"1453342286484882.jpg\" alt=\"1453342286484882.jpg\" width=\"640\" height=\"392\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 392px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342288133656.jpg\" title=\"1453342288133656.jpg\" alt=\"1453342288133656.jpg\" width=\"640\" height=\"425\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 425px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">细节描述 DETAIL DISPLAY</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453343080115755.jpg\" title=\"1453343080115755.jpg\" alt=\"IMG_4281_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343084956467.jpg\" title=\"1453343084956467.jpg\" alt=\"IMG_4286_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343087363919.jpg\" title=\"1453343087363919.jpg\" alt=\"IMG_4311_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343091145232.jpg\" title=\"1453343091145232.jpg\" alt=\"IMG_4314_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343095757574.jpg\" title=\"1453343095757574.jpg\" alt=\"IMG_4345_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457404416);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (12,'G1603000009','乌鸡蛋（6枚装）','2016年2月4日前订单，均年后配送',1800,1980,0,500,'盒',100,0,1,0,9,0,0,'/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',0,1457405026,NULL,'<p></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">产品特色&nbsp;PRODUCT&nbsp;FEATURES</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">营养均衡</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">温泉之乡林地散养 ，生态循环-天然养殖、健康放心</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453344900402863.jpg\" title=\"1453344900402863.jpg\" alt=\"1453344900402863.jpg\" width=\"640\" height=\"481\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 481px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">自由采食 纯粮喂养</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">原料喂养，自由觅食昆虫、青草；渴了喝井水，露水，食料天然</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453345057134960.jpg\" title=\"1453345057134960.jpg\" alt=\"1453345057134960.jpg\" width=\"640\" height=\"510\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 510px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span>蛋香浓郁 味道鲜美 适应多种特殊人群</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">天然营养加工厂，食用桔梗皮、花椒种、豆梗、玉米等独创性饲料<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">富集多种营养成分，适合孕妇、婴幼儿、儿童及老年人等特殊人群食用</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453346281657095.jpg\" title=\"1453346281657095.jpg\" alt=\"1453346281657095.jpg\" width=\"640\" height=\"913\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 913px; max-width: 100%; width: 640px;\"/></p>','[]','[]',0,0,0,0,0,1,1457405026);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (13,'G1603000010','五常稻花香龙稻尚品大米2.5kg','珍稀稻米品种-寒地稻，全程精耕细作，蒸煮米香四溢',4900,6400,0,1000,'袋',100,0,1,0,7,0,0,'/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',0,1457597947,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837266125153.jpg\" title=\"1445837266125153.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837266795184.jpg\" title=\"1445837266795184.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837268720954.jpg\" title=\"1445837268720954.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837270131939.jpg\" title=\"1445837270131939.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837271823628.jpg\" title=\"1445837271823628.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837273247863.jpg\" title=\"1445837273247863.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457597947);
insert  into `shop_goods`(`id`,`gn`,`name`,`info`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`classid`,`typeid`,`brandid`,`imgurl`,`disabled`,`upAt`,`downAt`,`note`,`prop`,`spec`,`is_spec`,`view_count`,`buy_count`,`comment_count`,`location`,`updatedBy`,`updatedAt`) values (14,'G1603000011','阿根廷红虾L4 (2kg)','深海捕捞 极速鲜动 壳薄肉大 ',23500,30900,0,800,'盒',100,0,1,0,10,0,0,'/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',0,1457597958,NULL,'<p style=\"text-align: center;\"><img src=\"http://www.duomii.cn/upload/image/20151117/1447732720138510.gif\" title=\"1447732720138510.gif\" alt=\"详情_01.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732735711659.gif\" title=\"1447732735711659.gif\" alt=\"详情_02.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732745635149.gif\" title=\"1447732745635149.gif\" alt=\"详情_03.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732751841615.gif\" title=\"1447732751841615.gif\" alt=\"详情_04.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732754796776.gif\" title=\"1447732754796776.gif\" alt=\"详情_05.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732758803575.gif\" title=\"1447732758803575.gif\" alt=\"详情_06.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p>','[]','[]',0,0,0,0,0,1,1457597958);

/*Table structure for table `shop_goods_brand` */

CREATE TABLE `shop_goods_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `note` longtext,
  `alias` varchar(100) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_brand` */

insert  into `shop_goods_brand`(`id`,`name`,`note`,`alias`,`domain`,`picurl`,`location`) values (3,'苹果','<p>苹果</p>','苹果公司','http://www.apple.com','',NULL);

/*Table structure for table `shop_goods_class` */

CREATE TABLE `shop_goods_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `settings` longtext,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `is_index` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_class` */

insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (3,0,'0001','手机',NULL,1,1,1,1,1,1457332978,14);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (4,3,'00010001','苹果手机',NULL,0,0,0,5,1,1457332988,14);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (5,0,'0002','蔬菜',NULL,0,1,1,2,1,1457333001,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (6,5,'00020001','新鲜果蔬',NULL,0,0,0,1,1,1457333017,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (7,5,'00020002','粮油干货',NULL,0,0,0,2,1,1457333030,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (8,0,'0003','充值卡',NULL,1,0,0,3,1,1457333050,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (9,5,'00020003','肉禽蛋奶',NULL,0,0,0,3,1,1457403983,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (10,5,'00020004','水产海鲜',NULL,0,0,0,4,1,1457403998,0);

/*Table structure for table `shop_goods_lv_price` */

CREATE TABLE `shop_goods_lv_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `lvid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_lv_price` */

/*Table structure for table `shop_goods_products` */

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_products` */

insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (14,'P1603000004','卡侬亚麻籽油250ml','',4500,5900,0,50,'瓶',100,0,1,0,7,7,0,0,NULL,0,1,1457403305,NULL,0,1,1457403305);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (15,'P1603000005','独头黑蒜（礼盒装）20枚','',9900,11900,0,260,'盒',100,0,1,0,8,6,0,0,NULL,0,1,1457403633,NULL,0,1,1457403633);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (18,'P1603000008','竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','',16800,19800,0,1500,'袋',100,0,1,0,11,9,0,0,NULL,0,1,1457404416,NULL,0,1,1457404416);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (19,'P1603000009','乌鸡蛋（6枚装）','',1800,1980,0,500,'盒',100,0,1,0,12,9,0,0,NULL,0,1,1457405026,NULL,0,1,1457405026);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (25,'P1603000010','五常稻花香龙稻尚品大米2.5kg','',4900,6400,0,1000,'袋',100,0,1,0,13,7,0,0,NULL,0,1,1457597947,NULL,0,1,1457597947);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (26,'P1603000011','阿根廷红虾L4 (2kg)','',23500,30900,0,800,'盒',100,0,1,0,14,10,0,0,NULL,0,1,1457597958,NULL,0,1,1457597958);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (27,'P1603000003','即食木耳（中辣）45g','',300,500,0,45,'袋',100,0,1,0,6,7,0,0,NULL,0,1,1457598016,NULL,0,1,1457598016);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (28,'P1603000007','寿西湖红颜草莓1.2kg（火热预售）','',4800,6000,0,1200,'袋',100,0,1,0,10,6,0,0,NULL,0,1,1457598042,NULL,0,1,1457598042);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (29,'P1603000006','绿格自然栽培果蔬包6~8斤','',8900,15800,0,3000,'袋',100,0,1,0,9,6,0,0,NULL,0,1,1457598094,NULL,0,1,1457598094);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (30,'P1603000001','山东特产正宗潍县萝卜青萝卜','',2490,3500,0,1000,'箱',100,0,1,0,4,6,0,0,NULL,0,1,1458703521,NULL,0,1,1458703521);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (31,'P1603000002-1','iPhone6','存储大小:16G*颜色:灰色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,1,1458703530,NULL,0,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (32,'P1603000002-2','iPhone6','存储大小:16G*颜色:银色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,1,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (33,'P1603000002-3','iPhone6','存储大小:16G*颜色:金色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,2,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (34,'P1603000002-4','iPhone6','存储大小:32G*颜色:灰色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,3,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (35,'P1603000002-5','iPhone6','存储大小:32G*颜色:银色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,4,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (36,'P1603000002-6','iPhone6','存储大小:32G*颜色:金色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,5,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (37,'P1603000002-7','iPhone6','存储大小:64G*颜色:灰色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,6,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (38,'P1603000002-8','iPhone6','存储大小:64G*颜色:银色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,7,1,1458703530);
insert  into `shop_goods_products`(`id`,`gn`,`name`,`spec`,`price`,`priceMarket`,`priceCost`,`weight`,`unit`,`stock`,`score`,`buyMin`,`buyMax`,`goodsid`,`classid`,`typeid`,`brandid`,`qrcode`,`disabled`,`is_default`,`upAt`,`downAt`,`location`,`updatedBy`,`updatedAt`) values (39,'P1603000002-9','iPhone6','存储大小:64G*颜色:金色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,8,1,1458703530);

/*Table structure for table `shop_goods_spec` */

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

CREATE TABLE `shop_goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `is_physical` tinyint(1) DEFAULT NULL,
  `use_spec` tinyint(1) DEFAULT NULL,
  `use_props` tinyint(1) DEFAULT NULL,
  `use_params` tinyint(1) DEFAULT NULL,
  `use_tabs` tinyint(1) DEFAULT NULL,
  `params` longtext,
  `tabs` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type` */

insert  into `shop_goods_type`(`id`,`name`,`alias`,`is_physical`,`use_spec`,`use_props`,`use_params`,`use_tabs`,`params`,`tabs`) values (14,'手机','',1,1,1,0,0,NULL,NULL);

/*Table structure for table `shop_goods_type_props` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_history_payments` */

/*Table structure for table `shop_history_refunds` */

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

CREATE TABLE `shop_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `shop_images` */

insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (10,'/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg',7);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (11,'/open/image/file/d08b02392f094759802397b109adc157.jpg',7);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (12,'/open/image/file/38b675d5ad904792aaa9bfc37a38ca09.jpg',7);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (13,'/open/image/file/24aa7d9a50694693a5387fe66a92383a.jpg',7);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (14,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',8);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (15,'/open/image/file/44ef4c06af124317915e2b8c4d371483.jpg',8);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (16,'/open/image/file/11ff343dbeda4ff3a9b0e2d962c7766b.jpg',8);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (17,'/open/image/file/0a7b520b43774ac699a70387698ca757.jpg',8);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (18,'/open/image/file/771880c741d24fa1bcc08b986f7844b5.jpg',8);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (25,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',11);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (26,'/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',12);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (49,'/open/image/file/8050f2cf794b438d8c62e12c7a1d945a.jpg',13);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (50,'/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',13);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (51,'/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (52,'/open/image/file/7871160e5eb14b46a3f5c3db4491e48e.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (53,'/open/image/file/2a16c0a6e63a4d95bcf07ed1180595c9.jpg',14);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (54,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',6);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (55,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',10);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (56,'/open/image/file/7245859fe5e74edd9bfc63043b097eef.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (57,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (58,'/open/image/file/20f16a08b4684d5cad73749001bcbb65.jpg',9);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (59,'/open/image/file/49898d94c8244b5c94534dd3bc3911c9.jpg',4);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (60,'/open/image/file/1c2799a956154059a826f06c230cd967.jpg',4);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (61,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',4);
insert  into `shop_images`(`id`,`imgurl`,`goodsid`) values (62,'/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg',5);

/*Table structure for table `shop_member` */

CREATE TABLE `shop_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lv_id` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
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
  `reg_source` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member` */

insert  into `shop_member`(`id`,`lv_id`,`nickname`,`area`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (1,0,'133****1952',NULL,'13359011952',NULL,NULL,0,0,0,0,0,0,NULL,NULL,0,'::ffff:192.168.1.11',1457597627,'pc');
insert  into `shop_member`(`id`,`lv_id`,`nickname`,`area`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (2,0,'139****0212',NULL,'13956990212',NULL,NULL,0,0,0,0,0,0,NULL,NULL,0,'::ffff:192.168.1.11',1457597717,'pc');

/*Table structure for table `shop_member_account` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_account` */

insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (1,1,'13359011952','w36677c53a31864194e68787a604eb84',0,1457597627,NULL,NULL);
insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (2,2,'13956990212','wfcd2304bf06b7e0c1f92d7346f5d4ec',0,1457597717,'::ffff:192.168.1.11',1458703951);

/*Table structure for table `shop_member_addr` */

CREATE TABLE `shop_member_addr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_addr` */

insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`is_default`,`createdAt`) values (1,2,'大鲨鱼','13311212121','安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室',1,1458704106);

/*Table structure for table `shop_member_bind` */

CREATE TABLE `shop_member_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `bind_type` varchar(10) DEFAULT NULL,
  `bind_openid` varchar(100) DEFAULT NULL,
  `bind_nickname` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bind_openid` (`bind_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_bind` */

/*Table structure for table `shop_member_cart` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_cart` */

/*Table structure for table `shop_member_comment` */

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
  `orderId` int(11) DEFAULT NULL,
  `createIp` varchar(255) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `replyId` int(11) DEFAULT NULL,
  `replyNickname` varchar(100) DEFAULT NULL,
  `replyNote` varchar(500) DEFAULT NULL,
  `replyAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_comment` */

/*Table structure for table `shop_member_coupon` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_coupon` */

/*Table structure for table `shop_member_lv` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_lv` */

/*Table structure for table `shop_member_money_log` */

CREATE TABLE `shop_member_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `orderId` varchar(20) DEFAULT NULL,
  `oldMoney` int(11) DEFAULT NULL,
  `newMoney` int(11) DEFAULT NULL,
  `diffMoney` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_money_log` */

/*Table structure for table `shop_member_score_log` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_score_log` */

/*Table structure for table `shop_order` */

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
  `receivedStatus` int(11) DEFAULT NULL,
  `createdIp` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
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
  KEY `receivedStatus` (`receivedStatus`),
  KEY `createdAt` (`createdAt`),
  KEY `receivedAt` (`receivedAt`),
  KEY `updateAt` (`updateAt`),
  KEY `memberId` (`memberId`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order` */

insert  into `shop_order`(`id`,`cityId`,`status`,`weight`,`score`,`goodsAmount`,`freightAmount`,`discountAmount`,`finishAmount`,`payAmount`,`payStatus`,`payType`,`shipStatus`,`shiptypeId`,`shiptypeName`,`shiptypeNo`,`addrId`,`addrProvince`,`addrCity`,`addrArea`,`addrAddr`,`addrName`,`addrMobile`,`addrTime`,`taxType`,`taxNo`,`taxTitle`,`taxCentent`,`receivedStatus`,`createdIp`,`createdAt`,`receivedAt`,`updateAt`,`memberId`,`memo`,`source`,`disabled`) values ('160322203797104',0,'active',1000,24,2490,0,0,2490,0,0,'pay_wxpay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','蜀山区肥西路66号汇金大厦608室','大鲨鱼','13311212121',NULL,0,'','','',0,'::ffff:192.168.1.11',1458704265,NULL,NULL,2,'','pc',0);

/*Table structure for table `shop_order_goods` */

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
  `createAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_goods` */

insert  into `shop_order_goods`(`id`,`orderId`,`goodsId`,`productId`,`name`,`gn`,`spec`,`price`,`gprice`,`num`,`sendNum`,`amount`,`score`,`weight`,`createAt`) values (1,'160322203797104',4,30,'山东特产正宗潍县萝卜青萝卜','P1603000001','',2490,2490,1,0,2490,24,1000,1458704265);

/*Table structure for table `shop_order_log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_log` */

insert  into `shop_order_log`(`id`,`orderId`,`opTag`,`opContent`,`opType`,`opId`,`opNickname`,`opAt`,`opResult`) values (1,'160322203797104','create','创建订单','member',2,'139****0212',1458704265,'ok');

/*Table structure for table `shop_order_ship_log` */

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

CREATE TABLE `shop_sales_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `maxNum` int(11) DEFAULT NULL,
  `hasNum` int(11) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_sales_coupon` */

/*Table structure for table `sms_config` */

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

insert  into `sms_config`(`id`,`app_type`,`app_key`,`app_secret`,`sms_sign_name`,`sms_reg_template`,`sms_check_template`,`sms_login_template`,`sms_password_template`,`updatedAt`) values (1,'top','23273074','201646c2c8ff6f42c47bc599203a1d26','','SMS_2675019','SMS_2675022','SMS_2675021','SMS_2675017',1457518406);

/*Table structure for table `sms_log` */

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

/*Table structure for table `sys_config` */

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) DEFAULT NULL,
  `config_val` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (1,'system.AppName','上城电子商城系统',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (2,'system.AppDomain','wizzer.wicp.net',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (3,'system.AppShrotName','上城Shop',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (4,'system.AppCopyright','Wizzer.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (5,'system.AppIp','61.174.40.247',1458703898);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (1,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457333545);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (2,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457343136);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (3,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457400138);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (4,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:192.168.1.11',1457518417);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (5,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457518419);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (6,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:192.168.1.11',1457518473);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (7,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457518474);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (8,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:192.168.1.11',1457518532);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (9,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457518533);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (10,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457572390);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (11,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1457597778);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (12,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:192.168.1.11',1458703496);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (13,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1458703497);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (14,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:192.168.1.11',1458703851);
insert  into `sys_log`(`id`,`type`,`url`,`note`,`createdBy`,`createdByName`,`createdIp`,`createdAt`) values (15,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:192.168.1.11',1458703852);

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
  KEY `path` (`path`),
  KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,47,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,48,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,49,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,50,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/task','data-pjax','','system:task:job',0,0,0,51,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,23,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,52,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,53,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','营销',NULL,'','','','marketing',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,1,'00010004','商店配置',NULL,'','','ti-shopping-cart','system:config:shop',0,0,1,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000100040001','商店设置',NULL,'/private/conf/shop','data-pjax',NULL,'system:config:shop:setting',0,0,0,42,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000100040002','短信设置',NULL,'/private/conf/sms','data-pjax',NULL,'system:config:shop:sms',0,0,0,43,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,NULL,NULL,NULL,'order:list:orders',0,0,0,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,NULL,NULL,NULL,'order:list:cashs',0,0,0,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,NULL,NULL,NULL,'order:list:sends',0,0,0,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,0,0,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,NULL,NULL,NULL,'order:list:refunds',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,'','','ti-shopping-cart','goods:manage',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,'/private/shop/goods/goods','data-pjax','','goods:manage:list',0,0,0,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,'','','ti-settings','goods:setting',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,'/private/shop/goods/class','data-pjax','','goods:setting:class',0,0,0,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,'/private/shop/goods/type','data-pjax','','goods:setting:type',0,0,0,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,'/private/shop/goods/spec','data-pjax','','goods:setting:spec',0,0,0,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,NULL,NULL,NULL,'member:manage',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,NULL,NULL,NULL,'member:manage:list',0,0,0,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,NULL,NULL,NULL,'member:manage:level',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (37,34,'000500010003','注册协议',NULL,NULL,NULL,NULL,'member:manage:reg',0,0,0,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (38,34,'000500010004','隐私保护',NULL,NULL,NULL,NULL,'member:manage:hide',0,0,0,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,NULL,NULL,NULL,'member:msg',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,NULL,NULL,NULL,'member:msg:faq',0,0,0,13,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,NULL,NULL,NULL,'member:msg:review',0,0,0,14,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (42,39,'000500020003','站内消息',NULL,NULL,NULL,NULL,'member:msg:site',0,0,0,15,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (43,39,'000500020004','消息设置',NULL,NULL,NULL,NULL,'member:msg:setting',0,0,0,16,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','CMS',NULL,'','','','site',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (45,44,'00060001','站点管理',NULL,'','','ti-world','site:manage',0,0,1,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (47,45,'000600010002','站点配置',NULL,'/private/cms/site','data-pjax','','site:manage:setting',0,0,0,27,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,'','','ti-pencil-alt','site:cms',0,0,1,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,'/private/cms/channel','data-pjax','','site:cms:channel',0,0,0,40,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,'/private/cms/article','data-pjax','','site:cms:article',0,0,0,41,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','广告及链接',NULL,'','','ti-link','site:link',0,0,1,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','友情链接',NULL,'/private/cms/link','data-pjax','','site:link:list',0,0,0,55,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (53,0,'0007','微信',NULL,'',NULL,'','weixin',0,0,1,4,1,1445825925);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (54,53,'00070001','微信配置',NULL,'',NULL,'fa fa-weixin','weixin:manage',0,0,1,10,1,1445826142);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (55,54,'000700010001','帐号配置',NULL,'/private/wx/config','data-pjax','','weixin:manage:config',0,0,0,28,1,1445826178);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (56,54,'000700010002','菜单配置',NULL,'/private/wx/menu','data-pjax','','weixin:manage:menu',0,0,0,29,1,1445830074);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (57,53,'00070002','消息管理',NULL,'','','ti-pencil-alt','weixin:msg',0,0,1,8,1,1445843697);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (58,57,'000700020001','文字消息',NULL,'/private/wx/txt','data-pjax','','weixin:msg:txt',0,0,0,25,1,1445843720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (59,57,'000700020002','图文消息',NULL,'/private/wx/news','data-pjax','','weixin:msg:news',0,0,0,26,1,1445843889);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (60,53,'00070003','自动回复',NULL,'',NULL,'ti-back-left','weixin:reply',0,0,1,9,1,1445929792);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (61,60,'000700030001','关注自动回复',NULL,'/private/wx/reply?type=follow','data-pjax','','weixin:reply:follow',0,0,0,1,1,1445929848);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (62,60,'000700030002','关键词回复',NULL,'/private/wx/reply?type=keyword','data-pjax','','weixin:reply:keyword',0,0,0,2,1,1445929868);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (63,51,'000600030002','链接分类',NULL,'/private/cms/linkclass','data-pjax','','site:link:class',0,0,0,54,1,1446788018);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (64,27,'000400020004','商品品牌',NULL,'/private/shop/goods/brand','data-pjax','','goods:setting:brand',0,0,0,21,1,1450253034);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (65,53,'00070004','营销活动',NULL,'','','fa fa-credit-card','weixin:sales',0,0,1,7,1,1451438619);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (66,65,'000700040001','活动管理',NULL,'/private/wx/sales/manage','data-pjax','','weixin:sales:manage',0,0,0,23,1,1451438974);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (67,65,'000700040002','活动详情',NULL,'/private/wx/sales/result','data-pjax','','weixin:sales:result',0,0,0,24,1,1451439283);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (68,53,'00070005','微信会员',NULL,'','data-pjax','fa fa-user','weixin:user',0,0,1,6,1,1451986421);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (69,68,'000700050001','会员列表',NULL,'/private/wx/user','data-pjax','','weixin:user:list',0,0,0,22,1,1451986453);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (72,0,'0008','统计',NULL,'','','','count',0,0,1,6,1,1453858438);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (73,72,'00080001','销售统计',NULL,'','','ti-shopping-cart-full','count:shopsale',0,0,1,15,1,1453858640);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (74,73,'000800010001','销售收入',NULL,'','data-pjax','','count:shopsale:income',0,0,0,37,1,1453858718);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (75,73,'000800010002','商品销量',NULL,'','data-pjax','','count:shopsale:sales',0,0,0,38,1,1453858771);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (76,72,'00080002','站点统计',NULL,'','','ti-world','count:site',0,0,1,16,1,1453858917);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (77,76,'000800020001','网站访问量',NULL,'','data-pjax','','count:site:pv',0,0,0,39,1,1453858986);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (78,12,'00020001','促销管理',NULL,'','','ti-stats-up','marketing:promotion',0,0,1,11,1,1453859141);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (79,78,'000200010001','订单促销',NULL,'','data-pjax','','marketing:promotion:order',0,0,0,30,1,1453859226);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (80,78,'000200010002','商品促销',NULL,'','data-pjax','','marketing:promotion:goods',0,0,0,31,1,1453859244);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (81,12,'00020002','优惠券',NULL,'','','ti-credit-card','marketing:coupon',0,0,1,12,1,1453859500);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (82,81,'000200020001','优惠券管理',NULL,'','data-pjax','','marketing:coupon:list',0,0,0,32,1,1453859559);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (83,81,'000200020002','优惠券使用记录',NULL,'','data-pjax','','marketing:coupon:history',0,0,0,33,1,1453859710);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (84,81,'000200020003','积分兑换优惠券',NULL,'','data-pjax','','marketing:coupon:exchange',0,0,0,34,1,1453859776);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (85,12,'00020003','注册营销',NULL,'','','ti-id-badge','marketing:register',0,0,1,13,1,1453859864);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (86,85,'000200030001','注册营销配置',NULL,'','data-pjax','','marketing:register:setting',0,0,0,35,1,1453859929);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (87,12,'00020004','赠品营销',NULL,'','','ti-gift','marketing:gift',0,0,1,14,1,1453859999);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (88,87,'000200040001','赠品管理',NULL,'','data-pjax','','marketing:gift:list',0,0,0,36,1,1453860035);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (89,13,'000100040003','图片设置',NULL,'/private/conf/img','data-pjax','','system:config:shop:img',0,0,0,45,1,1458703650);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (90,13,'000100040004','区域设置',NULL,'/private/shop/area','data-pjax','','system:config:shop:area',0,0,0,44,1,1458703720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (91,2,'000100010005','系统参数',NULL,'/private/sys/conf','data-pjax','','system:sys:conf',0,0,0,46,1,1458703756);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;

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
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (471,16,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (472,17,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (473,18,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (474,19,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (475,20,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (476,21,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (477,22,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (478,23,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (479,33,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (480,34,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (481,35,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (482,36,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (483,37,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (484,38,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (485,39,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (486,40,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (487,41,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (488,42,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (489,43,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (490,24,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (491,25,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (492,26,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (493,27,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (494,28,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (495,29,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (496,30,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (497,64,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (498,53,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (499,68,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (500,69,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (501,65,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (502,66,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (503,67,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (504,57,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (505,58,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (506,59,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (507,60,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (508,61,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (509,62,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (510,54,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (511,55,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (512,56,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (513,12,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (514,78,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (515,79,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (516,80,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (517,82,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (518,81,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (519,83,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (520,84,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (521,85,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (522,86,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (523,87,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (524,88,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (525,72,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (526,73,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (527,74,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (528,75,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (529,76,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (530,77,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (531,44,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (532,45,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (533,47,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (534,48,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (535,49,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (536,50,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (537,51,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (538,63,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (539,52,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (540,1,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (541,13,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (542,14,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (543,15,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (544,90,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (545,89,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (546,2,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (547,91,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (548,3,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (549,4,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (550,5,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (551,6,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (552,7,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (553,8,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (554,9,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (555,10,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (556,11,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (1,0,'公共角色','public',0,1,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (2,0,'系统管理','sysadmin',0,2,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (19,4,'袭人花店角色','xiren',0,0,1,1445562940);

/*Table structure for table `sys_role_users__sys_user_roles` */

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
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (58,19,16);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统管理','请勿删除','安徽省合肥市蜀山区','13359011952','0551-63506223',0,1,1,1442391167);
insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,0,'0002','袭人花店','','','','',0,0,1,1452828945);

/*Table structure for table `sys_user` */

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
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  KEY `nickname` (`nickname`),
  KEY `unitid` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (1,'superadmin','超级管理员','wizzer@qq.com','w308aa01db0f163e8f0eb82df40590e2',0,1,'::ffff:192.168.1.11',1458703852,395,'palette.css',0,0,0,1,1452828989,1);
insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`createdBy`,`createdAt`,`unitid`) values (16,'xradmin','袭人花店管理员','','w0eac2466d0c6fe280c4c8261c58acc4',0,1,'::ffff:192.168.1.11',1452829832,6,NULL,0,0,0,1,1452828989,4);

/*Table structure for table `wx_config` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wx_config` */

insert  into `wx_config`(`id`,`appname`,`ghid`,`appid`,`appsecret`,`encodingAESKey`,`token`,`access_token`,`expire_time`,`jsapi_ticket`,`jsapi_time`,`qrcode`,`createdBy`,`createdAt`) values (2,'sun','gh_c8c3f92c1b2f','wx17fe71227e1577d9','190550dda42029b952ee4273b8d4aec1','IEcfKeAWngE5vzgrPuFwBtNAtES9urJhVF2XuwABvPd','wizzer','3L0f9yVwH1fSyrIzev3AnHL67AiYtWkyY8FMD0N6EbNHe8Z96hg_zsC-jkUWkKo7aqIpjJeLwzidOsZ_2XdI4sa3qD85rHUzCiu_Lwt5EJIli99mN3fWBUvjOHh2CISRRKHbAGAZSP',1454299931,'bxLdikRXVbTPdHSM05e5u5qWFhRRus1fubH4C8teRcMeHB3qae9MZLEqziJnxM6ou-SRTPFJdC9WjBiywTyC9Q',1454299931,'/upload/image/20160112/9c941345-d4ab-49cb-96a8-9aafbf1b5152.jpg',1,1446104003);
insert  into `wx_config`(`id`,`appname`,`ghid`,`appid`,`appsecret`,`encodingAESKey`,`token`,`access_token`,`expire_time`,`jsapi_ticket`,`jsapi_time`,`qrcode`,`createdBy`,`createdAt`) values (3,'袭人花店','gh_76f683b94c1a','wxfce1cabec3c8c19a','70989394692d6de17b26c38b4f7c3e63','mSxIp5NQGlTuQtBsdXr5fgJBusi8URLScfIFjQDx9Gt','xiren123','NBwqgBiDDOT3bzF4b1668UydDt2oD41Ayk4cBVgkBeVrDCvjnbF5HACs6YWIGhpsmFTU5FFCFTX4eK4h0QKb6y5KNPFZK0kwWXU-CMJsfVsZBUbAIAUWP',1453094382,NULL,0,'',1,1453083918);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `wx_menu` */

insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (26,0,'0004','菜单1','','','',1,1,1,1446110661,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (27,0,'0005','菜单2','','','',1,2,1,1446191595,2);
insert  into `wx_menu`(`id`,`parentId`,`path`,`name`,`type`,`key`,`url`,`hasChildren`,`location`,`createdBy`,`createdAt`,`wxid`) values (28,26,'00040001','链接1','view','','http://www.baidu.com',0,1,1,1446191624,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wx_news` */

insert  into `wx_news`(`id`,`title`,`description`,`picUrl`,`url`,`createdBy`,`createdAt`) values (3,'测试','测试','http://wizzer.wicp.net/upload/image/20160131/9b7d34cc-c507-4006-a821-fca0e62e89b4.png','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx17fe71227e1577d9&redirect_uri=http%3A%2F%2Fwizzer.wicp.net%2Fpublic%2Fwx%2Fsales%2Fxiren%2Fmy%2F1&response_type=code&scope=snsapi_base&state=11624317#wechat_redirect',1,1454301746);

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

insert  into `wx_reply`(`id`,`type`,`msgtype`,`keyword`,`content`,`createdBy`,`createdAt`,`wxid`) values (9,'keyword','txt','MENU_CLICK_1','4',1,1446106371,2);

/*Table structure for table `wx_sales` */

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
  UNIQUE KEY `unionid` (`unionid`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wx_user` */

insert  into `wx_user`(`id`,`openid`,`unionid`,`nickname`,`subscribe`,`sex`,`city`,`province`,`country`,`headimgurl`,`createdAt`,`wxid`) values (1,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc',NULL,'Wizzer',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',1454301785,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
