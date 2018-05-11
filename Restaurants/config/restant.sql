/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : restant

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-05-11 17:26:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `dish_name` varchar(255) DEFAULT NULL COMMENT '菜名',
  `dish_price` double(10,2) DEFAULT NULL COMMENT '菜价',
  `dish_img` varchar(255) DEFAULT NULL COMMENT '配图',
  `dish_value` varchar(20) DEFAULT NULL COMMENT '所属类型  1 小吃 2 主食  3 菜品  4 酒水',
  `dish_state` varchar(1) DEFAULT NULL COMMENT '1 在售   0 售罄',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('2', '10', '九转大肠', '2.00', '008.JPG', '1', '1');
INSERT INTO `dish` VALUES ('4', '10', '毛豆', '68.00', '002.JPG', '1', '1');
INSERT INTO `dish` VALUES ('5', '10', '烤肉', '21.00', '010.JPG', '1', '1');
INSERT INTO `dish` VALUES ('7', '10', '锅包肉', '35.00', 'java学习路线图.png', '1', '1');
INSERT INTO `dish` VALUES ('8', '10', '鲅鱼水饺', '45.00', null, '1', '1');
INSERT INTO `dish` VALUES ('9', '2', '红烧肉', '50.00', null, '1', '1');
INSERT INTO `dish` VALUES ('10', '2', '烤鱼', '123.00', null, '1', '1');
INSERT INTO `dish` VALUES ('11', '2', '火锅', '10.00', null, '3', '1');
INSERT INTO `dish` VALUES ('12', '2', '花生米', '10.00', null, '1', '1');
INSERT INTO `dish` VALUES ('16', '10', '1111', '11.00', null, '1', '1');
INSERT INTO `dish` VALUES ('15', '10', '佛跳墙', '100.00', null, '3', '1');
INSERT INTO `dish` VALUES ('17', '10', '1111', '11.00', null, '1', '1');
INSERT INTO `dish` VALUES ('18', '10', '123', '123.00', null, '1', '1');
INSERT INTO `dish` VALUES ('19', '10', '123', '123.00', null, '1', '1');
INSERT INTO `dish` VALUES ('20', '10', '123', '123.00', null, '1', '1');
INSERT INTO `dish` VALUES ('21', '10', '111', '111.00', null, '1', '1');
INSERT INTO `dish` VALUES ('22', '10', '123', '111.00', 'c2.jpg', '1', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `goods_price` double(10,2) DEFAULT NULL,
  `goods_value` int(2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `user` int(10) DEFAULT NULL,
  `isCash` varchar(1) DEFAULT NULL COMMENT '1.现金 0 刷卡',
  `state` varchar(1) DEFAULT NULL COMMENT '1.完成 0未付款',
  `orderDate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '2', '1', '1', null, '1', '1');
INSERT INTO `order` VALUES ('2', '14827', '2', '63.0', null, null, '1', '2018-05-10 14:45');
INSERT INTO `order` VALUES ('3', '23229', '10', '2.0', '1', null, '3', '2018-05-10 14:30');
INSERT INTO `order` VALUES ('4', '25600', '10', '2.0', '13', null, '3', '2018-05-10 14:50');
INSERT INTO `order` VALUES ('5', '25644', '10', '68.0', '13', null, '3', '2018-05-17 14:50');
INSERT INTO `order` VALUES ('6', '25713', '10', '68.0', '13', null, '3', '2018-05-10 14:57');
INSERT INTO `order` VALUES ('7', '30035', '2', '68.0', '13', null, '3', '2018-05-16 14:50');
INSERT INTO `order` VALUES ('8', '30319', '2', '2.0', '1', null, '1', '2018-05-17 14:50');
INSERT INTO `order` VALUES ('9', '30733', '2', '70.0', '1', null, '3', '2018-05-10 14:45');
INSERT INTO `order` VALUES ('10', '31308', '2', '68.0', '1', null, '3', '2018-05-23 18:50');
INSERT INTO `order` VALUES ('11', '44939', '2', '23.0', '1', '1', '0', '2018-05-16 13:45');
INSERT INTO `order` VALUES ('12', '11813', '2', '52.0', '1', '1', '3', '2018-05-17 13:15');
INSERT INTO `order` VALUES ('13', '31135', null, '6.0', '1', '1', '', '2018-05-24 14:10');

-- ----------------------------
-- Table structure for order1
-- ----------------------------
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) DEFAULT NULL,
  `order_name` varchar(255) DEFAULT NULL,
  `order_count` int(8) DEFAULT NULL,
  `order_price` double(10,2) DEFAULT NULL,
  `order_pricesum` double(15,2) DEFAULT NULL,
  `order_table` int(4) DEFAULT NULL,
  `order_state` int(3) NOT NULL DEFAULT '0' COMMENT '0是未完成状态 1完成 2待支付',
  `location` varchar(10) DEFAULT NULL,
  `orderdate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order1
-- ----------------------------
INSERT INTO `order1` VALUES ('90', '13923', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-17 13:50');
INSERT INTO `order1` VALUES ('91', '13923', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-17 13:50');
INSERT INTO `order1` VALUES ('92', '13923', 'a', '1', '21.00', '21.00', null, '1', '1', '2018-05-17 13:50');
INSERT INTO `order1` VALUES ('93', '14332', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-24 14:45');
INSERT INTO `order1` VALUES ('94', '14332', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-24 14:45');
INSERT INTO `order1` VALUES ('95', '14827', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-10 14:45');
INSERT INTO `order1` VALUES ('96', '14827', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-10 14:45');
INSERT INTO `order1` VALUES ('97', '14827', '锅包肉', '1', '40.00', '40.00', null, '0', '1', '2018-05-10 14:45');
INSERT INTO `order1` VALUES ('98', '23229', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-10 14:30');
INSERT INTO `order1` VALUES ('99', '25600', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-10 14:50');
INSERT INTO `order1` VALUES ('100', '25644', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-17 14:50');
INSERT INTO `order1` VALUES ('48', '123018', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('49', '123133', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('50', '123717', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('51', '123820', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('52', '123846', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('53', '123847', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('54', '123848', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('55', '123958', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('56', '124004', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('57', '124138', '锅包肉', '1', '40.00', '40.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('58', '124525', '11111', '1', '2.00', '2.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('59', '124546', '11111', '1', '2.00', '2.00', null, '0', null, null);
INSERT INTO `order1` VALUES ('60', '125622', '11111', '1', '2.00', '2.00', null, '0', '2', 'orderDate');
INSERT INTO `order1` VALUES ('61', '125623', 'w', '1', '68.00', '68.00', null, '0', '2', 'orderDate');
INSERT INTO `order1` VALUES ('62', '11234', 'w', '1', '68.00', '68.00', null, '0', '2', '2018-03-27 17:25');
INSERT INTO `order1` VALUES ('63', '11234', 'a', '1', '21.00', '21.00', null, '0', '2', '2018-03-27 17:25');
INSERT INTO `order1` VALUES ('64', '15012', 'w', '2', '68.00', '136.00', null, '0', '1', '2018-04-11 14:50');
INSERT INTO `order1` VALUES ('65', '15012', '锅包肉', '1', '40.00', '40.00', null, '0', '1', '2018-04-11 14:50');
INSERT INTO `order1` VALUES ('66', '15036', 'w', '2', '68.00', '136.00', null, '0', '1', '2018-04-11 14:50');
INSERT INTO `order1` VALUES ('67', '15036', '锅包肉', '1', '40.00', '40.00', null, '0', '1', '2018-04-11 14:50');
INSERT INTO `order1` VALUES ('68', '15319', 'w', '2', '68.00', '136.00', null, '0', '2', '2018-04-25 18:50');
INSERT INTO `order1` VALUES ('69', '15319', '锅包肉', '1', '40.00', '40.00', null, '0', '2', '2018-04-25 18:50');
INSERT INTO `order1` VALUES ('70', '15428', 'w', '2', '68.00', '136.00', null, '0', '2', '2018-05-02 22:50');
INSERT INTO `order1` VALUES ('71', '15428', '锅包肉', '1', '40.00', '40.00', null, '0', '2', '2018-05-02 22:50');
INSERT INTO `order1` VALUES ('72', '15517', 'w', '2', '68.00', '136.00', null, '0', '2', '2018-05-02 22:50');
INSERT INTO `order1` VALUES ('73', '15517', '锅包肉', '1', '40.00', '40.00', null, '0', '2', '2018-05-02 22:50');
INSERT INTO `order1` VALUES ('74', '91115', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-04-13 10:00');
INSERT INTO `order1` VALUES ('75', '91115', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-04-13 10:00');
INSERT INTO `order1` VALUES ('76', '91527', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-04-13 10:00');
INSERT INTO `order1` VALUES ('77', '91527', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-04-13 10:00');
INSERT INTO `order1` VALUES ('78', '102721', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('79', '102721', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('80', '102721', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('81', '103026', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('82', '103026', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('83', '103026', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('84', '103042', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('85', '103042', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('86', '103042', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('87', '103116', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('88', '103116', '11111', '2', '2.00', '4.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('89', '103116', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-10 14:25');
INSERT INTO `order1` VALUES ('101', '25713', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:57');
INSERT INTO `order1` VALUES ('102', '30035', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-16 14:50');
INSERT INTO `order1` VALUES ('103', '30319', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-17 14:50');
INSERT INTO `order1` VALUES ('104', '30733', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-10 14:45');
INSERT INTO `order1` VALUES ('105', '30733', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-10 14:45');
INSERT INTO `order1` VALUES ('106', '31308', 'w', '1', '68.00', '68.00', null, '0', '1', '2018-05-23 18:50');
INSERT INTO `order1` VALUES ('107', '44939', '11111', '1', '2.00', '2.00', null, '0', '1', '2018-05-16 13:45');
INSERT INTO `order1` VALUES ('108', '44939', 'a', '1', '21.00', '21.00', null, '0', '1', '2018-05-16 13:45');
INSERT INTO `order1` VALUES ('109', '11813', '九转大肠', '1', '2.00', '2.00', null, '0', '1', '2018-05-17 13:15');
INSERT INTO `order1` VALUES ('110', '11813', '红烧肉', '1', '50.00', '50.00', null, '0', '1', '2018-05-17 13:15');
INSERT INTO `order1` VALUES ('111', '31135', '九转大肠', '3', '2.00', '6.00', null, '0', '1', '2018-05-24 14:10');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL COMMENT '1.管理员 2.商户  3.消费者',
  `money` double(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'a', '123', '2', '111.000');
INSERT INTO `t_user` VALUES ('5', 'admin', '123', '1', '0.000');
INSERT INTO `t_user` VALUES ('9', '1111', '111', '1', '0.000');
INSERT INTO `t_user` VALUES ('10', '123', '1', '2', '0.000');
INSERT INTO `t_user` VALUES ('13', '赵云', '123', '3', '563.000');
INSERT INTO `t_user` VALUES ('14', '张飞', '123', '3', '111.000');
INSERT INTO `t_user` VALUES ('15', '刘备', '1', '1', '0.000');
