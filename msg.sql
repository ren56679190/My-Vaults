/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2019-03-31 21:15:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_name` varchar(10) NOT NULL,
  `m_content` varchar(255) NOT NULL,
  `m_time` datetime DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('2', '亚索', '面对疾风吧', '2019-03-12 09:19:03');
INSERT INTO `msg` VALUES ('3', '贾克斯', '一个能打的都没有', '2019-02-27 09:19:19');
INSERT INTO `msg` VALUES ('4', '盲僧', '一库', '2019-03-28 09:19:43');
INSERT INTO `msg` VALUES ('5', '阿木木', '还记得我吗？能和我做朋友吗？', '2019-03-27 09:20:32');
INSERT INTO `msg` VALUES ('9', '盖伦', '人在塔在', '2019-04-01 08:57:14');
INSERT INTO `msg` VALUES ('8', '剑圣', '你的剑就是我的剑', '2019-03-27 09:20:32');
INSERT INTO `msg` VALUES ('10', '盲僧', '我用双手成就你的梦想', '2019-03-31 13:00:00');
INSERT INTO `msg` VALUES ('11', '亚索', '死亡如风,常伴吾身', '2019-03-31 13:00:00');
INSERT INTO `msg` VALUES ('12', '亚索', '吾虽浪迹天涯，却未迷失本心。', '2019-03-31 15:11:39');
INSERT INTO `msg` VALUES ('13', '亚索', '我还在寻找回家的路。', '2019-03-31 15:13:54');
INSERT INTO `msg` VALUES ('14', '盲僧', '一库', '2019-03-31 15:39:33');
INSERT INTO `msg` VALUES ('15', '剑圣', '这将会是一个惨痛的教训 捍卫你自己', '2019-03-31 15:55:55');
INSERT INTO `msg` VALUES ('16', '赛利亚', '你好,我是赛利亚', '2019-03-31 16:08:05');
