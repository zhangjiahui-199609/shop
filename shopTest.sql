-- MySQL dump 10.13  Distrib 5.7.29, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'满1000减20','满1000-20',80,1000,20,1000,20),(8,'无优惠','0',1,0,0,0,0);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (11,11,'北京市','北京市市辖区','东城区','订单','顶顶顶顶顶','23342334'),(13,11,'河北省','石家庄市','桥西区','河北外国语学院','张嘉辉','18633717931');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `moduleId` int(10) NOT NULL,
  `dgreeName` varchar(255) DEFAULT NULL COMMENT '0：普通用户 1：管理员',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'627837879@qq.com','66832876900b13e4d39d20514eb3552a',1,'管理员'),(2,'laowang@shop.com','04e10bd7e5a3e20c507a141d8f6ca074',2,'普通职员'),(3,'xiaoli@shop.com','111111',1,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'数码'),(2,'服饰'),(3,'家电'),(4,'书籍');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `chatId` int(20) NOT NULL AUTO_INCREMENT,
  `sendUser` int(12) NOT NULL,
  `receiveUser` int(12) NOT NULL,
  `MsgContent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MsgTime` datetime NOT NULL,
  PRIMARY KEY (`chatId`),
  KEY `sendUser` (`sendUser`),
  KEY `receiveUser` (`receiveUser`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`sendUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`receiveUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (35,11,12,'你好，我说张三正在和张三2020进行对话','2020-04-08 12:43:47'),(36,11,12,'55','2020-04-08 13:45:33'),(41,5,11,'asd','2020-04-08 14:08:07'),(42,11,5,'nihao','2020-04-08 14:08:46'),(43,11,5,'今天天气不错','2020-04-08 14:11:01');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (11,100,'2020-03-26 23:48:41');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,11,108,5,'好好好，用三天就坏了！！！！！','2020-04-01 19:48:30');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver`
--

DROP TABLE IF EXISTS `deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver`
--

LOCK TABLES `deliver` WRITE;
/*!40000 ALTER TABLE `deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  `desImgPath` varchar(255) NOT NULL,
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (100,'锤子手机',2699,200,'2020-03-25 11:28:46',1,'手机','品牌： 锤子（smartisan）\r\n商品名称：锤子（smartisan）坚果Pro3商品编号：60637688928商品毛重：300.00gCPU型号：其他运行内存：8GB机身存储：其它存储存储卡：其它存储卡摄像头数量：其他后摄主摄像素：其他前摄主摄像素：其他主屏幕尺寸（英寸）：其他英寸分辨率：其它分辨率屏幕比例：其它屏幕比例屏幕前摄组合：其他电池容量（mAh）：4000充电器：5V/3A；9V/2A；其他机身颜色：绿色操作系统：Android(安卓)',1,'4b1a3673f8524b22a58d20da299cf130080817d2958bc0e7.jpg'),(101,'Apple iPhone XS Max (A2104) 256GB',7299,100,'2020-04-01 10:37:00',1,'手机','品牌： Apple\r\n商品名称：AppleiPhone XS Max商品编号：100000287117商品毛重：490.00g商品产地：中国CPU型号：其他运行内存：其它内存机身存储：256GB存储卡：不支持存储卡摄像头数量：后置双摄后摄主摄像素：1200万像素前摄主摄像素：700万像素主屏幕尺寸（英寸）：6.5英寸分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：刘海屏充电器：其他热点：人脸识别特殊功能：语音命令操作系统：iOS(Apple)\r\n更多参数>>\r\n\r\n\r\n\r\n\r\n \r\n\r\n\r\n\r\n   \r\n\r\n\r\n售后保障\r\n 厂家服务\r\n本产品全国联保，享受三包服务，质保期为：一年质保\r\n如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！\r\n(注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。)\r\n 京东承诺\r\n京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！\r\n注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！\r\n正品行货\r\n京东商城向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。\r\n全国联保\r\n凭质保证书及京东商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。京东商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！\r\n\r\n注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！\r\n无忧退货\r\n客户购买京东自营商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下，可无理由退货。（部分商品除外，详情请见各商品细则）\r\n权利声明：\r\n京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n注：本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。',1,'43735fdac08d3917.jpg'),(102,'Apple iPad Pro 11英寸平板电脑 2020年新款',7029,100,'2020-04-01 10:38:39',1,'手机','品牌： Apple\r\n商品名称：AppleiPad商品编号：100011977044商品毛重：0.855kg商品产地：中国大陆系统：ios系统存储容量：256GB厚度：7.0mm以下屏幕尺寸：11英寸分类：娱乐平板颜色：灰色',1,'c800136d346d853e.jpg'),(103,'Apple Watch Series 5智能手表',3299,100,'2020-04-01 10:47:35',1,'手机','商品名称：AppleApple Watch商品编号：100008341010商品毛重：0.51kg商品产地：中国大陆机身厚度：10-12mm屏幕大小：40mm以上运动模式识别：10-15种屏幕显示：彩色触屏防水等级：50米防水续航时间：3天以下通话功能：蓝牙通话优选服务：一年质保功能：GPS定位，NFC支付，久坐提醒，气压高度测量，消息提醒，心率监测，自定义表盘，3G通话/4G通话，短信收发，来电提醒，邮件提示，音乐播放适用人群：男士，女士，老人，儿童，通用腕带材质：硅胶',1,'ea14707b74a43a7b.jpg'),(104,'Apple 2020新款 MacBook Air 13.3',7999,100,'2020-04-01 10:56:21',1,'手机','品牌： Apple\r\n商品名称：AppleMacBook Air商品编号：100011979232商品毛重：2.36kg商品产地：中国大陆系统：MAC特性：背光键盘，指纹识别，机身厚度小于20mm系列：其他处理器：Intel i3分类：轻薄本，常规笔记本屏幕尺寸：13.3英寸色域：其他',1,'9fefe611d473d671.jpg'),(105,'三星 Galaxy Fold(SM-F9000)折叠屏双屏手机',15998,100,'2020-04-01 11:02:09',1,'手机','品牌： 三星（SAMSUNG）\r\n商品名称：三星Fold商品编号：100005427837商品毛重：0.751kg商品产地：越南CPU型号：骁龙855运行内存：12GB机身存储：512GB存储卡：不支持存储卡摄像头数量：后置三摄后摄主摄像素：1200万像素前摄主摄像素：1000万像素主屏幕尺寸（英寸）：7.2英寸分辨率：QHD+及以上屏幕比例：20.6~21:9屏幕前摄组合：其他充电器：9V/1.67A操作系统：Android(安卓)',1,'O1CN01VMWJuo22C3ueYthPh_!!370627083.jpg'),(106,'三星 Galaxy S20 5G (SM-G9810)双模5G',6999,100,'2020-04-01 11:07:53',1,'手机','品牌： 三星（SAMSUNG）\r\n商品名称：三星Galaxy S20 5G商品编号：100006349795商品毛重：450.00g商品产地：越南CPU型号：骁龙865运行内存：12GB机身存储：128GB存储卡：支持MicroSD(TF)摄像头数量：后置三摄后摄主摄像素：1200万像素前摄主摄像素：1000万像素主屏幕尺寸（英寸）：6.2英寸分辨率：QHD+及以上屏幕比例：19.6~20:9屏幕前摄组合：极点屏充电器：其他操作系统：Android(安卓)游戏性能：发烧级',1,'84ed-ireifzf8938880.jpg'),(107,'尼康（Nikon）D7500 单反相机 数码相机',6499,100,'2020-04-01 11:15:48',1,'相机','品牌： 尼康（Nikon）\r\n商品名称：尼康D7500商品编号：4247631商品毛重：2.16kg商品产地：泰国（批次不同，产地不同）滤镜直径：67mm用途：人物摄影，风光摄影，运动摄影，静物摄影画幅：APS-C画幅分类：中端套头：单镜头套机像素：2000-2999万',1,'TB26i.Axm0mpuFjSZPiXXbssVXa_!!2787064574.jpg'),(108,'索尼（SONY）KD-77A9G 77英寸 4K超高清',49999,100,'2020-04-01 11:36:11',1,'手机','功耗参数\r\n电源功率（w）\r\n653W\r\n待机功率（w）\r\n0.5\r\n工作电压（v）\r\n220v\r\n外观设计\r\n机身厚薄\r\n最薄处约6.9mm\r\n底座配置\r\n外置底座\r\n安装孔距\r\n300*300\r\n边框材质\r\n金属\r\n边框宽窄\r\n窄\r\n核心参数\r\nCPU核数\r\n四核心\r\n运行内存\r\n3GB\r\nCPU\r\n4核\r\n存储内存\r\n16GB\r\n主体参数\r\n上市时间\r\n2019-05\r\n产品颜色\r\n黑色\r\n产品类型\r\nOLED电视\r\n能效等级\r\n无能效等级\r\n认证型号\r\nKD-77A9G\r\n产品品牌\r\n索尼（SONY）\r\n推荐观看距离(米)\r\n3.5m以上（70英寸以上）\r\n产品型号\r\nKD-77A9G\r\n端口参数\r\nUSB2.0接口\r\n2\r\n光纤音频输出\r\n支持\r\nUSB3.0接口\r\n1\r\nHDMI1.4接口\r\n无\r\nHDMI2.0接口\r\n4\r\nHDMI1.3接口\r\n无\r\n显示参数\r\nHDR显示\r\n支持\r\n支持格式（高清）\r\n2160p\r\n屏幕尺寸\r\n77英寸\r\n背光方式\r\n其他\r\n屏幕分辨率\r\n超高清4K\r\n背光源\r\nOLED\r\n规格参数\r\n单屏重量（kg）\r\n约35.3\r\n外包装尺寸（宽*高*厚）mm\r\n约1851 x 1126 x 207\r\n单屏尺寸（宽*高*厚）mm\r\n约1721x996x49(6.9)\r\n含底座重量（kg）\r\n约39.7\r\n含外包装重量（kg）\r\n约53\r\n含底座尺寸（宽*高*厚）mm\r\n约1721x1001x302\r\n包装清单\r\n电视 （1） 遥控器 （1） 产品说明书 （1） 保修卡 （1） 外包装 （1）',8,'O1CN01m2lD3Q1Klvmjtf9sn_!!782731205.jpg'),(109,'Java EE互联网轻量级框架整合开发',94,100,'2020-04-01 11:45:35',4,'计算机','随着移动互联网的兴起，以Java技术为后台的互联网技术占据了市场的主导地位，而在Java互联网后台开发中，SSM框架（Spring Spring MVC MyBatis）成为了主要架构，本书以此为焦点从入门到实际工作要求讲述了SSM框架的技术应用；与此同时，为了提高系统性能，NoSQL（尤其是Redis）在互联网系统中已经广泛使用，为了适应这个变化，本书通过Spring讲解了有关Redis的技术应用，这样更加贴近实际学习和工作的需要。本书主要分为6个部分，第1部分对Java互联网的框架和主要涉及的模式做初步简介；第2部分讲述MyBatis技术；第3部分讲述Spring基础（包括IoC、AOP和数据库应用），重点讲解Spring数据库事务应用，以满足互联网企业的应用要求；第4部分，讲述Spring MVC框架；第5部分，通过Spring技术的应用，讲解Redis技术；第6部分，讲解SSM Redis实践应用，通过互联网高并发如抢票、抢红包等场景，使用全注解的方式讲解SSM框架的整合，以及高并发与锁的应用和系统性能优化。本书结合企业的实际需求，从原理到实践全面讲解SSM Redis技术应用，无论你是Java程序员、SSM应用和研究人员，还是Redis应用人员、互联网开发人员，都可以从本书中收获知识。',1,'99999990003416383.jpg'),(110,'深入浅出Spring Boot 2.x',78,100,'2020-04-01 11:50:16',4,'计算机','spring boot 2实战精髓 企业级应用开发实战 微服务实战指南 结合主流持久层框架MyBatis 讲述企业级Spring Boot开发要点 赠送作者讲解的部分配套视频课程',1,'99999990026885306.jpg'),(111,'高性能MySQL',85,100,'2020-04-01 11:54:37',4,'计算机','　《高性能MySQL（第3版）》是MySQL 领域的极佳之作，拥有广泛的影响力。第3 版更新了大量的内容，不但涵盖了新的MySQL5.5版本的新特性，也讲述了关于固态盘、高可扩展性设计和云计算环境下的数据库相关的新内容，原有的基准测试和性能优化部分也做了大量的扩展和补充。全书共分为16章和6 个附录，内容涵盖MySQL架构和历史，基准测试和性能剖析，数据库软硬件性能优化，复制、备份和恢复，高可用与高可扩展性，以及云端的MySQL和MySQL相关工具等方面的内容。每一章都是相对独立的主题，读者可以有选择性地单独阅读。\r\n　　《高性能MySQL（第3版）》不但适合数据库管理员（DBA）阅读，也适合开发人员参考学习。不管是数据库新手还是专家，相信都能从本书有所收获。',1,'99999990003241980.jpg'),(112,'深入理解Spring Cloud与微服务构建',79,100,'2020-04-01 11:56:18',4,'计算机','《深入理解Spring Cloud与微服务构建 第2版》共分为18章，全面涵盖了通过Spring Cloud构建微服务的相关知识点。第1、2章详细介绍了微服务架构和Spring Cloud。第3、4章讲解了通过Spring Cloud构建微服务的准备工作。第5～14章以案例为切入点，讲解了通过Spring Cloud构建微服务的基础组件，包括Eureka、Ribbon、Feign、Hystrix、Zuul、Gateway、Consul、Config、Sleuth、Admint等组件。第15～17章讲述了使用Spring Cloud OAuth2来保护微服务系统的相关知识。第18章用一个综合案例全面讲解了如何使用Spring Cloud构建微服务，可用于实际开发中。',1,'99999990064285986.jpg'),(113,'Redis实战',56,100,'2020-04-01 11:59:42',4,'计算机','当你需要以接近实时的速度访问快速变动的数据流时，Redis这样的键值数据库就是你的极好选择。通过接纳散列、字符串、列表等多种数据类型，Redis对键值对模式进行了扩展，它既提供了极其快速的内存数据集操作，又可以在运行时轻松地将这些数据持久化到磁盘上面。除此之外，Redis还是免费的、开源的。\r\n　　本书对Redis本身以及它的键值对模型进行了介绍，读者将接触到包括缓存、分布式广告定向等实际使用案例，学到如何从小型的作业任务开始，扩展Redis以适应大规模的数据集，以及如何与其他传统的关系数据库或是其他NoSQL存储系统进行集成。有经验的开发者应该会对集群和服务器脚本编程等较为深入的内容感兴趣。\r\n　　本书主要内容\r\n　　全面介绍Redis\r\n　　预处理实时数据\r\n　　管理内存数据集\r\n　　发布/订阅及配置\r\n　　持久化到磁盘\r\n　　本书面向熟悉数据库概念的开发者。阅读本书既不要求读者预先了解NoSQL数据库概念，也不要求读者有任何Redis使用经验。本书也适合具备编程能力的系统管理员阅读。\r\n　　要下载本书代码可以访问manning.com/RedisinAction。',1,'99999990001181879.jpg'),(114,'RabbitMQ实战',60,100,'2020-04-01 12:02:34',4,'计算机','息队列服务器，它可以轻而易举地处理各种情形下的消息通信，不论是网络初创公司还是大型企业系统。\r\n本书能够教会你如何使用RabbitMQ消息通信服务器，构建和管理用不同语言编写的可伸缩应用。这很容易上手。你将学习消息队列的工作原理以及RabbitMQ是如何适用的。然后，你将通过许多案例来探索实践当中的可扩展性和互操作性问题。*后，你将学习如何将Rabbit打造成一部运作良好的机器，以应对24×7×365的无间断工作环境。\r\n\r\n本书包以下内容\r\n□ 学习基本消息通信设计模式\r\n□ 使用模式来满足按需扩展\r\n□ 整合PHP编写的前端和用任何语言编写的后端\r\n□ 在30分钟内实现发布/订阅的告警服务\r\n□ 配置RabbitMQ内建集群\r\n□ 监控、管理、扩展并调试RabbitMQ\r\n\r\n本书是为那些熟悉Python、PHP、Java、.NET或者任何其他现代编程语言的开发者编写的。无须任何RabbitMQ经验。',1,'99999990000575272.png'),(115,'深入理解Apache Dubbo与实战',40,100,'2020-04-01 12:05:10',4,'计算机','本书首先介绍Dubbo的简史、后续的规划和整体架构大图；接着介绍Dubbo环境配置，并基于Dubbo开发*款应用程序；然后介绍Dubbo内置的常用注册中心的实现原理，Dubbo扩展点加载的原理和实现，Dubbo的启动、服务暴露、服务消费和优雅停机的机制，Dubbo中RPC协议细节、编解码和服务调用实现原理，Dubbo集群容错、路由和负载均衡机制，Dubbo的扩展点相关知识，Dubbo高级特性的实现和原理，Dubbo常用的Filter的实现原理，Dubbo中新增etcd3注册中心的实战内容和Dubbo服务治理平台的相关知识；*后介绍Dubbo未来生态和Dubbo Mesh的相关知识。',1,'99999990048141325.jpg'),(116,'深入理解Java虚拟机：JVM高级特性与最佳实践',110,100,'2020-04-01 12:08:07',4,'计算机','这是一部从工作原理和工程实践两个维度深入剖析JVM的著作，是计算机领域公认的经典，繁体版在台湾也颇受欢迎。\r\n自2011年上市以来，前两个版本累计印刷36次，销量超过30万册，两家主要网络书店的评论近90000条，内容上近乎零差评，是原创计算机图书领域不可逾越的丰碑。\r\n第3版在第2版的基础上做了重大修订，内容更丰富、实战性更强：根据新版JDK对内容进行了全方位的修订和升级，围绕新技术和生产实践新增逾10万字，包含近50%的全新内容，并对第2版中含糊、瑕疵和错误内容进行了修正。\r\n全书一共13章，分为五大部分：\r\n*部分（第1章）走近Java\r\n系统介绍了Java的技术体系、发展历程、虚拟机家族，以及动手编译JDK，了解这部分内容能对学习JVM提供良好的指引。\r\n第二部分（第2~5章）自动内存管理\r\n详细讲解了Java的内存区域与内存溢出、垃圾收集器与内存分配策略、虚拟机性能监控与故障排除等与自动内存管理相关的内容，以及10余个经典的性能优化案例和优化方法；',1,'99999990092424373.jpg');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagepath`
--

DROP TABLE IF EXISTS `imagepath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagepath`
--

LOCK TABLES `imagepath` WRITE;
/*!40000 ALTER TABLE `imagepath` DISABLE KEYS */;
INSERT INTO `imagepath` VALUES (16,100,'377358caed3049588a0c849fd1930d253dacff81f715a78d.jpg'),(17,100,'32c753625398462280adee5aaf3c0d3893dbe26ce15b5651.jpg'),(18,100,'940112530d194b3babe1b58ed7812f64117256151278c3ba.jpg'),(19,100,'4a60194184fb4800b1d57bcc0a71fe46a0a0351a21a4243b.jpg'),(20,101,'3f3e4aa3c7515658.jpg'),(21,101,'45ab3dd6c35d981b.jpg'),(22,101,'daa0e12cb13e95bf.jpg'),(23,102,'a0098dc1ebd37168.jpg'),(24,102,'b1e0a0b976b3479f.jpg'),(25,102,'b92dbe889565383b.jpg'),(26,102,'b4359bbe043557e7.jpg'),(27,102,'daf56cf32b02298b.jpg'),(28,103,'004e5206990e7baa.jpg'),(29,103,'0288f4cf3016e061.jpg'),(30,103,'ffeb25dc1f713d56.jpg'),(31,104,'904f48b263669780.jpg'),(32,104,'524855.jpg'),(33,105,'5521eaef9881d48d.jpg'),(34,105,'6260dc42c404370d.jpg'),(35,105,'cf7dbf09ee8af0a7.jpg'),(36,105,'f2585a52668e1826.jpg'),(37,106,'1a9d17f64e96e022.jpg'),(38,106,'8d64aa75c2bd3f97.jpg'),(39,106,'e3830ea05bccd9b9.jpg'),(40,107,'5926960cN00904afa.jpg'),(41,107,'59269641N3c72e367.jpg'),(42,107,'b235a1df7e81150c.jpg'),(43,108,'cd266c07c05e0658.jpg'),(44,109,'25111311-1_w_2.jpg'),(45,109,'25111311-2_u_4.jpg'),(46,109,'25111311-3_u_2.jpg'),(47,110,'Snipaste_2020-04-01_11-49-43.jpg'),(48,111,'23214590-2_u_9.jpg'),(49,111,'23214590-5_u_3.jpg'),(50,112,'27927033-1_u_6.jpg'),(51,113,'23800641-1_u_2.jpg'),(52,113,'23800641-2_u_2.jpg'),(53,113,'23800641-3_u_2.jpg'),(54,113,'23800641-4_u_2.jpg'),(55,114,'23799313-1_u_1.jpg'),(56,115,'27896166-1_u_4.jpg'),(57,115,'27896166-2_u_3.jpg'),(58,116,'28495225-2_u_6.jpg'),(59,116,'28495225-3_u_3.jpg'),(60,116,'28495225-4_u_3.jpg');
/*!40000 ALTER TABLE `imagepath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indent`
--

DROP TABLE IF EXISTS `indent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indent`
--

LOCK TABLES `indent` WRITE;
/*!40000 ALTER TABLE `indent` DISABLE KEYS */;
INSERT INTO `indent` VALUES (1,11,'2020-02-24 13:47:32',10,10,1,1,1,1,11),(3,11,'2020-02-24 16:18:55',10,10,1,1,0,0,11),(4,11,'2020-02-24 16:20:26',10,10,1,1,0,0,11),(5,11,'2020-02-24 16:23:19',10,10,0,1,0,0,11),(6,11,'2020-02-24 16:40:35',10,10,1,1,0,0,11),(7,11,'2020-02-24 16:44:24',10,10,1,1,0,0,11),(8,11,'2020-02-24 16:51:23',10,10,0,1,0,0,11),(9,11,'2020-02-24 17:00:05',10,10,0,1,0,0,11),(10,11,'2020-02-24 17:02:51',10,10,0,1,0,0,11),(11,11,'2020-02-24 17:12:09',10,10,1,1,0,0,11),(12,11,'2020-02-24 17:29:33',11,11,1,1,0,0,11),(13,11,'2020-02-24 18:23:11',329,329,1,1,0,0,11),(14,11,'2020-02-28 11:36:22',329,329,1,1,1,1,11),(15,11,'2020-03-26 23:42:52',2699,215920,0,1,0,0,13),(16,11,'2020-04-01 19:45:36',49999,49999,1,1,1,1,13),(17,11,'2020-04-04 12:06:07',15998,1279840,1,1,0,0,13);
/*!40000 ALTER TABLE `indent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'管理员'),(2,'普通员工'),(3,'临时工');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (11,15,100,1),(12,16,108,1),(13,17,105,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'kefu','12345678','2020-04-08 14:02:46','kefu@qq.com','18656787931'),(11,'zhangsan','12345678','2020-02-22 22:51:27','627837879@qq.com','18633717931'),(12,'zhangsan2020','12345678','2020-02-28 10:40:27','zeroii8586@gmail.com','18633717931');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-09 17:15:04
