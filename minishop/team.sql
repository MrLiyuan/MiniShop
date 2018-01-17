/*
Navicat MySQL Data Transfer

Source Server         : DB
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : team

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-17 14:35:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `a_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `a_name` varchar(32) NOT NULL COMMENT '收件人姓名',
  `a_phone` varchar(32) NOT NULL COMMENT '收件人手机号',
  `a_address1` varchar(64) NOT NULL COMMENT '所在地',
  `a_address2` varchar(128) NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `b_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '买家编号',
  `b_sex` int(1) DEFAULT '2' COMMENT '买家性别',
  `b_name` varchar(32) DEFAULT NULL COMMENT '买家昵称',
  `b_phone` varchar(32) DEFAULT NULL COMMENT '买家电话号',
  `b_email` varchar(128) DEFAULT NULL COMMENT '买家邮箱',
  `b_password` varchar(128) NOT NULL COMMENT '买家密码',
  `b_shopcart` varchar(128) DEFAULT NULL COMMENT '购物车编号集',
  `b_history` varchar(128) DEFAULT NULL COMMENT '历史订单',
  `b_icon` varchar(64) DEFAULT NULL COMMENT '买家头像',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('1', '1', '李源', '15849222770', '15849222770@163.com', '/NEGR3o+Y0awQ5+y/WnSig==', '1,2,2', '1,2', '666.jpg');
INSERT INTO `buyer` VALUES ('2', '1', '小明', '12345671234', '1183920307@qq.com', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('4', '2', '于传浩', '15247120000', 'yuchuanhao@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('5', '2', '骆奇峰', '15247120001', 'luoqifeng@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('6', '2', '于潇跃', '15247120002', 'yuxiaoyue@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('7', '2', '苏德', '15247120003', 'sude@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('9', '2', '小钱', '15247120005', 'xiaoqian@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('10', '2', '小孙', '15247120006', 'xiaosun@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('11', '2', '小李', '15247120007', 'xiaoli@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('12', '2', '小周', '15247120008', 'xiaozhou@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('13', '2', '小吴', '15247120009', 'xiaowu@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('14', '2', '小郑', '15247120010', 'xiaozheng@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('15', '2', '小王', '15247120011', 'xiaowang@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('16', '2', '小刘', '15247120012', 'xiaoliu@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('17', '2', '小峰', '15247120013', 'xiaofeng@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('18', '2', '小史', '15247120014', 'xiaoshi@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('19', '2', '小明', '15247120015', 'xiaoming@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);
INSERT INTO `buyer` VALUES ('20', '2', '小富', '15247120016', 'xiaofu@cc.cc', '/NEGR3o+Y0awQ5+y/WnSig==', null, null, null);

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `g_name` varchar(32) NOT NULL COMMENT '商品名称',
  `g_price` double(10,2) NOT NULL COMMENT '商品价格',
  `g_introduce` varchar(256) NOT NULL COMMENT '商品介绍',
  `g_surplus` int(5) NOT NULL COMMENT '商品库存量',
  `g_sales` int(5) NOT NULL COMMENT '商品销售量',
  `g_address` varchar(128) NOT NULL COMMENT '商品地址',
  `g_clas` varchar(32) NOT NULL COMMENT '商品类别',
  `g_imgs` varchar(256) NOT NULL COMMENT '商品图片集',
  `g_explain` text NOT NULL COMMENT '商品说明',
  `g_state` int(2) NOT NULL COMMENT '商品状态',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '坚果', '23.40', '坚果是坚果的坚，果是坚果的果', '100', '20', '美国', '食物类', '02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('4', '坚果', '23.40', '坚果是坚果的坚，果是坚果的果', '100', '20', '美国', '食物类', '02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('5', '坚果', '23.40', '坚果是坚果的坚，果是坚果的果', '100', '20', '美国', '食物类', '02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('6', '坚果', '23.40', '坚果是坚果的坚，果是坚果的果', '100', '20', '美国', '食物类', '02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('7', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', 'k02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('8', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', 'k03.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('9', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('10', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('11', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('12', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('13', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('14', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('15', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('16', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('17', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('18', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('19', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('20', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('21', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('22', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('23', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p008.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('24', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p009.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('25', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p010.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('26', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p011.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('27', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p012.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('28', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p013.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('29', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('30', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('31', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('32', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('33', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('34', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('35', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('36', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('37', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('38', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('39', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('40', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('41', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('42', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('43', '坚果', '23.40', '美味坚果，纯天然，无污染', '100', '20', '北京', '食物类', 'k01.jpgx,y,z', 'xxx', '0');
INSERT INTO `goods` VALUES ('44', '坚果', '23.40', '美味坚果，纯天然，无污染', '100', '20', '北京', '食物类', 'k01.jpgx,y,z', 'xxx', '0');
INSERT INTO `goods` VALUES ('45', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', 'k02.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('46', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', 'k03.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('47', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('48', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('49', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('50', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('51', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('52', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('53', '坚果', '23.40', '美味坚果，纯天，无污染', '100', '20', '北京', '食物类', '007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('54', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('55', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('56', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('57', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('58', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('59', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('60', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('61', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p008.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('62', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p009.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('63', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p010.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('64', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p011.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('65', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p012.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('66', '手机', '5488.00', '流畅无卡顿，超长待机', '50', '10', '北京', '数码类', 'p013.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('67', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('68', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('69', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('70', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('71', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('72', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('73', '洁面乳', '49.90', '洁面润肤，干爽，清凉', '40', '5', '北京', '化妆品类', 'h007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('74', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca001.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('75', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca002.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('76', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'ca003.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('77', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c004.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('78', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c005.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('79', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c006.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('80', '羽绒服', '499.00', '冬天不再寒冷，温暖舒适', '60', '40', '北京', '衣服类', 'c007.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('81', '实木黑胡桃红橡极简组合书架', '2180.00', '小户型多功能 北欧日式', '200', '60', '中国浙江', '家具类', '101.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('82', '美式床实木床简欧床欧式床双人床', '8280.00', '1.8米复古主卧风格家具奢华婚床', '1800', '42', '中国上海', '家具类', '102.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('83', '北欧茶几简约现代', '1248.00', '客厅储物小户型胡桃木色长方形实木铁艺茶台桌', '2808', '32', '中国广东', '家具类', '103.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('84', '北欧现代小户型客厅整装家具布艺迷你沙发单人双人三人组合小沙发', '380.00', '小户型多功能 北欧现式', '9571', '546', '加拿大温哥华', '家具类', '104.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('85', '全实木中式乌金木原木床1.8米气压高箱储物床主卧室家具双人婚床', '5280.00', '全中式', '8051', '5421', '中国江苏', '家具类', '105.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('86', '美式乡村复古实木斗柜地中海田园玄关柜卧室储物柜彩绘香杉木家具', '1359.00', '小户型多功能', '801', '514', '中国福建', '家具类', '106.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('87', '欧式大理石茶几电视柜组合客厅套装家具抽屉茶桌美式实木复古茶几', '1980.00', '小户型多功能 北欧风格', '60', '44', '美国华盛顿', '家具类', '107.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('88', '木墨MUMO 不折椅 实木餐椅 ', '225.00', '红橡木黑胡桃木餐椅 简约全实木家具', '500', '60', '中国新疆', '家具类', '108.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('89', '饼干床儿童床', '4980.00', '白蜡实木木蜡油1.21.5米原创设计包邮入户', '600', '40', '中国黑龙江', '家具类', '109.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('90', '日本原装进口二手雅马哈', '4950.00', '具有较高的性价比，全实木制做，音质，手感好', '450', '30', '日本东京', '乐器类', '111.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('91', '钢琴家用英昌U3韩国进口forest', '5920.00', '儿童初学成人练习考级二手钢琴立式', '666', '66', '中国呼和浩特', '乐器类', '112.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('92', '卡斯摩38寸吉他民谣吉他木吉他', '156.00', '初学者入门练习吉它学生男女乐器', '600', '546', '中国呼和浩特', '乐器类', '113.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('93', '安德鲁尤克里里23寸初学者尤克里里21寸小吉他', '154.00', '26寸黑色乌克丽丽', '1540', '145', '中国北京', '乐器类', '114.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('94', '二胡乐器学生成人初学通用', '120.00', '适合初学者，舞台道具', '450', '50', '中国江苏', '乐器类', '115.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('95', '苏州专业老红木二胡', '908.00', '成人演奏', '800', '664', '中国广东', '乐器类', '116.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('96', '浮雕楠木全实木整张梧桐木', '1560.00', '扬州古筝初学者 汉唐遗韵', '45', '6', '中国江西', '乐器类', '117.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('97', '然虎纹大提琴', '1458.00', '鑫音手工实木成人儿童初学者考级练习', '5686', '566', '中国西藏', '乐器类', '118.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('98', '彩色大提琴 哑光 白色 亮光 黑色 大提琴高档乐器', '554.00', '初学练习大提琴', '650', '125', '中国南京', '乐器类', '119.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('99', '真皮单肩小包包', '468.00', '新款潮中年妈妈包', '400', '66', '中国台湾', '箱包类', '131.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('100', '牛皮真皮磨砂皮单肩包', '198.00', '时尚潮流女包大包', '456', '80', '中国台湾', '箱包类', '132.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('101', '尼龙斜跨包帆布单肩斜挎包', '68.00', '牛津布旅游跨包轻便妈妈包女包', '400', '156', '中国江西', '箱包类', '133.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('102', '尼龙牛津布配牛皮铆钉双肩包', '109.00', '韩版百搭旅行背包书包', '1000', '660', '中国山西', '箱包类', '134.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('103', '时尚鲨鱼包运动双肩包', '139.00', '韩版休闲旅行背包', '3992', '8', '中国浙江', '箱包类', '135.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('104', '复古休闲旅行背包学生书包', '145.00', '文艺范帆布包女包潮包双肩大包', '600', '68', '中国江西', '箱包类', '136.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('105', ' 双肩包女士三用帆布旅行包', '264.00', '日系风书包休闲包包', '500', '146', '中国江苏', '箱包类', '137.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('106', '真皮拼帆布包女单肩双肩包', '236.00', '韩版潮时尚休闲女包大包包', '450', '135', '美国华盛顿', '箱包类', '138.jpg', 'xxx', '0');
INSERT INTO `goods` VALUES ('107', '铝框行李箱拉杆箱男女旅行箱', '240.00', '复古英伦风硬登机密码箱', '1150', '865', '中国内蒙', '箱包类', '139.jpg', 'xxx', '0');

-- ----------------------------
-- Table structure for `goodsclass`
-- ----------------------------
DROP TABLE IF EXISTS `goodsclass`;
CREATE TABLE `goodsclass` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `img` varchar(32) NOT NULL,
  `pro` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsclass
-- ----------------------------
INSERT INTO `goodsclass` VALUES ('1', '食物', 'home001.jpg', '美味的食物');
INSERT INTO `goodsclass` VALUES ('2', '数码', 'home002.jpg', '智能的数码设备');
INSERT INTO `goodsclass` VALUES ('3', '化妆品', 'home003.jpg', '好吃的口红');
INSERT INTO `goodsclass` VALUES ('4', '衣服', 'home004.jpg', '漂亮的衣服');
INSERT INTO `goodsclass` VALUES ('5', '家具', 'home005.jpg', '比我高的家具');
INSERT INTO `goodsclass` VALUES ('6', '乐器', 'home006.jpg', '滴滴答答。。。');
INSERT INTO `goodsclass` VALUES ('7', '箱包', 'home007.jpg', '大包小包');

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `i_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `i_buyer_info` int(11) NOT NULL COMMENT '买家地址',
  `i_goodsnum` int(5) NOT NULL,
  `i_goods_id` int(11) NOT NULL,
  `i_totalprice` double(10,2) NOT NULL,
  `i_createtime` date NOT NULL COMMENT '创建时间',
  `i_outtime` date DEFAULT NULL COMMENT '发货时间',
  `i_isout` smallint(2) DEFAULT '0',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('2', '1', '3', '38', '1497.00', '2018-01-12', null, '1');
INSERT INTO `indent` VALUES ('5', '1', '1', '31', '49.90', '2018-01-15', null, '1');
INSERT INTO `indent` VALUES ('6', '1', '3', '36', '1497.00', '2018-01-15', null, '1');
INSERT INTO `indent` VALUES ('7', '1', '3', '37', '1497.00', '2018-01-15', null, '0');
INSERT INTO `indent` VALUES ('8', '1', '1', '42', '499.00', '2018-01-15', null, '0');
INSERT INTO `indent` VALUES ('12', '1', '1', '17', '5488.00', '2018-01-15', null, '0');
INSERT INTO `indent` VALUES ('14', '1', '1', '11', '23.40', '2018-01-15', null, '0');
INSERT INTO `indent` VALUES ('15', '1', '2', '4', '46.80', '2018-01-16', null, '0');
INSERT INTO `indent` VALUES ('16', '1', '1', '99', '468.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('17', '1', '1', '106', '236.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('18', '1', '1', '104', '145.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('19', '1', '1', '102', '109.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('20', '1', '1', '92', '156.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('21', '1', '1', '94', '120.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('22', '1', '1', '98', '554.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('23', '1', '1', '89', '4980.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('24', '1', '1', '99', '468.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('25', '1', '1', '100', '198.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('26', '1', '1', '101', '68.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('27', '1', '1', '92', '156.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('28', '1', '1', '94', '120.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('29', '1', '1', '98', '554.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('30', '2', '1', '103', '139.00', '2018-01-17', null, '0');
INSERT INTO `indent` VALUES ('31', '1', '1', '100', '198.00', '2018-01-17', null, '0');

-- ----------------------------
-- Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `s_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家编号',
  `s_name` varchar(32) NOT NULL COMMENT '卖家店铺名',
  `s_phone` varchar(32) NOT NULL COMMENT '卖家电话',
  `s_password` varchar(128) NOT NULL COMMENT '卖家密码',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', 'liyuan', '15849222770', '/NEGR3o+Y0awQ5+y/WnSig==');
INSERT INTO `seller` VALUES ('2', 'shepi', '13312341234', '+Y0awQ5+y/WnSig==');
INSERT INTO `seller` VALUES ('3', 'zhupi', '14412341234', '/NEGR3o+Y0awQ5+y/WnSig==');
