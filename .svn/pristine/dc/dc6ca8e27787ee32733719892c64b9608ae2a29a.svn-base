/*
Navicat MySQL Data Transfer

Source Server         : oa
Source Server Version : 50540
Source Host           : 192.168.6.65:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-21 14:22:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `oa_loan`
-- ----------------------------
DROP TABLE IF EXISTS `oa_loan`;
CREATE TABLE `oa_loan` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '人员选择',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `MONEY` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '借款金额(大写)',
  `RECORD_ID` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '借支记录id',
  `REASON` text COLLATE utf8_bin COMMENT '借款原由',
  `ISBUY` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否用于采购:0,是;1,不是',
  `UPPERTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '直属领导意见',
  `PROTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '项目经理意见',
  `FINCINALTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '财务部副总意见',
  `MANAGERTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '总经理审批意见',
  `ACCOUNTTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '会计审核意见',
  `PAYTEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出纳付款确认',
  `FILES` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '拟稿人',
  `create_date` datetime NOT NULL COMMENT '拟稿时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记0,正常；1，删除;2，草稿',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='借支表';

-- ----------------------------
-- Records of oa_loan
-- ----------------------------
INSERT INTO `oa_loan` VALUES ('4bb18117df65490586ecfa4940947fd2', '72c47637dff242f78ac59e3ef6afd2f9', ',', null, 'sdfsdf', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-15 10:10:40', '1', '2016-11-15 10:10:40', null, '0');
INSERT INTO `oa_loan` VALUES ('55d49fbd22bd49d5b587acb249351f0b', '0b85ecdcaf274333b3bcdc5bd1042cfb', ',', null, '发文1', '', '', null, null, null, null, null, null, null, '', '2', '2016-11-17 10:23:21', '2', '2016-11-17 10:23:21', null, '1');
INSERT INTO `oa_loan` VALUES ('736449013d9c47319246123998d0f514', '0f340039568e4e4bb518a2472f678ef7', ',', null, '动态', '楚誉【财】', '', null, null, null, null, null, null, null, '', '1', '2016-11-18 13:12:19', '3b90faccc4234871b80d6f5a80de3e1c', '2016-11-18 13:19:47', null, '1');
INSERT INTO `oa_loan` VALUES ('7e02f54fb1e24db08f15f72d6308665b', '7bb8c2e1deef4050a892676265ddf171', ',', null, '发文', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-17 10:22:24', '1', '2016-11-17 10:24:45', null, '1');
INSERT INTO `oa_loan` VALUES ('8b3a81cc0e7e46678a307ba2bf07d9d8', '3ef5c9ceb9824c50a6b44ccf9be032ed', ',', null, 'asadsd', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-15 15:02:18', '2', '2016-11-15 15:44:43', null, '1');
INSERT INTO `oa_loan` VALUES ('a44fb51dba094e36b60567d7f28e0b1e', '9585e8561b84479ea92a1cd5e08025ae', '', '', 'ytr', 'yrt', 0x7274, null, null, null, null, null, null, null, '', '1', '2016-11-10 16:14:50', '1', '2016-11-10 16:14:50', '', '0');
INSERT INTO `oa_loan` VALUES ('b03845af53ea4e5393de4be1e1684b0d', '851d08315fb24bac83d3322b185478e4', '', '', '公司政策', '楚【研】1003', 0x7873646666736467, null, null, null, null, null, null, null, '', '1', '2016-11-11 14:26:30', '1', '2016-11-11 14:26:30', '', '0');
INSERT INTO `oa_loan` VALUES ('c5f6b2626a764f5abfafabc98508a01d', '8b37f300d28f4adc8a1b0793ed740c53', ',', null, 'fdsf', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-17 13:52:04', '0f315bcd901a43eab4ab40069ec0ac42', '2016-11-18 13:48:18', null, '1');
INSERT INTO `oa_loan` VALUES ('cda252fe70674674b48694e5ce2cbaa2', '67375a3f2eab4cdab021c1ff2876b5b5', ',', null, '动态123', '楚誉【研】', '', null, null, null, null, null, null, null, '', '3b90faccc4234871b80d6f5a80de3e1c', '2016-11-18 13:17:35', '3b90faccc4234871b80d6f5a80de3e1c', '2016-11-18 13:22:34', null, '1');
INSERT INTO `oa_loan` VALUES ('f6304ed5e7e047209b472233623495f3', 'b71b29d738134d698c57f3516cd56eea', ',', null, '动态1212', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-18 13:32:18', '3b90faccc4234871b80d6f5a80de3e1c', '2016-11-18 13:47:02', null, '1');
INSERT INTO `oa_loan` VALUES ('fa20ebdf6c5a4427ac6ebeb2b70f096b', 'b44b934931e34bac9aa0c9ec59756a5c', ',', null, 'sdfs', '0', '', null, null, null, null, null, null, null, '', '2', '2016-11-17 13:53:05', '2', '2016-11-17 13:53:05', null, '1');
INSERT INTO `oa_loan` VALUES ('fd1ea63fbb004328935fa2e4aaed845a', 'a37a4605b61f4c0a917bfcd429db46ea', ',', null, '动态', '', '', null, null, null, null, null, null, null, '', '1', '2016-11-15 11:36:06', '97614ba29c284862883dcc937a153076', '2016-11-15 11:56:19', null, '1');
