/*
 Navicat Premium Data Transfer

 Source Server         : house_sale
 Source Server Type    : MySQL
 Source Server Version : 50128
 Source Host           : localhost:3307
 Source Schema         : house_sale

 Target Server Type    : MySQL
 Target Server Version : 50128
 File Encoding         : 65001

 Date: 20/05/2023 22:11:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agent_info
-- ----------------------------
DROP TABLE IF EXISTS `agent_info`;
CREATE TABLE `agent_info`  (
  `agent_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中介人id',
  `agent_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中介人姓名',
  `agent_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中介人价值等级',
  `agent_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中介人成交等级',
  `phone` bigint(20) NULL DEFAULT NULL COMMENT '联系电话',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`agent_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_info
-- ----------------------------
INSERT INTO `agent_info` VALUES ('A001', '1', 'null', 'null', 1, '1', 2, '1', '男');

-- ----------------------------
-- Table structure for building_info
-- ----------------------------
DROP TABLE IF EXISTS `building_info`;
CREATE TABLE `building_info`  (
  `bd_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼房ID',
  `bd_no` int(5) NOT NULL COMMENT '楼号（几号楼）',
  `pre_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '所属楼盘ID',
  `unit_num` int(10) NOT NULL COMMENT '单元数',
  `floor_num` int(10) NOT NULL COMMENT '每单元楼层数',
  `area_covered` double(20, 0) NOT NULL COMMENT '占地面积(㎡)',
  `building_area` double(20, 0) NOT NULL COMMENT '建筑面积(㎡)',
  `household_num_perfloor` int(20) NOT NULL COMMENT '每层户数',
  `household_num_all` int(20) NOT NULL COMMENT '总户数',
  `car_num` int(20) NOT NULL COMMENT '车库数',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`bd_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for client2_info
-- ----------------------------
DROP TABLE IF EXISTS `client2_info`;
CREATE TABLE `client2_info`  (
  `client2_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client2_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client2_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` double(20, 0) NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client2_grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client2_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client2_info
-- ----------------------------
INSERT INTO `client2_info` VALUES ('c003', '美丽', '签订认购中', 'null', '001', '未定', '未赠送', 123, 'null', '', 'D');
INSERT INTO `client2_info` VALUES ('c002', '李华', '未回访', 'null', '123', '未定', '未赠送', 1234, 'null', '', 'B');
INSERT INTO `client2_info` VALUES ('c001', '何云帆', '未回访', 'null', '123', '未定', '未赠送', 18786998406, 'null', '', 'A');
INSERT INTO `client2_info` VALUES ('c005', '周锐', '签订认购中', 'null', '12', '90', '已赠送', 12, 'null', '2023-05-20', 'B');
INSERT INTO `client2_info` VALUES ('c006', '理想', '签订认购中', 'null', '12', '未定', '未赠送', 12, 'null', '', 'A');
INSERT INTO `client2_info` VALUES ('c007', '123', '未回访', 'null', '12', '未定', '未赠送', 12, 'null', '', 'C');
INSERT INTO `client2_info` VALUES ('c008', '黎明', '未回访', 'null', '11112222', '未定', 'null', 12345678788, 'null', '', 'C');
INSERT INTO `client2_info` VALUES ('c009', '1', '未回访', 'null', '1', '0', '已赠送', 1, 'null', '2023-05-20', 'C');

-- ----------------------------
-- Table structure for client_info
-- ----------------------------
DROP TABLE IF EXISTS `client_info`;
CREATE TABLE `client_info`  (
  `client_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '客户ID',
  `client_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '洽谈；已认购；已购买',
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责的置业顾问的员工ID',
  `client_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `phone` bigint(20) NULL DEFAULT NULL COMMENT '联系电话',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `motivation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购房动机',
  `work_unit` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `occupation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业/工作性质',
  `monthly_income` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '月收入',
  `pF_monthly_contribution` double(20, 0) NULL DEFAULT NULL COMMENT '公积金月缴额,“PF”经常作为“Provident Fund”',
  `pF_balance` double(20, 0) NULL DEFAULT NULL COMMENT '公积金余额',
  `existing_houses` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '已有房屋数',
  `considerations` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考虑因素',
  `hope_unit_price` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '期望单价(元)',
  `hope_price` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '期望房款(万元)',
  `hope_area` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '期望面积(㎡)',
  `hope_floor` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '期望楼层',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `amount_paid` double(20, 0) NULL DEFAULT NULL COMMENT '已付金额:定金，首付，分期的钱一旦到账了就往里加',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client_info
-- ----------------------------
INSERT INTO `client_info` VALUES ('c001', '未回访', '001', '何云帆', 18786998406, '123', '522100200509081216', '男', 21, '123', '没房', '北京', '学生', '10000以下', 1, 1, 01, '钱', '20000以下', '150~200', '110~125', '8~10', '1', 0);
INSERT INTO `client_info` VALUES ('c002', '签订认购中', '003', '李华', 1234, '123', '1234', '男', 12, '12', '没房', '外国', '老师', '10000以下', 12, 12, 02, '地段', '20000以下', '200~250', '110~125', '8~10', '12', 0);
INSERT INTO `client_info` VALUES ('c003', '洽谈中', '1', '美丽', 123, '001', '123', '女', 21, '1', '1', '1', '1', '10000~30000', 1, 1, 01, '1', '20000以下', '150~200', '90~110', '8~10', '1', 0);
INSERT INTO `client_info` VALUES ('c004', '未回访', '12', '王伟', 12, '12', '12', '男', 12, '12', '12', '12', '12', '30000~100000', 12, 12, 12, '12', '40000~60000', '200~250', '110~125', '10~12', '12', 0);
INSERT INTO `client_info` VALUES ('c005', '未回访', '12', '周锐', 12, '12', '12', '男', 12, '12', '12', '12', '12', '10000~30000', 12, 12, 12, '12', '40000~60000', '150~200', '110~125', '5~7', '1', 0);
INSERT INTO `client_info` VALUES ('c006', '未回访', '12', '理想', 12, '12', '12', '男', 12, '12', '12', '12', '12', '10000~30000', 12, 12, 12, '12', '40000~60000', '200~250', '110~125', '8~10', '', 0);
INSERT INTO `client_info` VALUES ('c007', '未回访', '12', '123', 12, '12', '12', '男', 12, '12', '12', '12', '12', '10000~30000', 12, 12, 12, '12', '40000~60000', '200~250', '110~125', '8~10', '', 0);
INSERT INTO `client_info` VALUES ('c008', '未回访', '007', '黎明', 12345678788, '11112222', '52210122222', '男', 42, '北京市海淀区', '投资', '北京科技大学', '老师', '10000~30000', 1000, 1000, 03, '位置', '60000以上', '1500以上', '125以上', '31~33', '', 0);
INSERT INTO `client_info` VALUES ('c009', '未回访', '1', '1', 1, '1', '1', '男', 1, '', '1', '', '', 'null', 0, 0, 01, '', 'null', 'null', 'null', 'null', '', 0);

-- ----------------------------
-- Table structure for gift_info
-- ----------------------------
DROP TABLE IF EXISTS `gift_info`;
CREATE TABLE `gift_info`  (
  `gift_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gift_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_num` int(10) NULL DEFAULT NULL,
  `gift_price` int(10) NULL DEFAULT NULL,
  `gift_grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_place` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`gift_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gift_info
-- ----------------------------
INSERT INTO `gift_info` VALUES ('c001', '1', 40, 1, '1', 'C区');

-- ----------------------------
-- Table structure for give_info
-- ----------------------------
DROP TABLE IF EXISTS `give_info`;
CREATE TABLE `give_info`  (
  `give_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_to` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `give_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_reason` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gift_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_price` int(10) NULL DEFAULT NULL,
  `gift_num` int(10) NULL DEFAULT NULL,
  `gift_rate` int(10) NULL DEFAULT NULL,
  `give_torate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`give_to`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of give_info
-- ----------------------------
INSERT INTO `give_info` VALUES ('c001', 'c001', '云帆', '客户', '中介人不定期赠送', '2023-05-16 03:17:21', '玉佩', 1000, 1, 1, 'A');
INSERT INTO `give_info` VALUES ('c006', NULL, '理想', '客户', '客户业务回馈', '2023-05-20 20:17:43', NULL, NULL, NULL, 3, 'A');
INSERT INTO `give_info` VALUES ('A001', NULL, '1', '中介人', '中介人定期赠送', '2023-05-20 20:16:05', NULL, NULL, NULL, 30, 'C');
INSERT INTO `give_info` VALUES ('c002', '8', '98', '中介人', '中介人定期赠送', '2023-05-20 19:54:40', '0', 789, 0, 8, 'B');

-- ----------------------------
-- Table structure for giverecord_info
-- ----------------------------
DROP TABLE IF EXISTS `giverecord_info`;
CREATE TABLE `giverecord_info`  (
  `give_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_to` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_reason` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_price` int(10) NULL DEFAULT NULL,
  `gift_num` int(10) NULL DEFAULT NULL,
  `gift_rate` int(10) NULL DEFAULT NULL,
  `give_torate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `give_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of giverecord_info
-- ----------------------------
INSERT INTO `giverecord_info` VALUES ('null', '001', '14', '中介人', '中介人定期赠送', '玉', 50, 20, 30, 'C', '2023-05-08 21:22:59');
INSERT INTO `giverecord_info` VALUES ('null', 'c001', '1', '客户', '中介人不定期赠送', '玉山', 1000, 1, 1, 'A', '2023-05-16 03:11:36');
INSERT INTO `giverecord_info` VALUES ('null', 'C001', '1', '客户', '中介人不定期赠送', '玉佩', 1000, 1, 1, 'A', '2023-05-16 03:15:09');
INSERT INTO `giverecord_info` VALUES ('null', '1', '1', '客户', '中介人不定期赠送', '1', 10, 1, 1, 'A', '2023-05-16 03:15:30');
INSERT INTO `giverecord_info` VALUES ('null', '005', '祥浩', '中介人', '中介人定期赠送', '羽扇', 200, 20, 30, 'C', '2023-05-20 19:35:45');
INSERT INTO `giverecord_info` VALUES ('null', '005', '周锐', '客户', '客户业务回馈', '玉石', 100, 20, 3, 'B', '2023-05-20 19:37:31');
INSERT INTO `giverecord_info` VALUES ('null', '005', '周锐', '客户', '客户业务回馈', '玉石', 100, 5, 3, 'B', '2023-05-20 19:42:54');
INSERT INTO `giverecord_info` VALUES ('null', '005', '周锐', '客户', '客户业务回馈', '玉山', 200, 2, 3, 'B', '2023-05-20 19:46:13');
INSERT INTO `giverecord_info` VALUES ('null', '1', '周锐', '客户', '客户业务回馈', '7', 90, 8, 3, 'B', '2023-05-20 19:48:20');
INSERT INTO `giverecord_info` VALUES ('null', 'c001', '1', '中介人', '中介人定期赠送', '1', 0, 5, 30, 'C', '2023-05-20 21:54:06');
INSERT INTO `giverecord_info` VALUES ('null', 'c001', '1', '中介人', '中介人定期赠送', '1', 12, 5, 30, 'C', '2023-05-20 21:56:07');
INSERT INTO `giverecord_info` VALUES ('null', 'c001', '1', '中介人', '中介人定期赠送', '', 34, 6, 30, 'C', '2023-05-20 22:00:12');
INSERT INTO `giverecord_info` VALUES ('null', '', '1', '中介人', '中介人定期赠送', '', 0, 21, 30, 'C', '2023-05-20 22:07:25');

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info`  (
  `house_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '房屋ID',
  `bd_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '所属楼房ID(几号楼)',
  `unit_no` int(10) NOT NULL COMMENT '单元号',
  `floor` int(10) NOT NULL COMMENT '楼层',
  `house_no` int(10) NOT NULL COMMENT '房号',
  `house_kind` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '房屋类型:普通型住宅,别墅,商铺',
  `house_type_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '户型ID',
  `client_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '客户ID',
  `if_handin` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '是否交房:已交房；未交房；未售出',
  `certificate_no` int(30) NULL DEFAULT NULL COMMENT '房产证号',
  `house_state` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '待售；已订；已售，首付未缴；已售，首付已缴',
  `if_mortgaged` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '未完成，已完成，无代办服务，未售出',
  `if_certificated` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '未完成，已完成，无代办服务，未售出',
  `bd_area` double(10, 0) NOT NULL COMMENT '建筑面积(㎡)\r\nps:钱是按建筑面积算的',
  `inside_area` double(10, 0) NOT NULL COMMENT '套内面积(㎡)',
  `balcony_area` double(10, 0) NOT NULL COMMENT '阳台面积(㎡)',
  `shared_area` double(10, 0) NOT NULL COMMENT '分摊面积(㎡)',
  `face_to` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '朝向',
  `decoration` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '装修标准',
  `total_price` double(10, 2) NOT NULL COMMENT '房屋总价(万元)',
  `per_price` double(10, 2) NOT NULL COMMENT '房屋单价(元/㎡)',
  `use_limit` int(10) NOT NULL COMMENT '产权年限',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`house_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for house_type_info
-- ----------------------------
DROP TABLE IF EXISTS `house_type_info`;
CREATE TABLE `house_type_info`  (
  `house_type_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '户型ID',
  `type_tall` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '户型(按高度分):低层、多层、中高层、高层以及超高层',
  `type_f` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '户型(按房型分):单元式住宅、公寓式住宅、复式住宅、跃层式住宅、花园洋房式住宅(别墅)以及小户型住宅等',
  `type_t` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '户型(按套型分):一居室，二居室，多居室',
  `parlour_num` int(10) NOT NULL COMMENT '客厅数量',
  `balcony_num` int(10) NOT NULL COMMENT '阳台数量',
  `closet_num` int(10) NOT NULL COMMENT '储藏室数量',
  `attic_num` int(10) NOT NULL COMMENT '阁楼数量',
  `bedroom_num` int(10) NOT NULL COMMENT '卧室数量',
  `toilet_num` int(10) NOT NULL COMMENT '卫生间数量',
  `garden_num` int(10) NOT NULL COMMENT '入户花园数量',
  `kitchen_num` int(10) NOT NULL COMMENT '厨房数量',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`house_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for plan_info
-- ----------------------------
DROP TABLE IF EXISTS `plan_info`;
CREATE TABLE `plan_info`  (
  `plan_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plan_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_stime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_etime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_gift_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_gift_num` int(10) NULL DEFAULT NULL,
  `b_gift_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_gift_num` int(10) NULL DEFAULT NULL,
  `c_gift_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_gift_num` int(10) NULL DEFAULT NULL,
  `d_gift_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_gift_num` int(10) NULL DEFAULT NULL,
  `plan_rate` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan_info
-- ----------------------------
INSERT INTO `plan_info` VALUES ('1', '我', '12.3', '12.5', '2', '你W', '牙刷', 23, '玉山', 3, '布衣', 6, '玉米', 3, 9);
INSERT INTO `plan_info` VALUES ('3', '3', '3', '3', '3', '3', '3', 33, '33', 3, '3', 3, '33', 3, 3);

-- ----------------------------
-- Table structure for premise_info
-- ----------------------------
DROP TABLE IF EXISTS `premise_info`;
CREATE TABLE `premise_info`  (
  `pre_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼盘ID',
  `pre_name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼盘名称',
  `address` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼盘地址',
  `area` double(20, 0) NOT NULL COMMENT '占地面积(㎡)',
  `price_range` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '价格范围(元/平方米)',
  `bd_num` int(20) NOT NULL COMMENT '楼盘楼房数',
  `house_num` int(20) NOT NULL COMMENT '楼盘房屋数',
  `car_num` int(20) NOT NULL COMMENT '楼盘车位数',
  `use_limit` int(20) NOT NULL COMMENT '使用年限',
  `developer` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼盘开发商',
  `contractor` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '楼盘承建商',
  `representative` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '法定代表人',
  `circumstance` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '周边设施',
  `remark` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pre_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info`  (
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_des` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('r001', '系统管理员', NULL);
INSERT INTO `role_info` VALUES ('r002', '销售经理', NULL);
INSERT INTO `role_info` VALUES ('r003', '置业顾问', NULL);
INSERT INTO `role_info` VALUES ('r004', '财务', NULL);

-- ----------------------------
-- Table structure for ru_info
-- ----------------------------
DROP TABLE IF EXISTS `ru_info`;
CREATE TABLE `ru_info`  (
  `ru_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gift_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ru_num` int(10) NULL DEFAULT NULL,
  `gift_price` int(10) NULL DEFAULT NULL,
  `gift_place` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ru_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ru_info
-- ----------------------------
INSERT INTO `ru_info` VALUES ('c004', '石头', 32, 21, 'C区', '2');
INSERT INTO `ru_info` VALUES ('c003', '玉', 24, 700, 'B区', '1');
INSERT INTO `ru_info` VALUES ('c002', '玉', 45, 700, 'B区', '1');
INSERT INTO `ru_info` VALUES ('c001', '玉', 25, 700, 'B区', '1');
INSERT INTO `ru_info` VALUES ('c005', '石头', 10, 21, 'C区', '2');

-- ----------------------------
-- Table structure for sale_info
-- ----------------------------
DROP TABLE IF EXISTS `sale_info`;
CREATE TABLE `sale_info`  (
  `sell_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT ' 销售合同ID,创建时系统自动生成',
  `sub_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '认购书ID',
  `client_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '客户ID',
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `house_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '房屋ID',
  `sell_time` date NOT NULL COMMENT '签订时间',
  `if_mortgaged` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '是否有代办按揭手续：无，有(自费)，有(赠送)',
  `if_certificated` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '是否有代办产权证：无，有(自费)，有(赠送)',
  `pay_method` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '付款方式',
  `down_payment_amount` double(10, 0) NOT NULL COMMENT '首付款金额',
  `down_payment_time` date NOT NULL COMMENT '首付期限',
  `house_price` double(10, 2) NOT NULL COMMENT '实付房款',
  `mortgage_percentage` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '按揭成数：所贷款的额度总额占房款总额的比例',
  `loan_amount` double(10, 0) NULL DEFAULT NULL COMMENT '商贷金额',
  `loan_time` int(10) NULL DEFAULT NULL COMMENT '商贷年限',
  `loan_bank` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '商贷银行',
  `PF_amount` double(10, 0) NULL DEFAULT NULL COMMENT '公积金贷款金额',
  `PF_time` int(10) NULL DEFAULT NULL COMMENT '公积金年限',
  `PF_bank` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '公积金银行',
  `installment_num` int(10) NULL DEFAULT NULL COMMENT '分期付款的期数：最短可以贷款一年可以分为12期，最长可以贷款三十年可以分为360期',
  `repayment_each` double(10, 0) NULL DEFAULT NULL COMMENT '每期还款金额',
  `repayment_time` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '每期还款日期',
  `handin_time` date NOT NULL COMMENT '交房时间',
  `remark` varchar(500) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  `audit` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '审核结果(状态):审核中；未通过；已通过',
  PRIMARY KEY (`sell_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info`  (
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工ID',
  `staff_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态：在职；离职',
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `phone` bigint(15) NULL DEFAULT NULL COMMENT '电话',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `department` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sellpost` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `injob_time` date NULL DEFAULT NULL COMMENT '入职时间',
  `outjob_time` date NULL DEFAULT NULL COMMENT '离职时间',
  `experience` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经历',
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for subscribe_info
-- ----------------------------
DROP TABLE IF EXISTS `subscribe_info`;
CREATE TABLE `subscribe_info`  (
  `sub_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '认购书ID',
  `client_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '客户ID',
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `house_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '房屋ID',
  `sub_time` date NOT NULL COMMENT '认购时间',
  `deposit_amount` int(20) NOT NULL COMMENT '定金金额',
  `final_price` double(10, 2) NOT NULL COMMENT '最终商定的房价',
  `sale_time` date NOT NULL COMMENT '销售合同签订时间',
  `pay_method` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '付款方式',
  `remark` varchar(500) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '备注',
  `audit` varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '审核结果（状态），有：审核中；未通过；已通过',
  `if_mortgaged` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否有代办按揭手续服务',
  `if_certificated` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否有代办产权证服务：无；有(赠送)；有(自费)',
  PRIMARY KEY (`sub_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `A` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `B` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('百度', 'https://www.baidu.co');
INSERT INTO `test` VALUES ('百度', NULL);

-- ----------------------------
-- Table structure for test2
-- ----------------------------
DROP TABLE IF EXISTS `test2`;
CREATE TABLE `test2`  (
  `C` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `D` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test2
-- ----------------------------
INSERT INTO `test2` VALUES ('百度', NULL);

-- ----------------------------
-- Table structure for type_like_info
-- ----------------------------
DROP TABLE IF EXISTS `type_like_info`;
CREATE TABLE `type_like_info`  (
  `no` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动递增',
  `client_id` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '客户ID',
  `type_like` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '意向房型',
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID(用户名)',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_pw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `mailbox` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `last_logintime` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `this_logintime` datetime NULL DEFAULT NULL COMMENT '本次登录时间',
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外键，员工ID，创建的时候自动生成',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'roo3', '柳青', '1', 'liuqing@gmail.com', NULL, NULL, 's003');

-- ----------------------------
-- Table structure for visit_info
-- ----------------------------
DROP TABLE IF EXISTS `visit_info`;
CREATE TABLE `visit_info`  (
  `client_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_rate` int(20) NULL DEFAULT NULL,
  `considerations` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_num` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visit_info
-- ----------------------------
INSERT INTO `visit_info` VALUES ('c002', '李华', 'B', '签订认购中', '001', '李明', '2023-04-01 23:53:58', '定期回访', 7, '户型', 0);
INSERT INTO `visit_info` VALUES ('c003', '美丽', 'D', '洽谈中', '001', '香兰', '2023-04-25 23:54:18', '定期回访', 2, '户型', 0);
INSERT INTO `visit_info` VALUES ('c001', '何云帆', 'A', '签订认购中', '001', '李云', '2023-04-25 03:01:57', '定期回访', 5, '钱', 0);
INSERT INTO `visit_info` VALUES ('c005', '周锐', 'B', '洽谈中', '001', '李云', '2023-05-16 04:01:50', '回访计划', 5, NULL, NULL);
INSERT INTO `visit_info` VALUES ('c007', '123', 'C', '洽谈中', '001', '李云', '2023-05-10 04:01:54', '回访计划', 7, NULL, NULL);
INSERT INTO `visit_info` VALUES ('c006', '理想', 'A', '洽谈中', NULL, NULL, '2023-05-16 02:43:35', '回访计划', NULL, NULL, NULL);
INSERT INTO `visit_info` VALUES ('c008', '黎明', 'C', '洽谈中', NULL, NULL, '2023-05-20 19:56:32', '回访计划', 7, NULL, NULL);
INSERT INTO `visit_info` VALUES ('c009', '1', 'C', '洽谈中', NULL, NULL, '2023-05-20 20:02:52', '回访计划', 7, NULL, NULL);

-- ----------------------------
-- Table structure for visitrecord_info
-- ----------------------------
DROP TABLE IF EXISTS `visitrecord_info`;
CREATE TABLE `visitrecord_info`  (
  `visit_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visit_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `considerations` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_num` int(10) NULL DEFAULT NULL,
  `visit_rate` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`visit_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitrecord_info
-- ----------------------------
INSERT INTO `visitrecord_info` VALUES ('c003', 'c002', '李华', 'B', '签订认购中', '001', '李明', '2023-04-25 23:53:58', '定期回访', '户型', 0, 7);
INSERT INTO `visitrecord_info` VALUES ('c004', 'c003', '美丽', 'D', '洽谈中', '001', '香兰', '2023-04-25 23:54:18', '定期回访', '户型', 0, 2);
INSERT INTO `visitrecord_info` VALUES ('c002', 'c002', '李华', 'B', '签订认购中', '001', '遇难', '2023-04-25 10:16:22', '定期回访', '户型', 0, 7);
INSERT INTO `visitrecord_info` VALUES ('c001', 'c001', '何云帆', 'A', '签订认购中', '001', '李云', '2023-04-25 03:01:57', '定期回访', '钱', 0, 5);
INSERT INTO `visitrecord_info` VALUES ('c007', 'c006', '理想', 'A', '已购买', '005', '云帆', '2023-04-26 00:16:57', '不定期回访', '', 0, 3);
INSERT INTO `visitrecord_info` VALUES ('c008', 'c003', '美丽', 'D', '洽谈中', '001', '香兰', '2023-05-08 17:40:45', '定期回访', '户型', 0, 2);
INSERT INTO `visitrecord_info` VALUES ('c009', 'c002', '李华', 'B', '签订认购中', '001', '李明', '2023-05-08 17:43:23', '定期回访', '户型', 0, 7);

-- ----------------------------
-- Table structure for yuce_info
-- ----------------------------
DROP TABLE IF EXISTS `yuce_info`;
CREATE TABLE `yuce_info`  (
  `yuce_num` int(20) NULL DEFAULT NULL,
  `yuce_week` int(255) NOT NULL,
  PRIMARY KEY (`yuce_week`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of yuce_info
-- ----------------------------
INSERT INTO `yuce_info` VALUES (20, 1);
INSERT INTO `yuce_info` VALUES (30, 2);
INSERT INTO `yuce_info` VALUES (20, 3);

SET FOREIGN_KEY_CHECKS = 1;
