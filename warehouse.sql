/*
Navicat MySQL Data Transfer

Source Server         : 192.168.158.138
Source Server Version : 50732
Source Host           : 192.168.158.138:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2020-11-21 10:27:52
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
  `tenant_id` int(11) DEFAULT NULL COMMENT '商铺（租户）ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张布艺', '商丘', '15279230588', '1', '1', '1');
INSERT INTO `bus_customer` VALUES ('2', '小丽布艺', '南阳', '13064154936', '1', '2', '1');
INSERT INTO `bus_customer` VALUES ('3', '小红布艺', '心想', '13617020687', '1', '2', '1');
INSERT INTO `bus_customer` VALUES ('4', '一帘幽梦', '十里大道1039号', '13648524759', '1', '3', '1');

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
  `tenant_id` int(11) DEFAULT NULL COMMENT '商铺（租户）ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_logistics_base
-- ----------------------------
INSERT INTO `bus_logistics_base` VALUES ('1', '达发物流', '陕县,开封', '15290865083', '1', '10.00', '1');
INSERT INTO `bus_logistics_base` VALUES ('2', '创新物流', '商丘,民权', '15290865084', '1', '10.00', '1');
INSERT INTO `bus_logistics_base` VALUES ('3', '安利物流', '新郑,开封', '15290865085', '1', '10.50', '1');
INSERT INTO `bus_logistics_base` VALUES ('12', '方圆物流', '开封', '123456', '1', '10.00', '1');
INSERT INTO `bus_logistics_base` VALUES ('13', '浩宇物流', '浙江', '1256489', '2', '80.00', '1');
INSERT INTO `bus_logistics_base` VALUES ('14', '测试物流', '银河系', '123456', '1', '96.00', '0');

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
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户（店铺）ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '仙桃', '0728-4124312', '中国农业银行', '654124345131', '12312321@sina.com', '1', '0');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '汉川', '0728-4124312', '中国农业银行', '654124345131', '12312321@sina.com', '1', '0');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '杭州', '0790-362514856', '建设银行', '512314141541', '12312321@sina.com', '1', '0');
INSERT INTO `bus_provider` VALUES ('4', '蒙牛集团', '内蒙古', '0790-362514856', '中国银行', '36214587962509', '13617252689@163.com', '1', '0');
INSERT INTO `bus_provider` VALUES ('5', '伊利集团', '内蒙古', '0792-36548569', '建设银行', '3621458963596509', '13698560566@163.com', '1', '0');
INSERT INTO `bus_provider` VALUES ('13', '彩云布艺', '浙江', '123456789', '杭州工行', '123456789456789', 'www@163.com', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('1', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:16:46');
INSERT INTO `sys_loginfo` VALUES ('2', 'wlp-wlp', '192.168.30.1', '2020-11-20 00:17:12');
INSERT INTO `sys_loginfo` VALUES ('3', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 00:18:00');
INSERT INTO `sys_loginfo` VALUES ('404', 'wlp-wlp', '192.168.30.1', '2020-11-20 13:37:54');
INSERT INTO `sys_loginfo` VALUES ('405', '冰镇土笋冻-wll', '192.168.30.1', '2020-11-20 13:38:36');
INSERT INTO `sys_loginfo` VALUES ('406', 'wlp-wlp', '192.168.30.1', '2020-11-20 14:03:21');
INSERT INTO `sys_loginfo` VALUES ('407', 'wlp-wlp', '192.168.30.1', '2020-11-20 14:27:43');
INSERT INTO `sys_loginfo` VALUES ('408', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-20 14:29:31');
INSERT INTO `sys_loginfo` VALUES ('409', 'wlp-wlp', '0:0:0:0:0:0:0:1', '2020-11-20 14:35:48');
INSERT INTO `sys_loginfo` VALUES ('410', 'wlp-wlp', '0:0:0:0:0:0:0:1', '2020-11-21 02:26:44');

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
INSERT INTO `sys_notice` VALUES ('1', '测试', '测试', '2020-03-08 03:53:03', '冰镇土笋冻');
INSERT INTO `sys_notice` VALUES ('2', 'sadf', 'asdf', '2020-03-08 04:17:44', '冰镇土笋冻');

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
INSERT INTO `sys_tenant` VALUES ('1', '好运来家纺', '租户管理员', '郑州', '1', '1', '2020-11-19 17:43:38', '12345678911');

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
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户(店铺)ID',
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
INSERT INTO `sys_user` VALUES ('23', 'wlp', 'wlp', 'd590d20435ed2a7ff7fbff4ebbd329fd', '郑州', '1', '租户管理员', '1', '2020-11-19 17:44:20', '1', '1', '1', '/images/defaultUserTitle.jpg', '982D52A4C42E428BAB9FB911E85A4568');

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
