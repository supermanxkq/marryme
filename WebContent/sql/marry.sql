/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : marry

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 08/24/2017 11:30:00 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ralation`
-- ----------------------------
DROP TABLE IF EXISTS `ralation`;
CREATE TABLE `ralation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `relateId` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ralation`
-- ----------------------------
BEGIN;
INSERT INTO `ralation` VALUES ('51', '3', '1', '2'), ('53', '3', '2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `edu` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `desca` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `weChat` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `headPic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'admin', '888888', '12', '341234132', null, 'asdf阿斯顿发', '中国', '中文了。', '11', '1', '1', 'admin23', 'img3.jpg'), ('2', 'xukaiqiang', '888', '12', '12', null, '1', '1', '谷歌', '11', '1', '1', '徐凯强2', 'img_5.jpg'), ('3', 'fans', '8888', '12', '1', '1', '1', '1', '阿斯顿发的撒', '1', '1', '1', 'fans', 'img_3.jpg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
