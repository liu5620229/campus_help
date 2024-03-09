/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : campus_help

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 24/02/2024 10:52:38
*/
DROP DATABASE IF EXISTS campus_help ;
CREATE DATABASE campus_help CHARACTER SET utf8;
use campus_help ;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `account` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `username` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `state` int NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '46', '123456', '管理员', '2021-11-08 09:16:25', 0);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `name` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级名',
  `school_id` int NOT NULL COMMENT '学校id',
  `dept_id` int NOT NULL COMMENT '系别id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CLASS_SCHOOL`(`school_id`) USING BTREE,
  INDEX `FK_CLASS_DEPT`(`dept_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  CONSTRAINT `FK_CLASS_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CLASS_SCHOOL` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '2班', 1, 1);
INSERT INTO `class` VALUES (6, '1班', 1, 1);
INSERT INTO `class` VALUES (7, '2018软件工程2班', 2, 5);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '系别id',
  `name` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '系别名称',
  `school_id` int NOT NULL COMMENT '学校id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_DEPT_SCHOOL`(`school_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  CONSTRAINT `FK_DEPT_SCHOOL` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '软件工程', 1);
INSERT INTO `dept` VALUES (2, '音乐表演', 1);
INSERT INTO `dept` VALUES (3, '计算机', 1);
INSERT INTO `dept` VALUES (5, '计算机科学与工程学院', 2);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_content` longblob NULL COMMENT '公告内容',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (7, '666', 0x3C7020636C6173733D22716C2D616C69676E2D63656E746572223EE4BB8AE5A4A9E4BC91E681AFE59084E4BD8DE58584E5BC9FE4BBAC3C2F703E, 'admin', '2022-05-13 22:41:47', '666');
INSERT INTO `notice` VALUES (11, '444', 0x3C703E3434343C2F703E, 'admin', '2022-05-13 22:50:12', '444');
INSERT INTO `notice` VALUES (12, '222', 0x3C703E3232323C2F703E, 'admin', '2022-05-13 22:51:14', '222');
INSERT INTO `notice` VALUES (16, '333', NULL, '46', '2022-05-14 01:53:39', NULL);
INSERT INTO `notice` VALUES (17, 'adasd', 0x3C7020636C6173733D22716C2D616C69676E2D63656E746572223E61736473613C2F703E, 'hhh', '2022-05-14 02:00:24', 'dfdfg');
INSERT INTO `notice` VALUES (18, '维护更新', 0x32303232E5B9B4E6999AE4B88A3131E782B9EFBC8CE585A8E69C8DE69BB4E696B0EFBC8CE695ACE8AFB7E8B085E8A7A3E38082, '46', '2022-05-18 11:36:46', NULL);
INSERT INTO `notice` VALUES (19, '维护完成', NULL, '', '2022-05-18 11:43:04', NULL);

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学校id',
  `name` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学校名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (2, '毛塘铺大学');
INSERT INTO `school` VALUES (1, '湖南信息学院');

-- ----------------------------
-- Table structure for sxc_remark
-- ----------------------------
DROP TABLE IF EXISTS `sxc_remark`;
CREATE TABLE `sxc_remark`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `star` int NULL DEFAULT NULL COMMENT '星级',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `task_id` int NOT NULL COMMENT '任务id',
  `accept_id` int NOT NULL COMMENT '送货人id',
  `publish_id` int NOT NULL COMMENT '评价人id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `accept_id`(`accept_id`) USING BTREE,
  INDEX `publish_id`(`publish_id`) USING BTREE,
  CONSTRAINT `accept_id` FOREIGN KEY (`accept_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `publish_id` FOREIGN KEY (`publish_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxc_remark
-- ----------------------------
INSERT INTO `sxc_remark` VALUES (2, 4, '很不错', 23, 19, 23);
INSERT INTO `sxc_remark` VALUES (3, 1, '还可以', 25, 24, 19);
INSERT INTO `sxc_remark` VALUES (4, 3, '送的很慢，下次不点了', 26, 19, 24);

-- ----------------------------
-- Table structure for sxc_student
-- ----------------------------
DROP TABLE IF EXISTS `sxc_student`;
CREATE TABLE `sxc_student`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxc_student
-- ----------------------------
INSERT INTO `sxc_student` VALUES (3, 'lx', 20);
INSERT INTO `sxc_student` VALUES (5, 'lx', 30);
INSERT INTO `sxc_student` VALUES (13, 'ASDAS', 12);
INSERT INTO `sxc_student` VALUES (14, '22', 32);
INSERT INTO `sxc_student` VALUES (16, '中的', 26);
INSERT INTO `sxc_student` VALUES (17, 'ghh', 55);
INSERT INTO `sxc_student` VALUES (18, '中肯的', 20);
INSERT INTO `sxc_student` VALUES (20, '老头', 30);
INSERT INTO `sxc_student` VALUES (21, '王八', 20);
INSERT INTO `sxc_student` VALUES (22, '王八王子', 50);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `publish_user_id` int NOT NULL COMMENT '用户发布id',
  `accept_user_id` int NULL DEFAULT NULL COMMENT '接受任务用户id',
  `user_school_id` int NOT NULL COMMENT '用户所在的学校id',
  `reward` double NULL DEFAULT 0 COMMENT '任务奖励',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `order_time` timestamp(0) NULL DEFAULT NULL COMMENT '接单时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `task_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务标题',
  `task_context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务内容',
  `state` int NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_TASK_PUBLISH_USER`(`publish_user_id`) USING BTREE,
  INDEX `FK_TASK_ACCEPT_USER`(`accept_user_id`) USING BTREE,
  INDEX `FK_TASK_USER_SCHOOL`(`user_school_id`) USING BTREE,
  CONSTRAINT `FK_TASK_ACCEPT_USER` FOREIGN KEY (`accept_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TASK_PUBLISH_USER` FOREIGN KEY (`publish_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TASK_USER_SCHOOL` FOREIGN KEY (`user_school_id`) REFERENCES `school` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (19, 13, 14, 1, 2, '2021-11-04 14:36:32', '2021-11-08 09:02:57', '2021-11-08 09:45:23', '拿快递', '帮我拿快递', 2);
INSERT INTO `task` VALUES (20, 13, 14, 1, 100, '2021-11-08 09:47:00', '2021-11-08 09:47:43', NULL, '那个快递', '校门口', 1);
INSERT INTO `task` VALUES (21, 14, 13, 1, 2, '2021-11-12 00:16:10', '2021-11-12 15:12:41', NULL, '取餐', '无', 1);
INSERT INTO `task` VALUES (22, 13, 19, 1, 2, '2021-11-12 11:28:01', '2022-05-16 21:42:56', NULL, '取快递', '拿快递', 1);
INSERT INTO `task` VALUES (23, 23, 19, 1, 20, '2022-05-11 23:09:35', '2022-05-16 00:40:00', '2022-05-16 00:56:48', '代取快递', '帮我去取个快递 ，取件码200-022-022', 2);
INSERT INTO `task` VALUES (24, 19, 25, 1, 20, '2022-05-15 23:43:03', '2022-05-18 00:49:27', NULL, '超市买东西', '去超市买东西', 1);
INSERT INTO `task` VALUES (25, 19, 24, 1, 10, '2022-05-15 23:57:04', '2022-05-16 15:55:16', '2022-05-16 15:55:44', '111', '测试User user2 = (User) session.getAttribute(\"user\");\n        System.out.println(user2);输出', 2);
INSERT INTO `task` VALUES (26, 24, 19, 1, 20, '2022-05-16 22:04:11', '2022-05-16 22:04:21', '2022-05-16 22:04:34', '代买零食', '帮我去超市买一包辣条，送到19栋202', 2);
INSERT INTO `task` VALUES (27, 25, NULL, 1, 20, '2022-05-18 00:46:08', NULL, NULL, '食堂买饭', '去食堂买饭，一餐厅二楼湘味一米哥买饭，送到40栋202.', 0);
INSERT INTO `task` VALUES (28, 26, NULL, 2, 18, '2022-05-19 00:12:55', NULL, NULL, '帮我打单子', '帮我上一下英雄联盟的号打单子。', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `student_id` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `school_id` int NOT NULL COMMENT '学校id',
  `dept_id` int NULL DEFAULT NULL COMMENT '系别id',
  `class_id` int NULL DEFAULT NULL COMMENT '班级id',
  `sex` int NULL DEFAULT 0 COMMENT '性别',
  `username` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `balance` double NULL DEFAULT 0 COMMENT '余额',
  `state` int NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_USER_SCHOOL`(`school_id`) USING BTREE,
  INDEX `FK_USER_DEPT`(`dept_id`) USING BTREE,
  INDEX `FK_USER_CLASS`(`class_id`) USING BTREE,
  CONSTRAINT `FK_USER_CLASS` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USER_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USER_SCHOOL` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (13, '1', 'e10adc3949ba59abbe56e057f20f883e', '13332552233', 1, 1, 1, 0, '李四', '2021-11-04 14:33:06', 76, 0);
INSERT INTO `user` VALUES (14, '46', 'e10adc3949ba59abbe56e057f20f883e', '18573743210', 1, 1, 1, 0, '管理员', '2021-11-08 09:01:53', 0, 0);
INSERT INTO `user` VALUES (15, '201801420246', 'e10adc3949ba59abbe56e057f20f883e', '18573743210', 1, 1, 1, 0, '王五', '2021-11-29 14:46:17', 0, 0);
INSERT INTO `user` VALUES (16, '2', 'e10adc3949ba59abbe56e057f20f883e', '19988665774', 1, 1, 1, 0, '李哥', '2022-05-11 00:42:49', 0, 0);
INSERT INTO `user` VALUES (18, '2', 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, NULL, 0, NULL, '2022-05-11 12:08:32', 0, 0);
INSERT INTO `user` VALUES (19, '3', 'e10adc3949ba59abbe56e057f20f883e', '17888665663', 1, 1, 1, 0, '李学', '2022-05-11 12:15:53', 110, 0);
INSERT INTO `user` VALUES (20, '4', 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, NULL, 0, NULL, '2022-05-11 12:24:31', 90, 0);
INSERT INTO `user` VALUES (21, '6', 'e10adc3949ba59abbe56e057f20f883e', '17886554422', 1, 1, 1, 1, '成龙', '2022-05-11 12:45:54', 0, 0);
INSERT INTO `user` VALUES (23, '9', 'e10adc3949ba59abbe56e057f20f883e', '18776554420', 1, 1, 1, 0, '王哥', '2022-05-11 17:04:06', 80, 0);
INSERT INTO `user` VALUES (24, '4', 'e10adc3949ba59abbe56e057f20f883e', '12255446677', 1, 1, 1, 0, '栗子木哥', '2022-05-16 15:54:33', 90, 0);
INSERT INTO `user` VALUES (25, '5', 'e10adc3949ba59abbe56e057f20f883e', '13873546677', 1, 1, 1, 1, '王木木', '2022-05-18 00:32:59', 80, 0);
INSERT INTO `user` VALUES (26, '1', 'e10adc3949ba59abbe56e057f20f883e', '17899887622', 2, 5, 7, 0, '王老大', '2022-05-19 00:12:02', 70, 0);

SET FOREIGN_KEY_CHECKS = 1;
