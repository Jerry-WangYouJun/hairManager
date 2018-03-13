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

 Date: 03/13/2018 22:10:24 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_info`
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
--  Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `dic_id` int(11) NOT NULL COMMENT '字典类型ID',
  `subType` varchar(150) DEFAULT NULL,
  `hairType` varchar(50) DEFAULT NULL,
  `permed` varchar(10) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `texture` varchar(50) DEFAULT NULL,
  `unit` double(10,2) DEFAULT NULL,
  `items` varchar(150) DEFAULT NULL,
  `hairLen` varchar(150) DEFAULT NULL,
  `hairColor` varchar(150) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `hotsale` varchar(5) DEFAULT NULL COMMENT '是否热卖产品',
  `column1` varchar(100) DEFAULT NULL,
  `column2` varchar(100) DEFAULT NULL,
  `column3` varchar(100) DEFAULT NULL,
  `column4` varchar(100) DEFAULT NULL,
  `column5` varchar(100) DEFAULT NULL,
  `column6` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`dic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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

SET FOREIGN_KEY_CHECKS = 1;
