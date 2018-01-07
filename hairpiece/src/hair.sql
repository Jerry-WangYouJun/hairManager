/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : hair

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 01/07/2018 22:25:25 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_cart`
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
--  Records of `t_cart`
-- ----------------------------
BEGIN;
INSERT INTO `t_cart` VALUES ('1', '1', '1', null), ('2', '1', '2', null), ('3', '1', '3', null), ('4', '1', '4', null), ('5', '1', '4', null), ('6', '1', '4', null), ('7', '1', '4', null), ('8', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_dictionary`
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
--  Records of `t_dictionary`
-- ----------------------------
BEGIN;
INSERT INTO `t_dictionary` VALUES ('3', 'dddd', '123', null, '123'), ('4', 'Wigs', 'Wigs123', null, 'WigsWigs'), ('5', 'Wigs', 'Wigs12333', null, 'WigsWigs'), ('6', 'Hair extensions', 'Hair extensions', null, 'Hair extensions'), ('7', 'Hair pieces', 'Hair pieces', null, 'Hair pieces'), ('8', 'Eyelashs', 'Eyelashs', null, 'Eyelashs');
COMMIT;

-- ----------------------------
--  Table structure for `t_image`
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
--  Records of `t_image`
-- ----------------------------
BEGIN;
INSERT INTO `t_image` VALUES ('7', 'D:\\image', 'IMG_2754.JPG', '2', null), ('14', 'D:\\image', 'java学习路线图.png', '2', 'HAIR EXTENSIONS'), ('17', 'D:\\image', 'java学习路线图.png', '3', '5'), ('18', 'D:\\image', '201801041020155_sql注入.jpg', '3', '6'), ('19', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801052128209_DSC00601.JPG', '3', '7'), ('20', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801052129002_DSC00601.JPG', '3', '7'), ('21', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339170_DSC00606.JPG', '3', '4'), ('22', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339897_DSC00600.JPG', '3', '4'), ('23', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071339926_DSC00600.JPG', '3', '4'), ('24', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071351884_DSC00598.JPG', '1', null), ('25', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502769_DSC00604.JPG', '3', '4'), ('26', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502798_DSC00601.JPG', '3', '4'), ('27', '/Users/wangyoujun/Desktop/smd/WebContent/image', '201801071502819_DSC00598.JPG', '3', '4');
COMMIT;

-- ----------------------------
--  Table structure for `t_msg`
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
--  Records of `t_msg`
-- ----------------------------
BEGIN;
INSERT INTO `t_msg` VALUES ('1', '1', 'admin', 'aaaaa', '1', '1989-02-01'), ('2', '1', 'admin', '123', null, '2018-01-05 14:25'), ('3', '1', 'admin', '123', null, '2018-01-05 14:25'), ('4', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('5', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('6', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('7', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('8', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('9', '1', 'admin', '123123', null, '2018-01-05 14:25'), ('10', '2', 'admin', '', null, '2018-01-05 14:26'), ('11', '1', 'admin', '123', null, '2018-01-05 15:11'), ('12', '1', 'admin', '111', null, '2018-01-05 15:12'), ('13', '2', 'admin', '123', null, '2018-01-05 15:20'), ('14', '2', 'admin', '123', null, '2018-01-05 15:21'), ('15', '2', 'admin', '123', null, '2018-01-05 15:21'), ('16', '2', 'admin', '123', null, '2018-01-05 15:25'), ('17', '2', 'admin', '123', null, '2018-01-05 15:25'), ('18', '2', 'admin', '123', null, '2018-01-05 15:25'), ('19', '2', 'admin', '', null, '2018-01-05 15:28'), ('20', '2', 'admin', '', null, '2018-01-05 15:28'), ('21', '2', 'admin', '123123', null, '2018-01-05 15:28'), ('22', '1', 'admin', '11111', null, '2018-01-05 15:28'), ('23', '2', 'admin', '1111', null, '2018-01-05 15:45'), ('24', '1', 'admin', '123', null, '2018-01-05 15:47');
COMMIT;

-- ----------------------------
--  Table structure for `t_product`
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
--  Records of `t_product`
-- ----------------------------
BEGIN;
INSERT INTO `t_product` VALUES ('1', '123', '1', '1', '1', '1', '2', '2', '1.00', '1.00', '2', '2', '1', null), ('2', '123', 'Hair extensions', 'Hair extensions', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11111', null), ('3', '31', 'Eyelashs', 'Eyelashs', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11', null), ('4', '123', 'Hair extensions', 'Hair extensions', '1', '1', '11111', '123', '3.00', '2312.00', '31', '231,231,231,231', '123', '1'), ('5', 'aaaaaa', 'Hair extensions', 'Hair extensions', '123', '1', '123', '123', '123.00', '12.00', '123', '23', '', '1'), ('6', '1111', 'Hair pieces', 'Hair pieces', '11', '1', '23', '123', '123.00', '123.00', '123', '123', '', null), ('7', '111111111', 'Hair extensions', 'Hair extensions', '1111', '2', '1', '1', '1.00', '1.00', '1', '1,1', '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
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
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', '1', null, null, null, null, null), ('2', '11', '1111', '111', '2', '0', '111,', '111', '1111', '111'), ('5', '111', '111', '111', '2', '0', '', '', '', ''), ('6', '123', '11', '111', '2', '0', '', '', '', ''), ('9', '111', '123', '111', '2', '0', '123', null, '123', '123'), ('10', 'a', '啊啊啊', '1', '2', '0', '11', null, '11', '11'), ('20', '', '1', '1', '2', '0', '1', '', '', ''), ('19', '1', '123', '1admin', '2', '0', '', '', '', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
