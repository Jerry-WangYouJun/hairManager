/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hair

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-02 15:11:22
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '123', '1', '1', '1', '1', '2', '2', '1.00', '1.00', '2', '2', '1');
INSERT INTO `t_product` VALUES ('2', '123', 'Hair extensions', 'Hair extensions', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11111');
INSERT INTO `t_product` VALUES ('3', '31', 'Eyelashs', 'Eyelashs', '1', '1', '1', '1', '1.00', '1.00', '1', '1', '11');
INSERT INTO `t_product` VALUES ('4', '123', 'Hair extensions', 'Hair extensions', '1', '1', '', '123', '3.00', '2312.00', '31', '231', '123');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', '1', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('2', '11', '1111', '111', '2', '0', '111,', '111', '1111', '111');
INSERT INTO `t_user` VALUES ('5', '111', '111', '111', '2', '0', '', '', '', '');
INSERT INTO `t_user` VALUES ('6', '123', '11', '111', '2', '0', '', '', '', '');
