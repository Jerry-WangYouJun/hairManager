/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hair

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-08 17:27:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1', '1', '1', null);
INSERT INTO `t_cart` VALUES ('2', '1', '2', null);
INSERT INTO `t_cart` VALUES ('3', '1', '3', null);
INSERT INTO `t_cart` VALUES ('4', '1', '4', null);
INSERT INTO `t_cart` VALUES ('5', '1', '4', null);
INSERT INTO `t_cart` VALUES ('6', '1', '4', null);
INSERT INTO `t_cart` VALUES ('7', '1', '4', null);
INSERT INTO `t_cart` VALUES ('8', '1', null, null);

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
INSERT INTO `t_dictionary` VALUES ('3', 'dddd', '123', null, '123');
INSERT INTO `t_dictionary` VALUES ('4', 'Wigs', 'Wigs123', null, 'WigsWigs');
INSERT INTO `t_dictionary` VALUES ('5', 'Wigs', 'Wigs12333', null, 'WigsWigs');
INSERT INTO `t_dictionary` VALUES ('6', 'Hair extensions', 'Hair extensions', null, 'Hair extensions');
INSERT INTO `t_dictionary` VALUES ('7', 'Hair pieces', 'Hair pieces', null, 'Hair pieces');
INSERT INTO `t_dictionary` VALUES ('8', 'Eyelashs', 'Eyelashs', null, 'Eyelashs');

