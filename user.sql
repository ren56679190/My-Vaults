/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2019-03-31 21:15:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `u_pwd` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '亚索', '123');
INSERT INTO `user` VALUES ('3', '贾克斯', '123');
INSERT INTO `user` VALUES ('4', '盲僧', '123');
INSERT INTO `user` VALUES ('5', '阿木木', '123');
INSERT INTO `user` VALUES ('6', '剑圣', '123');
INSERT INTO `user` VALUES ('7', '盖伦', '123');
INSERT INTO `user` VALUES ('8', '赛利亚', '123');
INSERT INTO `user` VALUES ('9', '小菜鸡', '123');
