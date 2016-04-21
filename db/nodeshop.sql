# Host: 192.168.1.11  (Version: 5.6.0-m4)
# Date: 2016-04-20 10:27:52
# Generator: MySQL-Front 5.3  (Build 4.120)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "cms_article"
#

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

#
# Data for table "cms_article"
#

INSERT INTO `cms_article` VALUES (1,0,'合肥上城信息技术有限公司','上城（SunCHN），创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。 ','admin','pc',1457337778,0,'/upload/image/20160307/7178538f-89d4-40fc-8867-64d3f5b5f170.jpg','','','',1,1457337864,12,1),(2,0,'有机会员的日常生活：策马奔腾！','策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！','超级管理员',NULL,1457339797,0,'/upload/image/20160307/479f164a-2824-4880-b5a3-b5e1e3ac3564.jpg','','','',1,1457339823,16,2),(3,0,'我不推广产品 我推广健康','进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。','超级管理员',NULL,1457339853,0,'/upload/image/20160307/e8def416-c655-486e-9fac-bdecf7a00c25.jpg','','','',1,1457339891,16,3),(4,0,'家庭环保：小厨房的大环保','在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。','超级管理员',NULL,1457339896,0,'/upload/image/20160307/4d4106db-aa82-4b94-bbcb-5ab83e691676.jpg','','','',1,1457339927,16,4);

#
# Structure for table "cms_article_content"
#