-- ----------------------------
-- Table structure for t_image
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipath` varchar(100) DEFAULT NULL COMMENT '路径',
  `iname` varchar(50) DEFAULT NULL COMMENT '名字',
  `type` int(11) DEFAULT NULL COMMENT '图片类型',
  `contect` varchar(100) DEFAULT NULL COMMENT '图片关联关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_image
-- ----------------------------
INSERT INTO `t_image` VALUES ('7', 'D:\\image', 'IMG_2754.JPG', '2', null);
INSERT INTO `t_image` VALUES ('14', 'D:\\image', 'java学习路线图.png', '2', 'HAIR EXTENSIONS');
INSERT INTO `t_image` VALUES ('17', 'D:\\image', 'java学习路线图.png', '3', '5');
INSERT INTO `t_image` VALUES ('18', 'D:\\image', '201801041020155_sql注入.jpg', '3', '6');
INSERT INTO `t_image` VALUES ('19', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801052128209_DSC00601.JPG', '3', '7');
INSERT INTO `t_image` VALUES ('20', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801052129002_DSC00601.JPG', '3', '7');
INSERT INTO `t_image` VALUES ('21', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339170_DSC00606.JPG', '3', '4');
INSERT INTO `t_image` VALUES ('22', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339897_DSC00600.JPG', '3', '4');
INSERT INTO `t_image` VALUES ('23', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339926_DSC00600.JPG', '3', '4');
INSERT INTO `t_image` VALUES ('24', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071351884_DSC00598.JPG', '1', null);
INSERT INTO `t_image` VALUES ('25', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502769_DSC00604.JPG', '3', '4');
INSERT INTO `t_image` VALUES ('26', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502798_DSC00601.JPG', '3', '4');
INSERT INTO `t_image` VALUES ('27', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502819_DSC00598.JPG', '3', '4');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_us` varchar(3000) DEFAULT NULL,
  `wholesale` varchar(3000) DEFAULT NULL,
  `order` varchar(3000) DEFAULT NULL,
  `acceptable` varchar(3000) DEFAULT NULL,
  `shipping` varchar(3000) DEFAULT NULL,
  `contact` varchar(3000) DEFAULT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `bank_address` varchar(300) DEFAULT NULL,
  `beneficiary_name` varchar(100) DEFAULT NULL,
  `beneficiary_no` varchar(30) DEFAULT NULL,
  `beneficiary_address` varchar(200) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `whole_address` varchar(200) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesaler? Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesalerÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesalerÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesalerÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesalerÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', 'Welcome to join the supply chain of Dream lace wig Group! \r\n\r\nIf you are looking into becoming a wholesalerÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. \r\n\r\nWe supply our hair products at true wholesale costs and sell our product as represented\r\n\r\nWe offer timely shipments that you can rely on\r\n\r\nWe keep the largest amount of stock lace wigs and weft hair in China for immediate shipping. \r\n\r\nAll our sales representative have more than 5 years working experiences on hair line and are very professional to answer your questions and give constructive advices.\r\n\r\nSimply send email to sales@dreamlacewig.com with your inquiry. A company representative will contact you by email or phone within 24 hours.', '1', '1', '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contect` int(11) NOT NULL COMMENT '用户主键',
  `name` varchar(50) DEFAULT NULL COMMENT '留言/回复人 姓名',
  `msg` varchar(500) DEFAULT NULL COMMENT '内容',
  `status` varchar(2) DEFAULT NULL COMMENT '状态  已读1、未读0',
  `time` varchar(20) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msg
-- ----------------------------
INSERT INTO `t_msg` VALUES ('1', '1', 'admin', 'aaaaa', '1', '1989-02-01');
INSERT INTO `t_msg` VALUES ('2', '1', 'admin', '123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('3', '1', 'admin', '123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('4', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('5', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('6', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('7', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('8', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('9', '1', 'admin', '123123', null, '2018-01-05 14:25');
INSERT INTO `t_msg` VALUES ('10', '2', 'admin', '', null, '2018-01-05 14:26');
INSERT INTO `t_msg` VALUES ('11', '1', 'admin', '123', null, '2018-01-05 15:11');
INSERT INTO `t_msg` VALUES ('12', '1', 'admin', '111', null, '2018-01-05 15:12');
INSERT INTO `t_msg` VALUES ('13', '2', 'admin', '123', null, '2018-01-05 15:20');
INSERT INTO `t_msg` VALUES ('14', '2', 'admin', '123', null, '2018-01-05 15:21');
INSERT INTO `t_msg` VALUES ('15', '2', 'admin', '123', null, '2018-01-05 15:21');
INSERT INTO `t_msg` VALUES ('16', '2', 'admin', '123', null, '2018-01-05 15:25');
INSERT INTO `t_msg` VALUES ('17', '2', 'admin', '123', null, '2018-01-05 15:25');
INSERT INTO `t_msg` VALUES ('18', '2', 'admin', '123', null, '2018-01-05 15:25');
INSERT INTO `t_msg` VALUES ('19', '2', 'admin', '', null, '2018-01-05 15:28');
INSERT INTO `t_msg` VALUES ('20', '2', 'admin', '', null, '2018-01-05 15:28');
INSERT INTO `t_msg` VALUES ('21', '2', 'admin', '123123', null, '2018-01-05 15:28');
INSERT INTO `t_msg` VALUES ('22', '1', 'admin', '11111', null, '2018-01-05 15:28');
INSERT INTO `t_msg` VALUES ('23', '2', 'admin', '1111', null, '2018-01-05 15:45');
INSERT INTO `t_msg` VALUES ('24', '1', 'admin', '123', null, '2018-01-05 15:47');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `subType` varchar(50) DEFAULT NULL,
  `hairType` varchar(50) DEFAULT NULL,
  `permed` varchar(10) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `texture` varchar(50) DEFAULT NULL,
  `unit` double(10,2) DEFAULT NULL,
  `items` double(10,2) DEFAULT NULL,
  `hairLen` double(10,0) DEFAULT NULL,
  `hairColor` varchar(15) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `hotsale` varchar(5) DEFAULT NULL COMMENT '是否热卖产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '123', '1', '1', '1', '1', '2', '2', '1.00', '1.00', '2', '2', '1', null);
INSERT INTO `t_product` VALUES ('2', '123', 'Hair extensions', 'Hair extensions', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11111', null);
INSERT INTO `t_product` VALUES ('3', '31', 'Eyelashs', 'Eyelashs', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11', null);
INSERT INTO `t_product` VALUES ('4', '123', 'Hair extensions', 'Hair extensions', '1', '1', '11111', '123', '3.00', '2312.00', '31', '231,231,231,231', '123', '1');
INSERT INTO `t_product` VALUES ('5', 'aaaaaa', 'Hair extensions', 'Hair extensions', '123', '1', '123', '123', '123.00', '12.00', '123', '23', '', '1');
INSERT INTO `t_product` VALUES ('6', '1111', 'Hair pieces', 'Hair pieces', '11', '1', '23', '123', '123.00', '123.00', '123', '123', '', null);
INSERT INTO `t_product` VALUES ('7', '111111111', 'Hair extensions', 'Hair extensions', '1111', '2', '1', '1', '1.00', '1.00', '1', '1,1', '1', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `roleid` int(10) NOT NULL COMMENT '1:二期管理员  2:二期代理商  3:三期管理员  4:三期代理商 ',
  `sex` varchar(1) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', '1', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('2', '11', '1111', '111', '2', '0', '111,', '111', '1111', '111');
INSERT INTO `t_user` VALUES ('5', '111', '111', '111', '2', '0', '', '', '', '');
INSERT INTO `t_user` VALUES ('6', '123', '11', '111', '2', '0', '', '', '', '');
INSERT INTO `t_user` VALUES ('9', '111', '123', '111', '2', '0', '123', null, '123', '123');
INSERT INTO `t_user` VALUES ('10', 'a', '啊啊啊', '1', '2', '0', '11', null, '11', '11');
INSERT INTO `t_user` VALUES ('20', '', '1', '1', '2', '0', '1', '', '', '');
INSERT INTO `t_user` VALUES ('19', '1', '123', '1admin', '2', '0', '', '', '', '');
