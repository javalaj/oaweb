/*
Navicat MySQL Data Transfer

Source Server         : oa
Source Server Version : 50540
Source Host           : 192.168.6.65:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-15 14:49:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `oa_archives_record`
-- ----------------------------
DROP TABLE IF EXISTS `oa_archives_record`;
CREATE TABLE `oa_archives_record` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `oa_archives_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '公文ID',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`),
  KEY `oa_notify_record_notify_id` (`oa_archives_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文发送记录表';

-- ----------------------------
-- Records of oa_archives_record
-- ----------------------------