DROP TABLE IF EXISTS `cms_article_content`;
CREATE TABLE `cms_article_content` (
  `content` longtext,
  `articleId` int(11) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "cms_article_content"
#

INSERT INTO `cms_article_content` VALUES ('<p>上城（SunCHN），创始于2007年，是中国首批电子商务研发服务商。公司致力于为中小微企业提供电商技术服务，从前端到后端，从直销到分销，从PC到手机，从线上到线下，帮助企业实现一体化电商售卖业务。&nbsp;</p><p><br/></p><p>上城是一个聚焦于电商，专注于技术研发的技术性团队。凭借多年以来长期扎根在电商领域的研究与服务经验，着眼于最前沿的技术线路，着重于中小微企业用户群体，依照中小微企业现状特征量身制定敏捷高效的电商售卖解决方案。横向整合第三方支付、物流信息、客服通讯等接口环节，纵向打通目前主流ERP、CRM等系统产品，为企业打造一个电商时代售卖一体化的开放式技术平台。&nbsp;</p><p><br/></p><p>未来，上城继续在电商研发领域深耕细作，坚持以客户需求为中心，以最大化客户电商产投性价比为思维导向，坚守品质，追求卓越，和更多的合作伙伴携手与共，助力企业轻松开创电商时代。</p>',1,1),('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">策马奔腾，是一项极需要气场的运动，而且在城市中，想要参加这一运动，也不是一件像骑自行车那样随便的。至少对于小编来说，在草原，扬鞭、奔驰，是一件非常非常令人神往的事！但就是这样的好事，却是我们尚作有机会员的日常！</span></span></span></p>',2,2),('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">进入食品行业，对曾杨来说并不是偶然。在生活中，曾杨虽然和其他二十多岁的小伙子一样，喜欢运动，爱玩爱闹，但曾杨也和其他的年轻男孩不一样——他更关注生活，关注食品。</span></span></span></p>',3,3),('<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">在很多人的观念里，环保可能是很宏大很遥远的东西，它需要花费你无数的时间精力去努力，得到的效果可能还是微不足道的。但对尚作的会员周丽来说，环保其实就是很简单小事，做好厨房垃圾的处理，将那些湿哒哒的垃圾处理好，就是环保。</span></span></span></span></span></p>',4,4);

#
# Structure for table "cms_channel"
#

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
  `content` longtext,
  `disabled` tinyint(1) DEFAULT NULL,
  `hasChildren` tinyint(1) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cms_channel"
#


#
# Structure for table "cms_link"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "cms_link"
#

INSERT INTO `cms_link` VALUES (8,'新品热卖1','img','/upload/image/20160306/e247e21a-ee9e-4476-b920-34b33f72247a.jpg','/hot','_blank',1,1457332270,4),(9,'新品热卖2','img','/upload/image/20160306/e247e21a-ee9e-4476-b920-34b33f72247a.jpg','/hot','_blank',1,1457332274,4),(10,'公测','img','/upload/image/20160309/5efbaed7-1e47-4881-b1e1-0b3d1035f010.jpg','javascript:;','_self',1,1457573796,5),(11,'登录页背景图','img','/upload/image/20160309/b5dd34b1-b364-4f0f-b9e8-391e799efd40.jpg','javascript:;','_self',1,1457573838,6),(12,'01','img','/upload/image/20160330/6ee4bafb-b5a0-42ff-809f-2b0e75060dbc.jpg','javascript:;','_self',1,1459394120,7),(13,'02','img','/upload/image/20160330/1af827eb-9c26-480e-b47b-f996d7fbb747.jpg','javascript:;','_self',1,1459394148,7);

#
# Structure for table "cms_linkclass"
#

DROP TABLE IF EXISTS `cms_linkclass`;
CREATE TABLE `cms_linkclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "cms_linkclass"
#

INSERT INTO `cms_linkclass` VALUES (4,'首页Banner',1,1457332232),(5,'商品列表Banner',1,1457573644),(6,'登录页背景',1,1457573664),(7,'手机版首页Banner',1,1459394065);

#
# Structure for table "cms_site"
#

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

#
# Data for table "cms_site"
#

INSERT INTO `cms_site` VALUES (1,NULL,'电子商城演示系统','','','/upload/image/20160306/5ab3e9c5-975d-47fc-b2fa-949f2846745d.png','/upload/image/20160330/caef1d45-9acd-4075-ab72-5f3eea6d752d.png','11624317','','4008-448-008','','','','','','/upload/image/20160306/abf3f5e1-176f-42fc-b14d-07774be9b498.jpg','','','','©2016 合肥上城信息技术有限公司');

#
# Structure for table "img_config"
#

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

#
# Data for table "img_config"
#

INSERT INTO `img_config` VALUES ('1',260,260,420,420,'',0,'',1458704444);

#
# Structure for table "img_image"
#

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

#
# Data for table "img_image"
#

INSERT INTO `img_image` VALUES ('0a7b520b43774ac699a70387698ca757','3.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99.jpg','/open/image/file/0a7b520b43774ac699a70387698ca757.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_m.jpg','/upload/image/20160307/fbd83541-4261-463a-962e-e3ba120f0d99_s.jpg',800,800,0,1457403551),('0f5daea9c0b94f3bb89b3d9798ad432a','i1.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af.jpg','/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_m.jpg','/upload/image/20160306/8893169b-d010-413c-a884-64c26a2898af_s.jpg',430,430,0,1457334101),('11ff343dbeda4ff3a9b0e2d962c7766b','5.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad.jpg','/open/image/file/11ff343dbeda4ff3a9b0e2d962c7766b.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_m.jpg','/upload/image/20160307/b81bf1de-75bf-47b2-8841-f4e20a3910ad_s.jpg',800,800,0,1457403551),('17274ea8a11e46b88c6d8a7967c7a976','3.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528.jpg','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_m.jpg','/upload/image/20160307/268b67c9-49b1-4c12-aca6-630f69959528_s.jpg',720,720,0,1457404284),('1c2799a956154059a826f06c230cd967','5.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4.jpg','/open/image/file/1c2799a956154059a826f06c230cd967.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_m.jpg','/upload/image/20160306/78338fbe-2c28-40e1-94eb-9ab111883ba4_s.jpg',350,350,0,1457333832),('20f16a08b4684d5cad73749001bcbb65','201602122052502802.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca.jpg','/open/image/file/20f16a08b4684d5cad73749001bcbb65.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_m.jpg','/upload/image/20160310/7c629022-0a0f-4707-bec0-4ed4fc579dca_s.jpg',600,600,0,1457598090),('24aa7d9a50694693a5387fe66a92383a','04.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b.jpg','/open/image/file/24aa7d9a50694693a5387fe66a92383a.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_m.jpg','/upload/image/20160307/6e5082bb-b106-476f-9128-cf19030c777b_s.jpg',600,600,0,1457403271),('2a16c0a6e63a4d95bcf07ed1180595c9','5.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351.jpg','/open/image/file/2a16c0a6e63a4d95bcf07ed1180595c9.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_m.jpg','/upload/image/20160307/e4f7ec06-9830-4992-9c73-fe2534ddb351_s.jpg',500,500,0,1457405268),('2cb01917077741a18fa9f9aed511a244','1.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de.jpg','/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_m.jpg','/upload/image/20160307/fbbe587e-96c7-44b2-a90d-6508a9a8d5de_s.jpg',800,800,0,1457403550),('2f4bdf8a0d884426ac9440cb7b446fdb','01.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266.jpg','/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_m.jpg','/upload/image/20160307/db581a46-6e39-45c7-b9ab-b32615aad266_s.jpg',640,640,0,1457403270),('38b675d5ad904792aaa9bfc37a38ca09','03.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59.jpg','/open/image/file/38b675d5ad904792aaa9bfc37a38ca09.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_m.jpg','/upload/image/20160307/41ecf475-006e-4a53-896f-c6c5f5bd6c59_s.jpg',600,600,0,1457403270),('44ef4c06af124317915e2b8c4d371483','4.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f.jpg','/open/image/file/44ef4c06af124317915e2b8c4d371483.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_m.jpg','/upload/image/20160307/9ebbd16e-a4ab-42e8-9f81-f4ddb3959a8f_s.jpg',800,800,0,1457403550),('49898d94c8244b5c94534dd3bc3911c9','4.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2.jpg','/open/image/file/49898d94c8244b5c94534dd3bc3911c9.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_m.jpg','/upload/image/20160306/78138fab-4ef5-4851-a4c4-74bda1be31e2_s.jpg',350,350,0,1457333832),('4a799a201c7245c095e6d96f5c967bd8','3.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147.jpg','/open/image/file/4a799a201c7245c095e6d96f5c967bd8.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147_m.jpg','/upload/image/20160331/0368c028-7785-4115-a4d9-3ab0192a7147_s.jpg',3652,3648,0,1459492178),('52ce1880b3384aec89a854394cb68978','pic_m.jpg','/upload/image/20160119/a1e61e1f-d652-430f-afef-38100cb2dc6b.jpg','/open/image/52ce1880b3384aec89a854394cb68978.jpg',NULL,NULL,180,72,0,1453190985),('551860e3ef97462ca2f2bc27d1c79533','1.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59.jpg','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_m.jpg','/upload/image/20160306/64c880b9-b38d-43da-8068-92571c437d59_s.jpg',350,350,0,1457333832),('5c7e75fc65524649bc35a6cba507b291','1.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150.jpg','/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_m.jpg','/upload/image/20160307/4903a57e-6563-438a-8730-f2ea759e2150_s.jpg',400,400,0,1457404968),('64c03356c56a4681b3660c8b0ad1d1ba','1.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd.jpg','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd_m.jpg','/upload/image/20160331/2baafc2d-23c0-4e51-a2ec-3177c18f12fd_s.jpg',3646,3648,0,1459492178),('699ed33635164f8cb101e787d1d7d774','2.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5.jpg','/open/image/file/699ed33635164f8cb101e787d1d7d774.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_m.jpg','/upload/image/20160306/5b07be69-4a28-4e6b-b049-b603e5a26ef5_s.jpg',350,350,0,1457333152),('6cac523104ac4737a7a9ce937b3c09f7','6.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939.jpg','/open/image/file/6cac523104ac4737a7a9ce937b3c09f7.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_m.jpg','/upload/image/20160306/89e51030-9a06-4bc9-b180-2d7591855939_s.jpg',800,1200,0,1457333153),('6f963b00383449ae87e674fdba40be29','201601051454487968.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd.png','/open/image/file/6f963b00383449ae87e674fdba40be29.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_m.png','/upload/image/20160310/1c20835b-fb13-4a29-a1d6-a6524b42e6bd_s.png',418,418,0,1457598009),('7245859fe5e74edd9bfc63043b097eef','3.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300.jpg','/open/image/file/7245859fe5e74edd9bfc63043b097eef.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_m.jpg','/upload/image/20160307/bc3b041b-df43-486e-9af7-6fa067f3a300_s.jpg',600,600,0,1457403758),('771880c741d24fa1bcc08b986f7844b5','2.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c.jpg','/open/image/file/771880c741d24fa1bcc08b986f7844b5.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_m.jpg','/upload/image/20160307/38198d4c-d48d-48d2-87da-e078cfa7c77c_s.jpg',800,800,0,1457403551),('7871160e5eb14b46a3f5c3db4491e48e','3.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97.jpg','/open/image/file/7871160e5eb14b46a3f5c3db4491e48e.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_m.jpg','/upload/image/20160307/f0ac123f-bb06-4cc7-8932-f71c0f8e0e97_s.jpg',500,500,0,1457405268),('7ae441f3add44b488d50277b8ec23abf','1.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48.jpg','/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_m.jpg','/upload/image/20160307/a5074408-4d77-489c-8bd1-bf20baeb2e48_s.jpg',400,400,0,1457404361),('7d8f312e85d44e47a4729039adc9db16','1.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0.jpg','/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_m.jpg','/upload/image/20160307/2075e0a5-c7ab-4b63-8d80-6418f37242b0_s.jpg',500,500,0,1457405268),('8050f2cf794b438d8c62e12c7a1d945a','3.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658.jpg','/open/image/file/8050f2cf794b438d8c62e12c7a1d945a.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_m.jpg','/upload/image/20160307/42c7660f-dcfc-4b07-8d4b-61a71aa14658_s.jpg',640,640,0,1457405118),('854830f165c54850bea26f9e6ac9f26f','20151010092555.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1.jpg','/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_m.jpg','/upload/image/20160310/ef098d4d-aac9-4a44-859a-d05d527b4da1_s.jpg',600,600,0,1457598082),('896723809b9449f481fd2e8ba87eeaf1','2.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325.jpg','/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_m.jpg','/upload/image/20160307/4b615f01-9e6d-46fa-a94d-f3d13c628325_s.jpg',640,640,0,1457405118),('9145518ce21d418db8aef27665cba657','pic_m.jpg','/upload/image/20160119/754ad334-4de5-44ad-98cf-d1fd4fb0648c.jpg','/open/image/file/9145518ce21d418db8aef27665cba657.jpg',NULL,NULL,180,72,0,1453191632),('d6e7767307764869b8ac1284cb650578','2.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d.jpg','/open/image/file/d6e7767307764869b8ac1284cb650578.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d_m.jpg','/upload/image/20160331/aacbe499-7519-435a-9669-237cb285822d_s.jpg',3652,3648,0,1459492178),('eaef3cc8c59e489ab0ab3dfbe02a2007','201601051454487968.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103.png','/open/image/file/eaef3cc8c59e489ab0ab3dfbe02a2007.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_m.png','/upload/image/20160310/ac0259b2-35dc-4230-956f-d4ecd32aa103_s.png',418,418,0,1457598085);

#
# Structure for table "img_image_id__shop_goods_images"
#

DROP TABLE IF EXISTS `img_image_id__shop_goods_images`;
CREATE TABLE `img_image_id__shop_goods_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "img_image_id__shop_goods_images"
#


#
# Structure for table "img_image_id__shop_goods_lv_price_images"
#

DROP TABLE IF EXISTS `img_image_id__shop_goods_lv_price_images`;
CREATE TABLE `img_image_id__shop_goods_lv_price_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_goods_lv_price_images` int(11) DEFAULT NULL,
  `img_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "img_image_id__shop_goods_lv_price_images"
#


#
# Structure for table "shop_area"
#

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

#
# Data for table "shop_area"
#

INSERT INTO `shop_area` VALUES (1,0,'0001','安徽省',NULL,0,1,0),(2,1,'00010001','合肥市',NULL,0,1,0),(3,2,'000100010001','庐阳区',NULL,0,0,0),(4,2,'000100010002','瑶海区',NULL,0,0,0),(5,2,'000100010003','蜀山区',NULL,0,0,0),(6,2,'000100010004','包河区',NULL,0,0,0),(7,2,'000100010005','经开区',NULL,0,0,0),(8,2,'000100010006','政务区',NULL,0,0,0),(9,2,'000100010007','高新区',NULL,0,0,0),(10,2,'000100010008','滨湖新区',NULL,0,0,0);

#
# Structure for table "shop_config"
#

DROP TABLE IF EXISTS `shop_config`;
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
  `member_reg_coupon` int(11) DEFAULT NULL,
  `member_reg_score` int(11) DEFAULT NULL,
  `member_weixinreg_auto` tinyint(1) DEFAULT NULL,
  `member_weixinreg_coupon` int(11) DEFAULT NULL,
  `member_weixinreg_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "shop_config"
#

INSERT INTO `shop_config` VALUES (1,'default','green','ajax',4,1,1,'price',8,1000,0,200,1,1,1,'{\"alipay_parter\":\"2088411890520875\",\"alipay_key\":\"fmo0y0t56k541itec79qt65x4oscmugj\",\"alipay_email\":\"chenggz@sunchn.com\"}',1,'{\"wxpay_appid\":\"wx17fe71227e1577d9\",\"wxpay_mchid\":\"1310090901\",\"wxpay_key\":\"SunChn8878dhdhd72hdvASdyxyyd3713\",\"wxpay_appsecret\":\"190550dda42029b952ee4273b8d4aec1\"}',1,600,1,2,500);

#
# Structure for table "shop_goods"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods"
#

INSERT INTO `shop_goods` VALUES (4,'G1603000001','山东特产正宗潍县萝卜青萝卜','绿色无公害',2490,3500,0,1000,'箱',44,0,2,5,6,0,0,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',0,1460515808,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ae90a9e2-a9e7-469e-bb07-7a65c00d1400.jpg\" style=\"\" title=\"TB2Ilz5iVXXXXa1XXXXXXXXXXXX_!!2329658969.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/f001f0be-999d-45ed-b06c-94b12985ec44.jpg\" style=\"\" title=\"TB2pNYGiVXXXXbkXpXXXXXXXXXX_!!2329658969.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ffe7382d-ba0f-47cf-8632-fdb00128feb9.jpg\" style=\"\" title=\"TB2VTjIiVXXXXaPXpXXXXXXXXXX_!!2329658969.jpg\"/></p><p><br/></p>','[]','[]',0,392,54,0,9,1,1460515808),(5,'G1603000002','iPhone6','与众不同',399900,400000,0,500,'个',1000,0,1,0,4,14,3,'/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg',1,1459912015,1460006476,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160306/dfeb74d6-4b9e-45f2-9ffe-0ee58901d928.jpg\" style=\"\" title=\"i5.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/ad65c80b-372b-4787-9990-4509c492eb3d.jpg\" style=\"\" title=\"i6.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160306/897d3e28-681a-44d9-8e6e-0041e1b876c0.jpg\" style=\"\" title=\"i7.jpg\"/></p><p><br/></p>','[{\"name\":\"网络制式\",\"value\":\"4G\"},{\"name\":\"出厂年份\",\"value\":\"2016\"},{\"name\":\"特性\",\"value\":\"漂亮\"}]','[[{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"9\",\"spec_value_name\":\"16G\"},{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"10\",\"spec_value_name\":\"32G\"},{\"spec_name\":\"存储大小\",\"spec_type\":\"0\",\"spec_id\":\"6\",\"spec_value_id\":\"11\",\"spec_value_name\":\"64G\"}],[{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"12\",\"spec_value_name\":\"灰色\"},{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"13\",\"spec_value_name\":\"银色\"},{\"spec_name\":\"颜色\",\"spec_type\":\"0\",\"spec_id\":\"7\",\"spec_value_id\":\"14\",\"spec_value_name\":\"金色\"}]]',1,3,0,0,8,1,1458703530),(6,'G1603000003','即食木耳（中辣）45g','单袋独立包装 清新爽口',300,500,0,45,'袋',100,0,1,0,7,0,0,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',0,1457598016,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/a75d778b-e253-4bce-a72e-2da41baf3c89.jpg\" style=\"\" title=\"000000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/8dc791f5-db68-4374-9026-e5d2bff814ed.jpg\" style=\"\" title=\"0000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/08d7f6c4-e643-41cf-9cf3-56a63ebf1062.jpg\" style=\"\" title=\"000.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/9f8ee1f1-3eb6-4981-8624-3ae056073565.jpg\" style=\"\" title=\"00.jpg\"/></p><p><br/></p>','[]','[]',0,1,0,0,0,1,1457598016),(7,'G1603000004','卡侬亚麻籽油250ml','纯自然的亚麻籽为原料，采用先进热榨技术制成',4500,5900,0,50,'瓶',100,0,1,0,7,0,0,'/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg',0,1457403305,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/f59e0c45-12ae-40f2-b534-caa0c64a505d.jpg\" style=\"\" title=\"05.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ab22329c-35b0-41d2-9ec1-8d68c828f471.jpg\" style=\"\" title=\"06.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ecf0a90c-ffec-4e52-ac5c-5503eae74fec.jpg\" style=\"\" title=\"07.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/b39d02e0-712d-4dc3-9b93-6d5abb1eda6a.jpg\" style=\"\" title=\"08.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ae0a9dd7-72aa-4c26-a1dc-4942d5e2193f.jpg\" style=\"\" title=\"09.jpg\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457403305),(8,'G1603000005','独头黑蒜（礼盒装）20枚','发酵完全，口感醇厚，颗颗粒大饱满，营养丰富全面，260g/盒',9900,11900,0,260,'盒',100,0,1,0,6,0,0,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',0,1457403633,NULL,'<p style=\"text-align: center;\"><img src=\"/upload/image/20160307/8dc65471-8703-4111-bdc3-b347fc2d8ecf.jpg\" style=\"\" title=\"01.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5fe9ab20-7007-4627-ac51-365d30cc30fd.jpg\" style=\"\" title=\"0.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/380c4663-5ad6-41dd-8405-d44ea1370a88.jpg\" style=\"\" title=\"02.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/2f4b0c1f-4e13-4523-b9df-8cc5cccbb645.jpg\" style=\"\" title=\"04.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/27502cf9-0c6b-417d-aed1-94289a493000.jpg\" style=\"\" title=\"03.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5b6a4d46-ab0e-4bec-b783-844f9d2de150.jpg\" style=\"\" title=\"05.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/ba7fa5db-451e-4c53-b5fd-0e18da5f2267.jpg\" style=\"\" title=\"06.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/2a61964d-a75d-4d53-a729-e28fc9f549fb.jpg\" style=\"\" title=\"07.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/68fb3b44-90c3-46ba-bd12-f3f0ef0cda0c.jpg\" style=\"\" title=\"08.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/upload/image/20160307/5b7b7602-7d9a-4568-8c1d-6e3693d1736b.jpg\" style=\"\" title=\"09.jpg\"/></p><p><br/></p>','[]','[]',0,7,0,0,0,1,1457403633),(9,'G1603000006','绿格自然栽培果蔬包6~8斤','清晨采摘，当天配送，绿色健康，口感自然',8900,15800,0,3000,'袋',100,0,1,0,6,0,0,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',0,1457598094,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎自然栽培果蔬包，仅限售合肥市内，外地请勿下单。<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎因季节限定，目前秋茬蔬菜刚上市，品种只有6种。后期会有更多品种陆续上市。敬请耐心等待！总重量大约8-10斤左右。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎配送时间：周一至周六9：00-17：00</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">◎运费规则：合肥市区内包邮免费送货上门</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img title=\"1444805074116301.jpg\" alt=\"QQ图片20151009114218.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805074116301.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">◎水果黄瓜</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">水果黄瓜富含蛋白质、糖类、维生素B2、维生素C、维生素E、胡萝卜素、尼克酸、钙、磷、铁等营养成分。多吃可起到延年益寿、降低血糖、抗衰老的作用。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用生食或做水果沙拉。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805113900956.jpg\" alt=\"1444805113900956.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805113900956.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎樱桃萝卜</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">萝卜性甘、凉，味辛，有通气宽胸、健胃消食、止咳化痰、除燥生津、解毒散瘀、止泄、利尿等功效。萝卜汁液可防止胆结石形成，所含的粗纤维和木质素化合物有抗癌作用。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般素炒或凉拌食用。（这里啰嗦一句：不少人只吃萝卜，不吃萝卜叶。殊不知萝卜叶中的维生度A含量是1400IU，是同类花椰菜的3倍。而且萝卜叶中的膳食纤维，能促进肠胃蠕动，防治便秘。）</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805146131462.jpg\" alt=\"1444805146131462.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805146131462.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎紫色青梗菜</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自北京，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">紫色青梗菜营养价值成分与白菜相近似，它含有蛋白质、膳食纤维、钙、铁、胡萝卜素、维生素B1、维生素B2、维生素C等。其中钙的含量较高，几乎等于白菜含量的2～3倍。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般素炒食用</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img title=\"1444805174139646.jpg\" alt=\"QQ图片20151009120159.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805174139646.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎秋葵</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自荷兰进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">秋葵含有果胶、牛乳聚糖等，其含有铁、钙及糖类等多种营养成分，有预防贫血的效果。还含有维生素A，有益于视网膜健康、维护视力。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">秋葵可凉拌、热炒、油炸、炖食，做色拉、汤菜等，在凉拌和炒食之前必须在沸水中烫三五分钟以去涩。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"640\" title=\"1444805228341414.jpg\" alt=\"1444805228341414.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805228341414.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 640px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎辣椒</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自瑞士进口，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软���黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">每百克辣椒维生素C含量高达198毫克，居蔬菜之首位。维生素B、胡萝卜素以及钙、铁等矿物质含量亦较丰富。对于温胃驱寒都有很大的功效。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用煎炒，煮食，研末服或生食。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"831\" title=\"1444806683102028.jpg\" alt=\"1444806683102028.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444806683102028.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 831px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">◎豆角</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">种源来自南京，非转基因。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">豆角含丰富维生素B、C和植物蛋白质，能使人头脑宁静.调理消化系统，消除胸膈胀满。可防治急性肠胃炎，呕吐腹泻。有解渴健脾、补肾止泄、益气生津的功效。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">一般采用热炒，煮食。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">温馨提示：豆角一定要焯透，以防止中毒。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 24px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(146, 208, 80);\">关于基地</span></strong></span></p><hr style=\"margin: 20px 0px; padding: 0px; box-sizing: border-box; border-right-width: 0px; border-left-width: 0px; border-top-style: solid; border-top-color: rgb(238, 238, 238); border-bottom-style: solid; border-bottom-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 2em;\">绿格牛角大圩种植基地，学专人员全程管理，自然栽培，苛求自然的口感和绿色的品质。</span><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"360\" title=\"1444805521101468.jpg\" alt=\"1444805521101468.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805521101468.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 360px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格全球范围内优选果蔬种源，主要供应商为全球著名的荷兰Bejo和瑞士Syngenta，承诺非转基因，品种独特，外观极具观赏性。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"149\" title=\"1444805635116198.jpg\" alt=\"1444805635116198.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805635116198.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 149px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格进口荷兰Koppert熊蜂，自然授粉，杜绝化学激素。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img width=\"640\" height=\"346\" title=\"1444805654968774.jpg\" alt=\"1444805654968774.jpg\" src=\"http://www.duomii.cn/upload/image/20151014/1444805654968774.jpg\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 346px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绿格将继续引进更优秀的品种，执行更严格的管理，生产处更好的自然栽培果蔬，助力您及家人品质生活。</p><p><br/></p>','[]','[]',0,26,4,0,0,1,1457598094),(10,'G1603000007','寿西湖红颜草莓1.2kg（火热预售）','基地直采，新鲜直达，俏丽“红颜”，新品预售，共享“莓”好时光',4800,6000,0,1200,'袋',100,0,1,0,6,0,0,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',0,1457598042,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457140997273639.jpg\" title=\"1457140997273639.jpg\" alt=\"1457140997273639.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">寿西湖红颜草莓</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">产地：寿县寿西湖农场</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">规格：1箱（6盒，200g/盒）</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">专业育种，生态种植</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">新鲜采摘，无膨大剂</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">口感：清甜多汁，柔嫩细腻</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">营养：维生素、矿物质、微量元素、果胶、纤维素</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">储存方法：冰箱冷藏</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">食用方法：</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">1</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">）用淡盐水浸泡草莓前，不要摘掉草莓蒂，以免渗入果肉内造成污染</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">2</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">）草莓自然成熟后采摘，不易长久保存，收到后请冷藏，并尽快食用。</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457141160337584.jpg\" title=\"1457141160337584.jpg\" alt=\"1457141160337584.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457141557126040.jpg\" title=\"1457141557126040.jpg\" alt=\"QQ图片20160305092932_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">甜蜜之源</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">多米农社坚持寻找放心食材，为了找到让人吃的放心的食材，来到草莓源产地——安徽六安寿县寿西湖农场，精挑细选，直到发现真正好吃和健康的红颜草莓。我们用心倾听普通农民的故事，记录每一样食材的来源，最终呈现给顾客一份份充满人情味的礼物。</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142288560488.jpg\" title=\"1457142288560488.jpg\" alt=\"1457142288560488.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142261278286.jpg\" title=\"1457142261278286.jpg\" alt=\"1457142261278286.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">俏丽红颜 唇齿之享</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">寿西湖农场直采，当季新鲜采摘</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142365266581.jpg\" title=\"1457142365266581.jpg\" alt=\"1457142365266581.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142388108917.jpg\" title=\"1457142388108917.jpg\" alt=\"1457142388108917.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-size: 16px; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">美味俏红颜</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">红颜草莓因其鲜嫩红润，宛如少女娇羞的脸颊，故又称“红颊草莓”</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457142442535960.jpg\" title=\"1457142442535960.jpg\" alt=\"1457142442535960.jpg\" width=\"640\" height=\"426\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 426px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">共享“莓”好时光</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">果肉柔软细嫩，丰盈汁水弥漫舌尖，果实馥郁芳香，口口新鲜唇齿留香</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">有机种植，真正的草莓味，无任何生长激素，无膨大剂</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\"><img src=\"http://www.duomii.cn/upload/image/20160305/1457143014106180.jpg\" title=\"1457143014106180.jpg\" alt=\"1457143014106180.jpg\" width=\"640\" height=\"853\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 853px; max-width: 100%; width: 640px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 21px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 宋体;\">预售规则：周三下午16:00前下单购买，周四统一安排配送；</span></p><p><br/></p>','[]','[]',0,10,3,0,0,1,1457598042),(11,'G1603000008','竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','2016年2月4日前订单，均年后配送！',16800,19800,0,1500,'袋',100,0,1,0,9,0,0,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',0,1457404416,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品说明 PRODUCT DESCRIPTION</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">本期主题：多米农社禽蛋年货主题周<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\">活动时间：2016年1月23日—2016年1月30日</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\">具体说明：活动仅限一周，时间截止，即刻恢复原价</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 24px;\">活动促销价：原价168元/只 现活动促销128元/只，另：赠送4枚价值12元的绿皮乌鸡蛋</span></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px;\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342791308107.jpg\" title=\"1453342791308107.jpg\" alt=\"IMG_4281_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品信息 PRODUCT INFORMATION</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【品名】 ：竹丝乌骨鸡</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【规格】 ：宰杀后1.5-3斤左右</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【鸡龄】 ：<span style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">≥180天</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【喂养方式】：纯粮食古法喂养</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【产地】 ：安徽庐江汤池镇</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【包装】 ：现宰现杀，真空包装装</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">储存方法 STORAGE METHOD</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">冷藏保存</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453341501960942.jpg\" title=\"1453341501960942.jpg\" alt=\"webwxgetmsgimg_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">产品特色&nbsp;PRODUCT&nbsp;FEATURES</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">自由采食 纯粮喂养<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">温泉之乡林地放养，远离工业污染，水源纯净空气清新；</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">原料喂养，自由觅食昆虫、青草；渴了喝井水，露水，食料天然</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453341826899063.jpg\" title=\"1453341826899063.jpg\" alt=\"IMG_4298_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">散养乌鸡 乌皮乌骨</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">优质鸡种，世界稀有，中国独有，天然食料品质安心</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342081731109.jpg\" title=\"1453342081731109.jpg\" alt=\"1453342081731109.jpg\" width=\"640\" height=\"559\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 559px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">营养丰富 健康美味&nbsp;<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">上海各大月子会所专供滋补佳品</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453342272151902.jpg\" title=\"1453342272151902.jpg\" alt=\"1453342272151902.jpg\" width=\"640\" height=\"427\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 427px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342280667422.jpg\" title=\"1453342280667422.jpg\" alt=\"1453342280667422.jpg\" width=\"640\" height=\"494\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 494px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342286484882.jpg\" title=\"1453342286484882.jpg\" alt=\"1453342286484882.jpg\" width=\"640\" height=\"392\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 392px; max-width: 100%; width: 640px;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453342288133656.jpg\" title=\"1453342288133656.jpg\" alt=\"1453342288133656.jpg\" width=\"640\" height=\"425\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 425px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">细节描述 DETAIL DISPLAY</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453343080115755.jpg\" title=\"1453343080115755.jpg\" alt=\"IMG_4281_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343084956467.jpg\" title=\"1453343084956467.jpg\" alt=\"IMG_4286_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343087363919.jpg\" title=\"1453343087363919.jpg\" alt=\"IMG_4311_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343091145232.jpg\" title=\"1453343091145232.jpg\" alt=\"IMG_4314_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/><img src=\"http://www.duomii.cn/upload/image/20160121/1453343095757574.jpg\" title=\"1453343095757574.jpg\" alt=\"IMG_4345_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p><br/></p>','[]','[]',0,1,0,0,0,1,1457404416),(12,'G1603000009','乌鸡蛋（6枚装）','2016年2月4日前订单，均年后配送',1800,1980,0,500,'盒',100,0,1,0,9,0,0,'/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',0,1457405026,NULL,'<p></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">产品特色&nbsp;PRODUCT&nbsp;FEATURES</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">营养均衡</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">温泉之乡林地散养 ，生态循环-天然养殖、健康放心</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453344900402863.jpg\" title=\"1453344900402863.jpg\" alt=\"1453344900402863.jpg\" width=\"640\" height=\"481\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 481px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">自由采食 纯粮喂养</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">原料喂养，自由觅食昆虫、青草；渴了喝井水，露水，食料天然</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453345057134960.jpg\" title=\"1453345057134960.jpg\" alt=\"1453345057134960.jpg\" width=\"640\" height=\"510\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 510px; max-width: 100%; width: 640px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span>蛋香浓郁 味道鲜美 适应多种特殊人群</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">天然营养加工厂，食用桔梗皮、花椒种、豆梗、玉米等独创性饲料<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">富集多种营养成分，适合孕妇、婴幼儿、儿童及老年人等特殊人群食用</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20160121/1453346281657095.jpg\" title=\"1453346281657095.jpg\" alt=\"1453346281657095.jpg\" width=\"640\" height=\"913\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 913px; max-width: 100%; width: 640px;\"/></p>','[]','[]',0,0,0,0,0,1,1457405026),(13,'G1603000010','五常稻花香龙稻尚品大米2.5kg','珍稀稻米品种-寒地稻，全程精耕细作，蒸煮米香四溢',4900,6400,0,1000,'袋',100,0,1,0,7,0,0,'/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',0,1457597947,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837266125153.jpg\" title=\"1445837266125153.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837266795184.jpg\" title=\"1445837266795184.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837268720954.jpg\" title=\"1445837268720954.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837270131939.jpg\" title=\"1445837270131939.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837271823628.jpg\" title=\"1445837271823628.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://www.duomii.cn/upload/image/20151026/1445837273247863.jpg\" title=\"1445837273247863.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></p><p><br/></p>','[]','[]',0,0,0,0,0,1,1457597947),(14,'G1603000011','阿根廷红虾L4 (2kg)','深海捕捞 极速鲜动 壳薄肉大 ',23500,30900,0,800,'盒',100,0,1,0,10,0,0,'/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',0,1457597958,NULL,'<p style=\"text-align: center;\"><img src=\"http://www.duomii.cn/upload/image/20151117/1447732720138510.gif\" title=\"1447732720138510.gif\" alt=\"详情_01.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732735711659.gif\" title=\"1447732735711659.gif\" alt=\"详情_02.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732745635149.gif\" title=\"1447732745635149.gif\" alt=\"详情_03.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732751841615.gif\" title=\"1447732751841615.gif\" alt=\"详情_04.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732754796776.gif\" title=\"1447732754796776.gif\" alt=\"详情_05.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"http://www.duomii.cn/upload/image/20151117/1447732758803575.gif\" title=\"1447732758803575.gif\" alt=\"详情_06.gif\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; line-height: 24px; text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p>','[]','[]',0,1,0,0,0,1,1457597958);
INSERT INTO `shop_goods` VALUES (15,'G1603000012','秭归血橙新鲜预售（礼盒装）','基地直采 不抛光 不打蜡 不使用防腐剂 ',3800,5500,0,2250,'盒',200,0,1,0,6,0,0,'/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',0,1459492226,NULL,'<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">产品信息</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">产品名称：秭归血橙</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">产地：湖北秭归茅坪镇</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background: white;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">规格：2.25kg/箱</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background: white;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">规格：10枚/盒</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background: white;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">储存方法：阴凉处冷藏保存</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 1.5em; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">预售原则：</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">限量60盒，先定先得</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458306450126108.jpg\" title=\"1458306450126108.jpg\" alt=\"IMG_4956_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">生鲜产品为什么坚持预售？</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【1】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">新鲜</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458306533342317.jpg\" title=\"1458306533342317.jpg\" alt=\"1458306533342317.jpg\" width=\"640\" height=\"427\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 427px; max-width: 100%; width: 640px;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">基地直采，现摘现发，跟着四季吃食材</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【2】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">安全</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458306621121762.jpg\" title=\"1458306621121762.jpg\" alt=\"1458306621121762.jpg\" width=\"640\" height=\"478\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 478px; max-width: 100%; width: 640px;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">回到源头，去除中间环节，连接农人与消费者之间的信任</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【3】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">直接</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458306660790622.jpg\" title=\"1458306660790622.jpg\" alt=\"1458306660790622.jpg\" width=\"640\" height=\"427\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 427px; max-width: 100%; width: 640px;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">直供全国农人的原生态食材，从枝头到舌尖的味蕾享受</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">秭归脐橙真的好吃？</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【1】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">橙中贵族</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458306684913564.jpg\" title=\"1458306684913564.jpg\" alt=\"1458306684913564.jpg\" width=\"640\" height=\"427\" border=\"0\" vspace=\"0\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: 427px; max-width: 100%; width: 640px;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">90%</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">的人没有吃过的稀有品种，营养价值是普通橙子的3倍以上，是苹果的10倍</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【2】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">好吃因为原产</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458307398118096.jpg\" title=\"1458307398118096.jpg\" alt=\"IMG_0663_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">神奇的北纬30°，中国脐橙之乡——湖北秭归，国家地理标志保护产品，</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">每年超过3000小时的日照，昼夜温差大，</span><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">冬暖、少雾、长日照的峡江小气候，更适合橙果生长的额斜坡逆温层</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【3】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">孕妇小孩都能放心吃的血橙</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458307495612428.jpg\" title=\"1458307495612428.jpg\" alt=\"IMG_4957_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">自然生长，基地直采，现摘现发，不抛光不打蜡，不浸药，不使用任何保鲜措施</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【4】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">没有女生能抗拒的诱惑</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458307541335432.jpg\" title=\"1458307541335432.jpg\" alt=\"IMG_4962_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">甜度13-14°，只有不到2%的橙子可以被选入最高级的“14度橙”系列，果味浓郁</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【5】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">水果界的“暖男”</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458307592723321.jpg\" title=\"1458307592723321.jpg\" alt=\"IMG_4978_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">秭归血橙果形中等，果肉丰富，富含天然色素花青素</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">【6】</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">春季阳光下的新鲜美味</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\"><img src=\"http://www.duomii.cn/upload/image/20160318/1458307660515649.jpg\" title=\"1458307660515649.jpg\" alt=\"IMG_4967_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">果肉粉红至红色，色泽均匀，致密细嫩，饱满多汁，入口清爽宜人</span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-size: 14px; white-space: normal; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(123, 12, 0);\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px; font-family: 华文细黑;\">预售原则</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; line-height: 2em; color: rgb(51, 51, 51); font-size: 14px; white-space: normal; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 21px; font-family: 华文细黑;\">限量60盒，38元/盒（2.25kg左右），先定先得</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; box-sizing: border-box; line-height: 24px; color: rgb(51, 51, 51); font-family: Verdana, Arial, 微软雅黑; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: 华文细黑;\">&nbsp;<img src=\"http://www.duomii.cn/upload/image/20160318/1458307704923548.jpg\" title=\"1458307704923548.jpg\" alt=\"IMG_4951_副本.jpg\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; border: none; vertical-align: top; height: auto; max-width: 100%;\"/></span></p><p><br/></p>','[]','[]',0,17,7,0,0,1,1459492226),(16,'G1604000001','121221','',0,0,0,0,'',0,0,1,100,0,0,0,'',0,1460526678,NULL,'','[]','[]',0,1,0,0,0,1,1460526678);

#
# Structure for table "shop_goods_brand"
#

DROP TABLE IF EXISTS `shop_goods_brand`;
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

#
# Data for table "shop_goods_brand"
#

INSERT INTO `shop_goods_brand` VALUES (3,'苹果','<p>苹果</p>','苹果公司','http://www.apple.com','',NULL);

#
# Structure for table "shop_goods_class"
#

DROP TABLE IF EXISTS `shop_goods_class`;
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

#
# Data for table "shop_goods_class"
#

INSERT INTO `shop_goods_class` VALUES (3,0,'0001','手机',NULL,1,1,1,1,1,1457332978,14),(4,3,'00010001','苹果手机',NULL,0,0,0,5,1,1457332988,14),(5,0,'0002','蔬菜',NULL,0,1,1,2,1,1457333001,0),(6,5,'00020001','新鲜果蔬',NULL,0,0,0,1,1,1457333017,0),(7,5,'00020002','粮油干货',NULL,0,0,0,2,1,1457333030,0),(8,0,'0003','充值卡',NULL,1,0,0,3,1,1457333050,0),(9,5,'00020003','肉禽蛋奶',NULL,0,0,0,3,1,1457403983,0),(10,5,'00020004','水产海鲜',NULL,0,0,0,4,1,1457403998,0);

#
# Structure for table "shop_goods_lv_price"
#

DROP TABLE IF EXISTS `shop_goods_lv_price`;
CREATE TABLE `shop_goods_lv_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `lvid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods_lv_price"
#

INSERT INTO `shop_goods_lv_price` VALUES (5,4,45,1,1),(6,4,45,2,1);

#
# Structure for table "shop_goods_products"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods_products"
#

INSERT INTO `shop_goods_products` VALUES (14,'P1603000004','卡侬亚麻籽油250ml','',4500,5900,0,50,'瓶',100,0,1,0,7,7,0,0,NULL,0,1,1457403305,NULL,0,1,1457403305),(15,'P1603000005','独头黑蒜（礼盒装）20枚','',9900,11900,0,260,'盒',100,0,1,0,8,6,0,0,NULL,0,1,1457403633,NULL,0,1,1457403633),(18,'P1603000008','竹丝乌骨鸡（赠送价值12元绿皮乌鸡蛋）','',16800,19800,0,1500,'袋',100,0,1,0,11,9,0,0,NULL,0,1,1457404416,NULL,0,1,1457404416),(19,'P1603000009','乌鸡蛋（6枚装）','',1800,1980,0,500,'盒',100,0,1,0,12,9,0,0,NULL,0,1,1457405026,NULL,0,1,1457405026),(25,'P1603000010','五常稻花香龙稻尚品大米2.5kg','',4900,6400,0,1000,'袋',100,0,1,0,13,7,0,0,NULL,0,1,1457597947,NULL,0,1,1457597947),(26,'P1603000011','阿根廷红虾L4 (2kg)','',23500,30900,0,800,'盒',100,0,1,0,14,10,0,0,NULL,0,1,1457597958,NULL,0,1,1457597958),(27,'P1603000003','即食木耳（中辣）45g','',300,500,0,45,'袋',100,0,1,0,6,7,0,0,NULL,0,1,1457598016,NULL,0,1,1457598016),(28,'P1603000007','寿西湖红颜草莓1.2kg（火热预售）','',4800,6000,0,1200,'袋',97,0,1,0,10,6,0,0,NULL,0,1,1457598042,NULL,0,1,1457598042),(29,'P1603000006','绿格自然栽培果蔬包6~8斤','',8900,15800,0,3000,'袋',90,0,1,0,9,6,0,0,NULL,0,1,1457598094,NULL,0,1,1457598094),(31,'P1603000002-1','iPhone6','存储大小:16G*颜色:灰色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,1,1458703530,NULL,0,1,1458703530),(32,'P1603000002-2','iPhone6','存储大小:16G*颜色:银色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,1,1,1458703530),(33,'P1603000002-3','iPhone6','存储大小:16G*颜色:金色',399900,400000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,2,1,1458703530),(34,'P1603000002-4','iPhone6','存储大小:32G*颜色:灰色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,3,1,1458703530),(35,'P1603000002-5','iPhone6','存储大小:32G*颜色:银色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,4,1,1458703530),(36,'P1603000002-6','iPhone6','存储大小:32G*颜色:金色',499900,500000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,5,1,1458703530),(37,'P1603000002-7','iPhone6','存储大小:64G*颜色:灰色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,6,1,1458703530),(38,'P1603000002-8','iPhone6','存储大小:64G*颜色:银色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,7,1,1458703530),(39,'P1603000002-9','iPhone6','存储大小:64G*颜色:金色',599900,600000,0,500,'个',1000,0,1,0,5,4,14,3,NULL,0,0,1458703530,NULL,8,1,1458703530),(42,'P1603000012','秭归血橙新鲜预售（礼盒装）','',3800,5500,0,2250,'盒',190,0,1,0,15,6,0,0,NULL,0,1,1459492226,NULL,0,1,1459492226),(45,'P1603000001','山东特产正宗潍县萝卜青萝卜','',2490,3500,0,1000,'箱',38,0,2,5,4,6,0,0,NULL,0,1,1460515808,NULL,0,1,1460515808),(46,'P1604000001','121221','',0,0,0,0,'',0,0,1,100,16,0,0,0,NULL,0,1,1460526678,NULL,0,1,1460526678);

#
# Structure for table "shop_goods_spec"
#

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

#
# Data for table "shop_goods_spec"
#

INSERT INTO `shop_goods_spec` VALUES (6,'存储大小',0,'','',0),(7,'颜色',0,'','',0);

#
# Structure for table "shop_goods_spec_values"
#

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

#
# Data for table "shop_goods_spec_values"
#

INSERT INTO `shop_goods_spec_values` VALUES (9,'16G',NULL,NULL,0,6),(10,'32G',NULL,NULL,1,6),(11,'64G',NULL,NULL,2,6),(12,'灰色',NULL,NULL,0,7),(13,'银色',NULL,NULL,1,7),(14,'金色',NULL,NULL,2,7);

#
# Structure for table "shop_goods_type"
#

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
  `params` longtext,
  `tabs` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods_type"
#

INSERT INTO `shop_goods_type` VALUES (14,'手机','',1,1,1,0,0,NULL,NULL);

#
# Structure for table "shop_goods_type_props"
#

DROP TABLE IF EXISTS `shop_goods_type_props`;
CREATE TABLE `shop_goods_type_props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods_type_props"
#

INSERT INTO `shop_goods_type_props` VALUES (16,'网络制式','select',0,14),(17,'出厂年份','select',1,14),(18,'特性','input',2,14);

#
# Structure for table "shop_goods_type_props_values"
#

DROP TABLE IF EXISTS `shop_goods_type_props_values`;
CREATE TABLE `shop_goods_type_props_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `propsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Data for table "shop_goods_type_props_values"
#

INSERT INTO `shop_goods_type_props_values` VALUES (24,'3G',0,16),(25,'4G',1,16),(26,'2015',0,17),(27,'2016',1,17),(28,'2017',2,17);

#
# Structure for table "shop_goods_type_spec"
#

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

#
# Data for table "shop_goods_type_spec"
#

INSERT INTO `shop_goods_type_spec` VALUES (9,0,14,6),(10,1,14,7);

#
# Structure for table "shop_history_payments"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "shop_history_payments"
#

INSERT INTO `shop_history_payments` VALUES (1,'160414121435660',1,2,NULL,'pay_money',1460607369,'余额支付','Wizzer','::ffff:127.0.0.1',NULL,'余额支付:￥0.02',1460607369,NULL,0);

#
# Structure for table "shop_history_refunds"
#

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

#
# Data for table "shop_history_refunds"
#


#
# Structure for table "shop_images"
#

DROP TABLE IF EXISTS `shop_images`;
CREATE TABLE `shop_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

#
# Data for table "shop_images"
#

INSERT INTO `shop_images` VALUES (10,'/open/image/file/2f4bdf8a0d884426ac9440cb7b446fdb.jpg',7),(11,'/open/image/file/d08b02392f094759802397b109adc157.jpg',7),(12,'/open/image/file/38b675d5ad904792aaa9bfc37a38ca09.jpg',7),(13,'/open/image/file/24aa7d9a50694693a5387fe66a92383a.jpg',7),(14,'/open/image/file/2cb01917077741a18fa9f9aed511a244.jpg',8),(15,'/open/image/file/44ef4c06af124317915e2b8c4d371483.jpg',8),(16,'/open/image/file/11ff343dbeda4ff3a9b0e2d962c7766b.jpg',8),(17,'/open/image/file/0a7b520b43774ac699a70387698ca757.jpg',8),(18,'/open/image/file/771880c741d24fa1bcc08b986f7844b5.jpg',8),(25,'/open/image/file/7ae441f3add44b488d50277b8ec23abf.jpg',11),(26,'/open/image/file/5c7e75fc65524649bc35a6cba507b291.jpg',12),(49,'/open/image/file/8050f2cf794b438d8c62e12c7a1d945a.jpg',13),(50,'/open/image/file/896723809b9449f481fd2e8ba87eeaf1.jpg',13),(51,'/open/image/file/7d8f312e85d44e47a4729039adc9db16.jpg',14),(52,'/open/image/file/7871160e5eb14b46a3f5c3db4491e48e.jpg',14),(53,'/open/image/file/2a16c0a6e63a4d95bcf07ed1180595c9.jpg',14),(54,'/open/image/file/6f963b00383449ae87e674fdba40be29.png',6),(55,'/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',10),(56,'/open/image/file/7245859fe5e74edd9bfc63043b097eef.jpg',9),(57,'/open/image/file/854830f165c54850bea26f9e6ac9f26f.jpg',9),(58,'/open/image/file/20f16a08b4684d5cad73749001bcbb65.jpg',9),(62,'/open/image/file/0f5daea9c0b94f3bb89b3d9798ad432a.jpg',5),(69,'/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',15),(70,'/open/image/file/d6e7767307764869b8ac1284cb650578.jpg',15),(71,'/open/image/file/4a799a201c7245c095e6d96f5c967bd8.jpg',15),(78,'/open/image/file/49898d94c8244b5c94534dd3bc3911c9.jpg',4),(79,'/open/image/file/1c2799a956154059a826f06c230cd967.jpg',4),(80,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',4);

#
# Structure for table "shop_member"
#

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
  `reg_source` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lv_id` (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member"
#

INSERT INTO `shop_member` VALUES (1,2,'Wizzer',NULL,'http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',NULL,NULL,NULL,NULL,'13359011954',NULL,'wizzer@qq.com',2,NULL,NULL,NULL,NULL,20000,2,NULL,100,NULL,1460354582,NULL),(47,1,'Wizzer',NULL,'http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',NULL,NULL,NULL,NULL,'13359011952',NULL,NULL,0,0,0,0,1,0,0,NULL,0,'::ffff:192.168.1.11',1460354582,'weixin'),(48,2,'Wizzer','大鲨鱼','http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',NULL,NULL,NULL,NULL,'13359011952',NULL,'wizzer@qq.com',1,2013,4,3,1,10000,2,NULL,0,'::ffff:192.168.1.11',1460355687,'weixin');

#
# Structure for table "shop_member_account"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_account"
#

INSERT INTO `shop_member_account` VALUES (2,1,'13956990212','wfcd2304bf06b7e0c1f92d7346f5d4ec',0,1457597717,'::ffff:127.0.0.1',1461117377),(3,2,'18656133178','w0c810d4948063616adb87e97daa6de7',0,1459936427,'::ffff:192.168.1.119',1460001558);

#
# Structure for table "shop_member_addr"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_addr"
#

INSERT INTO `shop_member_addr` VALUES (1,1,'大鲨鱼','13359011952','安徽省','合肥市','蜀山区','黄山路666号','',1,1460354651);

#
# Structure for table "shop_member_bind"
#

DROP TABLE IF EXISTS `shop_member_bind`;
CREATE TABLE `shop_member_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `bind_type` varchar(10) DEFAULT NULL,
  `bind_openid` varchar(100) DEFAULT NULL,
  `bind_nickname` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `binded` tinyint(1) DEFAULT NULL,
  `bindedAt` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bind_openid` (`bind_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_bind"
#

INSERT INTO `shop_member_bind` VALUES (27,1,'weixin','oFTcHj6Mz7YNtl1BGt3YgsqsdIsc','Wizzer<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',0,1,NULL,1460355687);

#
# Structure for table "shop_member_cart"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_cart"
#

INSERT INTO `shop_member_cart` VALUES (34,43,15,42,'秭归血橙新鲜预售（礼盒装）','','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',1,3420,2250,0,1459936443),(37,43,10,28,'寿西湖红颜草莓1.2kg（火热预售）','','/open/image/file/17274ea8a11e46b88c6d8a7967c7a976.jpg',1,4320,1200,0,1459936448),(38,23,4,43,'山东特产正宗潍县萝卜青萝卜','','/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1,1,1000,1,1460112853),(39,1,15,42,'秭归血橙新鲜预售（礼盒装）','','/open/image/file/64c03356c56a4681b3660c8b0ad1d1ba.jpg',1,3420,2250,0,1461117377);

#
# Structure for table "shop_member_comment"
#

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
  KEY `memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_comment"
#

INSERT INTO `shop_member_comment` VALUES (1,1,3,'嘎嘎嘎',NULL,10,'Wizzer',4,30,'2147483647','::ffff:192.168.1.11',1459326655,0,NULL,NULL,NULL,0),(2,1,3,'嘎嘎嘎嘎',NULL,10,'Wizzer',4,30,'160329231792604','::ffff:192.168.1.11',1459326819,0,NULL,NULL,NULL,0),(3,1,2,'低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒低洼撒旦撒',NULL,10,'Wizzer',9,29,'160329231792604','::ffff:192.168.1.11',1459327733,0,NULL,NULL,NULL,0),(4,1,1,'产品还行吧~~不是我的菜',NULL,10,'Wizzer',4,30,'160330015380732','::ffff:192.168.1.11',1459328116,0,NULL,NULL,NULL,0),(5,1,2,'',NULL,10,'Wizzer',10,28,'160330020153694','::ffff:192.168.1.11',1459328555,0,NULL,NULL,NULL,1),(6,1,1,'一般般~~',NULL,10,'Wizzer',4,30,'160330020153694','::ffff:192.168.1.11',1459328560,0,NULL,NULL,NULL,1),(7,1,3,'@！！！！\'\"\",\'\'\\\\//',NULL,10,'Wizzer',4,30,'160330020642016','::ffff:192.168.1.11',1459328812,0,NULL,NULL,NULL,1),(8,1,3,'',NULL,23,'Wizzer',4,43,'160408025229419','::ffff:192.168.1.102',1460111464,0,NULL,NULL,NULL,1),(9,1,3,'',NULL,23,'Wizzer',10,28,'160408023475902','::ffff:192.168.1.102',1460111735,0,NULL,NULL,NULL,1),(10,1,3,'',NULL,23,'Wizzer',15,42,'160408023475902','::ffff:192.168.1.102',1460111738,0,NULL,NULL,NULL,1),(11,1,2,'',NULL,23,'Wizzer',4,43,'160408023475902','::ffff:192.168.1.102',1460111800,0,NULL,NULL,NULL,1),(12,1,2,'非常好吃啊啊啊',NULL,23,'Wizzer',9,29,'160408023475902','::ffff:192.168.1.102',1460111994,0,NULL,NULL,NULL,1);

#
# Structure for table "shop_member_coupon"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_coupon"
#

INSERT INTO `shop_member_coupon` VALUES (14,22,2,'10元',1000,NULL,NULL,0,1459845015),(15,23,2,'10元',1000,'160408002096991',1460100014,1,1459845052),(16,1,2,'10元',1000,NULL,NULL,0,1460962099);

#
# Structure for table "shop_member_lv"
#

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

#
# Data for table "shop_member_lv"
#

INSERT INTO `shop_member_lv` VALUES (1,'一级会员','member',NULL,95,300,NULL,0),(2,'二级会员','member',NULL,90,500,NULL,0);

#
# Structure for table "shop_member_money_log"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_money_log"
#

INSERT INTO `shop_member_money_log` VALUES (33,47,'160410230653086',30000,26390,3610,NULL,'支付订单:160410230653086',0,1460354776),(34,1,'0',NULL,26390,26390,'','帐号绑定余额转入',0,1460355428),(35,47,'0',26390,0,26390,'','帐号绑定余额转出',0,1460355428),(36,1,'0',26390,28390,2000,'','帐号绑定余额转入',0,1460355859),(37,48,'0',2000,0,2000,'','帐号绑定余额转出',0,1460355859),(38,1,'160414121435660',28390,28388,2,NULL,'支付订单:160414121435660',0,1460607369),(39,1,'0',28388,28388,0,'','管理员操作:',1,1461035844),(40,1,'0',28388,30388,2000,'','管理员操作:+20',1,1461036027),(41,1,'0',30388,30721,333,'','管理员操作:',1,1461036058),(42,1,'0',30721,30021,-700,'','管理员操作:',1,1461036569),(43,1,'0',30021,30022,1,'','管理员操作:',1,1461036597),(44,48,'0',0,10000,10000,'','管理员操作:',1,1461036709),(45,1,'0',0,20000,20000,'','管理员操作:',1,1461038906);

#
# Structure for table "shop_member_score_log"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

#
# Data for table "shop_member_score_log"
#

INSERT INTO `shop_member_score_log` VALUES (45,47,'160410230653086',300,336,36,'订单:160410230653086',0,1460354776),(46,1,'0',NULL,336,336,'帐号绑定积分转入',0,1460355428),(47,47,'0',336,0,336,'帐号绑定积分转出',0,1460355428),(48,48,NULL,0,500,500,'微信注册赠送',0,1460355687),(49,1,'0',336,836,500,'帐号绑定积分转入',0,1460355859),(50,48,'0',500,0,500,'帐号绑定积分转出',0,1460355859),(51,1,NULL,836,336,500,'兑换优惠券:20元',NULL,1460356715),(52,1,NULL,336,136,200,'兑换优惠券:10元',NULL,1460962099),(53,1,'0',136,236,100,'管理员操作:加积分',1,1461038772),(54,1,'0',136,0,-136,'管理员操作:',1,1461038823),(55,1,'0',136,100,-36,'管理员操作:',1,1461038897);

#
# Structure for table "shop_order"
#

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
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "shop_order"
#

INSERT INTO `shop_order` VALUES ('160413105396054',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460516034,1,0,NULL,NULL,1,'','pc',0),('160413105696125',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460516173,1,0,NULL,NULL,1,'','pc',0),('160413110153615',0,'active',9000,0,9,0,0,9,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460516490,1,0,NULL,NULL,1,'','pc',0),('160413110298178',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460516528,1,0,NULL,NULL,1,'','pc',0),('160413110787506',0,'active',10000,0,10,0,0,10,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460516870,1,0,NULL,NULL,1,'','pc',0),('160413111530959',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517326,1,0,NULL,NULL,1,'','pc',0),('160413111541180',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517329,1,0,NULL,NULL,1,'','pc',0),('160413111544331',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517323,1,0,NULL,NULL,1,'','pc',0),('160413111588010',0,'active',10000,0,10,0,0,10,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517300,1,0,NULL,NULL,1,'','pc',0),('160413111598898',0,'active',10000,0,10,0,0,10,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517304,1,0,NULL,NULL,1,'','pc',0),('160413111835823',0,'active',1000,0,1,0,0,1,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517483,1,0,NULL,NULL,1,'','pc',0),('160413111893264',0,'active',6000,0,6,0,0,6,0,0,'pay_alipay',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517491,1,0,NULL,NULL,1,'','pc',0),('160413112085403',0,'active',6000,0,6,0,0,6,0,0,'pay_cash',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460517643,1,0,NULL,1461117395,1,'','pc',0),('160414121435660',0,'active',2000,0,2,0,0,2,2,1,'pay_money',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460607294,1,0,NULL,1460607369,1,'','pc',0),('160418144718583',0,'active',3000,0,3,0,0,3,0,0,'pay_cash',0,0,NULL,NULL,1,'安徽省','合肥市','蜀山区','黄山路666号','大鲨鱼','13359011952',NULL,0,'','','','::ffff:127.0.0.1',1460962077,1,0,NULL,1460962084,1,'','pc',0);

#
# Structure for table "shop_order_goods"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "shop_order_goods"
#

INSERT INTO `shop_order_goods` VALUES (1,'160413105396054',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460516034,0,NULL),(2,'160413105696125',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460516173,0,NULL),(3,'160413110153615',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,9,0,9,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460516490,0,NULL),(4,'160413110298178',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460516528,0,NULL),(5,'160413110787506',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,10,0,10,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460516870,0,NULL),(6,'160413111588010',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,10,0,10,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517300,0,NULL),(7,'160413111598898',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,10,0,10,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517304,0,NULL),(8,'160413111544331',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517323,0,NULL),(9,'160413111530959',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517326,0,NULL),(10,'160413111541180',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517329,0,NULL),(11,'160413111835823',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,1,0,1,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517483,0,NULL),(12,'160413111893264',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,6,0,6,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517491,0,NULL),(13,'160413112085403',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,6,0,6,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460517643,0,NULL),(14,'160414121435660',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,2,0,2,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460607294,0,NULL),(15,'160418144718583',4,45,'山东特产正宗潍县萝卜青萝卜','P1603000001','',1,2490,3,0,3,0,1000,'/open/image/file/551860e3ef97462ca2f2bc27d1c79533.jpg',1460962077,0,NULL);

#
# Structure for table "shop_order_log"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "shop_order_log"
#

INSERT INTO `shop_order_log` VALUES (1,'160413105396054','create','创建订单','member',1,'Wizzer',1460516034,'ok'),(2,'160414121435660','create','创建订单','member',1,'Wizzer',1460607294,'ok'),(3,'160414121435660','payment','订单付款:余额支付','member',1,'Wizzer',1460607369,'ok'),(4,'160418144718583','create','创建订单','member',1,'Wizzer',1460962077,'ok'),(5,'160418144718583','update','变更支付方式为:货到付款','member',1,'Wizzer',1460962084,'ok'),(6,'160413112085403','update','变更支付方式为:货到付款','member',1,'Wizzer',1461117395,'ok');

#
# Structure for table "shop_order_ship_log"
#

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

#
# Data for table "shop_order_ship_log"
#


#
# Structure for table "shop_sales_coupon"
#

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

#
# Data for table "shop_sales_coupon"
#

INSERT INTO `shop_sales_coupon` VALUES (1,'20元',2000,1000,27,1,500,1,NULL,0),(2,'10元',1000,800,18,1,200,1,NULL,0),(3,'500元',50000,4,3,1,7000,1,NULL,0);

#
# Structure for table "sms_config"
#

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

#
# Data for table "sms_config"
#

INSERT INTO `sms_config` VALUES (1,'top','23273074','201646c2c8ff6f42c47bc599203a1d26','上城网络','SMS_2675019','SMS_2675022','SMS_2675021','SMS_2675017',1457518406);

#
# Structure for table "sms_log"
#

DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log` (
  `id` varchar(255) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `sms` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sms_log"
#

INSERT INTO `sms_log` VALUES ('1','13359011952','457855','注册验证',1457594894);

#
# Structure for table "sys_config"
#

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) DEFAULT NULL,
  `config_val` varchar(100) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "sys_config"
#

INSERT INTO `sys_config` VALUES (1,'system.AppName','上城电子商城系统',NULL),(2,'system.AppDomain','wizzer.wicp.net',NULL),(3,'system.AppShrotName','上城Shop',NULL),(4,'system.AppCopyright','Wizzer.cn',NULL),(5,'system.AppIp','61.174.40.247',1458703898);

#
# Structure for table "sys_log"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "sys_log"
#

INSERT INTO `sys_log` VALUES (1,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460524535),(2,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460525630),(3,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460537251),(4,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460597002),(5,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460610680),(6,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460706161),(7,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460706564),(8,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460706566),(9,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460706886),(10,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460706887),(11,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460706893),(12,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460706898),(13,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460706904),(14,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460706905),(15,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460707087),(16,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460707089),(17,'system','/private/login/logout','退出系统',1,'超级管理员','::ffff:127.0.0.1',1460707091),(18,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460946630),(19,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460947497),(20,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460950929),(21,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460956274),(22,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460966560),(23,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1460968326),(24,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1461028449),(25,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1461030803),(26,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1461117027),(27,'system','/private/login/doLogin','登录成功',1,'超级管理员','::ffff:127.0.0.1',1461118675);

#
# Structure for table "sys_menu"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

#
# Data for table "sys_menu"
#

INSERT INTO `sys_menu` VALUES (1,0,'0001','系统',NULL,'',NULL,'','system',0,0,1,8,1,NULL),(2,1,'00010001','系统管理',NULL,'',NULL,'ti-settings','system:sys',0,0,1,21,1,NULL),(3,2,'000100010001','单位管理',NULL,'/private/sys/unit','data-pjax','','system:sys:unit',0,0,0,47,1,NULL),(4,2,'000100010002','用户管理',NULL,'/private/sys/user','data-pjax','','system:sys:user',0,0,0,48,1,NULL),(5,2,'000100010003','角色管理',NULL,'/private/sys/role','data-pjax','','system:sys:role',0,0,0,49,1,NULL),(6,2,'000100010004','菜单管理',NULL,'/private/sys/menu','data-pjax','','system:sys:menu',0,0,0,50,1,NULL),(7,1,'00010002','定时任务',NULL,'',NULL,'ti-time','system:task',0,0,1,22,1,NULL),(8,7,'000100020001','定时任务',NULL,'/private/sys/task','data-pjax','','system:task:job',0,0,0,51,1,NULL),(9,1,'00010003','系统安全',NULL,'',NULL,'ti-user','system:safe',0,0,1,23,1,NULL),(10,9,'000100030001','登录日志',NULL,'/private/sys/log','','','system:safe:log',0,0,0,52,1,NULL),(11,9,'000100030002','访问控制',NULL,'/private/sys/ip',NULL,NULL,'system:safe:ip',0,0,0,53,1,NULL),(12,0,'0002','营销',NULL,'','','','marketing',0,0,1,5,1,NULL),(13,1,'00010004','商店配置',NULL,'','','ti-shopping-cart','system:config:shop',0,0,1,20,1,NULL),(14,13,'000100040001','商店设置',NULL,'/private/conf/shop','data-pjax',NULL,'system:config:shop:setting',0,0,0,42,1,NULL),(15,13,'000100040002','短信设置',NULL,'/private/conf/sms','data-pjax',NULL,'system:config:shop:sms',0,0,0,43,1,NULL),(16,0,'0003','订单',NULL,NULL,NULL,NULL,'order',0,0,1,1,1,NULL),(17,16,'00030001','订单列表',NULL,NULL,NULL,'ti-shopping-cart-full','order:list',0,0,1,1,1,NULL),(18,17,'000300010001','订单',NULL,'/private/shop/order/order','data-pjax','','order:list:orders',0,0,0,3,1,NULL),(19,17,'000300010002','收款单',NULL,NULL,NULL,NULL,'order:list:cashs',0,0,0,4,1,NULL),(20,17,'000300010003','发货单',NULL,NULL,NULL,NULL,'order:list:sends',0,0,0,5,1,NULL),(21,17,'000300010004','售后单',NULL,NULL,NULL,NULL,'order:list:services',0,0,0,6,1,NULL),(22,17,'000300010005','退货单',NULL,NULL,NULL,NULL,'order:list:returns',0,0,0,7,1,NULL),(23,17,'000300010006','退款单',NULL,NULL,NULL,NULL,'order:list:refunds',0,0,0,8,1,NULL),(24,0,'0004','商品',NULL,NULL,NULL,NULL,'goods',0,0,1,3,1,NULL),(25,24,'00040001','商品管理',NULL,'','','ti-shopping-cart','goods:manage',0,0,1,4,1,NULL),(26,25,'000400010001','商品列表',NULL,'/private/shop/goods/goods','data-pjax','','goods:manage:list',0,0,0,17,1,NULL),(27,24,'00040002','商品配置',NULL,'','','ti-settings','goods:setting',0,0,1,5,1,NULL),(28,27,'000400020001','商品分类',NULL,'/private/shop/goods/class','data-pjax','','goods:setting:class',0,0,0,18,1,NULL),(29,27,'000400020002','商品类型',NULL,'/private/shop/goods/type','data-pjax','','goods:setting:type',0,0,0,19,1,NULL),(30,27,'000400020003','商品规格',NULL,'/private/shop/goods/spec','data-pjax','','goods:setting:spec',0,0,0,20,1,NULL),(33,0,'0005','会员',NULL,NULL,NULL,NULL,'member',0,0,1,2,1,NULL),(34,33,'00050001','会员管理',NULL,'','','ti-user','member:manage',0,0,1,2,1,NULL),(35,34,'000500010001','会员列表',NULL,'/private/shop/member/member','data-pjax','','member:manage:list',0,0,0,9,1,NULL),(36,34,'000500010002','会员等级',NULL,'/private/shop/member/level','data-pjax','','member:manage:level',0,0,0,10,1,NULL),(39,33,'00050002','咨询评论',NULL,'','','ti-comment','member:msg',0,0,1,3,1,NULL),(40,39,'000500020001','咨询列表',NULL,'/private/shop/member/comment','data-pjax','','member:msg:faq',0,0,0,13,1,NULL),(41,39,'000500020002','评论列表',NULL,NULL,NULL,NULL,'member:msg:review',0,0,0,14,1,NULL),(44,0,'0006','CMS',NULL,'','','','site',0,0,1,7,1,NULL),(45,44,'00060001','站点管理',NULL,'','','ti-world','site:manage',0,0,1,17,1,NULL),(47,45,'000600010002','站点配置',NULL,'/private/cms/site','data-pjax','','site:manage:setting',0,0,0,27,1,NULL),(48,44,'00060002','内容管理',NULL,'','','ti-pencil-alt','site:cms',0,0,1,18,1,NULL),(49,48,'000600020001','栏目管理',NULL,'/private/cms/channel','data-pjax','','site:cms:channel',0,0,0,40,1,NULL),(50,48,'000600020002','文章管理',NULL,'/private/cms/article','data-pjax','','site:cms:article',0,0,0,41,1,NULL),(51,44,'00060003','广告及链接',NULL,'','','ti-link','site:link',0,0,1,19,1,NULL),(52,51,'000600030001','链接管理',NULL,'/private/cms/link','data-pjax','','site:link:list',0,0,0,55,1,NULL),(53,0,'0007','微信',NULL,'',NULL,'','weixin',0,0,1,4,1,1445825925),(54,53,'00070001','微信配置',NULL,'',NULL,'fa fa-weixin','weixin:manage',0,0,1,10,1,1445826142),(55,54,'000700010001','帐号配置',NULL,'/private/wx/config','data-pjax','','weixin:manage:config',0,0,0,28,1,1445826178),(56,54,'000700010002','菜单配置',NULL,'/private/wx/menu','data-pjax','','weixin:manage:menu',0,0,0,29,1,1445830074),(57,53,'00070002','素材管理',NULL,'','','ti-pencil-alt','weixin:msg',0,0,1,8,1,1445843697),(58,57,'000700020001','文字消息',NULL,'/private/wx/txt','data-pjax','','weixin:msg:txt',0,0,0,25,1,1445843720),(59,57,'000700020002','图文消息',NULL,'/private/wx/news','data-pjax','','weixin:msg:news',0,0,0,26,1,1445843889),(60,53,'00070003','自动回复',NULL,'',NULL,'ti-back-left','weixin:reply',0,0,1,9,1,1445929792),(61,60,'000700030001','关注自动回复',NULL,'/private/wx/reply?type=follow','data-pjax','','weixin:reply:follow',0,0,0,1,1,1445929848),(62,60,'000700030002','关键词回复',NULL,'/private/wx/reply?type=keyword','data-pjax','','weixin:reply:keyword',0,0,0,2,1,1445929868),(63,51,'000600030002','链接分类',NULL,'/private/cms/linkclass','data-pjax','','site:link:class',0,0,0,54,1,1446788018),(64,27,'000400020004','商品品牌',NULL,'/private/shop/goods/brand','data-pjax','','goods:setting:brand',0,0,0,21,1,1450253034),(65,53,'00070004','营销活动',NULL,'','','fa fa-credit-card','weixin:sales',0,1,1,7,1,1451438619),(66,65,'000700040001','活动管理',NULL,'/private/wx/sales/manage','data-pjax','','weixin:sales:manage',0,0,0,23,1,1451438974),(67,65,'000700040002','活动详情',NULL,'/private/wx/sales/result','data-pjax','','weixin:sales:result',0,0,0,24,1,1451439283),(68,53,'00070005','微信会员',NULL,'','data-pjax','fa fa-user','weixin:user',0,0,1,6,1,1451986421),(69,68,'000700050001','会员列表',NULL,'/private/wx/user','data-pjax','','weixin:user:list',0,0,0,22,1,1451986453),(72,0,'0008','统计',NULL,'','','','count',0,0,1,6,1,1453858438),(73,72,'00080001','销售统计',NULL,'','','ti-shopping-cart-full','count:shopsale',0,0,1,15,1,1453858640),(74,73,'000800010001','销售收入',NULL,'','data-pjax','','count:shopsale:income',0,0,0,37,1,1453858718),(75,73,'000800010002','商品销量',NULL,'','data-pjax','','count:shopsale:sales',0,0,0,38,1,1453858771),(76,72,'00080002','站点统计',NULL,'','','ti-world','count:site',0,0,1,16,1,1453858917),(77,76,'000800020001','网站访问量',NULL,'','data-pjax','','count:site:pv',0,0,0,39,1,1453858986),(78,12,'00020001','促销管理',NULL,'','','ti-stats-up','marketing:promotion',0,0,1,11,1,1453859141),(79,78,'000200010001','订单促销',NULL,'','data-pjax','','marketing:promotion:order',0,0,0,30,1,1453859226),(80,78,'000200010002','商品促销',NULL,'','data-pjax','','marketing:promotion:goods',0,0,0,31,1,1453859244),(81,12,'00020002','优惠券',NULL,'','','ti-credit-card','marketing:coupon',0,0,1,12,1,1453859500),(82,81,'000200020001','优惠券管理',NULL,'','data-pjax','','marketing:coupon:list',0,0,0,32,1,1453859559),(83,81,'000200020002','优惠券使用记录',NULL,'','data-pjax','','marketing:coupon:history',0,0,0,33,1,1453859710),(85,12,'00020003','注册营销',NULL,'','','ti-id-badge','marketing:register',0,0,1,13,1,1453859864),(86,85,'000200030001','注册营销配置',NULL,'','data-pjax','','marketing:register:setting',0,0,0,35,1,1453859929),(87,12,'00020004','赠品营销',NULL,'','','ti-gift','marketing:gift',0,0,1,14,1,1453859999),(88,87,'000200040001','赠品管理',NULL,'','data-pjax','','marketing:gift:list',0,0,0,36,1,1453860035),(89,13,'000100040003','图片配置',NULL,'/private/conf/img','data-pjax','','system:config:shop:img',0,0,0,45,1,1458703650),(90,13,'000100040004','区域管理',NULL,'/private/shop/area','data-pjax','','system:config:shop:area',0,0,0,44,1,1458703720),(91,2,'000100010005','系统参数',NULL,'/private/sys/conf','data-pjax','','system:sys:conf',0,0,0,46,1,1458703756);

#
# Structure for table "sys_menu_roles__sys_role_menus"
#

DROP TABLE IF EXISTS `sys_menu_roles__sys_role_menus`;
CREATE TABLE `sys_menu_roles__sys_role_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_menu_roles` int(11) DEFAULT NULL,
  `sys_role_menus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;

#
# Data for table "sys_menu_roles__sys_role_menus"
#

INSERT INTO `sys_menu_roles__sys_role_menus` VALUES (257,12,1),(258,14,1),(259,13,1),(260,15,1),(289,7,20),(290,1,20),(291,2,20),(292,9,20),(437,60,19),(438,53,19),(439,68,19),(440,69,19),(441,65,19),(442,66,19),(443,67,19),(444,57,19),(445,58,19),(446,59,19),(447,61,19),(448,62,19),(449,54,19),(450,55,19),(451,56,19),(471,16,2),(472,17,2),(473,18,2),(474,19,2),(475,20,2),(476,21,2),(477,22,2),(478,23,2),(479,33,2),(480,34,2),(481,35,2),(482,36,2),(485,39,2),(486,40,2),(487,41,2),(490,24,2),(491,25,2),(492,26,2),(493,27,2),(494,28,2),(495,29,2),(496,30,2),(497,64,2),(498,53,2),(499,68,2),(500,69,2),(501,65,2),(502,66,2),(503,67,2),(504,57,2),(505,58,2),(506,59,2),(507,60,2),(508,61,2),(509,62,2),(510,54,2),(511,55,2),(512,56,2),(513,12,2),(514,78,2),(515,79,2),(516,80,2),(517,82,2),(518,81,2),(519,83,2),(521,85,2),(522,86,2),(523,87,2),(524,88,2),(525,72,2),(526,73,2),(527,74,2),(528,75,2),(529,76,2),(530,77,2),(531,44,2),(532,45,2),(533,47,2),(534,48,2),(535,49,2),(536,50,2),(537,51,2),(538,63,2),(539,52,2),(540,1,2),(541,13,2),(542,14,2),(543,15,2),(544,90,2),(545,89,2),(546,2,2),(547,91,2),(548,3,2),(549,4,2),(550,5,2),(551,6,2),(552,7,2),(553,8,2),(554,9,2),(555,10,2),(556,11,2);

#
# Structure for table "sys_role"
#

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

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,0,'公共角色','public',0,1,1,NULL),(2,0,'系统管理','sysadmin',0,2,1,NULL),(19,4,'袭人花店角色','xiren',0,0,1,1445562940);

#
# Structure for table "sys_role_users__sys_user_roles"
#

DROP TABLE IF EXISTS `sys_role_users__sys_user_roles`;
CREATE TABLE `sys_role_users__sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sys_role_users` int(11) DEFAULT NULL,
  `sys_user_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

#
# Data for table "sys_role_users__sys_user_roles"
#

INSERT INTO `sys_role_users__sys_user_roles` VALUES (10,2,10),(28,2,1),(32,1,1),(58,19,16);

#
# Structure for table "sys_unit"
#

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

#
# Data for table "sys_unit"
#

INSERT INTO `sys_unit` VALUES (1,0,'0001','系统管理','请勿删除','安徽省合肥市蜀山区','13359011952','0551-63506223',0,1,1,1442391167),(4,0,'0002','袭人花店','','','','',0,0,1,1452828945);

#
# Structure for table "sys_user"
#

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
  `customMenus` longtext,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  KEY `nickname` (`nickname`),
  KEY `unitid` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (1,'superadmin','超级管理员','wizzer@qq.com','w308aa01db0f163e8f0eb82df40590e2',0,1,'::ffff:127.0.0.1',1461118675,442,'palette.css',0,0,0,NULL,1,1452828989,1),(16,'xradmin','袭人花店管理员','','w0eac2466d0c6fe280c4c8261c58acc4',0,1,'::ffff:192.168.1.11',1452829832,6,NULL,0,0,0,NULL,1,1452828989,4);

#
# Structure for table "wx_config"
#

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

#
# Data for table "wx_config"
#

INSERT INTO `wx_config` VALUES (2,'sun','gh_c8c3f92c1b2f','wx17fe71227e1577d9','190550dda42029b952ee4273b8d4aec1','IEcfKeAWngE5vzgrPuFwBtNAtES9urJhVF2XuwABvPd','wizzer','{\"accessToken\":\"0yxm9-htLpCwCqOBZxBUI5UUMDGMTsglzI-BgKEPMUv_bnh3Q1MgCxv3xUfXxYvH9h-iQtCxapp6J1mYYQ2oNk89VLsiSpkLVnzSfsdnPdp9shnAoLB_ATbDyZaU8oEqFKWcAHALQC\",\"expireTime\":1461124337654}',1461117147,'{\"ticket\":\"bxLdikRXVbTPdHSM05e5u5qWFhRRus1fubH4C8teRcPRzuAu8px4xLob9zub0Zbkg4Y4BwEBX1AH-mM-2ClGKA\",\"expireTime\":1460361849406}',1460354659,'/upload/image/20160112/9c941345-d4ab-49cb-96a8-9aafbf1b5152.jpg',1,1446104003);

#
# Structure for table "wx_menu"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "wx_menu"
#

INSERT INTO `wx_menu` VALUES (29,0,'0006','商城首页','view','','http://wizzer.wicp.net/wap/wechat/oauth?goto_url=http://wizzer.wicp.net/wap/',0,1,1,1459409356,2),(30,0,'0007','会员中心','view','','http://wizzer.wicp.net/wap/wechat/oauth?goto_url=http://wizzer.wicp.net/wap/member',0,2,1,1459409564,2);

#
# Structure for table "wx_news"
#

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

#
# Data for table "wx_news"
#

INSERT INTO `wx_news` VALUES (3,'测试','测试','http://wizzer.wicp.net/upload/image/20160131/9b7d34cc-c507-4006-a821-fca0e62e89b4.png','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx17fe71227e1577d9&redirect_uri=http%3A%2F%2Fwizzer.wicp.net%2Fpublic%2Fwx%2Fsales%2Fxiren%2Fmy%2F1&response_type=code&scope=snsapi_base&state=11624317#wechat_redirect',1,1454301746);

#
# Structure for table "wx_reply"
#

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

#
# Data for table "wx_reply"
#

INSERT INTO `wx_reply` VALUES (9,'keyword','txt','MENU_CLICK_1','4',1,1446106371,2),(10,'follow','txt',NULL,'4',1,1459316448,2);

#
# Structure for table "wx_sales"
#

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

#
# Data for table "wx_sales"
#

INSERT INTO `wx_sales` VALUES (1,'袭人花店',NULL,'1',NULL,'/upload/audio/20160114/b7ecc802-6762-4645-ae52-9a6c6e127cfe.mp3','1、红包领取时间为2016年1月1日到2月28日<br>\n2、红包使用时间为2月28日00：00至3月31日24：00<br>\n3、店铺红包无门槛，购买任何商品即可使用<br>\n4、关注公众号后，在“新年花语”-“我的红包”菜单中查看红包',NULL,1,0,10000,3697,50,5,50,1451946247,1454737207,0,1,1451888662,2);

#
# Structure for table "wx_sales_info"
#

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

#
# Data for table "wx_sales_info"
#


#
# Structure for table "wx_sales_log"
#

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

#
# Data for table "wx_sales_log"
#


#
# Structure for table "wx_sales_user"
#

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

#
# Data for table "wx_sales_user"
#


#
# Structure for table "wx_txt"
#

DROP TABLE IF EXISTS `wx_txt`;
CREATE TABLE `wx_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "wx_txt"
#

INSERT INTO `wx_txt` VALUES (4,'关注自动回复','Node.js Test...',1,1446020591);

#
# Structure for table "wx_user"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

#
# Data for table "wx_user"
#

INSERT INTO `wx_user` VALUES (49,'oFTcHj6Mz7YNtl1BGt3YgsqsdIsc',NULL,'Wizzer',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELnuBaNQyQqyG4P96pepKUnN69HxsK9x4BdufWEJmbGoMYLI2icibiaViaTdpV0yfgIicQC4vKLjO9FRZQ/0',1459845051,2),(50,'oFTcHj_Jy1uObYDe29ek6C5NqAhs',NULL,'JING<span class=\"emoji emoji1f412\" title=\"monkey\"></span>',1,2,'','','埃及','http://wx.qlogo.cn/mmopen/PiajxSqBRaEJJt2ppsy2m1pO1TkLNEKqMNJCDo9hITstxtiatpRvricN15dd22wbN0sgqspbkGXrF7YxIszV4y8KA/0',1460122002,2),(51,'oFTcHj8fT5wGo5MLVQzR_I869ayE',NULL,'良人.',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHBOOv3KLibHzlMDNX36M5iaStXZy6nwUPs2aNPDU1icbdRNNjLHAe4ojpsanEhu2wa3wIEEhVCaPNmSw/0',1400037436,2),(52,'oFTcHj1jecFdUBrcqGloKQKA8Ixc',NULL,'<span class=\"emoji emoji1f380\" title=\"ribbon\"></span><span class=\"emoji emoji1f451\" title=\"crown\"></span>小鑫鑫<span class=\"emoji emoji1f48e\" title=\"gem stone\"></span>',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCXtlNo66OhMB1ScH3W3Qm4ErryYN8ZtZmaMjHeAAaAaDicInhXIJmlSuiax7BgygtdIpDVHjNibObGg/0',1399358673,2),(53,'oFTcHj0tGxoXmUuwDWFF1ZPO7y_g',NULL,'徐迅',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCLicCqV9mWKJN0lXOtFEfNBdAK4m1fmyqKQ7mshoaWDpRMUiaHmiaRLKSM90km0RW8JrFrgAaYOyaMg/0',1459928720,2),(54,'oFTcHj96YF_K8qdkUII5FCMTegno',NULL,'雨',1,2,'池州','安徽','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6bIxJSoC8B5M18hzlql4VboVXBEOC1fHwj1sQGwWxIrk14VbtAOLufnOlO3ZhfklljCiaTNB2KhgQ/0',1400037538,2),(56,'oFTcHjy8D7s_QYwnPVxCPMFF4U8g',NULL,'玄奘三藏',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM68iafgDVZA4HnJ5QJ6GecsRRFMDSeia2sshuZwq8Q2WCs740lgLfOLiaAKI1sKYGMFWKc2R5gTQZsOA/0',1400037167,2),(57,'oFTcHjzBfpxS7ckD5SeaI0AP32u8',NULL,'不动·峰',1,1,'长宁','上海','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKoIbzYeupKwSsdibSdJ4M8YTw16Pj4hwMuIOKPE1VxJHrR3MVMPmaCAUYDiasDItPEJAnDcIiad71yg/0',1460341402,2),(58,'oFTcHj0vFUoAHZraNpnpGUgmamq0',NULL,'DaN',1,2,'台州','浙江','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHD9EGoL5c4orrANxwlg3k5UJXqcuLXgWag9sxCtD7Ne31Ns90ibTKVWt3dPB59GNqAfgSY1hydvcxw/0',1372320687,2),(59,'oFTcHjxt5f3rdqcdhRK777J5hRIM',NULL,'AA<span class=\"emoji emoji1f47c\" title=\"baby angel\"></span><span class=\"emoji emoji2601\" title=\"cloud\"></span>️',1,2,'绍兴','浙江','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNCKmmTFsqu84d2gextBKP6JUBIWF1z1Z21HicrdK60RQxibIKicSCqKubV0coVVlK2XNSyloDhGHHA/0',1460341621,2),(60,'oFTcHj4F8noAm-R-viYLqv7ZSGUg',NULL,'折服、蛰伏わ',1,1,'漯河','河南','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7Hy8oW4rSSgEe632eBrX65T4Rf00LZicPbUQjjn0uHMmH3mUxN0k1j4hpcfuR1jxt4xbCQeyChW0eY/0',1459929204,2),(61,'oFTcHj3gTBEK0z8aMJRLVxe2uG3A',NULL,'朱婵',1,2,'南京','江苏','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4DtEjyxdpPENuFqnjfKCydSWPh4IuExkicUH0xDvkHkciaMbVk9WoWIuWDBSibpUrebFSGuVm9FebBw/0',1372652466,2),(62,'oFTcHj38oBp4u4_G6w-Deu0dTCIM',NULL,'往事终成须臾',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELsvwXLbEXmUW0I0fh25JjaYcCwFa5qMXSibyMgu1A2EYwEC3PGUhDgmZb1ic6JqljYOFeIRaiatB1AA/0',1400483135,2),(63,'oFTcHjyhZRQm9NjFI793U2_wDByU',NULL,'袭人草根',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H8aJYrGF4rcCGubZ407kibFB712wky7icuLa0Srjx140icJm6aywKFHO68NpMNKElRUnKTD2PfQpM9A/0',1452825631,2),(64,'oFTcHj0CU9OqbGrxZUHs1mQxBkPQ',NULL,'俊熙会计',1,2,'南京','江苏','中国','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCmFEL5Qycj70icF3GGQWZ6klqOGxd5jpe7SiaEfdD84pthicvbIl7eU4u5H8bkibvNn1DQXah4VUNuTg/0',1372432574,2),(65,'oFTcHjyKSC0if8vWMkaHBrpDstPE',NULL,'tina',1,2,'安庆','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaEJjhorS2Mxp7JWNnicaqJk7H1BeYBJju9iaqbrHOBFOR1ZFamcUy0wqSnGtNHx6qd1zfgdGxq15Qo6w/0',1400142848,2),(66,'oFTcHj7fxfVIztyBExCdgsonz9iE',NULL,'陌上',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6IkHGDKsBx31moWicJynpEb3hzicSicWicgltNLWkPcobUU09nVmEF8pj4ialhib7klVvddxicFiciaeBUyMvw/0',1460116404,2),(67,'oFTcHjzsOEMWb7H13xsdY2zxbGNo',NULL,'徽商茅台_韩新田',1,1,'浦东新区','上海','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaEIDoymM4647QXZSS3aaDk8wIMeibNzPfQVNBfVbp9fO7bkqwaYNCUjAIYr3cwK18icQBfvy1bk70kVQ/0',1400134723,2),(68,'oFTcHj0YrNElJvfT-SNtOfhTymW8',NULL,'小鱼宮主',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchUUlibn7w4bkMDnU2Wva6Rq4GYfZk8MCBIZ6QVxZT9LuhH69nfJmU6lTQianUl8mdqcEU9TogPgJbX/0',1371913519,2),(69,'oFTcHjwyxW_rJ6CvsTNRSEZEVEu0',NULL,'梦仙',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/ajNVdqHZLLB5TLricu0X1SrhBibMcibyRCtjDXlzDd4H7nwxxPib4EvibMSytEiazwEqzPTQCqlsKTSiaQ6xdFQuZa9uQ/0',1452754669,2),(70,'oFTcHj2ia7pIDfCM8oakxvqlg00g',NULL,'微信客服',1,0,'','','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM530hIvibnljt1WqEgFn3HvI3G6CGNNgRdWN8mfDOianAWn8F0ZnfD9DcEfDEQbWUTfhUg9qmqvic9xUOP2bngzicr6F98w7Y1jdrU/0',1384579785,2),(71,'oFTcHj7wxvQfPQOwg0oc0EJ9cDNY',NULL,'夏磊',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom1COEFZwEsp0LPDibdRTsGsRtrCg1oG8xl8feI8ibAKJGcZU1bLAiaiccJffjnMdZddhODicvpdqHUXSMgdKPDflOls5/0',1452750082,2),(72,'oFTcHj-vsjElEjcnb4SDo5E_6aN0',NULL,'袭人森林',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6JkrRp85bBfTwaZPlrq1wNjKs5BJcAmWacvtHoXroTHHGJR9oib5jsic3nKRJc8TPib4JdjriajxNUJIg/0',1452757713,2),(73,'oFTcHj3k97TlR_K7P_JwDpSFUBxE',NULL,'高压 ',1,2,'那曲','西藏','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKYVyzT7xIMb579mklXcapFURUiaj6qXdjpKGV5iagOXCYFo5S7NwhdM23Y22pVccbX52quGOVjkhFz/0',1459928611,2),(74,'oFTcHj4ohbc6MILbDaKtCGBSFjOI',NULL,'ShoutLeaf',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchdOghibTb1tyMFWjNzXGQcJYaJsG1wPggbO5R5UOKgibWHn8JEpW3ukFsiax6ZEE5QyMAbX0AItyoL7/0',1451876406,2),(75,'oFTcHj7S9E2vhZj-SZnBDG-TKO4I',NULL,'嘿嘿',1,1,'','','丹麦','http://wx.qlogo.cn/mmopen/3YPpiaGsLom0Jegia4d6DWuoKSFeN6KCKE43wZyf9zRRpxNHK1MBAQNibnicC1LUKhich0XW6p2FNYOwBcCGJ7yA00lpkQhjic3wjia/0',1452754060,2),(76,'oFTcHj6H0NFpe2l6wd-fEDPra29Q',NULL,'烟 火',1,1,'保定','河北','中国','http://wx.qlogo.cn/mmopen/ZOicUKz0Wt80FpDyYqbehXSyF3kStmxTbRpcmQJbibArQQiaQPxRV9j0Mk8Qjc2CwmSbEfNibC5Rm4zrq9Zca5pLIHvGVehHVwia8/0',1372321677,2),(77,'oFTcHj4bvBBEo8IG1wXKFQjQq9Wk',NULL,'Matt`槑',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM530hIvibnljt1WqEgFn3HvIVzakY13pXe3EtibkPqRBibfLOyeuI4JfkicibsPBxM8Arcg5fFHJOQeg0MLZYwAbw8Jcwbgtgf2VFlQ/0',1446687914,2),(78,'oFTcHjzdMmTdIM636kcneUsn3op0',NULL,'n',1,1,'和田','新疆','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchWPECvs1rFqh263BjrzYJVQeyia4qvZatJya1cibkpYg7Hg6QcDxnA41ia6VwJicUsPsl5XIs4I3R3BP/0',1459946807,2),(79,'oFTcHj8zzY7N4T0GOKtKcg-OoVe0',NULL,'吴',1,1,'','江苏','中国','',1372322536,2),(80,'oFTcHjyEwQinc9d2W9CAmCgyMLOU',NULL,'九天',1,1,'绍兴','浙江','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchbsPib3jU3zscUs4rfKSm5IpjvBIGCDcjsv3OmSMAzulSVaMo0vmBKxtwESTyrtDEZodsa3E5GKhX/0',1460342365,2),(81,'oFTcHj_eO8FF3wclLi6UQUjhe9YQ',NULL,'桂明',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/vQaBNyUWVUibsNicYms0JLdTgMQ6rFkFmeWmuJAZYib3Am3YL6T5VaIYEDFK8QhOu6IRdfWKPGCTAfJgJlM1UiawZWDNEdbO1BAib/0',1452831369,2),(82,'oFTcHj2m7RrTjYUHulby-viG08hs',NULL,'<span class=\"emoji emoji1f49c\" title=\"purple heart\"></span><span class=\"emoji emoji1f49c\" title=\"purple heart\"></span>♚雲<span class=\"emoji emojiae\" title=\"registered sign\"></span><span class=\"emoji emoji1f49c\" title=\"purple heart\"></span>',1,2,'','','冰岛','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDgRIPBj53skupdYlsRjQcPyJtHTT6hBKOia6H5pHbeCia0u8tiaictTpz5zYBN9qUGicP8URicsH6CxguQ/0',1460190058,2),(83,'oFTcHjxEf7UdmflozzIiVyAobCWU',NULL,'五彩缤纷',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchWGRQIWjc8eFAgQKSYn6kdjez2uyLyKCwjhzbM7EpR3ro8S5gUiaEDGakicxmd25xFsMiaKFMdHWObs/0',1452049754,2),(84,'oFTcHj6RHWas-H1AVZauQEPpSMzE',NULL,'一一',1,2,'安庆','安徽','中国','http://wx.qlogo.cn/mmopen/PiajxSqBRaELTVy5TEVQwZ88tOxGXTRF8R8cQwAvfbaG4r6ibmlkutelzkXibJiaEKMFIwHZ3sXUml2xcvrWiahu15w/0',1460116329,2),(85,'oFTcHj7ivFes-kdX_3L6e9kQz7S0',NULL,'旺仔牛奶！',1,1,'静安','上海','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H2BCUicwD2SwDI4GricDyOh38feO8oIefVlrxJIZk9U7mSokenHH9ktaEmZMKl6iceTIo63ic5tZhhDP/0',1400317182,2),(86,'oFTcHj6plWWZo3qYiVORKPCKbJeI',NULL,'黄平',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H41DRyzQ3DtAYojH7HgYIbnEOFYADKfWLlbKjLqbxoSZu23P1DNxV2EFllEnoEr7yl9o1vEQ2mpp/0',1400120854,2),(87,'oFTcHj_pYIVZbZ3To64jiMFDPYtg',NULL,'QFish',1,1,'朝阳','北京','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY7feiciaCTExKstf3X5HYLMeZ1q0Vvre1DxPV6yjzwdUykwBPOOYibJJnJAdyDN0MicgxtpF3GCkZTc4/0',1460117634,2),(88,'oFTcHjxoovLQN7OugLYJxO4p85Jg',NULL,'楼主的滑板鞋',1,1,'郑州','河南','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H7ROYw4RNFBUp4QOVtNbGy4NjDrtFiaRzIam5YvZpAqKOdK9H4XNaiaibHrMybYibAxicwNic5yNESlme0/0',1459930333,2),(89,'oFTcHj2OyUIKIhtR1TEYuHmZpx30',NULL,'LOVE鱼',1,1,'滁州','安徽','中国','http://wx.qlogo.cn/mmopen/ZOicUKz0Wt80FpDyYqbehXajib03B525h56nzYqy6ElCNCyh0YjicgnY2G21RLNNgEq1hb21375MZseUdic3KL3icu7mFtzfquhxn/0',1452049758,2),(90,'oFTcHj1DImjRUXpC4HHeGGi8YCNw',NULL,'何冲',1,1,'合肥','安徽','中国','',1459930447,2),(91,'oFTcHj_AZtAgnoTuOGlyUSwedHWk',NULL,'瑞瑞<span class=\"emoji emoji1f60a\" title=\"smiling face with smiling eyes\"></span>',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKciaL3gUyeTWtsL6S88Jr84GkzvWDKuZblOXG5DzD8Wlr0DkJrhK9OibS44nibRMLXYGyFBBUBds4GT/0',1460300085,2),(92,'oFTcHj2fXelRiRX4Pd5rmwLKGKAM',NULL,'可乐',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEche27bFp0NQLbSCbLDOnt6gJhWpXRKTky2ormicodYWYoMiceUlibYDetz4tGHOYYiaiaUI1d9jHpPNpNI/0',1372320181,2),(93,'oFTcHj5ZL-Ui4skrImsyfSoJzaaY',NULL,'七日心',1,0,'','','','',1459931207,2),(94,'oFTcHj8D6BwE6ryemMT9yJ7oYWJo',NULL,'秦芬',1,2,'广州','广东','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H8vlEUDbwJA1W5KV0FBTZWEWYSXMNkSwjovN7fwibDoVyn07wBCdnsrUkRgxPNkWz61fIKyr5fcHY/0',1373619346,2),(95,'oFTcHj_B4W49SjvXPDuljuee0U2k',NULL,'达达',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0ON34HEfM6a4MFibg1XrPT1TH1YFZJ8BH916BJ5MEpXWDsbzKz0baeDtSLuOl6zDRTickbjwVPPKp6S9tibJicLFnW9K/0',1426817590,2),(96,'oFTcHj9fLUYkg7Nmfymturd88P-k',NULL,'福特亚德',1,0,'','','','',1459989976,2),(97,'oFTcHj1bOHihlFHiL3agiwxUuT0Q',NULL,'原印',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6KJybeYefY5mRkyLnb4XKTicPZBPxibYBtRXbZ6DFK3ia1wF6S3dtM4jPNzAEf9PQ4LWxMWtx6icnm2Fnv0lkBzbzMj/0',1402973142,2),(98,'oFTcHj5Le8faw00G4P0Nyhj4oGN0',NULL,'泠泠',1,2,'','','中国','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGRq6CH21axPRWiaRVsSwVTFOomibCiciaZSJ6rV6KHlUOdvzugFKvsrKeeSE7h366jQC4wysSvI3IIJibXs30Tib5spOb6ABHAJ4uc/0',1459936129,2),(99,'oFTcHjz7fsizTTQMyfo3PlhW_9Xc',NULL,'dzy',1,1,'','','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchU6tykowQ6e0vnmtVpU4KadpuBnDib55snf0ZCUAAMNNmQCBgHeHXpkMVSwa4BVZugOCQ0hRTd8hY/0',1460117625,2),(100,'oFTcHj0Z4z1d7j3YZrvADhh6LFm0',NULL,'雷铭电商',1,1,'朝阳','北京','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5DLmPYdTmIfSRfDPcxjKbHulx4AG8ZLpr9YmAFJa0SgHvYcibfdukjrTViaVuYLKicLCx13foia44pyw/0',1459228575,2),(101,'oFTcHj1gNBcxv5CNpd5xCfVz036M',NULL,'琪琦',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7H2LD8THsWeSP7C3iaPsHb6mt3NKQKF88dPAx2LXsrSelibZSaDSFkasPDEXNPxMt6iaucB9kSg8J0WF/0',1372321223,2),(102,'oFTcHj3tMp9yaifE3D4Zz0_dYEck',NULL,'洪晓敏*^_^*',1,2,'凯恩斯','昆士兰','澳大利亚','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKdVc4uLKX3G1t4kCWQbGI3IGicmLf4vwHBqI8ULUfMkXV3hTp8ONTyVCIH2g1wImOsYPjY2UxNd2O/0',1428559675,2),(103,'oFTcHj-FFo9NlHk8qnUFJ4dZ_OTk',NULL,'YXH',1,1,'台州','浙江','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchfOzmciaYyn3I0fyxaTibaORfI5V8HumDnlyKHX6xAmQtXLjwWMLcPhlEwfn9fibSNqWzYYJEhfoJ1y/0',1459936879,2),(104,'oFTcHj1dQYvR-oc6T4xBPmTdsDf8',NULL,'草下的云',1,2,'安庆','安徽','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKVbyMIusync4DibVNmHOwo4jDSxtypce1G6sNjQxSFpIcreIOyia5bxkRbgI4Zibsh9URnA3EdickgEF/0',1452739228,2),(105,'oFTcHjxqM7QNpFO5M98vsPrCCnV8',NULL,'cheney',1,1,'','','北马里亚纳群岛','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchcH3vxnIokXJgzPLGTb0qSqfiaYtEpzNO7y93iadbMLLU46icDmXZXwXaKB0ibRzEnXxTx6iaBAia3F9LK/0',1460116396,2),(106,'oFTcHj-M69_r1JiYP5vtCj57FeeY',NULL,'(。・д・。)',1,2,'海口','海南','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom377KIYYExzE34zh5icVqIic02tMQBssJ0VPTE6ibEBWAW0Kiaf91QvNAxMq8ibhNw9C2GrfRPr9ebp8rGOq8LCyvbea/0',1459940566,2),(107,'oFTcHj6urT0p-vzW4FxLI_r6IEFM',NULL,'七月的天空',1,2,'苏州','江苏','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchcbEcfKfSW77rJHiarhibUatWtORka9I89iboob2BKg9VCF3Iz9xTXjCnRrANNTdbriaq1JZIYgeiaonn/0',1372321238,2),(108,'oFTcHj78v98_sAJRuIg3PRKHHuYs',NULL,'懒人思想',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/Q3auHgzwzM530hIvibnljt1WqEgFn3HvIUUwYXauxeEk0kKEToIia87hSYsNibF7UDR68hnOFmNDSJ9v7awfItBjeSfrGr6F3249sfQQwf7t9k/0',1372424821,2),(109,'oFTcHj1aG4AgacqYs1-vrl3af6v4',NULL,'一生懸命',1,1,'郑州','河南','中国','http://wx.qlogo.cn/mmopen/SYEMYpKSZHB4gAdpT9G7HyibOibuib5OeQNwZ63gLm4SnjPzQgnFDbUA84BlCaTICDtDZvpsXA1WDic0MYPjOicn9TzQjMiaMJVJ8c/0',1459929351,2),(110,'oFTcHj5tbqhtlJQ3aih1QZgeIFCo',NULL,'天涯',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/ajR8G6R65SKv5CbiaEKWq8Eu1O4kkFpRSMOE1OEW6CkHFu8GW4HfZ5tPcXQlXntIw6eURro0SgK9tAqGb2Kp1ry43laG3u7fR/0',1460121890,2),(111,'oFTcHjyt1R_qYUo7RwKASy1KzvtQ',NULL,'Y',1,2,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchR2JOnEllJwyiaiaJVvl5FyQ26eA3IrnLz2SptZvYVicD3kOPjhbjF9QQ8l1ibm1fPHXnwefhgwFdmhO/0',1399381238,2),(112,'oFTcHj9MQMZav0ZWo92_49_iVN1s',NULL,'不将就',1,1,'青岛','山东','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6LUNS8p4geNn6hoXDsnJLogZic1rIkCpA7SWZVZ0OuC2cdspfZnxlHbOEFVEMAg8u111YQaicmfKy1WO6aq5ibod1K/0',1459931107,2),(113,'oFTcHjxiTL1DY85_wuHWbvA3Z9zE',NULL,'婷婷@Vicky~~L',1,2,'','巴塞罗那','西班牙','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKqvEHWznma2LqbeLzYq3jBL5LTaWrujTGXJSnszTcnIL5832qyQQqZialGnsAvdB49IgfzqUAyY0hejzz4EZ99d33UeiasjTGy0/0',1459943377,2),(114,'oFTcHjwooyjbP2ZEcwwJCX48yaos',NULL,'程垚',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchbovTXpy8ITibicfY1iaicr4R7tPGYb07zxeibYia3dgbgviaJycBt00OCUapic2JDlhLyp0kdsksU0EOnTl/0',1447816761,2),(115,'oFTcHjwN_A9hLc4EuYlWPUbO5Wgw',NULL,'淳译·L',1,1,'','麦加','沙特阿拉伯','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKcN8grZt8JIY3bs3uNDhmVZvWf39bXg9XhdRhecrG8k2wJIjJ2vZVibm0joEfpRa1PyFWFpL41iaYE/0',1459933114,2),(116,'oFTcHjzXKRfN1fSC_JNKxxeWUa74',NULL,'Veaver 程恭囸',1,1,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OO9BP8VmKEchTlbveDJ1PM2kThqDjxf2Ull2uvuKSYK4Z4AoIZrf5cCiaLWbfM4ev4ibmM3kbCxI2d0VMv1NvXtIj/0',1400116883,2),(117,'oFTcHj-sb7d-omx3Oa6nki5UbctU',NULL,'朵朵',1,0,'','','','http://wx.qlogo.cn/mmopen/2ns9cM4KERz7BJQo1b4zdZbWx2hna3Hc0gbGbw8lxDzKryvTeAib3MKojZmVsX3j0btWK4D6HL4VPSwMRxdnteHTEmUoE0bGG/0',1399712984,2),(118,'oFTcHjyjqkT0jWzGxp4zY2TvMtic',NULL,'chonestly',1,1,'海口','海南','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKQxHsyHyicudKvEjUUY3K17H4tnXh23jVvzZQCB9YJbiaL2yhIKOqH4fkC4LuHp6Jk4u3C7sNwCIdK/0',1400037653,2),(119,'oFTcHj5SmxaJvk0U2m43WzScauho',NULL,'小小贝',1,2,'卢湾','上海','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKXSWQUiaS2G2oBChkcUpKVLibWiaeTia7us2iaOnzFFRBqw7zkImgfsATRauNibOHdoicM7l2Y97VK3Dwq6/0',1384527830,2),(120,'oFTcHj54VXkJhZvjquUIT2PoZ0Vo',NULL,'xiao艾',1,2,'苏州','江苏','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKehUVd4MrjqjYjFgiczp5GDq4GSWQLXtI2B4l81wgslxQWJOHNfuYjhhI9IibfZRVeaLAwHmLqUBmP/0',1426215048,2),(121,'oFTcHj0WdLKniIsxMNS3dz8A2uuk',NULL,'Fogway',1,1,'伊犁','新疆','中国','http://wx.qlogo.cn/mmopen/3YPpiaGsLom2BuzQRjbTDKSRrPrZaeLDEHU5uEBUMbJUMpicqibSSAyVZaUAZNBrKTE92uB0WdOrpuXxKW9aeYgHe4ibZr4ZAIuE/0',1459934008,2),(122,'oFTcHj2oTtsNHnGhMQjm4stN0jtw',NULL,'宋磊',1,1,'临沂','山东','中国','http://wx.qlogo.cn/mmopen/L7yyiaONt0OMV2KujgcK0o5cNYsJXDFx3DcVvtPreicEoG8tKSvt1AaupW8xJogXxfKlVhHpug3sZgERAldicwRhY50EZ0rUtMQ/0',1460117727,2),(123,'oFTcHj8OlyFxv2vpnVypYRl2t_Lk',NULL,'liu',1,0,'合肥','安徽','中国','http://wx.qlogo.cn/mmopen/SYeWkon6C6LU4xNCpxHJY2Kx4UmlQqpia5heL1Ef0icFpCeYw7gMUiauxK0a9AoMNYfxboOLTRKGa0kPpg8saB3P6JtwoAo7ia25/0',1400142509,2);
