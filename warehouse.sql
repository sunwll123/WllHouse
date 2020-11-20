/*
Navicat MySQL Data Transfer

Source Server         : 192.168.158.138
Source Server Version : 50732
Source Host           : 192.168.158.138:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2020-11-20 20:42:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `logistics_base_id` int(11) DEFAULT NULL COMMENT '用来关联物流信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张布艺', '商丘', '15279230588', '1', '1');
INSERT INTO `bus_customer` VALUES ('2', '小丽布艺', '南阳', '13064154936', '1', '2');
INSERT INTO `bus_customer` VALUES ('3', '小红布艺', '心想', '13617020687', '1', '2');
INSERT INTO `bus_customer` VALUES ('4', '一帘幽梦', '十里大道1039号', '13648524759', '1', '3');
INSERT INTO `bus_customer` VALUES ('15', '真真', '南阳', '123456', '1', '3');

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `produceplace` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `goodspackage` varchar(255) DEFAULT NULL,
  `productcode` varchar(255) DEFAULT NULL,
  `promitcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '3', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '463', '10', '2020-02-24/99F329D96E06449E9A5D613B1D3FA7DD.jpg', '1');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '1', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1090', '10', '2020-01-21/625C047E6A934D9FA5C611BB7D93CD8F.jpg', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '1', '仙桃', '盒', '盒', '11', '11', '111', '28', '1021', '100', '2020-01-21/8F743D2038D747878B02C0E2183823A6.jpg', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '3', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '760', '10', '2020-01-21/B1B4C7D489EB43E5B662E8E92A6A5180.jpg', '1');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '3', '武汉', '300ML', '瓶', '1234', '12321', '22221111', '3', '1000', '100', '2020-01-21/BAF8B804591942F2AEF43E6BE25934DD.jpg', '1');
INSERT INTO `bus_goods` VALUES ('6', '纯牛奶', '4', '内蒙古', '24瓶一箱', '瓶', 'SD13156146', '321651613', '牛奶', '55', '100', '20', '2020-01-21/F0BC1EBC2BFA4497BDF8B9254BA59511.jpg', '1');
INSERT INTO `bus_goods` VALUES ('18', '八宝粥', '2', '广州', '箱', '15', 'DFS234341231', 'DF123124324', '粥', '4', '490', '100', '2020-03-07/5D1B185D310245A7AD7EFF51393C8432.jpg', '1');

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bus_inport_ibfk_1` (`providerid`) USING BTREE,
  KEY `bus_inport_ibfk_2` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 00:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 00:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 00:00:00', '张三', '1000', '无', '2', '3', '1');
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 00:00:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-05-07 00:00:00', '张三', '100', '', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '支付宝', '2018-09-17 16:12:25', '超级管理员', '21', '21', '21', '1', '3');
INSERT INTO `bus_inport` VALUES ('12', '微信', '2018-12-25 16:48:24', '超级管理员', '90', '123213213', '12321321', '3', '1');

-- ----------------------------
-- Table structure for bus_logistics_base
-- ----------------------------
DROP TABLE IF EXISTS `bus_logistics_base`;
CREATE TABLE `bus_logistics_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logistics_name` varchar(255) DEFAULT NULL,
  `logistics_scope` varchar(1000) DEFAULT NULL,
  `logistics_phone` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `logistics_cost` decimal(10,2) DEFAULT NULL COMMENT '物流单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_logistics_base
-- ----------------------------
INSERT INTO `bus_logistics_base` VALUES ('1', '达发物流', '陕县,开封', '15290865083', '1', '10.00');
INSERT INTO `bus_logistics_base` VALUES ('2', '创新物流', '商丘,民权', '15290865084', '1', '10.00');
INSERT INTO `bus_logistics_base` VALUES ('3', '安利物流', '新郑,开封', '15290865085', '1', '10.50');
INSERT INTO `bus_logistics_base` VALUES ('12', '方圆物流', '开封', '123456', '1', '10.00');
INSERT INTO `bus_logistics_base` VALUES ('13', '浩宇物流', '浙江', '1256489', '2', '80.00');

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `outportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('1', '3', '微信', '2019-08-16 08:19:50', '超级管理员', '12321321.00', '1', '', '1');
INSERT INTO `bus_outport` VALUES ('2', '3', '微信', '2019-08-16 08:26:54', '超级管理员', '12321321.00', '11', '11', '1');
INSERT INTO `bus_outport` VALUES ('7', '3', '微信', '2020-11-17 05:36:43', '超级管理员', '12321321.00', '10', '次品', '1');

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');
INSERT INTO `bus_provider` VALUES ('4', '蒙牛集团', '332005', '内蒙古', '0790-362514856', '姿态', '13617252689', '中国银行', '36214587962509', '13617252689@163.com', '364145', '1');
INSERT INTO `bus_provider` VALUES ('5', '伊利集团', '562115', '内蒙古', '0792-36548569', 'Rita', '13698560566', '建设银行', '3621458963596509', '13698560566@163.com', '362514', '1');
INSERT INTO `bus_provider` VALUES ('12', 'asdf', '123', 'sdf', '123', 'sda', '123', '123', '123', '132', '213', '1');

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------
INSERT INTO `bus_sales` VALUES ('1', '4', '支付宝', '2020-01-21 03:04:52', '落亦-', '15', '士大夫士大夫', '60.00', '1');
INSERT INTO `bus_sales` VALUES ('8', '4', '支付宝', '2020-11-17 05:33:12', '超级管理员', '10', '', '50.00', '18');

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------
INSERT INTO `bus_salesback` VALUES ('4', '4', '支付宝', '2020-03-07 07:45:12', '60.00', '落亦-', '5', 'sdf', '1');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('14', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:45:25');
INSERT INTO `sys_loginfo` VALUES ('15', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:21:52');
INSERT INTO `sys_loginfo` VALUES ('16', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:23:39');
INSERT INTO `sys_loginfo` VALUES ('17', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:26:10');
INSERT INTO `sys_loginfo` VALUES ('18', '落亦--luoyi', '127.0.0.1', '2019-11-25 15:53:00');
INSERT INTO `sys_loginfo` VALUES ('19', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 08:32:41');
INSERT INTO `sys_loginfo` VALUES ('20', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 09:18:06');
INSERT INTO `sys_loginfo` VALUES ('21', '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-26 09:59:19');
INSERT INTO `sys_loginfo` VALUES ('22', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 10:48:05');
INSERT INTO `sys_loginfo` VALUES ('23', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:15:03');
INSERT INTO `sys_loginfo` VALUES ('24', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:42:02');
INSERT INTO `sys_loginfo` VALUES ('25', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 16:56:54');
INSERT INTO `sys_loginfo` VALUES ('26', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:07:44');
INSERT INTO `sys_loginfo` VALUES ('27', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:08:08');
INSERT INTO `sys_loginfo` VALUES ('28', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 19:23:12');
INSERT INTO `sys_loginfo` VALUES ('29', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 20:46:57');
INSERT INTO `sys_loginfo` VALUES ('30', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:17:48');
INSERT INTO `sys_loginfo` VALUES ('31', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:21:16');
INSERT INTO `sys_loginfo` VALUES ('32', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:13:56');
INSERT INTO `sys_loginfo` VALUES ('33', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:29:17');
INSERT INTO `sys_loginfo` VALUES ('34', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:30:38');
INSERT INTO `sys_loginfo` VALUES ('35', '落亦--luoyi', '127.0.0.1', '2019-11-27 20:32:36');
INSERT INTO `sys_loginfo` VALUES ('36', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:33:47');
INSERT INTO `sys_loginfo` VALUES ('37', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 08:52:02');
INSERT INTO `sys_loginfo` VALUES ('38', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:14');
INSERT INTO `sys_loginfo` VALUES ('39', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:23');
INSERT INTO `sys_loginfo` VALUES ('40', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:10:00');
INSERT INTO `sys_loginfo` VALUES ('41', '落亦--luoyi', '127.0.0.1', '2019-11-28 09:10:53');
INSERT INTO `sys_loginfo` VALUES ('42', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:17:06');
INSERT INTO `sys_loginfo` VALUES ('43', '落亦--luoyi', '127.0.0.1', '2019-11-28 09:18:25');
INSERT INTO `sys_loginfo` VALUES ('44', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:19:19');
INSERT INTO `sys_loginfo` VALUES ('45', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:43:12');
INSERT INTO `sys_loginfo` VALUES ('46', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:55:00');
INSERT INTO `sys_loginfo` VALUES ('47', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:56:54');
INSERT INTO `sys_loginfo` VALUES ('48', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:59:18');
INSERT INTO `sys_loginfo` VALUES ('49', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:28:42');
INSERT INTO `sys_loginfo` VALUES ('50', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:35:39');
INSERT INTO `sys_loginfo` VALUES ('51', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:46:07');
INSERT INTO `sys_loginfo` VALUES ('52', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:56:34');
INSERT INTO `sys_loginfo` VALUES ('53', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:57:11');
INSERT INTO `sys_loginfo` VALUES ('54', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 20:37:00');
INSERT INTO `sys_loginfo` VALUES ('55', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:29:07');
INSERT INTO `sys_loginfo` VALUES ('56', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:35:40');
INSERT INTO `sys_loginfo` VALUES ('57', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:38:15');
INSERT INTO `sys_loginfo` VALUES ('58', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:39:56');
INSERT INTO `sys_loginfo` VALUES ('59', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 08:34:49');
INSERT INTO `sys_loginfo` VALUES ('60', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:15:39');
INSERT INTO `sys_loginfo` VALUES ('61', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:24:44');
INSERT INTO `sys_loginfo` VALUES ('62', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:29:50');
INSERT INTO `sys_loginfo` VALUES ('63', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:13:31');
INSERT INTO `sys_loginfo` VALUES ('64', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:45:24');
INSERT INTO `sys_loginfo` VALUES ('65', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:51:44');
INSERT INTO `sys_loginfo` VALUES ('66', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 11:07:38');
INSERT INTO `sys_loginfo` VALUES ('67', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 21:52:58');
INSERT INTO `sys_loginfo` VALUES ('68', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:00:53');
INSERT INTO `sys_loginfo` VALUES ('69', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:13:18');
INSERT INTO `sys_loginfo` VALUES ('70', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:23:34');
INSERT INTO `sys_loginfo` VALUES ('71', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:28:58');
INSERT INTO `sys_loginfo` VALUES ('72', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:30:01');
INSERT INTO `sys_loginfo` VALUES ('73', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:01');
INSERT INTO `sys_loginfo` VALUES ('74', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:47');
INSERT INTO `sys_loginfo` VALUES ('75', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:45:21');
INSERT INTO `sys_loginfo` VALUES ('76', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:05:59');
INSERT INTO `sys_loginfo` VALUES ('77', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:14:08');
INSERT INTO `sys_loginfo` VALUES ('78', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:19:56');
INSERT INTO `sys_loginfo` VALUES ('79', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:29:39');
INSERT INTO `sys_loginfo` VALUES ('80', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:24:06');
INSERT INTO `sys_loginfo` VALUES ('81', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:40:39');
INSERT INTO `sys_loginfo` VALUES ('82', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:42:36');
INSERT INTO `sys_loginfo` VALUES ('83', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:47:08');
INSERT INTO `sys_loginfo` VALUES ('84', '落亦--luoyi', '127.0.0.1', '2019-11-30 11:59:23');
INSERT INTO `sys_loginfo` VALUES ('85', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:03:46');
INSERT INTO `sys_loginfo` VALUES ('86', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:18:12');
INSERT INTO `sys_loginfo` VALUES ('87', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:58:59');
INSERT INTO `sys_loginfo` VALUES ('88', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 18:29:39');
INSERT INTO `sys_loginfo` VALUES ('89', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 09:37:38');
INSERT INTO `sys_loginfo` VALUES ('90', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 11:46:14');
INSERT INTO `sys_loginfo` VALUES ('91', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:39:07');
INSERT INTO `sys_loginfo` VALUES ('92', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:42:01');
INSERT INTO `sys_loginfo` VALUES ('93', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:44:22');
INSERT INTO `sys_loginfo` VALUES ('94', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:49:58');
INSERT INTO `sys_loginfo` VALUES ('95', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:40:27');
INSERT INTO `sys_loginfo` VALUES ('96', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:41:44');
INSERT INTO `sys_loginfo` VALUES ('97', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:51:51');
INSERT INTO `sys_loginfo` VALUES ('98', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 19:44:13');
INSERT INTO `sys_loginfo` VALUES ('99', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 08:40:06');
INSERT INTO `sys_loginfo` VALUES ('100', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:17:34');
INSERT INTO `sys_loginfo` VALUES ('101', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:33');
INSERT INTO `sys_loginfo` VALUES ('102', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:54');
INSERT INTO `sys_loginfo` VALUES ('103', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:46:23');
INSERT INTO `sys_loginfo` VALUES ('104', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:52:24');
INSERT INTO `sys_loginfo` VALUES ('105', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 11:12:01');
INSERT INTO `sys_loginfo` VALUES ('106', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 13:52:12');
INSERT INTO `sys_loginfo` VALUES ('107', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:33');
INSERT INTO `sys_loginfo` VALUES ('108', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:09:36');
INSERT INTO `sys_loginfo` VALUES ('109', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:12:28');
INSERT INTO `sys_loginfo` VALUES ('110', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:13:55');
INSERT INTO `sys_loginfo` VALUES ('111', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:20:36');
INSERT INTO `sys_loginfo` VALUES ('112', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:21:06');
INSERT INTO `sys_loginfo` VALUES ('113', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:37');
INSERT INTO `sys_loginfo` VALUES ('114', '旦素一-dansuyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:54');
INSERT INTO `sys_loginfo` VALUES ('115', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:04:21');
INSERT INTO `sys_loginfo` VALUES ('116', '李九-lijiu', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:02');
INSERT INTO `sys_loginfo` VALUES ('117', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:25');
INSERT INTO `sys_loginfo` VALUES ('118', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 08:36:54');
INSERT INTO `sys_loginfo` VALUES ('119', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:18:26');
INSERT INTO `sys_loginfo` VALUES ('120', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:40:35');
INSERT INTO `sys_loginfo` VALUES ('121', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:14:43');
INSERT INTO `sys_loginfo` VALUES ('122', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:27:12');
INSERT INTO `sys_loginfo` VALUES ('123', '李约素-liyuesu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:12');
INSERT INTO `sys_loginfo` VALUES ('124', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:20');
INSERT INTO `sys_loginfo` VALUES ('125', '赵六-zhaoliu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:28');
INSERT INTO `sys_loginfo` VALUES ('126', '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:40');
INSERT INTO `sys_loginfo` VALUES ('127', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:51');
INSERT INTO `sys_loginfo` VALUES ('128', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:00');
INSERT INTO `sys_loginfo` VALUES ('129', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:16');
INSERT INTO `sys_loginfo` VALUES ('130', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 11:13:42');
INSERT INTO `sys_loginfo` VALUES ('131', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:15:22');
INSERT INTO `sys_loginfo` VALUES ('132', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:16:03');
INSERT INTO `sys_loginfo` VALUES ('133', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:27:27');
INSERT INTO `sys_loginfo` VALUES ('134', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:32:11');
INSERT INTO `sys_loginfo` VALUES ('135', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:39:49');
INSERT INTO `sys_loginfo` VALUES ('136', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:43:26');
INSERT INTO `sys_loginfo` VALUES ('137', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:44:41');
INSERT INTO `sys_loginfo` VALUES ('138', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:35:56');
INSERT INTO `sys_loginfo` VALUES ('139', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:53:28');
INSERT INTO `sys_loginfo` VALUES ('140', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:02:42');
INSERT INTO `sys_loginfo` VALUES ('141', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:50:28');
INSERT INTO `sys_loginfo` VALUES ('142', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:20:01');
INSERT INTO `sys_loginfo` VALUES ('143', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:22:13');
INSERT INTO `sys_loginfo` VALUES ('144', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:19');
INSERT INTO `sys_loginfo` VALUES ('145', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:51');
INSERT INTO `sys_loginfo` VALUES ('146', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:38:39');
INSERT INTO `sys_loginfo` VALUES ('147', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 20:38:28');
INSERT INTO `sys_loginfo` VALUES ('148', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:05:55');
INSERT INTO `sys_loginfo` VALUES ('149', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:06:49');
INSERT INTO `sys_loginfo` VALUES ('150', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:07:39');
INSERT INTO `sys_loginfo` VALUES ('151', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:10:07');
INSERT INTO `sys_loginfo` VALUES ('152', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:47');
INSERT INTO `sys_loginfo` VALUES ('153', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:58');
INSERT INTO `sys_loginfo` VALUES ('154', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:54:31');
INSERT INTO `sys_loginfo` VALUES ('155', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 22:55:00');
INSERT INTO `sys_loginfo` VALUES ('156', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:57:38');
INSERT INTO `sys_loginfo` VALUES ('157', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:18');
INSERT INTO `sys_loginfo` VALUES ('158', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:38');
INSERT INTO `sys_loginfo` VALUES ('159', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:36:42');
INSERT INTO `sys_loginfo` VALUES ('160', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:18');
INSERT INTO `sys_loginfo` VALUES ('161', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:46');
INSERT INTO `sys_loginfo` VALUES ('162', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:45:31');
INSERT INTO `sys_loginfo` VALUES ('163', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:03');
INSERT INTO `sys_loginfo` VALUES ('164', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:41');
INSERT INTO `sys_loginfo` VALUES ('165', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:00');
INSERT INTO `sys_loginfo` VALUES ('166', '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:52');
INSERT INTO `sys_loginfo` VALUES ('167', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:49:12');
INSERT INTO `sys_loginfo` VALUES ('168', '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:36');
INSERT INTO `sys_loginfo` VALUES ('169', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:52');
INSERT INTO `sys_loginfo` VALUES ('170', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:53:36');
INSERT INTO `sys_loginfo` VALUES ('171', '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:55:07');
INSERT INTO `sys_loginfo` VALUES ('172', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 09:31:52');
INSERT INTO `sys_loginfo` VALUES ('173', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 22:30:06');
INSERT INTO `sys_loginfo` VALUES ('174', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:00:14');
INSERT INTO `sys_loginfo` VALUES ('175', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:19:13');
INSERT INTO `sys_loginfo` VALUES ('176', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:22:29');
INSERT INTO `sys_loginfo` VALUES ('177', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:24:33');
INSERT INTO `sys_loginfo` VALUES ('178', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:26:13');
INSERT INTO `sys_loginfo` VALUES ('179', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:32:24');
INSERT INTO `sys_loginfo` VALUES ('180', '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-12-09 16:14:07');
INSERT INTO `sys_loginfo` VALUES ('181', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:02:00');
INSERT INTO `sys_loginfo` VALUES ('182', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:13:25');
INSERT INTO `sys_loginfo` VALUES ('183', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:17:40');
INSERT INTO `sys_loginfo` VALUES ('184', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:23:43');
INSERT INTO `sys_loginfo` VALUES ('185', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:28:21');
INSERT INTO `sys_loginfo` VALUES ('186', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-06 02:28:24');
INSERT INTO `sys_loginfo` VALUES ('187', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-06 03:02:00');
INSERT INTO `sys_loginfo` VALUES ('188', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-07 07:54:49');
INSERT INTO `sys_loginfo` VALUES ('189', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-08 06:23:55');
INSERT INTO `sys_loginfo` VALUES ('190', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-09 07:45:00');
INSERT INTO `sys_loginfo` VALUES ('191', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 03:01:19');
INSERT INTO `sys_loginfo` VALUES ('192', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:08:23');
INSERT INTO `sys_loginfo` VALUES ('193', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:16:36');
INSERT INTO `sys_loginfo` VALUES ('194', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:20:26');
INSERT INTO `sys_loginfo` VALUES ('195', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:23:37');
INSERT INTO `sys_loginfo` VALUES ('196', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:25:52');
INSERT INTO `sys_loginfo` VALUES ('197', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:34:37');
INSERT INTO `sys_loginfo` VALUES ('198', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:36:25');
INSERT INTO `sys_loginfo` VALUES ('199', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:39:03');
INSERT INTO `sys_loginfo` VALUES ('200', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:42:08');
INSERT INTO `sys_loginfo` VALUES ('201', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:43:07');
INSERT INTO `sys_loginfo` VALUES ('202', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:44:12');
INSERT INTO `sys_loginfo` VALUES ('203', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:44:54');
INSERT INTO `sys_loginfo` VALUES ('204', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:09:37');
INSERT INTO `sys_loginfo` VALUES ('205', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:11:53');
INSERT INTO `sys_loginfo` VALUES ('206', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:13:10');
INSERT INTO `sys_loginfo` VALUES ('207', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:14:13');
INSERT INTO `sys_loginfo` VALUES ('208', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:19:38');
INSERT INTO `sys_loginfo` VALUES ('209', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:22:05');
INSERT INTO `sys_loginfo` VALUES ('210', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:26:19');
INSERT INTO `sys_loginfo` VALUES ('211', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:30:35');
INSERT INTO `sys_loginfo` VALUES ('212', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 07:16:07');
INSERT INTO `sys_loginfo` VALUES ('213', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 07:30:52');
INSERT INTO `sys_loginfo` VALUES ('214', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:05:43');
INSERT INTO `sys_loginfo` VALUES ('215', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:23:39');
INSERT INTO `sys_loginfo` VALUES ('216', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:58:01');
INSERT INTO `sys_loginfo` VALUES ('217', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 09:06:30');
INSERT INTO `sys_loginfo` VALUES ('218', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 09:52:11');
INSERT INTO `sys_loginfo` VALUES ('219', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:33:16');
INSERT INTO `sys_loginfo` VALUES ('220', '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 07:39:04');
INSERT INTO `sys_loginfo` VALUES ('221', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:40:26');
INSERT INTO `sys_loginfo` VALUES ('222', '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 07:47:07');
INSERT INTO `sys_loginfo` VALUES ('223', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:47:40');
INSERT INTO `sys_loginfo` VALUES ('224', '落亦--luoyi', '127.0.0.1', '2020-02-24 07:55:53');
INSERT INTO `sys_loginfo` VALUES ('225', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:09:22');
INSERT INTO `sys_loginfo` VALUES ('226', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:53:10');
INSERT INTO `sys_loginfo` VALUES ('227', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:57:15');
INSERT INTO `sys_loginfo` VALUES ('228', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:04:42');
INSERT INTO `sys_loginfo` VALUES ('229', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:24:06');
INSERT INTO `sys_loginfo` VALUES ('230', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:26:52');
INSERT INTO `sys_loginfo` VALUES ('231', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:32:45');
INSERT INTO `sys_loginfo` VALUES ('232', '落亦--luoyi', '127.0.0.1', '2020-02-24 09:35:36');
INSERT INTO `sys_loginfo` VALUES ('233', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:38:13');
INSERT INTO `sys_loginfo` VALUES ('234', '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:42:05');
INSERT INTO `sys_loginfo` VALUES ('235', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:42:47');
INSERT INTO `sys_loginfo` VALUES ('236', '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:43:05');
INSERT INTO `sys_loginfo` VALUES ('237', '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:43:42');
INSERT INTO `sys_loginfo` VALUES ('238', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:44:05');
INSERT INTO `sys_loginfo` VALUES ('239', '李四-lisi', '0:0:0:0:0:0:0:1', '2020-02-24 09:44:47');
INSERT INTO `sys_loginfo` VALUES ('240', '李四-lisi', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:14');
INSERT INTO `sys_loginfo` VALUES ('241', '王五-wangwu', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:35');
INSERT INTO `sys_loginfo` VALUES ('242', '赵六-zhaoliu', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:55');
INSERT INTO `sys_loginfo` VALUES ('243', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:46:32');
INSERT INTO `sys_loginfo` VALUES ('244', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-01 09:46:24');
INSERT INTO `sys_loginfo` VALUES ('245', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 02:28:15');
INSERT INTO `sys_loginfo` VALUES ('246', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 02:42:09');
INSERT INTO `sys_loginfo` VALUES ('247', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:02:07');
INSERT INTO `sys_loginfo` VALUES ('248', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:06:11');
INSERT INTO `sys_loginfo` VALUES ('249', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:12:35');
INSERT INTO `sys_loginfo` VALUES ('250', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:28:54');
INSERT INTO `sys_loginfo` VALUES ('251', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:53:25');
INSERT INTO `sys_loginfo` VALUES ('252', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 12:58:05');
INSERT INTO `sys_loginfo` VALUES ('253', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 03:11:53');
INSERT INTO `sys_loginfo` VALUES ('254', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 03:50:55');
INSERT INTO `sys_loginfo` VALUES ('255', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:13:39');
INSERT INTO `sys_loginfo` VALUES ('256', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:16:53');
INSERT INTO `sys_loginfo` VALUES ('257', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:23:31');
INSERT INTO `sys_loginfo` VALUES ('258', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:25:49');
INSERT INTO `sys_loginfo` VALUES ('259', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:34:00');
INSERT INTO `sys_loginfo` VALUES ('260', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:24:46');
INSERT INTO `sys_loginfo` VALUES ('261', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:44:40');
INSERT INTO `sys_loginfo` VALUES ('262', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:50:38');
INSERT INTO `sys_loginfo` VALUES ('263', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:52:28');
INSERT INTO `sys_loginfo` VALUES ('264', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:59:44');
INSERT INTO `sys_loginfo` VALUES ('265', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 08:10:44');
INSERT INTO `sys_loginfo` VALUES ('266', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 08:13:23');
INSERT INTO `sys_loginfo` VALUES ('267', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:37:14');
INSERT INTO `sys_loginfo` VALUES ('268', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:39:03');
INSERT INTO `sys_loginfo` VALUES ('269', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:41:25');
INSERT INTO `sys_loginfo` VALUES ('270', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:43:31');
INSERT INTO `sys_loginfo` VALUES ('271', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:56:23');
INSERT INTO `sys_loginfo` VALUES ('272', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 04:17:22');
INSERT INTO `sys_loginfo` VALUES ('273', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 04:29:46');
INSERT INTO `sys_loginfo` VALUES ('274', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 09:53:15');
INSERT INTO `sys_loginfo` VALUES ('275', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:07:53');
INSERT INTO `sys_loginfo` VALUES ('276', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:30:36');
INSERT INTO `sys_loginfo` VALUES ('277', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:32:45');
INSERT INTO `sys_loginfo` VALUES ('278', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:36:43');
INSERT INTO `sys_loginfo` VALUES ('279', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:50:53');
INSERT INTO `sys_loginfo` VALUES ('280', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:52:45');
INSERT INTO `sys_loginfo` VALUES ('281', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:53:31');
INSERT INTO `sys_loginfo` VALUES ('282', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:54:57');
INSERT INTO `sys_loginfo` VALUES ('283', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:55:39');
INSERT INTO `sys_loginfo` VALUES ('284', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:57:06');
INSERT INTO `sys_loginfo` VALUES ('285', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:00:54');
INSERT INTO `sys_loginfo` VALUES ('286', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:04:41');
INSERT INTO `sys_loginfo` VALUES ('287', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:08:39');
INSERT INTO `sys_loginfo` VALUES ('288', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-09 08:36:06');
INSERT INTO `sys_loginfo` VALUES ('289', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 14:46:10');
INSERT INTO `sys_loginfo` VALUES ('290', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 14:51:52');
INSERT INTO `sys_loginfo` VALUES ('291', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 14:54:45');
INSERT INTO `sys_loginfo` VALUES ('292', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 14:55:18');
INSERT INTO `sys_loginfo` VALUES ('293', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 15:10:12');
INSERT INTO `sys_loginfo` VALUES ('294', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 15:59:29');
INSERT INTO `sys_loginfo` VALUES ('295', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 16:04:34');
INSERT INTO `sys_loginfo` VALUES ('296', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 16:09:35');
INSERT INTO `sys_loginfo` VALUES ('297', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-16 16:14:40');
INSERT INTO `sys_loginfo` VALUES ('298', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 02:35:12');
INSERT INTO `sys_loginfo` VALUES ('299', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 03:10:18');
INSERT INTO `sys_loginfo` VALUES ('300', 'wll-wll', '0:0:0:0:0:0:0:1', '2020-11-17 03:47:13');
INSERT INTO `sys_loginfo` VALUES ('301', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 03:48:22');
INSERT INTO `sys_loginfo` VALUES ('302', 'wll-wll', '0:0:0:0:0:0:0:1', '2020-11-17 03:48:58');
INSERT INTO `sys_loginfo` VALUES ('303', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 03:51:42');
INSERT INTO `sys_loginfo` VALUES ('304', '李四-lisi', '0:0:0:0:0:0:0:1', '2020-11-17 03:53:13');
INSERT INTO `sys_loginfo` VALUES ('305', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 03:53:55');
INSERT INTO `sys_loginfo` VALUES ('306', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 04:36:37');
INSERT INTO `sys_loginfo` VALUES ('307', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 05:25:12');
INSERT INTO `sys_loginfo` VALUES ('308', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-17 12:26:51');
INSERT INTO `sys_loginfo` VALUES ('309', '超级管理员-system', '192.168.30.1', '2020-11-17 14:40:41');
INSERT INTO `sys_loginfo` VALUES ('310', '超级管理员-system', '192.168.30.1', '2020-11-17 14:45:03');
INSERT INTO `sys_loginfo` VALUES ('311', '超级管理员-system', '192.168.30.1', '2020-11-17 15:18:31');
INSERT INTO `sys_loginfo` VALUES ('312', '超级管理员-system', '192.168.30.1', '2020-11-17 15:23:36');
INSERT INTO `sys_loginfo` VALUES ('313', '超级管理员-system', '192.168.30.1', '2020-11-17 15:37:14');
INSERT INTO `sys_loginfo` VALUES ('314', '超级管理员-system', '192.168.30.1', '2020-11-17 15:41:53');
INSERT INTO `sys_loginfo` VALUES ('315', '超级管理员-system', '192.168.30.1', '2020-11-17 15:44:40');
INSERT INTO `sys_loginfo` VALUES ('316', '超级管理员-system', '192.168.30.1', '2020-11-17 15:46:29');
INSERT INTO `sys_loginfo` VALUES ('317', '超级管理员-system', '192.168.30.1', '2020-11-17 15:51:03');
INSERT INTO `sys_loginfo` VALUES ('318', '超级管理员-system', '192.168.30.1', '2020-11-17 15:54:05');
INSERT INTO `sys_loginfo` VALUES ('319', '超级管理员-system', '192.168.30.1', '2020-11-17 16:02:11');
INSERT INTO `sys_loginfo` VALUES ('320', '超级管理员-system', '192.168.30.1', '2020-11-17 16:04:14');
INSERT INTO `sys_loginfo` VALUES ('321', '超级管理员-system', '192.168.30.1', '2020-11-17 16:08:58');
INSERT INTO `sys_loginfo` VALUES ('322', '超级管理员-system', '192.168.30.1', '2020-11-17 16:13:20');
INSERT INTO `sys_loginfo` VALUES ('323', '超级管理员-system', '192.168.30.1', '2020-11-17 16:15:55');
INSERT INTO `sys_loginfo` VALUES ('324', '超级管理员-system', '192.168.30.1', '2020-11-17 16:21:51');
INSERT INTO `sys_loginfo` VALUES ('325', '超级管理员-system', '192.168.30.1', '2020-11-17 16:24:15');
INSERT INTO `sys_loginfo` VALUES ('326', '超级管理员-system', '192.168.30.1', '2020-11-17 16:40:57');
INSERT INTO `sys_loginfo` VALUES ('327', '超级管理员-system', '192.168.30.1', '2020-11-17 16:43:14');
INSERT INTO `sys_loginfo` VALUES ('328', '超级管理员-system', '192.168.30.1', '2020-11-17 16:44:01');
INSERT INTO `sys_loginfo` VALUES ('329', '超级管理员-system', '192.168.30.1', '2020-11-17 16:45:29');
INSERT INTO `sys_loginfo` VALUES ('330', '超级管理员-system', '192.168.30.1', '2020-11-17 16:51:26');
INSERT INTO `sys_loginfo` VALUES ('331', '超级管理员-system', '192.168.30.1', '2020-11-17 16:54:12');
INSERT INTO `sys_loginfo` VALUES ('332', '超级管理员-system', '192.168.30.1', '2020-11-17 16:55:45');
INSERT INTO `sys_loginfo` VALUES ('333', '超级管理员-system', '192.168.30.1', '2020-11-17 16:59:07');
INSERT INTO `sys_loginfo` VALUES ('334', '超级管理员-system', '192.168.30.1', '2020-11-17 17:04:45');
INSERT INTO `sys_loginfo` VALUES ('335', '超级管理员-system', '192.168.30.1', '2020-11-18 11:40:47');
INSERT INTO `sys_loginfo` VALUES ('336', '超级管理员-system', '192.168.30.1', '2020-11-18 12:12:37');
INSERT INTO `sys_loginfo` VALUES ('337', '超级管理员-system', '192.168.30.1', '2020-11-18 12:13:26');
INSERT INTO `sys_loginfo` VALUES ('338', '超级管理员-system', '192.168.30.1', '2020-11-18 12:35:00');
INSERT INTO `sys_loginfo` VALUES ('339', '超级管理员-system', '192.168.30.1', '2020-11-18 12:36:15');
INSERT INTO `sys_loginfo` VALUES ('340', '超级管理员-system', '192.168.30.1', '2020-11-18 12:38:45');
INSERT INTO `sys_loginfo` VALUES ('341', '超级管理员-system', '192.168.30.1', '2020-11-18 12:41:18');
INSERT INTO `sys_loginfo` VALUES ('342', '超级管理员-system', '192.168.30.1', '2020-11-18 13:58:14');
INSERT INTO `sys_loginfo` VALUES ('343', '超级管理员-system', '192.168.30.1', '2020-11-18 14:01:00');
INSERT INTO `sys_loginfo` VALUES ('344', '超级管理员-system', '192.168.30.1', '2020-11-18 14:03:40');
INSERT INTO `sys_loginfo` VALUES ('345', '超级管理员-system', '192.168.30.1', '2020-11-18 14:17:42');
INSERT INTO `sys_loginfo` VALUES ('346', '超级管理员-system', '192.168.30.1', '2020-11-18 14:20:11');
INSERT INTO `sys_loginfo` VALUES ('347', '超级管理员-system', '192.168.30.1', '2020-11-18 14:27:02');
INSERT INTO `sys_loginfo` VALUES ('348', '超级管理员-system', '192.168.30.1', '2020-11-18 14:47:27');
INSERT INTO `sys_loginfo` VALUES ('349', '超级管理员-system', '192.168.30.1', '2020-11-18 14:53:28');
INSERT INTO `sys_loginfo` VALUES ('350', '超级管理员-system', '192.168.30.1', '2020-11-18 14:54:08');
INSERT INTO `sys_loginfo` VALUES ('351', '超级管理员-system', '192.168.30.1', '2020-11-18 14:55:56');
INSERT INTO `sys_loginfo` VALUES ('352', '超级管理员-system', '192.168.30.1', '2020-11-18 14:57:25');
INSERT INTO `sys_loginfo` VALUES ('353', '超级管理员-system', '192.168.30.1', '2020-11-18 14:58:32');
INSERT INTO `sys_loginfo` VALUES ('354', '超级管理员-system', '192.168.30.1', '2020-11-18 14:59:31');
INSERT INTO `sys_loginfo` VALUES ('355', '超级管理员-system', '192.168.30.1', '2020-11-18 15:02:36');
INSERT INTO `sys_loginfo` VALUES ('356', '超级管理员-system', '192.168.30.1', '2020-11-19 15:00:59');
INSERT INTO `sys_loginfo` VALUES ('357', '超级管理员-system', '192.168.30.1', '2020-11-19 15:11:27');
INSERT INTO `sys_loginfo` VALUES ('358', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 15:13:45');
INSERT INTO `sys_loginfo` VALUES ('359', '超级管理员-system', '192.168.30.1', '2020-11-19 15:23:59');
INSERT INTO `sys_loginfo` VALUES ('360', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 15:30:26');
INSERT INTO `sys_loginfo` VALUES ('361', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:03:30');
INSERT INTO `sys_loginfo` VALUES ('362', '超级管理员-system', '192.168.30.1', '2020-11-19 16:14:32');
INSERT INTO `sys_loginfo` VALUES ('363', '超级管理员-system', '192.168.30.1', '2020-11-19 16:16:43');
INSERT INTO `sys_loginfo` VALUES ('364', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:24:18');
INSERT INTO `sys_loginfo` VALUES ('365', '超级管理员-system', '192.168.30.1', '2020-11-19 16:30:39');
INSERT INTO `sys_loginfo` VALUES ('366', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:34:31');
INSERT INTO `sys_loginfo` VALUES ('367', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:38:00');
INSERT INTO `sys_loginfo` VALUES ('368', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:48:18');
INSERT INTO `sys_loginfo` VALUES ('369', 'wlp-wlp', '192.168.30.1', '2020-11-19 16:54:01');
INSERT INTO `sys_loginfo` VALUES ('370', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:54:24');
INSERT INTO `sys_loginfo` VALUES ('371', 'wlp-wlp', '192.168.30.1', '2020-11-19 16:54:43');
INSERT INTO `sys_loginfo` VALUES ('372', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 16:56:28');
INSERT INTO `sys_loginfo` VALUES ('373', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 17:03:30');
INSERT INTO `sys_loginfo` VALUES ('374', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 17:14:12');
INSERT INTO `sys_loginfo` VALUES ('375', '超级管理员-system', '192.168.30.1', '2020-11-19 17:19:04');
INSERT INTO `sys_loginfo` VALUES ('376', '超级管理员-system', '192.168.30.1', '2020-11-19 17:20:36');
INSERT INTO `sys_loginfo` VALUES ('377', '超级管理员-system', '192.168.30.1', '2020-11-19 17:22:26');
INSERT INTO `sys_loginfo` VALUES ('378', 'wlp-wlp', '192.168.30.1', '2020-11-19 17:23:09');
INSERT INTO `sys_loginfo` VALUES ('379', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 17:24:01');
INSERT INTO `sys_loginfo` VALUES ('380', 'wlp-wlp', '192.168.30.1', '2020-11-19 17:25:17');
INSERT INTO `sys_loginfo` VALUES ('381', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 17:35:08');
INSERT INTO `sys_loginfo` VALUES ('382', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 17:39:20');
INSERT INTO `sys_loginfo` VALUES ('383', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-19 23:49:10');
INSERT INTO `sys_loginfo` VALUES ('384', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:13:44');
INSERT INTO `sys_loginfo` VALUES ('385', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:14:35');
INSERT INTO `sys_loginfo` VALUES ('386', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:14:47');
INSERT INTO `sys_loginfo` VALUES ('387', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:15:07');
INSERT INTO `sys_loginfo` VALUES ('388', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:15:50');
INSERT INTO `sys_loginfo` VALUES ('389', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:16:46');
INSERT INTO `sys_loginfo` VALUES ('390', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:17:12');
INSERT INTO `sys_loginfo` VALUES ('391', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:18:00');
INSERT INTO `sys_loginfo` VALUES ('392', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:21:09');
INSERT INTO `sys_loginfo` VALUES ('393', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:24:24');
INSERT INTO `sys_loginfo` VALUES ('394', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:25:17');
INSERT INTO `sys_loginfo` VALUES ('395', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:00:32');
INSERT INTO `sys_loginfo` VALUES ('396', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:09:25');
INSERT INTO `sys_loginfo` VALUES ('397', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:13:50');
INSERT INTO `sys_loginfo` VALUES ('398', 'wlp-wlp', '192.168.30.1', '2020-11-20 12:14:46');
INSERT INTO `sys_loginfo` VALUES ('399', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:15:10');
INSERT INTO `sys_loginfo` VALUES ('400', 'wlp-wlp', '192.168.30.1', '2020-11-20 12:16:12');
INSERT INTO `sys_loginfo` VALUES ('401', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:17:09');
INSERT INTO `sys_loginfo` VALUES ('402', 'wlp-wlp', '192.168.30.1', '2020-11-20 12:37:40');
INSERT INTO `sys_loginfo` VALUES ('403', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 12:38:38');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('54', 'afds', 'dasf', '2020-03-08 03:48:47', '落亦-');
INSERT INTO `sys_notice` VALUES ('55', '测试', '测试', '2020-03-08 03:53:03', '落亦-');
INSERT INTO `sys_notice` VALUES ('56', 'sadf', 'asdf', '2020-03-08 04:17:44', '落亦-');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) DEFAULT NULL,
  `percode` varchar(255) DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '仓库管理系统', null, '&#xe68e;', '', '', '1', '1', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', 'menu', '基础管理', null, '&#xe857;', '', '', '0', '2', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', 'menu', '进货管理', null, '&#xe645;', '', null, '0', '3', '1');
INSERT INTO `sys_permission` VALUES ('4', '1', 'menu', '销售管理', null, '&#xe611;', '', '', '0', '4', '1');
INSERT INTO `sys_permission` VALUES ('5', '1', 'menu', '系统管理', null, '&#xe614;', '', '', '1', '5', '1');
INSERT INTO `sys_permission` VALUES ('6', '1', 'menu', '其它管理', null, '&#xe628;', '', '', '0', '6', '1');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '客户管理', null, '&#xe651;', '/bus/toCustomerManager', '', '0', '7', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', 'menu', '供应商管理', null, '&#xe658;', '/bus/toProviderManager', '', '0', '8', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', 'menu', '商品管理', null, '&#xe657;', '/bus/toGoodsManager', '', '0', '9', '1');
INSERT INTO `sys_permission` VALUES ('10', '3', 'menu', '商品进货', null, '&#xe756;', '/bus/toInportManager', '', '0', '10', '1');
INSERT INTO `sys_permission` VALUES ('11', '3', 'menu', '商品退货查询', null, '&#xe65a;', '/bus/toOutportManager', '', '0', '11', '1');
INSERT INTO `sys_permission` VALUES ('12', '4', 'menu', '商品销售', null, '&#xe65b;', '/bus/toSalesManager', '', '0', '12', '1');
INSERT INTO `sys_permission` VALUES ('13', '4', 'menu', '销售退货查询', null, '&#xe770;', '/bus/toSalesbackManager', '', '0', '13', '1');
INSERT INTO `sys_permission` VALUES ('14', '5', 'menu', '店铺管理', null, '&#xe770;', '/sys/toTenantManager', '', '0', '14', '1');
INSERT INTO `sys_permission` VALUES ('15', '5', 'menu', '菜单管理', null, '&#xe663;', '/sys/toMenuManager', '', '0', '15', '1');
INSERT INTO `sys_permission` VALUES ('16', '5', 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', '0', '16', '1');
INSERT INTO `sys_permission` VALUES ('17', '5', 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', '0', '17', '1');
INSERT INTO `sys_permission` VALUES ('18', '5', 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', '0', '18', '1');
INSERT INTO `sys_permission` VALUES ('21', '6', 'menu', '登陆日志', null, '&#xe675;', '/sys/toLoginfoManager', '', '0', '21', '1');
INSERT INTO `sys_permission` VALUES ('22', '6', 'menu', '系统公告', null, '&#xe756;', '/sys/toNoticeManager', null, '0', '22', '1');
INSERT INTO `sys_permission` VALUES ('23', '6', 'menu', '图标管理', null, '&#xe670;', '../resources/page/icon.html', null, '0', '23', '1');
INSERT INTO `sys_permission` VALUES ('30', '14', 'permission', '添加店铺', 'tenant:create', '', null, null, '0', '24', '1');
INSERT INTO `sys_permission` VALUES ('31', '14', 'permission', '修改店铺', 'tenant:update', '', null, null, '0', '26', '1');
INSERT INTO `sys_permission` VALUES ('32', '14', 'permission', '删除店铺', 'tenant:delete', '', null, null, '0', '27', '1');
INSERT INTO `sys_permission` VALUES ('34', '15', 'permission', '添加菜单', 'menu:create', '', '', '', '0', '29', '1');
INSERT INTO `sys_permission` VALUES ('35', '15', 'permission', '修改菜单', 'menu:update', '', null, null, '0', '30', '1');
INSERT INTO `sys_permission` VALUES ('36', '15', 'permission', '删除菜单', 'menu:delete', '', null, null, '0', '31', '1');
INSERT INTO `sys_permission` VALUES ('38', '16', 'permission', '添加权限', 'permission:create', '', null, null, '0', '33', '1');
INSERT INTO `sys_permission` VALUES ('39', '16', 'permission', '修改权限', 'permission:update', '', null, null, '0', '34', '1');
INSERT INTO `sys_permission` VALUES ('40', '16', 'permission', '删除权限', 'permission:delete', '', null, null, '0', '35', '1');
INSERT INTO `sys_permission` VALUES ('42', '17', 'permission', '添加角色', 'role:create', '', null, null, '0', '37', '1');
INSERT INTO `sys_permission` VALUES ('43', '17', 'permission', '修改角色', 'role:update', '', null, null, '0', '38', '1');
INSERT INTO `sys_permission` VALUES ('44', '17', 'permission', '删除角色', 'role:delete', '', null, null, '0', '39', '1');
INSERT INTO `sys_permission` VALUES ('46', '17', 'permission', '分配权限', 'role:selectPermission', '', null, null, '0', '41', '1');
INSERT INTO `sys_permission` VALUES ('47', '18', 'permission', '添加用户', 'user:create', '', null, null, '0', '42', '1');
INSERT INTO `sys_permission` VALUES ('48', '18', 'permission', '修改用户', 'user:update', '', null, null, '0', '43', '1');
INSERT INTO `sys_permission` VALUES ('49', '18', 'permission', '删除用户', 'user:delete', '', null, null, '0', '44', '1');
INSERT INTO `sys_permission` VALUES ('51', '18', 'permission', '用户分配角色', 'user:selectRole', '', null, null, '0', '46', '1');
INSERT INTO `sys_permission` VALUES ('52', '18', 'permission', '重置密码', 'user:resetPwd', null, null, null, '0', '47', '1');
INSERT INTO `sys_permission` VALUES ('53', '14', 'permission', '店铺查询', 'tenant:view', null, null, null, '0', '48', '1');
INSERT INTO `sys_permission` VALUES ('54', '15', 'permission', '菜单查询', 'menu:view', null, null, null, '0', '49', '1');
INSERT INTO `sys_permission` VALUES ('55', '16', 'permission', '权限查询', 'permission:view', null, null, null, '0', '50', '1');
INSERT INTO `sys_permission` VALUES ('56', '17', 'permission', '角色查询', 'role:view', null, null, null, '0', '51', '1');
INSERT INTO `sys_permission` VALUES ('57', '18', 'permission', '用户查询', 'user:view', null, null, null, '0', '52', '1');
INSERT INTO `sys_permission` VALUES ('68', '7', 'permission', '客户查询', 'customer:view', null, null, null, null, '60', '1');
INSERT INTO `sys_permission` VALUES ('69', '7', 'permission', '客户添加', 'customer:create', null, null, null, null, '61', '1');
INSERT INTO `sys_permission` VALUES ('70', '7', 'permission', '客户修改', 'customer:update', null, null, null, null, '62', '1');
INSERT INTO `sys_permission` VALUES ('71', '7', 'permission', '客户删除', 'customer:delete', null, null, null, null, '63', '1');
INSERT INTO `sys_permission` VALUES ('73', '21', 'permission', '日志查询', 'info:view', null, null, null, null, '65', '1');
INSERT INTO `sys_permission` VALUES ('74', '21', 'permission', '日志删除', 'info:delete', null, null, null, null, '66', '1');
INSERT INTO `sys_permission` VALUES ('75', '21', 'permission', '日志批量删除', 'info:batchdelete', null, null, null, null, '67', '1');
INSERT INTO `sys_permission` VALUES ('76', '22', 'permission', '公告查询', 'notice:view', null, null, null, null, '68', '1');
INSERT INTO `sys_permission` VALUES ('77', '22', 'permission', '公告添加', 'notice:create', null, null, null, null, '69', '1');
INSERT INTO `sys_permission` VALUES ('78', '22', 'permission', '公告修改', 'notice:update', null, null, null, null, '70', '1');
INSERT INTO `sys_permission` VALUES ('79', '22', 'permission', '公告删除', 'notice:delete', null, null, null, null, '71', '1');
INSERT INTO `sys_permission` VALUES ('81', '8', 'permission', '供应商查询', 'provider:view', null, null, null, null, '73', '1');
INSERT INTO `sys_permission` VALUES ('82', '8', 'permission', '供应商添加', 'provider:create', null, null, null, null, '74', '1');
INSERT INTO `sys_permission` VALUES ('83', '8', 'permission', '供应商修改', 'provider:update', null, null, null, null, '75', '1');
INSERT INTO `sys_permission` VALUES ('84', '8', 'permission', '供应商删除', 'provider:delete', null, null, null, null, '76', '1');
INSERT INTO `sys_permission` VALUES ('86', '22', 'permission', '公告查看', 'notice:viewnotice', null, null, null, null, '78', '1');
INSERT INTO `sys_permission` VALUES ('91', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '79', '1');
INSERT INTO `sys_permission` VALUES ('92', '9', 'permission', '商品添加', 'goods:create', null, null, null, '0', '80', '1');
INSERT INTO `sys_permission` VALUES ('116', '9', 'permission', '商品删除', 'goods:delete', null, null, null, '0', '84', '1');
INSERT INTO `sys_permission` VALUES ('117', '9', 'permission', '商品修改', 'goods:update', null, null, null, '0', '85', '1');
INSERT INTO `sys_permission` VALUES ('118', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '86', '1');
INSERT INTO `sys_permission` VALUES ('119', '22', 'permission', '公告批量删除', 'notice:batchdelete', null, null, null, '0', '87', '1');
INSERT INTO `sys_permission` VALUES ('122', '6', 'menu', '缓存管理', null, '&#xe630', '/sys/toCacheManager', '_black', '1', '88', '1');
INSERT INTO `sys_permission` VALUES ('123', '122', 'permission', '同步缓存', 'cache:syncCache', null, null, null, '0', '89', '1');
INSERT INTO `sys_permission` VALUES ('124', '122', 'permission', '清空缓存', 'cache:removeAllCache', null, null, null, '0', '90', '1');
INSERT INTO `sys_permission` VALUES ('126', '1', 'menu', '物流管理', null, '&#xe715;', '', '', '0', '91', '1');
INSERT INTO `sys_permission` VALUES ('127', '126', 'menu', '物流基础信息管理', null, '&#xe716;', '/bus/toLogisticsBase', '', '1', '92', '1');
INSERT INTO `sys_permission` VALUES ('128', '127', 'permission', '物流添加', 'logisticsBase:create', null, null, null, '0', '93', '1');
INSERT INTO `sys_permission` VALUES ('129', '127', 'permission', '物流编辑', 'logisticsBase:update', null, null, null, '0', '94', '1');
INSERT INTO `sys_permission` VALUES ('130', '127', 'permission', '物流删除', 'logisticsBase:delete', null, null, null, '0', '95', '1');
INSERT INTO `sys_permission` VALUES ('131', '10', 'permission', '添加进货', 'inport:create', null, null, null, '0', '96', '1');
INSERT INTO `sys_permission` VALUES ('132', '10', 'permission', '编辑进货', 'inport:update', null, null, null, '0', '97', '1');
INSERT INTO `sys_permission` VALUES ('133', '10', 'permission', '删除进货信息', 'inport:delete', null, null, null, '0', '98', '1');
INSERT INTO `sys_permission` VALUES ('134', '10', 'permission', '退货', 'inport:back', null, null, null, '0', '99', '1');
INSERT INTO `sys_permission` VALUES ('135', '11', 'permission', '删除退货信息', 'outport:delete', null, null, null, '0', '100', '1');
INSERT INTO `sys_permission` VALUES ('136', '13', 'permission', '删除客户退货信息', 'salesback:delete', null, null, null, '0', '101', '1');
INSERT INTO `sys_permission` VALUES ('137', '12', 'permission', '添加销售信息', 'sales:create', null, null, null, '0', '102', '1');
INSERT INTO `sys_permission` VALUES ('138', '12', 'permission', '编辑销售信息', 'sales:update', null, null, null, '0', '103', '1');
INSERT INTO `sys_permission` VALUES ('139', '12', 'permission', '删除销售信息', 'sales:delete', null, null, null, '0', '104', '1');
INSERT INTO `sys_permission` VALUES ('140', '12', 'permission', '退货', 'sales:back', null, null, null, '0', '105', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('12', '店铺管理员', '用来管理店铺信息', '1', '2020-11-19 17:46:22');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`) USING BTREE,
  KEY `sys_role_permission_ibfk_1` (`pid`) USING BTREE,
  KEY `sys_role_permission_ibfk_2` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('12', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('12', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3');
INSERT INTO `sys_role_permission` VALUES ('12', '3');
INSERT INTO `sys_role_permission` VALUES ('1', '4');
INSERT INTO `sys_role_permission` VALUES ('12', '4');
INSERT INTO `sys_role_permission` VALUES ('1', '5');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('12', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('12', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('12', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('12', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('12', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('12', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('12', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '30');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '32');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '42');
INSERT INTO `sys_role_permission` VALUES ('1', '43');
INSERT INTO `sys_role_permission` VALUES ('1', '44');
INSERT INTO `sys_role_permission` VALUES ('1', '46');
INSERT INTO `sys_role_permission` VALUES ('1', '47');
INSERT INTO `sys_role_permission` VALUES ('1', '48');
INSERT INTO `sys_role_permission` VALUES ('1', '49');
INSERT INTO `sys_role_permission` VALUES ('1', '51');
INSERT INTO `sys_role_permission` VALUES ('1', '52');
INSERT INTO `sys_role_permission` VALUES ('1', '53');
INSERT INTO `sys_role_permission` VALUES ('1', '54');
INSERT INTO `sys_role_permission` VALUES ('1', '55');
INSERT INTO `sys_role_permission` VALUES ('1', '56');
INSERT INTO `sys_role_permission` VALUES ('1', '57');
INSERT INTO `sys_role_permission` VALUES ('1', '68');
INSERT INTO `sys_role_permission` VALUES ('12', '68');
INSERT INTO `sys_role_permission` VALUES ('1', '69');
INSERT INTO `sys_role_permission` VALUES ('12', '69');
INSERT INTO `sys_role_permission` VALUES ('1', '70');
INSERT INTO `sys_role_permission` VALUES ('12', '70');
INSERT INTO `sys_role_permission` VALUES ('1', '71');
INSERT INTO `sys_role_permission` VALUES ('12', '71');
INSERT INTO `sys_role_permission` VALUES ('1', '73');
INSERT INTO `sys_role_permission` VALUES ('1', '74');
INSERT INTO `sys_role_permission` VALUES ('1', '75');
INSERT INTO `sys_role_permission` VALUES ('1', '76');
INSERT INTO `sys_role_permission` VALUES ('1', '77');
INSERT INTO `sys_role_permission` VALUES ('1', '78');
INSERT INTO `sys_role_permission` VALUES ('1', '79');
INSERT INTO `sys_role_permission` VALUES ('1', '81');
INSERT INTO `sys_role_permission` VALUES ('12', '81');
INSERT INTO `sys_role_permission` VALUES ('1', '82');
INSERT INTO `sys_role_permission` VALUES ('12', '82');
INSERT INTO `sys_role_permission` VALUES ('1', '83');
INSERT INTO `sys_role_permission` VALUES ('12', '83');
INSERT INTO `sys_role_permission` VALUES ('1', '84');
INSERT INTO `sys_role_permission` VALUES ('12', '84');
INSERT INTO `sys_role_permission` VALUES ('1', '86');
INSERT INTO `sys_role_permission` VALUES ('1', '91');
INSERT INTO `sys_role_permission` VALUES ('12', '91');
INSERT INTO `sys_role_permission` VALUES ('1', '92');
INSERT INTO `sys_role_permission` VALUES ('12', '92');
INSERT INTO `sys_role_permission` VALUES ('1', '116');
INSERT INTO `sys_role_permission` VALUES ('12', '116');
INSERT INTO `sys_role_permission` VALUES ('1', '117');
INSERT INTO `sys_role_permission` VALUES ('12', '117');
INSERT INTO `sys_role_permission` VALUES ('1', '118');
INSERT INTO `sys_role_permission` VALUES ('12', '118');
INSERT INTO `sys_role_permission` VALUES ('12', '126');
INSERT INTO `sys_role_permission` VALUES ('12', '127');
INSERT INTO `sys_role_permission` VALUES ('12', '128');
INSERT INTO `sys_role_permission` VALUES ('12', '129');
INSERT INTO `sys_role_permission` VALUES ('12', '130');
INSERT INTO `sys_role_permission` VALUES ('12', '131');
INSERT INTO `sys_role_permission` VALUES ('12', '132');
INSERT INTO `sys_role_permission` VALUES ('12', '133');
INSERT INTO `sys_role_permission` VALUES ('12', '134');
INSERT INTO `sys_role_permission` VALUES ('12', '135');
INSERT INTO `sys_role_permission` VALUES ('12', '136');
INSERT INTO `sys_role_permission` VALUES ('12', '137');
INSERT INTO `sys_role_permission` VALUES ('12', '138');
INSERT INTO `sys_role_permission` VALUES ('12', '139');
INSERT INTO `sys_role_permission` VALUES ('12', '140');

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调试显示顺序】',
  `createtime` datetime DEFAULT NULL,
  `phone` varchar(56) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES ('21', '好运来家纺', '租户管理员', '郑州', '1', '1', '2020-11-19 17:43:38', '12345678911');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录名称',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `hiredate` datetime DEFAULT NULL,
  `available` int(11) DEFAULT '1' COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员，1管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sys_user_loginname` (`loginname`) USING BTREE COMMENT '登陆名称唯一',
  KEY `FK_sys_dept_sys_user` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'system', '532ac00e86893901af5f0be6b704dbc7', '银河系', '1', '超级管理员', '0', '2018-06-25 11:06:34', '1', '1', '0', '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('2', '冰镇土笋冻', 'wll', '532ac00e86893901af5f0be6b704dbc7', '郑州', '1', '超级管理员', '0', '2019-11-23 20:52:16', '1', '2', '0', '2020-03-08/0F8C9E01C1DF4A60BB0E2747F67D03BF.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('23', 'wlp', 'wlp', 'd590d20435ed2a7ff7fbff4ebbd329fd', '郑州', '1', '租户管理员', '21', '2020-11-19 17:44:20', '1', '1', '1', '/images/defaultUserTitle.jpg', '982D52A4C42E428BAB9FB911E85A4568');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE,
  KEY `FK_sys_user_role_1` (`rid`) USING BTREE,
  CONSTRAINT `FK_sys_user_role_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_sys_user_role_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('23', '12');
