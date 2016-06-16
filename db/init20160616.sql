/*
SQLyog Ultimate v8.32 
MySQL - 5.6.0-m4 : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `api_basket` */

CREATE TABLE `api_basket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dis_count` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `api_basket` */

/*Table structure for table `api_basket_products` */

CREATE TABLE `api_basket_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` int(11) DEFAULT NULL,
  `basketid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `api_basket_products` */

/*Table structure for table `api_token` */

CREATE TABLE `api_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  `client_id` varchar(100) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
insert  into `cms_channel`(`id`,`shopid`,`parentId`,`path`,`name`,`url`,`seo_title`,`seo_keywords`,`seo_description`,`homepage`,`content`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (21,0,3,'00030004','品牌介绍','ppjs',NULL,NULL,NULL,0,'',0,0,0,2,1465267475);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (8,'新品热卖1','img','/upload/image/20160603/f675d13a-32dd-457d-ae84-fedac9f87612.jpg','/hot','_blank',1,1457332270,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (9,'新品热卖2','img','/upload/image/20160602/7c15f537-3ac0-4d3f-92f5-4bd85f336433.jpg','/hot','_blank',1,1457332274,4);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (10,'公测','img','/upload/image/20160506/e84ee8dd-9d17-48b7-9930-f4888e5cc81a.jpg','javascript:;','_self',1,1457573796,5);
insert  into `cms_link`(`id`,`name`,`type`,`picurl`,`url`,`target`,`createdBy`,`createdAt`,`classId`) values (12,'01','img','/upload/image/20160405/9ac035e4-f06b-47db-bdc5-d838017dcbcf.jpg','javascript:;','_self',1,1459394120,7);

/*Table structure for table `cms_linkclass` */

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

insert  into `cms_site`(`id`,`shopid`,`site_name`,`site_domain`,`site_icp`,`site_logo`,`site_wap_logo`,`site_qq`,`site_email`,`site_tel`,`weibo_name`,`weibo_url`,`weibo_qrcode`,`wechat_name`,`wechat_id`,`wechat_qrcode`,`seo_title`,`seo_keywords`,`seo_description`,`footer_content`) values (1,NULL,'电子商城演示系统','','','/upload/image/20160603/e22aa052-b7f4-45b7-9cc0-25b31a624601.png','/upload/image/20160603/34faec4c-baf0-4d67-b3a4-df51104dcfde.png','11624317','','4008-448-008','','','','','','/upload/image/20160306/abf3f5e1-176f-42fc-b14d-07774be9b498.jpg','','商城','商城系统','Copyright ©2016 www.sunshop.cn All Rights Reserved. 版权所有：上海轻远软件有限公司       <a href=\"http://sunshop.cn/\" style=\"padding-left:40px;\" target=\"_blank\">技术支持：Sunshop</a>');

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
  `pay_alipay_info` longtext,
  `pay_wxpay` tinyint(1) DEFAULT NULL,
  `pay_wxpay_info` longtext,
  `member_sorce_open` tinyint(1) DEFAULT NULL,
  `member_reg_coupon` int(11) DEFAULT NULL,
  `member_reg_score` int(11) DEFAULT NULL,
  `member_weixinreg_auto` tinyint(1) DEFAULT NULL,
  `member_weixinreg_coupon` int(11) DEFAULT NULL,
  `member_weixinreg_score` int(11) DEFAULT NULL,
  `oauth_open` tinyint(1) DEFAULT NULL,
  `oauth_weixin` tinyint(1) DEFAULT NULL,
  `oauth_qq` tinyint(1) DEFAULT NULL,
  `oauth_qq_info` longtext,
  `logistics_open` tinyint(1) DEFAULT NULL,
  `logistics_info` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_config` */

insert  into `shop_config`(`id`,`shop_templet`,`shop_css`,`shop_stock`,`list_load_type`,`list_page_size`,`list_quick_buy`,`freight_disabled`,`freight_type`,`freight_price`,`freight_num`,`tax_disabled`,`tax_price`,`pay_cash`,`pay_money`,`pay_alipay`,`pay_alipay_info`,`pay_wxpay`,`pay_wxpay_info`,`member_sorce_open`,`member_reg_coupon`,`member_reg_score`,`member_weixinreg_auto`,`member_weixinreg_coupon`,`member_weixinreg_score`,`oauth_open`,`oauth_weixin`,`oauth_qq`,`oauth_qq_info`,`logistics_open`,`logistics_info`) values (1,'default','green',50,'ajax',8,1,1,'price',8,1000,0,200,1,1,1,'{\"alipay_parter\":\"2088411890520875\",\"alipay_key\":\"fmo0y0t56k541itec79qt65x4oscmugj\",\"alipay_email\":\"chenggz@sunchn.com\"}',1,'{\"wxpay_appid\":\"wx17fe71227e1577d9\",\"wxpay_mchid\":\"1310090901\",\"wxpay_key\":\"SunChn8878dhdhd72hdvASdyxyyd3713\",\"wxpay_appsecret\":\"190550dda42029b952ee4273b8d4aec1\"}',1,1,600,1,2,500,1,1,1,'{\"qq_appid\":\"101308523\",\"qq_appkey\":\"6b9d3fc1d4856dcbc5b3dd96d7eef5f2\",\"qq_appcontent\":\"765754250763563070636\"}',1,'{\"lg_appname\":\"kdn\",\"lg_appid\":\"1255397\",\"lg_appkey\":\"a43e5d73-bacc-4e13-a4eb-474733db453b\"}');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_brand` */

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_class` */

insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (8,0,'0003','充值卡',NULL,1,0,1,6,1,1457333050,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (13,0,'0004','精品礼盒',NULL,0,0,1,1,1,1462354913,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (14,0,'0005','田园果蔬',NULL,0,0,1,2,1,1462355077,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (15,0,'0006','粮油干杂',NULL,0,0,1,3,1,1462355102,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (16,0,'0007','肉禽蛋品',NULL,0,0,0,4,1,1462355120,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (17,0,'0008','新鲜水果',NULL,0,0,1,5,1,1462355137,0);
insert  into `shop_goods_class`(`id`,`parentId`,`path`,`name`,`settings`,`disabled`,`hasChildren`,`is_index`,`location`,`createdBy`,`createdAt`,`typeid`) values (18,0,'0009','新建分类',NULL,0,0,0,0,2,1465268113,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_products` */

/*Table structure for table `shop_goods_spec` */

CREATE TABLE `shop_goods_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_spec` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_spec_values` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods_type_spec` */

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
  `payType` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_images` */

/*Table structure for table `shop_logistics` */

CREATE TABLE `shop_logistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bn` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `shop_logistics` */

insert  into `shop_logistics`(`id`,`bn`,`name`) values (1,'SF','顺丰快递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (2,'YTO','圆通速递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (3,'STO','申通快递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (4,'YD','韵达快递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (5,'ZTO','中通速递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (6,'HHTT','天天快递');
insert  into `shop_logistics`(`id`,`bn`,`name`) values (7,'EMS','EMS');

/*Table structure for table `shop_member` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member` */

insert  into `shop_member`(`id`,`lv_id`,`nickname`,`realname`,`headimgurl`,`province`,`city`,`area`,`addr`,`mobile`,`tel`,`email`,`order_num`,`b_year`,`b_month`,`b_day`,`sex`,`money`,`money_freeze`,`money_password`,`score`,`reg_ip`,`reg_time`,`reg_source`) values (2,2,'大鲨鱼','大鲨鱼',NULL,'安徽省','合肥市','瑶海区','瑶海区12122','13359011952',NULL,'',0,2016,3,1,2,429909,NULL,NULL,654,'::ffff:192.168.1.11',1457597717,'pc');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_account` */

insert  into `shop_member_account`(`id`,`memberId`,`login_name`,`login_password`,`disabled`,`createdAt`,`loginIp`,`loginAt`) values (9,2,'13359011952','w309549e3f1a024f366310b2d4e87bcb',0,1459848852,'61.191.26.107',1465780734);

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
  `postcode` varchar(6) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_addr` */

insert  into `shop_member_addr`(`id`,`memberId`,`name`,`mobile`,`province`,`city`,`area`,`addr`,`postcode`,`is_default`,`createdAt`) values (1,2,'大鲨鱼','13359011952','安徽省','合肥市','蜀山区','黄山路南京啊','',1,1460113579);

/*Table structure for table `shop_member_bind` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_bind` */

insert  into `shop_member_bind`(`id`,`memberId`,`bind_type`,`bind_openid`,`bind_nickname`,`disabled`,`binded`,`bindedAt`,`createdAt`) values (3,2,'weixin','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer<span class=\"emoji emoji1f60a\" title=\"smiling fa\"></span>',0,1,NULL,1459845052);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shop_member_lv` */

insert  into `shop_member_lv`(`id`,`name`,`lv_type`,`lv_logo`,`dis_count`,`point`,`expiretime`,`disabled`) values (1,'一级会员','member',NULL,100,3000,NULL,1);
insert  into `shop_member_lv`(`id`,`name`,`lv_type`,`lv_logo`,`dis_count`,`point`,`expiretime`,`disabled`) values (2,'二级会员','member',NULL,100,5000,NULL,1);

/*Table structure for table `shop_member_money_log` */

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
  KEY `payAt` (`payAt`),
  KEY `shipStatus` (`shipStatus`),
  KEY `createdAt` (`createdAt`),
  KEY `receivedStatus` (`receivedStatus`),
  KEY `receivedAt` (`receivedAt`),
  KEY `updateAt` (`updateAt`),
  KEY `memberId` (`memberId`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order` */

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
  `imgurl` varchar(255) DEFAULT NULL,
  `createAt` int(11) DEFAULT NULL,
  `is_comment` tinyint(1) DEFAULT NULL,
  `commentAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_goods` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_log` */

/*Table structure for table `shop_order_ship` */

CREATE TABLE `shop_order_ship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bn` varchar(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shop_order_ship` */

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
  `is_score` tinyint(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `endAt` varchar(20) DEFAULT NULL,
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

insert  into `sms_config`(`id`,`app_type`,`app_key`,`app_secret`,`sms_sign_name`,`sms_reg_template`,`sms_check_template`,`sms_login_template`,`sms_password_template`,`updatedAt`) values (1,'top','23273074','201646c2c8ff6f42c47bc599203a1d26','上城网络','SMS_2675019','SMS_2675022','SMS_2675021','SMS_2675017',1457518406);

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

/*Table structure for table `sys_backup` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_backup` */

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

insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (1,'system.AppName','Sunshop售卖系统',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (2,'system.AppDomain','demo.sunshop.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (3,'system.AppShrotName','售卖系统Sunshop.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (4,'system.AppCopyright','www.sunshop.cn',NULL);
insert  into `sys_config`(`id`,`config_key`,`config_val`,`createdAt`) values (5,'system.AppIp','121.40.66.131',1458703898);

/*Table structure for table `sys_ip` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_job` */

insert  into `sys_job`(`id`,`name`,`cron`,`note`,`disabled`,`updateTxt`,`updateStatus`,`updateAt`) values (1,'backupDb','10 2 * * *','数据库备份',1,'',1,1462731001);
insert  into `sys_job`(`id`,`name`,`cron`,`note`,`disabled`,`updateTxt`,`updateStatus`,`updateAt`) values (2,'deleteLog','0 2 * * *','清空三个月前后台日志',0,'',1,1466013600);
insert  into `sys_job`(`id`,`name`,`cron`,`note`,`disabled`,`updateTxt`,`updateStatus`,`updateAt`) values (3,'disableCoupon','1 0 * * *','优惠券到期失效',0,'',1,1466006460);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `path` (`path`),
  KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,18,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,36,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,37,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,38,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,39,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,19,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (8,7,'000100020001','定时任务',NULL,'/private/sys/job','data-pjax','','system:task:job',0,0,0,40,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,20,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (10,9,'000100030001','操作日志',NULL,'/private/sys/log',NULL,NULL,'system:safe:log',0,0,0,44,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,45,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (12,0,'0002','营销',NULL,'','','','marketing',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (13,1,'00010004','商店配置',NULL,'','','ti-shopping-cart','system:config:shop',0,0,1,17,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (14,13,'000100040001','商店设置',NULL,'/private/conf/shop','data-pjax',NULL,'system:config:shop:setting',0,0,0,46,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (15,13,'000100040002','短信设置',NULL,'/private/conf/sms','data-pjax',NULL,'system:config:shop:sms',0,0,0,48,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (18,17,'000300010001','订单',NULL,'/private/shop/order/order','data-pjax','','order:list:orders',0,0,0,1,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (19,17,'000300010002','收款单',NULL,'/private/shop/order/payment','data-pjax','','order:list:cashs',0,0,0,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (20,17,'000300010003','发货单',NULL,'/private/shop/order/ship','data-pjax','','order:list:sends',0,0,0,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (23,17,'000300010006','退款单',NULL,'/private/shop/order/refund','data-pjax','','order:list:refunds',0,0,0,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (25,24,'00040001','商品管理',NULL,'','','ti-shopping-cart','goods:manage',0,0,1,4,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (26,25,'000400010001','商品列表',NULL,'/private/shop/goods/goods','data-pjax','','goods:manage:list',0,0,0,9,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (27,24,'00040002','商品配置',NULL,'','','ti-settings','goods:setting',0,0,1,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (28,27,'000400020001','商品分类',NULL,'/private/shop/goods/class','data-pjax','','goods:setting:class',0,0,0,10,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (29,27,'000400020002','商品类型',NULL,'/private/shop/goods/type','data-pjax','','goods:setting:type',0,0,0,11,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (30,27,'000400020003','商品规格',NULL,'/private/shop/goods/spec','data-pjax','','goods:setting:spec',0,0,0,12,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (34,33,'00050001','会员管理',NULL,'','','ti-user','member:manage',0,0,1,2,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (35,34,'000500010001','会员列表',NULL,'/private/shop/member/member','data-pjax','','member:manage:list',0,0,0,5,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (36,34,'000500010002','会员等级',NULL,'/private/shop/member/level','data-pjax','','member:manage:level',0,0,0,6,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (39,33,'00050002','咨询评论',NULL,'','','ti-comment','member:msg',0,0,1,3,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (40,39,'000500020001','咨询列表',NULL,'/private/shop/member/comment?type=2','data-pjax','','member:msg:faq',0,0,0,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (41,39,'000500020002','评论列表',NULL,'/private/shop/member/comment?type=1','data-pjax','','member:msg:review',0,0,0,8,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (44,0,'0006','CMS',NULL,'','','','site',0,0,1,7,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (48,44,'00060002','内容管理',NULL,'','','ti-pencil-alt','site:cms',0,0,1,21,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (49,48,'000600020001','栏目管理',NULL,'/private/cms/channel','data-pjax','','site:cms:channel',0,0,0,51,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (50,48,'000600020002','文章管理',NULL,'/private/cms/article','data-pjax','','site:cms:article',0,0,0,52,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (51,44,'00060003','广告链接',NULL,'','','ti-link','site:link',0,0,1,22,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (52,51,'000600030001','链接管理',NULL,'/private/cms/link','data-pjax','','site:link:list',0,0,0,42,1,NULL);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (53,0,'0007','微信',NULL,'',NULL,'','weixin',0,0,1,4,1,1445825925);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (54,53,'00070001','微信配置',NULL,'',NULL,'fa fa-weixin','weixin:manage',0,0,1,16,1,1445826142);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (55,54,'000700010001','帐号配置',NULL,'/private/wx/config','data-pjax','','weixin:manage:config',0,0,0,31,1,1445826178);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (56,54,'000700010002','菜单配置',NULL,'/private/wx/menu','data-pjax','','weixin:manage:menu',0,0,0,32,1,1445830074);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (57,53,'00070002','消息管理',NULL,'','','ti-pencil-alt','weixin:msg',0,0,1,14,1,1445843697);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (58,57,'000700020001','会员消息',NULL,'/private/wx/msg/user','data-pjax','','weixin:msg:user',0,0,0,33,1,1445843720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (59,57,'000700020002','群发消息',NULL,'/private/wx/msg/mass','data-pjax','','weixin:msg:mass',0,0,0,34,1,1445843889);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (60,53,'00070003','自动回复',NULL,'',NULL,'ti-back-left','weixin:reply',0,0,1,15,1,1445929792);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (61,60,'000700030001','关注自动回复',NULL,'/private/wx/reply?type=follow','data-pjax','','weixin:reply:follow',0,0,0,29,1,1445929848);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (62,60,'000700030002','关键词回复',NULL,'/private/wx/reply?type=keyword','data-pjax','','weixin:reply:keyword',0,0,0,30,1,1445929868);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (63,51,'000600030002','链接分类',NULL,'/private/cms/linkclass','data-pjax','','site:link:class',0,0,0,41,1,1446788018);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (64,27,'000400020004','商品品牌',NULL,'/private/shop/goods/brand','data-pjax','','goods:setting:brand',0,0,0,13,1,1450253034);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (65,53,'00070004','营销活动',NULL,'','','fa fa-credit-card','weixin:sales',0,1,1,13,1,1451438619);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (66,65,'000700040001','活动管理',NULL,'/private/wx/sales/manage','data-pjax','','weixin:sales:manage',0,1,0,25,1,1451438974);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (67,65,'000700040002','活动详情',NULL,'/private/wx/sales/result','data-pjax','','weixin:sales:result',0,1,0,26,1,1451439283);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (68,53,'00070005','微信会员',NULL,'','data-pjax','fa fa-user','weixin:user',0,0,1,12,1,1451986421);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (69,68,'000700050001','会员列表',NULL,'/private/wx/user','data-pjax','','weixin:user:list',0,0,0,24,1,1451986453);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (72,0,'0008','统计',NULL,'','','','count',0,0,1,6,1,1453858438);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (73,72,'00080001','销售统计',NULL,'','','ti-shopping-cart-full','count:shopsale',0,0,1,10,1,1453858640);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (74,73,'000800010001','销售收入',NULL,'/private/shop/report/sale','data-pjax','','count:shopsale:income',0,0,0,14,1,1453858718);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (75,73,'000800010002','商品销量',NULL,'/private/shop/report/goodsale','data-pjax','','count:shopsale:sales',0,0,0,15,1,1453858771);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (76,72,'00080002','站点统计',NULL,'','','ti-world','count:site',0,1,1,11,1,1453858917);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (77,76,'000800020001','网站访问量',NULL,'','data-pjax','','count:site:pv',0,1,0,23,1,1453858986);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (78,12,'00020001','促销管理',NULL,'','','ti-stats-up','marketing:promotion',0,1,1,6,1,1453859141);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (79,78,'000200010001','订单促销',NULL,'','data-pjax','','marketing:promotion:order',0,1,0,17,1,1453859226);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (80,78,'000200010002','商品促销',NULL,'','data-pjax','','marketing:promotion:goods',0,1,0,18,1,1453859244);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (81,12,'00020002','优惠券',NULL,'','','ti-credit-card','marketing:coupon',0,0,1,7,1,1453859500);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (82,81,'000200020001','优惠券管理',NULL,'/private/shop/sales/coupon','data-pjax','','marketing:coupon:list',0,0,0,19,1,1453859559);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (83,81,'000200020002','优惠券使用记录',NULL,'/private/shop/sales/coupon/history','data-pjax','','marketing:coupon:history',0,0,0,20,1,1453859710);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (85,12,'00020003','注册营销',NULL,'','','ti-id-badge','marketing:register',0,0,1,8,1,1453859864);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (86,85,'000200030001','注册营销配置',NULL,'/private/shop/sales/register','data-pjax','','marketing:register:setting',0,0,0,21,1,1453859929);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (87,12,'00020004','赠品营销',NULL,'','','ti-gift','marketing:gift',0,1,1,9,1,1453859999);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (88,87,'000200040001','赠品管理',NULL,'','data-pjax','','marketing:gift:list',0,1,0,22,1,1453860035);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (89,13,'000100040003','图片配置',NULL,'/private/conf/img','data-pjax','','system:config:shop:img',0,0,0,50,1,1458703650);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (90,13,'000100040004','区域管理',NULL,'/private/shop/area','data-pjax','','system:config:shop:area',0,0,0,49,1,1458703720);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (91,2,'000100010005','系统参数',NULL,'/private/sys/conf','data-pjax','','system:sys:conf',0,0,0,35,1,1458703756);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (92,9,'000100030003','数据备份',NULL,'/private/sys/backup','data-pjax','','system:safe:backup',0,0,0,43,1,1461659175);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (93,60,'000700030003','文字内容',NULL,'/private/wx/txt','data-pjax','','weixin:reply:txt',0,0,0,27,1,1462504991);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (94,60,'000700030004','图文内容',NULL,'/private/wx/news','data-pjax','','weixin:reply:news',0,0,0,28,1,1462505023);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (95,73,'000800010003','会员销售',NULL,'/private/shop/report/report/memberSale','data-pjax','','count:shopsale:sales',0,0,0,16,1,1464938285);
insert  into `sys_menu`(`id`,`parentId`,`path`,`name`,`type`,`url`,`target`,`icon`,`permission`,`hidden`,`disabled`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (96,13,'000100040005','站点配置',NULL,'/private/cms/site','data-pjax','','system:config:shop:site',0,0,0,47,1,1465875443);

/*Table structure for table `sys_menu_roles__sys_role_menus` */

CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_roles__sys_role_menus` */

insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (257,12,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (258,14,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (259,13,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (260,15,1);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (808,16,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (809,17,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (810,18,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (811,19,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (812,20,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (813,23,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (814,33,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (815,34,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (816,35,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (817,36,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (818,39,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (819,40,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (820,41,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (821,24,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (822,25,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (823,26,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (824,27,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (825,28,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (826,29,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (827,30,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (828,64,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (829,53,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (830,68,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (831,69,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (832,65,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (833,66,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (834,67,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (835,57,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (836,58,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (837,59,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (838,60,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (839,93,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (840,94,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (841,61,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (842,62,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (843,54,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (844,55,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (845,56,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (846,12,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (847,78,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (848,79,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (849,80,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (850,81,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (851,82,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (852,83,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (853,85,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (854,86,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (855,87,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (856,88,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (857,72,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (858,73,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (859,74,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (860,75,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (861,95,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (862,76,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (863,77,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (864,44,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (865,48,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (866,49,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (867,50,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (868,51,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (869,63,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (870,52,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (871,1,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (872,13,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (873,96,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (874,14,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (875,15,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (876,90,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (877,89,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (878,2,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (879,91,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (880,3,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (881,4,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (882,5,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (883,6,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (884,7,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (885,8,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (886,9,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (887,92,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (888,10,2);
insert  into `sys_menu_roles__sys_role_menus`(`id`,`sys_menu_roles`,`sys_role_menus`) values (889,11,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (1,0,'公共角色','public',0,1,1,NULL);
insert  into `sys_role`(`id`,`unitid`,`name`,`code`,`disabled`,`location`,`createdBy`,`createdAt`) values (2,0,'系统管理','sysadmin',0,2,1,NULL);

/*Table structure for table `sys_role_users__sys_user_roles` */

CREATE TABLE `sys_role_users__sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_role_users` int(11) DEFAULT NULL,
  `sys_user_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_users__sys_user_roles` */

insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (10,2,10);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (28,2,1);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (32,1,1);
insert  into `sys_role_users__sys_user_roles`(`id`,`sys_role_users`,`sys_user_roles`) values (33,2,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`parentId`,`path`,`name`,`description`,`address`,`mobile`,`tel`,`hasChildren`,`location`,`createdBy`,`createdAt`) values (1,0,'0001','系统管理','请勿删除','安徽省合肥市高新区黄山路599号时代数码港大厦12层1202室','0551-653340','4008-448-008',0,1,1,1442391167);

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
  `customMenus` longtext,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  KEY `nickname` (`nickname`),
  KEY `unitid` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`nickname`,`email`,`password`,`disabled`,`online`,`lastIp`,`loginAt`,`loginCount`,`loginTheme`,`loginSidebar`,`loginScroll`,`loginBoxed`,`customMenus`,`createdBy`,`createdAt`,`unitid`) values (1,'superadmin','超级管理员','wizzer@qq.com','w078cb214826ef8e2bb4ead412c5aa1d',0,1,'124.113.174.90',1466043191,659,'palette.2.css',0,1,0,'[\"18\",\"35\",\"40\",\"41\"]',1,1452828989,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_config` */

/*Table structure for table `wx_mass` */

CREATE TABLE `wx_mass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `media_id` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `scope` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_mass` */

/*Table structure for table `wx_mass_news` */

CREATE TABLE `wx_mass_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_source_url` varchar(255) DEFAULT NULL,
  `content` longtext,
  `digest` longtext,
  `show_cover_pic` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_mass_news` */

/*Table structure for table `wx_mass_send` */

CREATE TABLE `wx_mass_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `massId` int(11) DEFAULT NULL,
  `receivers` longtext,
  `status` int(11) DEFAULT NULL,
  `msg_id` varchar(20) DEFAULT NULL,
  `errcode` varchar(20) DEFAULT NULL,
  `errmsg` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_mass_send` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_menu` */

/*Table structure for table `wx_msg` */

CREATE TABLE `wx_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  `replyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_msg` */

/*Table structure for table `wx_msg_reply` */

CREATE TABLE `wx_msg_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `wxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_msg_reply` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_news` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_reply` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_sales` */

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
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wx_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
