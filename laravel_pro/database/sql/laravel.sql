/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 17/09/2020 15:51:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `province` int(11) NOT NULL COMMENT '省',
  `city` int(11) NOT NULL COMMENT '市',
  `area` int(11) NOT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人姓名',
  `consignee_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人手机号',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是默认地址 0不是 1是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `address_customer_id_index`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2020-09-05 03:29:28', '2020-09-06 13:18:06', 1, 110000, 110100, 110101, 'aaavvv', '11111', '18102025221', 1);
INSERT INTO `address` VALUES (2, '2020-09-05 03:38:01', '2020-09-06 13:18:06', 1, 120000, 120100, 120101, '123', '11111', '18102025228', 0);
INSERT INTO `address` VALUES (3, '2020-09-05 07:14:41', '2020-09-05 07:14:41', 2, 110000, 110100, 110101, 'aaavvv', '11111', '18102025221', 0);
INSERT INTO `address` VALUES (4, '2020-09-06 13:17:36', '2020-09-06 13:18:06', 1, 110000, 110100, 110101, 'qqqqq', '777', '18192928888', 0);
INSERT INTO `address` VALUES (5, '2020-09-06 13:17:54', '2020-09-06 13:31:19', 1, 110000, 110100, 110101, 'cccc', '是是是', '18192928888', 0);

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, '客户管理', 'fa-bars', NULL, '*', '2020-09-04 13:23:56', '2020-09-04 13:25:17');
INSERT INTO `admin_menu` VALUES (9, 8, 10, '基本信息', 'fa-bars', 'customer', '*', '2020-09-04 13:24:49', '2020-09-06 13:52:19');
INSERT INTO `admin_menu` VALUES (10, 8, 9, '地址管理', 'fa-bars', 'address', '*', '2020-09-04 15:09:17', '2020-09-06 13:52:19');
INSERT INTO `admin_menu` VALUES (11, 0, 11, '产品管理', 'fa-bars', NULL, '*', '2020-09-06 13:52:02', '2020-09-06 13:52:59');
INSERT INTO `admin_menu` VALUES (12, 11, 12, '标签管理', 'fa-bars', 'pro-label', '*', '2020-09-06 13:53:24', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (13, 11, 13, '品牌管理', 'fa-bars', 'pro-brand', '*', '2020-09-06 14:31:39', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (14, 11, 14, '分类管理', 'fa-bars', 'pro-class', '*', '2020-09-07 01:55:58', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (15, 11, 15, '产品详情', 'fa-bars', 'pro-info', '*', '2020-09-07 07:21:53', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (18, 11, 16, '模板管理', 'fa-bars', 'freight-template', '*', '2020-09-09 13:16:34', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (19, 0, 17, '订单管理', 'fa-bars', NULL, '*', '2020-09-10 07:51:25', '2020-09-10 07:51:48');
INSERT INTO `admin_menu` VALUES (20, 19, 0, '订单管理', 'fa-bars', 'retail-order', '*', '2020-09-10 07:52:28', '2020-09-10 07:52:28');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 14:57:34', '2020-08-10 14:57:34');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-03 13:15:42', '2020-09-03 13:15:42');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-03 13:15:56', '2020-09-03 13:15:56');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-03 13:16:09', '2020-09-03 13:16:09');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 12:40:51', '2020-09-04 12:40:51');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 12:41:05', '2020-09-04 12:41:05');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 12:41:14', '2020-09-04 12:41:14');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:16:55', '2020-09-04 13:16:55');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 13:22:20', '2020-09-04 13:22:20');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:22:25', '2020-09-04 13:22:25');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:23:30', '2020-09-04 13:23:30');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:23:35', '2020-09-04 13:23:35');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:23:38', '2020-09-04 13:23:38');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:23:41', '2020-09-04 13:23:41');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"urIKGwaOPbUBezSFsltomTE4YCLgmfBmL6ddf7oz\"}', '2020-09-04 13:23:55', '2020-09-04 13:23:55');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:23:56', '2020-09-04 13:23:56');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u57fa\\u672c\\u4fe1\\u606f\",\"icon\":\"fa-bars\",\"uri\":\"customer\\/info\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"urIKGwaOPbUBezSFsltomTE4YCLgmfBmL6ddf7oz\"}', '2020-09-04 13:24:48', '2020-09-04 13:24:48');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:24:49', '2020-09-04 13:24:49');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:24:52', '2020-09-04 13:24:52');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:25:01', '2020-09-04 13:25:01');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"urIKGwaOPbUBezSFsltomTE4YCLgmfBmL6ddf7oz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2020-09-04 13:25:06', '2020-09-04 13:25:06');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:25:06', '2020-09-04 13:25:06');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"urIKGwaOPbUBezSFsltomTE4YCLgmfBmL6ddf7oz\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9}]}]\"}', '2020-09-04 13:25:17', '2020-09-04 13:25:17');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:25:18', '2020-09-04 13:25:18');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:25:21', '2020-09-04 13:25:21');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:25:22', '2020-09-04 13:25:22');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/customer/info', 'GET', '127.0.0.1', '[]', '2020-09-04 13:33:14', '2020-09-04 13:33:14');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 13:33:40', '2020-09-04 13:33:40');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u57fa\\u672c\\u4fe1\\u606f\",\"icon\":\"fa-bars\",\"uri\":\"customer\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"urIKGwaOPbUBezSFsltomTE4YCLgmfBmL6ddf7oz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2020-09-04 13:33:45', '2020-09-04 13:33:45');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 13:33:45', '2020-09-04 13:33:45');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/customer/info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:04:57', '2020-09-04 14:04:57');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/customer/info', 'GET', '127.0.0.1', '[]', '2020-09-04 14:04:57', '2020-09-04 14:04:57');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:05:05', '2020-09-04 14:05:05');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:05:18', '2020-09-04 14:05:18');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:06:01', '2020-09-04 14:06:01');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:08:21', '2020-09-04 14:08:21');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:10:05', '2020-09-04 14:10:05');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:10:08', '2020-09-04 14:10:08');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:10:10', '2020-09-04 14:10:10');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:10:53', '2020-09-04 14:10:53');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:13:07', '2020-09-04 14:13:07');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:29:50', '2020-09-04 14:29:50');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:31:25', '2020-09-04 14:31:25');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:31:28', '2020-09-04 14:31:28');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-04 14:36:00', '2020-09-04 14:36:00');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:36:04', '2020-09-04 14:36:04');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:36:59', '2020-09-04 14:36:59');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:39:49', '2020-09-04 14:39:49');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/customer/9', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:41:11', '2020-09-04 14:41:11');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:41:15', '2020-09-04 14:41:15');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/customer/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:41:18', '2020-09-04 14:41:18');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:42:45', '2020-09-04 14:42:45');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:43:34', '2020-09-04 14:43:34');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:46:04', '2020-09-04 14:46:04');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:46:07', '2020-09-04 14:46:07');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:07', '2020-09-04 14:47:07');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:09', '2020-09-04 14:47:09');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:10', '2020-09-04 14:47:10');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/customer/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:10', '2020-09-04 14:47:10');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:21', '2020-09-04 14:47:21');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:47:23', '2020-09-04 14:47:23');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:47:54', '2020-09-04 14:47:54');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:48:08', '2020-09-04 14:48:08');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:48:10', '2020-09-04 14:48:10');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:50:59', '2020-09-04 14:50:59');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:51:03', '2020-09-04 14:51:03');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:53:25', '2020-09-04 14:53:25');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 14:53:47', '2020-09-04 14:53:47');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:53:48', '2020-09-04 14:53:48');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:53:51', '2020-09-04 14:53:51');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:53:54', '2020-09-04 14:53:54');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:53:57', '2020-09-04 14:53:57');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 14:57:02', '2020-09-04 14:57:02');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:57:03', '2020-09-04 14:57:03');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:57:06', '2020-09-04 14:57:06');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:57:08', '2020-09-04 14:57:08');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:57:10', '2020-09-04 14:57:10');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 14:57:48', '2020-09-04 14:57:48');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:57:49', '2020-09-04 14:57:49');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:58:26', '2020-09-04 14:58:26');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 14:58:31', '2020-09-04 14:58:31');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 14:58:32', '2020-09-04 14:58:32');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 14:58:46', '2020-09-04 14:58:46');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-04 15:02:28', '2020-09-04 15:02:28');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 15:02:36', '2020-09-04 15:02:36');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 15:02:36', '2020-09-04 15:02:36');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:04:42', '2020-09-04 15:04:42');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 15:04:49', '2020-09-04 15:04:49');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 15:04:49', '2020-09-04 15:04:49');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:05:41', '2020-09-04 15:05:41');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/customer/1', 'PUT', '127.0.0.1', '{\"nickname\":\"Tom\",\"mobile\":\"18102025228\",\"status\":\"on\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/customer\"}', '2020-09-04 15:05:48', '2020-09-04 15:05:48');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-04 15:05:48', '2020-09-04 15:05:48');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:05:57', '2020-09-04 15:05:57');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-04 15:07:40', '2020-09-04 15:07:40');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:07:48', '2020-09-04 15:07:48');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/customer/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:07:52', '2020-09-04 15:07:52');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:07:54', '2020-09-04 15:07:54');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/customer/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:07:56', '2020-09-04 15:07:56');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:07:58', '2020-09-04 15:07:58');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-04 15:08:23', '2020-09-04 15:08:23');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5730\\u5740\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"address\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"aznFRv24j9XCLN8GfVzfk5hdNxZmg92XAZyVXMbz\"}', '2020-09-04 15:09:17', '2020-09-04 15:09:17');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 15:09:18', '2020-09-04 15:09:18');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-04 15:09:21', '2020-09-04 15:09:21');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-05 02:19:30', '2020-09-05 02:19:30');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 02:24:50', '2020-09-05 02:24:50');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 02:36:21', '2020-09-05 02:36:21');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 02:36:43', '2020-09-05 02:36:43');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 02:39:01', '2020-09-05 02:39:01');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/address/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 02:39:04', '2020-09-05 02:39:04');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:18:51', '2020-09-05 03:18:51');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:18:57', '2020-09-05 03:18:57');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:19:38', '2020-09-05 03:19:38');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:20:29', '2020-09-05 03:20:29');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:21:27', '2020-09-05 03:21:27');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:24:46', '2020-09-05 03:24:46');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:28:25', '2020-09-05 03:28:25');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:28:28', '2020-09-05 03:28:28');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"110000\",\"city\":\"110100\",\"area\":\"110101\",\"address\":\"aaavvv\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025221\",\"is_default\":\"1\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\"}', '2020-09-05 03:28:44', '2020-09-05 03:28:44');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:28:44', '2020-09-05 03:28:44');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"110000\",\"city\":\"110100\",\"area\":\"110101\",\"address\":\"aaavvv\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025221\",\"is_default\":\"1\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\"}', '2020-09-05 03:29:28', '2020-09-05 03:29:28');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:29:29', '2020-09-05 03:29:29');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/address/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 03:29:32', '2020-09-05 03:29:32');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"120000\",\"city\":\"120100\",\"area\":\"120101\",\"address\":\"aaavvv\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025228\",\"is_default\":\"1\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/address\"}', '2020-09-05 03:29:45', '2020-09-05 03:29:45');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:29:46', '2020-09-05 03:29:46');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"120000\",\"city\":\"120100\",\"area\":\"120101\",\"address\":\"aaavvv\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025228\",\"is_default\":\"1\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\"}', '2020-09-05 03:34:19', '2020-09-05 03:34:19');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:34:19', '2020-09-05 03:34:19');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:37:33', '2020-09-05 03:37:33');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"120000\",\"city\":\"120100\",\"area\":\"120101\",\"address\":\"123\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025228\",\"is_default\":\"1\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\"}', '2020-09-05 03:37:47', '2020-09-05 03:37:47');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/address/create', 'GET', '127.0.0.1', '[]', '2020-09-05 03:37:48', '2020-09-05 03:37:48');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"province\":\"120000\",\"city\":\"120100\",\"area\":\"120101\",\"address\":\"123\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025228\",\"is_default\":\"0\",\"_token\":\"URv298oXwDgke39QIllJeVeLMimBL0fUz23Awk7O\"}', '2020-09-05 03:38:01', '2020-09-05 03:38:01');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:38:02', '2020-09-05 03:38:02');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:48:08', '2020-09-05 03:48:08');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:53:38', '2020-09-05 03:53:38');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:53:50', '2020-09-05 03:53:50');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 03:55:58', '2020-09-05 03:55:58');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-05 06:07:12', '2020-09-05 06:07:12');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-05 06:51:46', '2020-09-05 06:51:46');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 06:52:09', '2020-09-05 06:52:09');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"3d66008e44416ee9eb7f04af127c465c\":\"Tom\"}', '2020-09-05 06:52:16', '2020-09-05 06:52:16');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"3d66008e44416ee9eb7f04af127c465c\":\"Tom\"}', '2020-09-05 06:52:33', '2020-09-05 06:52:33');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"3d66008e44416ee9eb7f04af127c465c\":\"Tom\"}', '2020-09-05 06:52:35', '2020-09-05 06:52:35');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"3d66008e44416ee9eb7f04af127c465c\":\"Tom\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 06:52:37', '2020-09-05 06:52:37');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"3d66008e44416ee9eb7f04af127c465c\":\"Tom\"}', '2020-09-05 06:54:02', '2020-09-05 06:54:02');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 06:54:07', '2020-09-05 06:54:07');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"T\"}', '2020-09-05 06:54:14', '2020-09-05 06:54:14');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"T\"}', '2020-09-05 06:54:26', '2020-09-05 06:54:26');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 06:54:31', '2020-09-05 06:54:31');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\"}', '2020-09-05 06:54:35', '2020-09-05 06:54:35');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\"}', '2020-09-05 06:54:50', '2020-09-05 06:54:50');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/address', 'GET', '127.0.0.1', '{\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"Tom\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 06:54:56', '2020-09-05 06:54:56');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/address', 'GET', '127.0.0.1', '{\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"Tom\"}', '2020-09-05 06:55:39', '2020-09-05 06:55:39');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/address', 'GET', '127.0.0.1', '{\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"Tom\"}', '2020-09-05 06:56:35', '2020-09-05 06:56:35');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/address', 'GET', '127.0.0.1', '{\"b4f1fc771e6d1959c25d275f84efc9d3\":\"t\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"Tom\"}', '2020-09-05 06:56:53', '2020-09-05 06:56:53');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-05 07:04:35', '2020-09-05 07:04:35');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:04:39', '2020-09-05 07:04:39');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:04:48', '2020-09-05 07:04:48');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:05:03', '2020-09-05 07:05:03');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:07:23', '2020-09-05 07:07:23');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"consignee_name\":null,\"consignee_mobile\":null,\"14d695e6aac52b5ab65aa46f6a14532a\":\"Tom\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:07:29', '2020-09-05 07:07:29');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:07:30', '2020-09-05 07:07:30');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:08:15', '2020-09-05 07:08:15');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"consignee_name\":null,\"consignee_mobile\":null,\"14d695e6aac52b5ab65aa46f6a14532a\":\"Tom\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:08:19', '2020-09-05 07:08:19');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:08:19', '2020-09-05 07:08:19');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/address', 'GET', '127.0.0.1', '{\"consignee_name\":null,\"consignee_mobile\":null,\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\"}', '2020-09-05 07:08:52', '2020-09-05 07:08:52');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"consignee_name\":null,\"consignee_mobile\":null,\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:08:55', '2020-09-05 07:08:55');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\"}', '2020-09-05 07:09:08', '2020-09-05 07:09:08');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"consignee_name\":null,\"consignee_mobile\":null,\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\"}', '2020-09-05 07:14:10', '2020-09-05 07:14:10');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"8\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:14:16', '2020-09-05 07:14:16');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"To\"}', '2020-09-05 07:14:22', '2020-09-05 07:14:22');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/address/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:14:25', '2020-09-05 07:14:25');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/address', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"province\":\"110000\",\"city\":\"110100\",\"area\":\"110101\",\"address\":\"aaavvv\",\"consignee_name\":\"11111\",\"consignee_mobile\":\"18102025221\",\"is_default\":\"0\",\"_token\":\"ugeXsaTqpRksCebeHeMRl3hzbAF5pzcMuuR2BERo\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/address?d167b605036516c1fa7459675ac7bd96=To%27m&b4f1fc771e6d1959c25d275f84efc9d3=11&consignee_name=&consignee_mobile=&74a41923cee29d5b531c42aa4a3df0d6=To\"}', '2020-09-05 07:14:40', '2020-09-05 07:14:40');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"To\"}', '2020-09-05 07:14:41', '2020-09-05 07:14:41');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"740612\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:14:46', '2020-09-05 07:14:46');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/address/3', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:15:00', '2020-09-05 07:15:00');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"740612\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:15:03', '2020-09-05 07:15:03');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"740612\"}', '2020-09-05 07:17:57', '2020-09-05 07:17:57');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"consignee_name\":null,\"consignee_mobile\":null,\"74a41923cee29d5b531c42aa4a3df0d6\":\"740612\"}', '2020-09-05 07:17:59', '2020-09-05 07:17:59');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:18:06', '2020-09-05 07:18:06');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\"}', '2020-09-05 07:18:37', '2020-09-05 07:18:37');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/address', 'GET', '127.0.0.1', '{\"d167b605036516c1fa7459675ac7bd96\":\"To\'m\",\"b4f1fc771e6d1959c25d275f84efc9d3\":\"11\"}', '2020-09-05 07:18:59', '2020-09-05 07:18:59');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:19:03', '2020-09-05 07:19:03');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/customer', 'GET', '127.0.0.1', '[]', '2020-09-05 07:24:50', '2020-09-05 07:24:50');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"nickname\":null,\"mobile\":null,\"status\":\"0\",\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:24:56', '2020-09-05 07:24:56');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"nickname\":null,\"mobile\":null,\"status\":\"1\"}', '2020-09-05 07:24:58', '2020-09-05 07:24:58');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:25:00', '2020-09-05 07:25:00');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:25:12', '2020-09-05 07:25:12');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/address/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:25:14', '2020-09-05 07:25:14');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-05 07:25:17', '2020-09-05 07:25:17');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-06 13:18:15', '2020-09-06 13:18:15');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:18:23', '2020-09-06 13:18:23');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"consignee_name\":null,\"consignee_mobile\":null,\"4c9536450158328bf920537d46465560\":\"Tom813210\"}', '2020-09-06 13:18:33', '2020-09-06 13:18:33');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:51:46', '2020-09-06 13:51:46');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\"}', '2020-09-06 13:52:02', '2020-09-06 13:52:02');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:52:02', '2020-09-06 13:52:02');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:52:14', '2020-09-06 13:52:14');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":9}]},{\\\"id\\\":11}]\"}', '2020-09-06 13:52:19', '2020-09-06 13:52:19');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:20', '2020-09-06 13:52:20');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:39', '2020-09-06 13:52:39');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:45', '2020-09-06 13:52:45');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:47', '2020-09-06 13:52:47');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:50', '2020-09-06 13:52:50');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:52:53', '2020-09-06 13:52:53');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2020-09-06 13:52:59', '2020-09-06 13:52:59');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:52:59', '2020-09-06 13:52:59');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:53:04', '2020-09-06 13:53:04');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2020-09-06 13:53:09', '2020-09-06 13:53:09');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:53:09', '2020-09-06 13:53:09');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u6807\\u7b7e\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"pro-label\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\"}', '2020-09-06 13:53:24', '2020-09-06 13:53:24');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:53:25', '2020-09-06 13:53:25');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 13:53:28', '2020-09-06 13:53:28');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:53:30', '2020-09-06 13:53:30');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:54:54', '2020-09-06 13:54:54');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/pro-label/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:56:06', '2020-09-06 13:56:06');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/pro-label', 'POST', '127.0.0.1', '{\"label_name\":\"\\u8fd0\\u52a8\",\"order_by\":\"10\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-label\"}', '2020-09-06 13:56:18', '2020-09-06 13:56:18');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:56:19', '2020-09-06 13:56:19');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/pro-label/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:56:22', '2020-09-06 13:56:22');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/pro-label', 'POST', '127.0.0.1', '{\"label_name\":\"\\u65f6\\u5c1a\",\"order_by\":\"10\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-label\"}', '2020-09-06 13:56:26', '2020-09-06 13:56:26');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:56:26', '2020-09-06 13:56:26');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/pro-label/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:56:28', '2020-09-06 13:56:28');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/pro-label', 'POST', '127.0.0.1', '{\"label_name\":\"\\u6587\\u827a\",\"order_by\":\"10\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-label\"}', '2020-09-06 13:56:32', '2020-09-06 13:56:32');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:56:33', '2020-09-06 13:56:33');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:57:39', '2020-09-06 13:57:39');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:57:56', '2020-09-06 13:57:56');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/pro-label/3', 'PUT', '127.0.0.1', '{\"name\":\"order_by\",\"value\":\"16\",\"pk\":\"3\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-09-06 13:58:04', '2020-09-06 13:58:04');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:58:17', '2020-09-06 13:58:17');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 13:58:28', '2020-09-06 13:58:28');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:58:30', '2020-09-06 13:58:30');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"}}', '2020-09-06 13:59:16', '2020-09-06 13:59:16');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"label_name\":\"\\u8fd0\\u52a8\",\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:59:21', '2020-09-06 13:59:21');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:59:23', '2020-09-06 13:59:23');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 13:59:23', '2020-09-06 13:59:23');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:20:34', '2020-09-06 14:20:34');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:21:23', '2020-09-06 14:21:23');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:22:19', '2020-09-06 14:22:19');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:22:21', '2020-09-06 14:22:21');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:22:27', '2020-09-06 14:22:27');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:22:30', '2020-09-06 14:22:30');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:22:53', '2020-09-06 14:22:53');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:22:56', '2020-09-06 14:22:56');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:23:32', '2020-09-06 14:23:32');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:23:35', '2020-09-06 14:23:35');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:23:41', '2020-09-06 14:23:41');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:25:03', '2020-09-06 14:25:03');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:25:05', '2020-09-06 14:25:05');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:25:07', '2020-09-06 14:25:07');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/pro-label/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:25:11', '2020-09-06 14:25:11');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/pro-label/1', 'PUT', '127.0.0.1', '{\"label_name\":\"\\u8fd0\\u52a8\",\"order_by\":\"10\",\"status\":\"on\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-label\"}', '2020-09-06 14:25:16', '2020-09-06 14:25:16');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-06 14:25:17', '2020-09-06 14:25:17');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/pro-label/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-06 14:26:31', '2020-09-06 14:26:31');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/pro-label/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-06 14:27:05', '2020-09-06 14:27:05');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:27:26', '2020-09-06 14:27:26');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:30:58', '2020-09-06 14:30:58');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u54c1\\u724c\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"pro-brand\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\"}', '2020-09-06 14:31:39', '2020-09-06 14:31:39');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 14:31:40', '2020-09-06 14:31:40');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-06 14:31:43', '2020-09-06 14:31:43');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:31:46', '2020-09-06 14:31:46');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/pro-brand/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:42:03', '2020-09-06 14:42:03');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:42:13', '2020-09-06 14:42:13');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/pro-brand/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:44:27', '2020-09-06 14:44:27');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/pro-brand', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_name\":\"nike\",\"description\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"status\":\"on\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-brand\"}', '2020-09-06 14:45:27', '2020-09-06 14:45:27');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:45:28', '2020-09-06 14:45:28');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/pro-brand/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:45:33', '2020-09-06 14:45:33');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-06 14:45:38', '2020-09-06 14:45:38');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:45:54', '2020-09-06 14:45:54');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:46:04', '2020-09-06 14:46:04');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:46:12', '2020-09-06 14:46:12');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/pro-brand/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:46:19', '2020-09-06 14:46:19');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:46:21', '2020-09-06 14:46:21');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/pro-brand/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"Xs7rPwDyMyUOnzcTSAp1ehi4JFlDeG1w7XKqZgzn\",\"_method\":\"PUT\"}', '2020-09-06 14:46:23', '2020-09-06 14:46:23');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-06 14:51:15', '2020-09-06 14:51:15');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-07 01:38:31', '2020-09-07 01:38:31');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 01:38:38', '2020-09-07 01:38:38');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/pro-brand/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 01:38:41', '2020-09-07 01:38:41');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/pro-brand', 'POST', '127.0.0.1', '{\"label_id\":\"2\",\"brand_name\":\"\\u9999\\u5948\\u513f\",\"description\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"status\":\"on\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-brand\"}', '2020-09-07 01:41:48', '2020-09-07 01:41:48');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-07 01:41:49', '2020-09-07 01:41:49');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/pro-brand/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 01:41:53', '2020-09-07 01:41:53');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/pro-brand', 'POST', '127.0.0.1', '{\"label_id\":\"3\",\"brand_name\":\"\\u4e8c\\u72d7\",\"description\":\"\\u6d4b\\u8bd5\",\"status\":\"on\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-brand\"}', '2020-09-07 01:42:24', '2020-09-07 01:42:24');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-07 01:42:25', '2020-09-07 01:42:25');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 01:55:38', '2020-09-07 01:55:38');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"pro-class\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\"}', '2020-09-07 01:55:58', '2020-09-07 01:55:58');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 01:55:58', '2020-09-07 01:55:58');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 01:56:02', '2020-09-07 01:56:02');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 01:56:04', '2020-09-07 01:56:04');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:08:57', '2020-09-07 02:08:57');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:08:57', '2020-09-07 02:08:57');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:09:37', '2020-09-07 02:09:37');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:09:39', '2020-09-07 02:09:39');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 02:10:22', '2020-09-07 02:10:22');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-class\"}', '2020-09-07 02:10:35', '2020-09-07 02:10:35');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 02:10:35', '2020-09-07 02:10:35');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u8863\\u670d\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"after-save\":\"2\"}', '2020-09-07 02:10:45', '2020-09-07 02:10:45');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 02:10:46', '2020-09-07 02:10:46');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u5176\\u4ed6\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\"}', '2020-09-07 02:10:55', '2020-09-07 02:10:55');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:10:55', '2020-09-07 02:10:55');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/pro-label', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:13:17', '2020-09-07 02:13:17');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:13:19', '2020-09-07 02:13:19');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '[]', '2020-09-07 02:14:04', '2020-09-07 02:14:04');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:14:06', '2020-09-07 02:14:06');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/pro-brand/3', 'PUT', '127.0.0.1', '{\"name\":\"order_by\",\"value\":\"11\",\"pk\":\"3\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-09-07 02:14:15', '2020-09-07 02:14:15');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:14:18', '2020-09-07 02:14:18');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/pro-brand/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:14:24', '2020-09-07 02:14:24');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:14:47', '2020-09-07 02:14:47');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/pro-brand/3', 'PUT', '127.0.0.1', '{\"name\":\"order_by\",\"value\":\"11\",\"pk\":\"3\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-09-07 02:14:53', '2020-09-07 02:14:53');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:14:54', '2020-09-07 02:14:54');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"}}', '2020-09-07 02:15:53', '2020-09-07 02:15:53');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"}}', '2020-09-07 02:17:04', '2020-09-07 02:17:04');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"label_id\":\"3\",\"brand_name\":null,\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:17:09', '2020-09-07 02:17:09');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"label_id\":\"1\",\"brand_name\":null}', '2020-09-07 02:17:13', '2020-09-07 02:17:13');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"label_id\":\"1\",\"brand_name\":\"1\"}', '2020-09-07 02:17:17', '2020-09-07 02:17:17');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"label_id\":\"1\",\"brand_name\":\"ni\"}', '2020-09-07 02:17:22', '2020-09-07 02:17:22');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"order_by\",\"type\":\"desc\"},\"label_id\":\"1\",\"brand_name\":\"ni\"}', '2020-09-07 02:19:43', '2020-09-07 02:19:43');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:19:46', '2020-09-07 02:19:46');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:20:44', '2020-09-07 02:20:44');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:22:03', '2020-09-07 02:22:03');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:28:10', '2020-09-07 02:28:10');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/pro-class/3', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_method\":\"PUT\"}', '2020-09-07 02:28:18', '2020-09-07 02:28:18');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-07 02:28:20', '2020-09-07 02:28:20');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"brand_id\":null,\"class_name\":\"\\u5176\\u4ed6\",\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:28:26', '2020-09-07 02:28:26');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:28:29', '2020-09-07 02:28:29');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/pro-class/3', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"CKI2lTW2xyrAAmlnZTs5USczDqnvNfbSWUTvE2ag\",\"_method\":\"PUT\"}', '2020-09-07 02:28:31', '2020-09-07 02:28:31');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/pro-class/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:28:41', '2020-09-07 02:28:41');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 02:28:43', '2020-09-07 02:28:43');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 07:21:34', '2020-09-07 07:21:34');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 07:21:35', '2020-09-07 07:21:35');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u4ea7\\u54c1\\u8be6\\u60c5\",\"icon\":\"fa-bars\",\"uri\":\"pro-info\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\"}', '2020-09-07 07:21:53', '2020-09-07 07:21:53');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 07:21:54', '2020-09-07 07:21:54');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 07:21:59', '2020-09-07 07:21:59');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 07:22:02', '2020-09-07 07:22:02');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 07:22:55', '2020-09-07 07:22:55');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 07:22:57', '2020-09-07 07:22:57');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 07:31:36', '2020-09-07 07:31:36');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 07:36:42', '2020-09-07 07:36:42');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:00:39', '2020-09-07 08:00:39');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:00:48', '2020-09-07 08:00:48');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:07:45', '2020-09-07 08:07:45');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:20:20', '2020-09-07 08:20:20');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:21:05', '2020-09-07 08:21:05');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"999.00\",\"present_price\":\"999.00\",\"description\":\"<p>\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5<\\/p>\",\"detail_params\":{\"keys\":[\"\\u5c3a\\u7801\",\"\\u989c\\u8272\",\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"42|43|44\",\"\\u7ea2\\u3001\\u767d\",\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\"}', '2020-09-07 08:33:16', '2020-09-07 08:33:16');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:33:17', '2020-09-07 08:33:17');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:37:35', '2020-09-07 08:37:35');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\",\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\",\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\"}', '2020-09-07 08:38:03', '2020-09-07 08:38:03');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-07 08:38:04', '2020-09-07 08:38:04');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\",\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\",\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\"}', '2020-09-07 08:38:42', '2020-09-07 08:38:42');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:38:43', '2020-09-07 08:38:43');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:38:51', '2020-09-07 08:38:51');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:38:53', '2020-09-07 08:38:53');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:38:56', '2020-09-07 08:38:56');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:39:11', '2020-09-07 08:39:11');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:40:27', '2020-09-07 08:40:27');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\"}', '2020-09-07 08:40:40', '2020-09-07 08:40:40');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:40:41', '2020-09-07 08:40:41');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:42:31', '2020-09-07 08:42:31');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\"}', '2020-09-07 08:42:40', '2020-09-07 08:42:40');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/pro-info/1', 'GET', '127.0.0.1', '[]', '2020-09-07 08:45:30', '2020-09-07 08:45:30');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/pro-info/1', 'GET', '127.0.0.1', '[]', '2020-09-07 08:46:04', '2020-09-07 08:46:04');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:46:14', '2020-09-07 08:46:14');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:46:19', '2020-09-07 08:46:19');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\\/\"}', '2020-09-07 08:46:28', '2020-09-07 08:46:28');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:46:29', '2020-09-07 08:46:29');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\"}', '2020-09-07 08:47:52', '2020-09-07 08:47:52');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:53', '2020-09-07 08:47:53');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:53', '2020-09-07 08:47:53');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:54', '2020-09-07 08:47:54');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:55', '2020-09-07 08:47:55');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:55', '2020-09-07 08:47:55');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:56', '2020-09-07 08:47:56');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:57', '2020-09-07 08:47:57');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:57', '2020-09-07 08:47:57');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:58', '2020-09-07 08:47:58');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:59', '2020-09-07 08:47:59');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:47:59', '2020-09-07 08:47:59');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:00', '2020-09-07 08:48:00');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:00', '2020-09-07 08:48:00');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:01', '2020-09-07 08:48:01');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:02', '2020-09-07 08:48:02');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:02', '2020-09-07 08:48:02');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:03', '2020-09-07 08:48:03');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:04', '2020-09-07 08:48:04');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:04', '2020-09-07 08:48:04');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:05', '2020-09-07 08:48:05');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/pro-info/1', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:11', '2020-09-07 08:48:11');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:17', '2020-09-07 08:48:17');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:42', '2020-09-07 08:48:42');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:48:46', '2020-09-07 08:48:46');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.00\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\\/\"}', '2020-09-07 08:48:55', '2020-09-07 08:48:55');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:48:56', '2020-09-07 08:48:56');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:49:01', '2020-09-07 08:49:01');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:49:06', '2020-09-07 08:49:06');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 08:59:06', '2020-09-07 08:59:06');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 08:59:10', '2020-09-07 08:59:10');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 08:59:55', '2020-09-07 08:59:55');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-07 09:00:33', '2020-09-07 09:00:33');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1111.50\",\"present_price\":\"1111.00\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\"}', '2020-09-07 09:00:52', '2020-09-07 09:00:52');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:00:52', '2020-09-07 09:00:52');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 09:02:18', '2020-09-07 09:02:18');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-07 09:02:31', '2020-09-07 09:02:31');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:02:31', '2020-09-07 09:02:31');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 09:02:40', '2020-09-07 09:02:40');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 09:08:48', '2020-09-07 09:08:48');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:10:03', '2020-09-07 09:10:03');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:10:20', '2020-09-07 09:10:20');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:13:11', '2020-09-07 09:13:11');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:13:19', '2020-09-07 09:13:19');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:13:35', '2020-09-07 09:13:35');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:14:33', '2020-09-07 09:14:33');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:14:48', '2020-09-07 09:14:48');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:15:33', '2020-09-07 09:15:33');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:18:10', '2020-09-07 09:18:10');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-07 09:19:22', '2020-09-07 09:19:22');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"pro_name\":null,\"original_price\":{\"start\":\"1\",\"end\":\"2222\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 09:19:29', '2020-09-07 09:19:29');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"pro_name\":null,\"original_price\":{\"start\":\"122222\",\"end\":\"2222\"}}', '2020-09-07 09:19:33', '2020-09-07 09:19:33');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"pro_name\":null,\"original_price\":{\"start\":\"1\",\"end\":\"2222\"},\"_pjax\":\"#pjax-container\"}', '2020-09-07 09:19:35', '2020-09-07 09:19:35');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"pro_name\":null,\"original_price\":{\"start\":\"1\",\"end\":\"2222\"}}', '2020-09-07 09:19:51', '2020-09-07 09:19:51');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 10:10:05', '2020-09-07 10:10:05');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u89c4\\u683c\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"pro-specs-class\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\"}', '2020-09-07 10:10:22', '2020-09-07 10:10:22');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 10:10:22', '2020-09-07 10:10:22');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-07 10:10:25', '2020-09-07 10:10:25');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 10:10:31', '2020-09-07 10:10:31');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/pro-specs-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 10:24:43', '2020-09-07 10:24:43');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/pro-specs-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 10:27:48', '2020-09-07 10:27:48');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/pro-specs-class', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_name\":\"\\u989c\\u8272\",\"order_by\":\"10\",\"status\":\"on\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"after-save\":\"2\"}', '2020-09-07 10:28:51', '2020-09-07 10:28:51');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/pro-specs-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 10:28:51', '2020-09-07 10:28:51');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/pro-specs-class', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_name\":\"\\u5c3a\\u7801\",\"order_by\":\"10\",\"status\":\"on\",\"_token\":\"POsbZIJVRVsgxMYzSJMsQBRV45pbPc0q6ishq6w4\",\"after-save\":\"2\"}', '2020-09-07 10:29:00', '2020-09-07 10:29:00');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/pro-specs-class/create', 'GET', '127.0.0.1', '[]', '2020-09-07 10:29:01', '2020-09-07 10:29:01');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-07 10:29:59', '2020-09-07 10:29:59');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '[]', '2020-09-07 10:33:41', '2020-09-07 10:33:41');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '[]', '2020-09-07 10:39:34', '2020-09-07 10:39:34');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"specs_name\":\"\\u8272\",\"_pjax\":\"#pjax-container\"}', '2020-09-07 10:41:23', '2020-09-07 10:41:23');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"class_id\":\"1\",\"specs_name\":\"\\u8272\"}', '2020-09-07 10:41:29', '2020-09-07 10:41:29');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"class_id\":\"1\",\"specs_name\":null}', '2020-09-07 10:41:33', '2020-09-07 10:41:33');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"brand_id\":\"1\",\"specs_name\":null}', '2020-09-07 10:41:39', '2020-09-07 10:41:39');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"brand_id\":\"1\",\"specs_name\":null}', '2020-09-08 01:19:01', '2020-09-08 01:19:01');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/pro-specs-class', 'GET', '127.0.0.1', '{\"brand_id\":\"1\",\"specs_name\":null}', '2020-09-08 08:24:28', '2020-09-08 08:24:28');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 08:24:45', '2020-09-08 08:24:45');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u89c4\\u683c\\u8be6\\u60c5\",\"icon\":\"fa-bars\",\"uri\":\"pro-specs-detail\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\"}', '2020-09-08 08:24:58', '2020-09-08 08:24:58');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-08 08:24:59', '2020-09-08 08:24:59');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-08 08:25:02', '2020-09-08 08:25:02');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/pro-specs-detail', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 08:25:05', '2020-09-08 08:25:05');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 08:25:08', '2020-09-08 08:25:08');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '[]', '2020-09-08 08:25:21', '2020-09-08 08:25:21');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/pro-specs-detail', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_class_id\":\"1\",\"detail_name\":\"\\u7ea2\\u8272\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\",\"after-save\":\"2\"}', '2020-09-08 08:27:29', '2020-09-08 08:27:29');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '[]', '2020-09-08 08:27:29', '2020-09-08 08:27:29');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/pro-specs-detail', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_class_id\":\"1\",\"detail_name\":\"\\u767d\\u8272\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\",\"after-save\":\"2\"}', '2020-09-08 08:27:37', '2020-09-08 08:27:37');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '[]', '2020-09-08 08:27:38', '2020-09-08 08:27:38');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/pro-specs-detail', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_class_id\":\"2\",\"detail_name\":\"42\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\",\"after-save\":\"2\"}', '2020-09-08 08:27:49', '2020-09-08 08:27:49');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '[]', '2020-09-08 08:27:49', '2020-09-08 08:27:49');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/pro-specs-detail', 'POST', '127.0.0.1', '{\"brand_id\":\"1\",\"class_id\":\"1\",\"specs_class_id\":\"2\",\"detail_name\":\"43\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\"}', '2020-09-08 08:27:57', '2020-09-08 08:27:57');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/pro-specs-detail', 'GET', '127.0.0.1', '[]', '2020-09-08 08:27:58', '2020-09-08 08:27:58');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/pro-specs-detail/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 08:28:01', '2020-09-08 08:28:01');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 09:44:07', '2020-09-08 09:44:07');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 09:44:10', '2020-09-08 09:44:10');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-08 09:46:03', '2020-09-08 09:46:03');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u6d4b\\u8bd5\",\"original_price\":\"111.00\",\"present_price\":\"111.00\",\"description\":\"<p>AS\\u963f\\u8428<\\/p>\",\"detail_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"44\\\",\\\"45\\\",\\\"46\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"45\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"46\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\"}', '2020-09-08 09:48:08', '2020-09-08 09:48:08');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-08 09:48:26', '2020-09-08 09:48:26');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 09:48:30', '2020-09-08 09:48:30');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e392\",\"original_price\":\"111.00\",\"present_price\":\"111.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u767d\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"32\\\",\\\"33\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"32\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"33\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u767d\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"32\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u767d\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"33\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"111\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-08 09:49:18', '2020-09-08 09:49:18');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-08 09:49:19', '2020-09-08 09:49:19');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 09:56:42', '2020-09-08 09:56:42');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '[]', '2020-09-08 09:56:44', '2020-09-08 09:56:44');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/pro-info/2', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e392\",\"original_price\":\"111.00\",\"present_price\":\"111.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u767d\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"32\\\",\\\"33\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"32\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"33\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u767d\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"32\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u767d\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"33\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"111\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"HEnhw0li4VFkgm4XNMGs00VT3QASPOjo366WyL2k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-08 09:56:48', '2020-09-08 09:56:48');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-08 09:57:07', '2020-09-08 09:57:07');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '[]', '2020-09-08 09:57:09', '2020-09-08 09:57:09');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-09 01:22:07', '2020-09-09 01:22:07');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:22:45', '2020-09-09 01:22:45');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/auth/menu/17', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\"}', '2020-09-09 01:22:51', '2020-09-09 01:22:51');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:22:52', '2020-09-09 01:22:52');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/auth/menu/16', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\"}', '2020-09-09 01:22:56', '2020-09-09 01:22:56');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:22:57', '2020-09-09 01:22:57');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:23:01', '2020-09-09 01:23:01');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:23:07', '2020-09-09 01:23:07');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 01:23:08', '2020-09-09 01:23:08');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/pro-info/2/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 01:24:25', '2020-09-09 01:24:25');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-09 01:24:35', '2020-09-09 01:24:35');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:24:37', '2020-09-09 01:24:37');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:24:42', '2020-09-09 01:24:42');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:24:45', '2020-09-09 01:24:45');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"11\\\",\\\"stock\\\":\\\"1\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-09 01:24:59', '2020-09-09 01:24:59');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-09 01:25:00', '2020-09-09 01:25:00');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:03', '2020-09-09 01:25:03');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 01:25:04', '2020-09-09 01:25:04');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:08', '2020-09-09 01:25:08');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Modules_ProInfo\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-09-09 01:25:12', '2020-09-09 01:25:12');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:13', '2020-09-09 01:25:13');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:15', '2020-09-09 01:25:15');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 01:25:17', '2020-09-09 01:25:17');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-09 01:25:40', '2020-09-09 01:25:40');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-09 01:25:40', '2020-09-09 01:25:40');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:43', '2020-09-09 01:25:43');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 01:25:44', '2020-09-09 01:25:44');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 01:25:47', '2020-09-09 01:25:47');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 02:10:33', '2020-09-09 02:10:33');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:12:30', '2020-09-09 02:12:30');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:14:11', '2020-09-09 02:14:11');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:14:53', '2020-09-09 02:14:53');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:14:55', '2020-09-09 02:14:55');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:11', '2020-09-09 02:15:11');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:20', '2020-09-09 02:15:20');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:27', '2020-09-09 02:15:27');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:34', '2020-09-09 02:15:34');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:43', '2020-09-09 02:15:43');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:49', '2020-09-09 02:15:49');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:15:56', '2020-09-09 02:15:56');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:16:01', '2020-09-09 02:16:01');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:16:09', '2020-09-09 02:16:09');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:16:15', '2020-09-09 02:16:15');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/address', 'GET', '127.0.0.1', '[]', '2020-09-09 02:16:35', '2020-09-09 02:16:35');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 02:16:38', '2020-09-09 02:16:38');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/address', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 02:16:41', '2020-09-09 02:16:41');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-09 03:12:25', '2020-09-09 03:12:25');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 03:12:29', '2020-09-09 03:12:29');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 03:13:13', '2020-09-09 03:13:13');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 03:13:15', '2020-09-09 03:13:15');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/05pPX5pqP9GnEgpOnx90rYeWagLp9ETqtJiCZLhv.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/U1IXU9HT0QUNWgXfeqnYmklQrFZPqWJOriMVOtfl.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/EhhzhnGK6NOiommnNRXySosdaS6nSJKzMjlcrFrN.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/gX7Z3VYSuGEx2s5U5q94XcYQRfFXINCAA0yeaVJz.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/hyrISmptJKkKPQ25IRsq2nESfMgiJX96YIL8PXya.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/8pCtB9TDcBk6jXLd4lvwnfMItShVGILQVxuhkb44.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-09 03:13:40', '2020-09-09 03:13:40');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-09 03:13:40', '2020-09-09 03:13:40');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 03:15:20', '2020-09-09 03:15:20');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 03:27:45', '2020-09-09 03:27:45');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 03:27:50', '2020-09-09 03:27:50');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"is_recommend\":\"on\",\"_token\":\"QRQv14fmrCzS1BzRytsrHH5yqxxacfT9C5jVi4zD\",\"_method\":\"PUT\"}', '2020-09-09 03:28:04', '2020-09-09 03:28:04');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-09 07:15:41', '2020-09-09 07:15:41');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-09 12:13:54', '2020-09-09 12:13:54');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 12:13:58', '2020-09-09 12:13:58');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"is_recommend\":\"off\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 12:14:07', '2020-09-09 12:14:07');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"is_recommend\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 12:14:08', '2020-09-09 12:14:08');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-09 12:14:53', '2020-09-09 12:14:53');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"is_recommend\":\"off\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 12:14:56', '2020-09-09 12:14:56');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"is_recommend\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 12:14:57', '2020-09-09 12:14:57');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 12:15:03', '2020-09-09 12:15:03');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 12:15:14', '2020-09-09 12:15:14');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 12:15:18', '2020-09-09 12:15:18');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 12:15:26', '2020-09-09 12:15:26');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 12:18:01', '2020-09-09 12:18:01');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 13:16:14', '2020-09-09 13:16:14');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"freight-template\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\"}', '2020-09-09 13:16:34', '2020-09-09 13:16:34');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-09 13:16:35', '2020-09-09 13:16:35');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-09 13:16:37', '2020-09-09 13:16:37');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 13:16:40', '2020-09-09 13:16:40');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 13:16:42', '2020-09-09 13:16:42');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:18:38', '2020-09-09 13:18:38');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:22:21', '2020-09-09 13:22:21');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:23:14', '2020-09-09 13:23:14');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:24:43', '2020-09-09 13:24:43');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:24:56', '2020-09-09 13:24:56');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:26:54', '2020-09-09 13:26:54');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:27:05', '2020-09-09 13:27:05');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:27:13', '2020-09-09 13:27:13');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:30:18', '2020-09-09 13:30:18');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:30:35', '2020-09-09 13:30:35');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:30:47', '2020-09-09 13:30:47');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:31:11', '2020-09-09 13:31:11');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:31:20', '2020-09-09 13:31:20');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:58:43', '2020-09-09 13:58:43');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:59:00', '2020-09-09 13:59:00');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 13:59:20', '2020-09-09 13:59:20');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:03:20', '2020-09-09 14:03:20');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:13:44', '2020-09-09 14:13:44');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:13:56', '2020-09-09 14:13:56');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:15:05', '2020-09-09 14:15:05');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:27:14', '2020-09-09 14:27:14');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:33:59', '2020-09-09 14:33:59');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:35:21', '2020-09-09 14:35:21');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:37:50', '2020-09-09 14:37:50');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:38:04', '2020-09-09 14:38:04');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:40:41', '2020-09-09 14:40:41');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:42:14', '2020-09-09 14:42:14');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:44:01', '2020-09-09 14:44:01');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:44:27', '2020-09-09 14:44:27');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:45:28', '2020-09-09 14:45:28');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:45:47', '2020-09-09 14:45:47');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:46:02', '2020-09-09 14:46:02');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:46:29', '2020-09-09 14:46:29');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:47:03', '2020-09-09 14:47:03');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:47:06', '2020-09-09 14:47:06');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:47:12', '2020-09-09 14:47:12');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/freight-template', 'POST', '127.0.0.1', '{\"template_name\":\"\\u5305\\u90ae\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"1\",\"is_free_shipping\":\"1\",\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"after-save\":\"2\"}', '2020-09-09 14:47:33', '2020-09-09 14:47:33');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:47:34', '2020-09-09 14:47:34');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/freight-template', 'POST', '127.0.0.1', '{\"template_name\":\"\\u5305\\u90ae\\u6a21\\u677f\",\"pro_country\":null,\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"1\",\"is_free_shipping\":\"1\",\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"after-save\":\"2\"}', '2020-09-09 14:48:11', '2020-09-09 14:48:11');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '[]', '2020-09-09 14:48:11', '2020-09-09 14:48:11');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/freight-template', 'POST', '127.0.0.1', '{\"template_name\":\"\\u5305\\u90ae\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"1\",\"is_free_shipping\":\"1\",\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\"}', '2020-09-09 14:48:20', '2020-09-09 14:48:20');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:48:21', '2020-09-09 14:48:21');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:48:26', '2020-09-09 14:48:26');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/freight-template', 'POST', '127.0.0.1', '{\"template_name\":\"\\u6b63\\u5e38\\u8fd0\\u8d39\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"0\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"10\",\"incr_piece\":\"1\",\"incr_price\":\"5\"},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 14:48:53', '2020-09-09 14:48:53');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:48:54', '2020-09-09 14:48:54');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/freight-template/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:48:57', '2020-09-09 14:48:57');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/freight-template/2', 'GET', '127.0.0.1', '[]', '2020-09-09 14:48:58', '2020-09-09 14:48:58');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:49:01', '2020-09-09 14:49:01');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/freight-template/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:49:04', '2020-09-09 14:49:04');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:49:08', '2020-09-09 14:49:08');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/freight-template/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:49:10', '2020-09-09 14:49:10');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/freight-template', 'POST', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"8\"},\"other_template\":{\"new_1\":{\"country\":\"1\",\"province\":\"130000\",\"default_piece\":\"1\",\"default_price\":\"90\",\"incr_piece\":\"1\",\"incr_price\":\"9\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 14:49:57', '2020-09-09 14:49:57');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:49:57', '2020-09-09 14:49:57');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:50:01', '2020-09-09 14:50:01');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:52:39', '2020-09-09 14:52:39');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:53:50', '2020-09-09 14:53:50');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:53:57', '2020-09-09 14:53:57');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:54:32', '2020-09-09 14:54:32');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:54:44', '2020-09-09 14:54:44');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:54:55', '2020-09-09 14:54:55');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"8\"},\"other_template\":{\"new_1\":{\"country\":\"1\",\"province\":\"120000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 14:55:10', '2020-09-09 14:55:10');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:55:11', '2020-09-09 14:55:11');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:55:14', '2020-09-09 14:55:14');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"8\"},\"other_template\":{\"new_1\":{\"country\":\"1\",\"province\":\"120000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 14:55:44', '2020-09-09 14:55:44');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:55:44', '2020-09-09 14:55:44');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:55:48', '2020-09-09 14:55:48');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:58:33', '2020-09-09 14:58:33');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"province\":\"120000\",\"default_piece\":\"1\",\"default_price\":\"22\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 14:58:43', '2020-09-09 14:58:43');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 14:58:44', '2020-09-09 14:58:44');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 14:58:46', '2020-09-09 14:58:46');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 14:59:43', '2020-09-09 14:59:43');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:00:23', '2020-09-09 15:00:23');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":{\"0\":{\"country\":\"1\",\"province\":\"110000\",\"default_piece\":\"1\",\"default_price\":\"22\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},\"new_1\":{\"country\":\"1\",\"province\":\"150000\",\"default_piece\":\"3\",\"default_price\":\"33\",\"incr_piece\":\"3\",\"incr_price\":\"33\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 15:00:38', '2020-09-09 15:00:38');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:00:38', '2020-09-09 15:00:38');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:01:01', '2020-09-09 15:01:01');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:02:11', '2020-09-09 15:02:11');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:02:28', '2020-09-09 15:02:28');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:02:56', '2020-09-09 15:02:56');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"province\":\"120000\",\"default_piece\":\"1\",\"default_price\":\"22\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},{\"country\":\"1\",\"province\":\"150000\",\"default_piece\":\"3\",\"default_price\":\"33\",\"incr_piece\":\"3\",\"incr_price\":\"33\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 15:03:04', '2020-09-09 15:03:04');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:03:05', '2020-09-09 15:03:05');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:03:08', '2020-09-09 15:03:08');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:05:44', '2020-09-09 15:05:44');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:05:47', '2020-09-09 15:05:47');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:07:33', '2020-09-09 15:07:33');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"province\":[null],\"default_piece\":\"1\",\"default_price\":\"22\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"1\"},{\"country\":\"1\",\"province\":[null],\"default_piece\":\"3\",\"default_price\":\"33\",\"incr_piece\":\"3\",\"incr_price\":\"33\",\"_remove_\":\"1\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 15:07:38', '2020-09-09 15:07:38');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:07:39', '2020-09-09 15:07:39');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:07:42', '2020-09-09 15:07:42');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":{\"new_1\":{\"country\":\"1\",\"province\":[\"120000\",\"810000\",null],\"default_piece\":\"1\",\"default_price\":\"33\",\"incr_piece\":\"1\",\"incr_price\":\"33\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 15:08:00', '2020-09-09 15:08:00');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:08:01', '2020-09-09 15:08:01');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:08:04', '2020-09-09 15:08:04');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:08:13', '2020-09-09 15:08:13');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:08:33', '2020-09-09 15:08:33');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"province\":[null],\"default_piece\":\"1\",\"default_price\":\"33\",\"incr_piece\":\"1\",\"incr_price\":\"33\",\"_remove_\":\"1\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 15:10:15', '2020-09-09 15:10:15');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:10:15', '2020-09-09 15:10:15');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:10:19', '2020-09-09 15:10:19');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":{\"new_1\":{\"country\":\"1\",\"province\":\"140000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 15:10:28', '2020-09-09 15:10:28');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:10:28', '2020-09-09 15:10:28');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:10:32', '2020-09-09 15:10:32');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:10:52', '2020-09-09 15:10:52');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"text\":\"130000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\"}', '2020-09-09 15:11:03', '2020-09-09 15:11:03');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:11:03', '2020-09-09 15:11:03');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:11:07', '2020-09-09 15:11:07');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"2\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 15:11:30', '2020-09-09 15:11:30');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:11:30', '2020-09-09 15:11:30');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:11:33', '2020-09-09 15:11:33');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:11:43', '2020-09-09 15:11:43');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:11:47', '2020-09-09 15:11:47');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:11:50', '2020-09-09 15:11:50');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:15:45', '2020-09-09 15:15:45');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:15:56', '2020-09-09 15:15:56');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:16:00', '2020-09-09 15:16:00');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/freight-template/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:17:19', '2020-09-09 15:17:19');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/freight-template/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:17:50', '2020-09-09 15:17:50');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/freight-template/1', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u5305\\u90ae\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"7\",\"is_free_shipping\":\"1\",\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\\/3\\/edit\"}', '2020-09-09 15:17:54', '2020-09-09 15:17:54');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:17:55', '2020-09-09 15:17:55');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":[{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\\/1\\/edit\"}', '2020-09-09 15:18:09', '2020-09-09 15:18:09');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/freight-template/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-09 15:18:09', '2020-09-09 15:18:09');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:18:24', '2020-09-09 15:18:24');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:18:28', '2020-09-09 15:18:28');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:18:30', '2020-09-09 15:18:30');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/freight-template/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-09 15:18:33', '2020-09-09 15:18:33');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/freight-template/2', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u6b63\\u5e38\\u8fd0\\u8d39\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"status\":\"on\",\"_token\":\"70RYJzxVxoc8H2fgsVZ2F4x5baRngRJUvFDqd5oR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/freight-template\"}', '2020-09-09 15:18:38', '2020-09-09 15:18:38');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-09 15:18:38', '2020-09-09 15:18:38');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-10 02:31:58', '2020-09-10 02:31:58');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-10 02:32:49', '2020-09-10 02:32:49');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:32:53', '2020-09-10 02:32:53');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:32:57', '2020-09-10 02:32:57');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"11\",\"incr_price\":\"111\"},\"other_template\":[{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/freight-template\"}', '2020-09-10 02:39:13', '2020-09-10 02:39:13');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:39:14', '2020-09-10 02:39:14');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:39:20', '2020-09-10 02:39:20');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":null,\"default_price\":null,\"incr_piece\":null,\"incr_price\":null},\"other_template\":{\"0\":{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},\"new_1\":{\"country\":\"1\",\"text\":\"320000\",\"default_piece\":\"1\",\"default_price\":\"1111\",\"incr_piece\":\"1\",\"incr_price\":\"111\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/freight-template\"}', '2020-09-10 02:39:31', '2020-09-10 02:39:31');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:39:32', '2020-09-10 02:39:32');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:42:29', '2020-09-10 02:42:29');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"3\",\"default_price\":\"3\",\"incr_piece\":\"3\",\"incr_price\":\"3\"},\"other_template\":[{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},{\"country\":\"1\",\"text\":\"320000\",\"default_piece\":\"1\",\"default_price\":\"1111\",\"incr_piece\":\"1\",\"incr_price\":\"111\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/freight-template\"}', '2020-09-10 02:42:35', '2020-09-10 02:42:35');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:42:36', '2020-09-10 02:42:36');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:42:38', '2020-09-10 02:42:38');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 02:42:59', '2020-09-10 02:42:59');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"3\",\"default_price\":\"3\",\"incr_piece\":\"3\",\"incr_price\":\"3\"},\"other_template\":[{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},{\"country\":\"1\",\"text\":\"320000\",\"default_piece\":\"1\",\"default_price\":\"1111\",\"incr_piece\":\"1\",\"incr_price\":\"111\",\"_remove_\":\"0\"}],\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\"}', '2020-09-10 02:43:19', '2020-09-10 02:43:19');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:43:19', '2020-09-10 02:43:19');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:43:28', '2020-09-10 02:43:28');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 02:43:59', '2020-09-10 02:43:59');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:44:48', '2020-09-10 02:44:48');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/freight-template/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:44:51', '2020-09-10 02:44:51');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/freight-template/2', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u6b63\\u5e38\\u8fd0\\u8d39\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"9\"},\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/freight-template\"}', '2020-09-10 02:44:58', '2020-09-10 02:44:58');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:44:59', '2020-09-10 02:44:59');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/freight-template/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:45:08', '2020-09-10 02:45:08');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/freight-template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:45:11', '2020-09-10 02:45:11');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:45:13', '2020-09-10 02:45:13');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/freight-template/3', 'PUT', '127.0.0.1', '{\"template_name\":\"\\u7279\\u6b8a\\u6a21\\u677f\",\"pro_country\":\"1\",\"pro_province\":\"110000\",\"pro_city\":\"110100\",\"pro_area\":\"110101\",\"delivery_time\":\"3\",\"is_free_shipping\":\"0\",\"default_template\":{\"default_piece\":\"3\",\"default_price\":\"3\",\"incr_piece\":\"3\",\"incr_price\":\"3\"},\"other_template\":{\"0\":{\"country\":\"1\",\"text\":\"810000\",\"default_piece\":\"1\",\"default_price\":\"11\",\"incr_piece\":\"1\",\"incr_price\":\"11\",\"_remove_\":\"0\"},\"1\":{\"country\":\"1\",\"text\":\"320000\",\"default_piece\":\"1\",\"default_price\":\"1111\",\"incr_piece\":\"1\",\"incr_price\":\"111\",\"_remove_\":\"1\"},\"new_1\":{\"country\":\"1\",\"text\":\"820000\",\"default_piece\":\"1\",\"default_price\":\"80\",\"incr_piece\":\"1\",\"incr_price\":\"15\",\"_remove_\":\"0\"}},\"status\":\"on\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/freight-template\"}', '2020-09-10 02:45:28', '2020-09-10 02:45:28');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 02:45:28', '2020-09-10 02:45:28');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 02:45:31', '2020-09-10 02:45:31');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 02:46:05', '2020-09-10 02:46:05');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 02:46:15', '2020-09-10 02:46:15');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/freight-template/3/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 03:10:14', '2020-09-10 03:10:14');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 03:42:27', '2020-09-10 03:42:27');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 03:42:30', '2020-09-10 03:42:30');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 03:42:40', '2020-09-10 03:42:40');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 03:42:57', '2020-09-10 03:42:57');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/05pPX5pqP9GnEgpOnx90rYeWagLp9ETqtJiCZLhv.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/U1IXU9HT0QUNWgXfeqnYmklQrFZPqWJOriMVOtfl.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/EhhzhnGK6NOiommnNRXySosdaS6nSJKzMjlcrFrN.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/gX7Z3VYSuGEx2s5U5q94XcYQRfFXINCAA0yeaVJz.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/hyrISmptJKkKPQ25IRsq2nESfMgiJX96YIL8PXya.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/8pCtB9TDcBk6jXLd4lvwnfMItShVGILQVxuhkb44.jpeg\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"v2JIerK4rLSUKz0WJsZgnaP4BN6gTJKbGYpXQdyQ\",\"_method\":\"PUT\"}', '2020-09-10 03:43:15', '2020-09-10 03:43:15');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-10 03:43:16', '2020-09-10 03:43:16');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 03:43:18', '2020-09-10 03:43:18');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-10 07:50:44', '2020-09-10 07:50:44');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 07:50:59', '2020-09-10 07:50:59');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"5yJEGrI9T5tOwKUu4KMlQwDlz6UpG3tRxUPoWqHT\"}', '2020-09-10 07:51:25', '2020-09-10 07:51:25');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:51:25', '2020-09-10 07:51:25');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:51:29', '2020-09-10 07:51:29');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:51:38', '2020-09-10 07:51:38');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"5yJEGrI9T5tOwKUu4KMlQwDlz6UpG3tRxUPoWqHT\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":9}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":18}]},{\\\"id\\\":19}]\"}', '2020-09-10 07:51:48', '2020-09-10 07:51:48');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 07:51:49', '2020-09-10 07:51:49');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:51:51', '2020-09-10 07:51:51');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 07:51:54', '2020-09-10 07:51:54');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 07:52:06', '2020-09-10 07:52:06');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"retail-order\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"5yJEGrI9T5tOwKUu4KMlQwDlz6UpG3tRxUPoWqHT\"}', '2020-09-10 07:52:28', '2020-09-10 07:52:28');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:52:29', '2020-09-10 07:52:29');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-09-10 07:52:31', '2020-09-10 07:52:31');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/retail-order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 07:52:34', '2020-09-10 07:52:34');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/freight-template', 'GET', '127.0.0.1', '[]', '2020-09-10 13:14:19', '2020-09-10 13:14:19');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 13:14:23', '2020-09-10 13:14:23');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 13:14:26', '2020-09-10 13:14:26');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"rOaKsZO0kVfEHxqblwZgUIqcD9ZDW3cQOMY8hdm7\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-10 13:15:12', '2020-09-10 13:15:12');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-10 13:15:13', '2020-09-10 13:15:13');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-10 13:15:15', '2020-09-10 13:15:15');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 13:15:16', '2020-09-10 13:15:16');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-10 13:15:52', '2020-09-10 13:15:52');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-11 02:59:57', '2020-09-11 02:59:57');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-11 03:00:02', '2020-09-11 03:00:02');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-11 03:00:05', '2020-09-11 03:00:05');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-11 03:00:11', '2020-09-11 03:00:11');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:20:10', '2020-09-12 12:20:10');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:41:28', '2020-09-12 12:41:28');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:41:32', '2020-09-12 12:41:32');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:41:37', '2020-09-12 12:41:37');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:41:43', '2020-09-12 12:41:43');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:41:51', '2020-09-12 12:41:51');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:41:53', '2020-09-12 12:41:53');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:41:56', '2020-09-12 12:41:56');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:44:03', '2020-09-12 12:44:03');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:44:06', '2020-09-12 12:44:06');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:44:07', '2020-09-12 12:44:07');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:44:38', '2020-09-12 12:44:38');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:44:38', '2020-09-12 12:44:38');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:44:43', '2020-09-12 12:44:43');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:44:46', '2020-09-12 12:44:46');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 12:44:46', '2020-09-12 12:44:46');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:45:05', '2020-09-12 12:45:05');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/pro-class/1', 'GET', '127.0.0.1', '[]', '2020-09-12 12:46:07', '2020-09-12 12:46:07');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:46:10', '2020-09-12 12:46:10');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:46:14', '2020-09-12 12:46:14');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/pro-class/1', 'GET', '127.0.0.1', '[]', '2020-09-12 12:46:22', '2020-09-12 12:46:22');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/pro-class/1', 'GET', '127.0.0.1', '[]', '2020-09-12 12:46:25', '2020-09-12 12:46:25');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:46:33', '2020-09-12 12:46:33');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:46:38', '2020-09-12 12:46:38');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-12 12:46:40', '2020-09-12 12:46:40');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/pro-class/1', 'GET', '127.0.0.1', '[]', '2020-09-12 12:47:06', '2020-09-12 12:47:06');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:10', '2020-09-12 12:47:10');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:13', '2020-09-12 12:47:13');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"id\":\"1\",\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-12 12:47:18', '2020-09-12 12:47:18');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/pro-class/1', 'GET', '127.0.0.1', '[]', '2020-09-12 12:47:30', '2020-09-12 12:47:30');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:37', '2020-09-12 12:47:37');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:47:40', '2020-09-12 12:47:40');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/pro-class/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:42', '2020-09-12 12:47:42');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"id\":\"1\",\"label_id\":\"1\",\"brand_id\":\"1\",\"class_name\":\"\\u978b\\u5b50\",\"status\":\"off\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-12 12:47:46', '2020-09-12 12:47:46');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:47:47', '2020-09-12 12:47:47');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:51', '2020-09-12 12:47:51');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:47:56', '2020-09-12 12:47:56');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:47:57', '2020-09-12 12:47:57');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:48:02', '2020-09-12 12:48:02');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:48:05', '2020-09-12 12:48:05');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 12:51:09', '2020-09-12 12:51:09');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:51:10', '2020-09-12 12:51:10');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:51:13', '2020-09-12 12:51:13');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:51:21', '2020-09-12 12:51:21');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:51:23', '2020-09-12 12:51:23');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:51:25', '2020-09-12 12:51:25');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:51:34', '2020-09-12 12:51:34');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:51:37', '2020-09-12 12:51:37');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:52:17', '2020-09-12 12:52:17');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:52:20', '2020-09-12 12:52:20');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:53:28', '2020-09-12 12:53:28');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:53:31', '2020-09-12 12:53:31');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:53:58', '2020-09-12 12:53:58');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:54:01', '2020-09-12 12:54:01');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:54:08', '2020-09-12 12:54:08');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:54:12', '2020-09-12 12:54:12');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:54:54', '2020-09-12 12:54:54');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:54:56', '2020-09-12 12:54:56');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:55:11', '2020-09-12 12:55:11');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:55:14', '2020-09-12 12:55:14');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:55:20', '2020-09-12 12:55:20');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:55:23', '2020-09-12 12:55:23');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:55:26', '2020-09-12 12:55:26');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:55:28', '2020-09-12 12:55:28');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:55:30', '2020-09-12 12:55:30');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 12:56:00', '2020-09-12 12:56:00');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:56:02', '2020-09-12 12:56:02');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:56:04', '2020-09-12 12:56:04');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:56:09', '2020-09-12 12:56:09');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:56:12', '2020-09-12 12:56:12');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:56:14', '2020-09-12 12:56:14');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:56:19', '2020-09-12 12:56:19');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:57:13', '2020-09-12 12:57:13');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:57:16', '2020-09-12 12:57:16');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:57:40', '2020-09-12 12:57:40');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:58:17', '2020-09-12 12:58:17');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:58:21', '2020-09-12 12:58:21');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 12:59:00', '2020-09-12 12:59:00');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:59:02', '2020-09-12 12:59:02');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:59:07', '2020-09-12 12:59:07');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:59:10', '2020-09-12 12:59:10');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/pro-class/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 12:59:12', '2020-09-12 12:59:12');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 12:59:15', '2020-09-12 12:59:15');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:09', '2020-09-12 13:01:09');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/pro-brand/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 13:01:11', '2020-09-12 13:01:11');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:14', '2020-09-12 13:01:14');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:18', '2020-09-12 13:01:18');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/pro-brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:24', '2020-09-12 13:01:24');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/pro-brand/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 13:01:25', '2020-09-12 13:01:25');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:28', '2020-09-12 13:01:28');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:01:32', '2020-09-12 13:01:32');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/pro-class/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:30:01', '2020-09-12 13:30:01');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:30:52', '2020-09-12 13:30:52');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-12 13:42:34', '2020-09-12 13:42:34');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Modules_ProClass\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-09-12 13:42:38', '2020-09-12 13:42:38');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 13:42:39', '2020-09-12 13:42:39');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:19:10', '2020-09-12 14:19:10');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:19:14', '2020-09-12 14:19:14');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"111.00\",\"description\":null,\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"single\\\"}\",\"total_count\":\"1\",\"sale_count\":\"1\",\"freight_template_id\":null,\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:19:56', '2020-09-12 14:19:56');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-12 14:19:57', '2020-09-12 14:19:57');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"111.00\",\"description\":\"<p>123123<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"single\\\"}\",\"total_count\":\"1\",\"sale_count\":\"1\",\"freight_template_id\":null,\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\"}', '2020-09-12 14:20:19', '2020-09-12 14:20:19');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:20:19', '2020-09-12 14:20:19');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/pro-info/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:20:23', '2020-09-12 14:20:23');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/pro-info/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\"}', '2020-09-12 14:20:30', '2020-09-12 14:20:30');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:20:31', '2020-09-12 14:20:31');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:21:00', '2020-09-12 14:21:00');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/pro-info', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"11.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u7eff\\u8272\\\"],\\\"\\u5c3a\\u7801\\\":[\\\"XXL\\\",\\\"XL\\\"]},\\\"sku\\\":[{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"11\",\"freight_template_id\":\"1\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:21:53', '2020-09-12 14:21:53');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:21:53', '2020-09-12 14:21:53');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:21:57', '2020-09-12 14:21:57');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 14:21:58', '2020-09-12 14:21:58');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/pro-info/4', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"11.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"XXL\\\",\\\"XL\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u7eff\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"11\",\"freight_template_id\":\"1\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:22:02', '2020-09-12 14:22:02');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/pro-info/4', 'GET', '127.0.0.1', '[]', '2020-09-12 14:22:35', '2020-09-12 14:22:35');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/pro-info/4', 'GET', '127.0.0.1', '[]', '2020-09-12 14:22:39', '2020-09-12 14:22:39');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-12 14:23:10', '2020-09-12 14:23:10');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:23:13', '2020-09-12 14:23:13');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:23:16', '2020-09-12 14:23:16');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 14:23:17', '2020-09-12 14:23:17');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/pro-info/4', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"11.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"XXL\\\",\\\"XL\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u7eff\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"11\",\"freight_template_id\":\"1\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:23:19', '2020-09-12 14:23:19');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:32:56', '2020-09-12 14:32:56');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:32:59', '2020-09-12 14:32:59');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:33:08', '2020-09-12 14:33:08');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-12 14:33:08', '2020-09-12 14:33:08');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\"}', '2020-09-12 14:36:00', '2020-09-12 14:36:00');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:36:00', '2020-09-12 14:36:00');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:36:14', '2020-09-12 14:36:14');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:36:23', '2020-09-12 14:36:23');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:36:24', '2020-09-12 14:36:24');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:36:33', '2020-09-12 14:36:33');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:37:01', '2020-09-12 14:37:01');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:37:01', '2020-09-12 14:37:01');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:37:32', '2020-09-12 14:37:32');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"3299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:37:40', '2020-09-12 14:37:40');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:37:41', '2020-09-12 14:37:41');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:37:49', '2020-09-12 14:37:49');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"3299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:37:54', '2020-09-12 14:37:54');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:37:55', '2020-09-12 14:37:55');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:38:16', '2020-09-12 14:38:16');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:38:44', '2020-09-12 14:38:44');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:38:45', '2020-09-12 14:38:45');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:39:07', '2020-09-12 14:39:07');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:39:30', '2020-09-12 14:39:30');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:39:31', '2020-09-12 14:39:31');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:40:41', '2020-09-12 14:40:41');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"3299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:40:50', '2020-09-12 14:40:50');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:40:51', '2020-09-12 14:40:51');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:41:31', '2020-09-12 14:41:31');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"3299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:41:35', '2020-09-12 14:41:35');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:41:36', '2020-09-12 14:41:36');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-12 14:41:41', '2020-09-12 14:41:41');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"2\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"L4vy3hL5XvJfTjJN39dnpEDBETTNrA80QEA9GR94\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-12 14:41:47', '2020-09-12 14:41:47');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-12 14:41:48', '2020-09-12 14:41:48');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-13 14:31:28', '2020-09-13 14:31:28');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"Bka9oLqngG35ftGl1gF4BhgIweMRvmKU1XvfZk9t\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-13 14:31:34', '2020-09-13 14:31:34');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-13 14:31:35', '2020-09-13 14:31:35');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 20:27:48', '2020-09-15 20:27:48');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 20:43:18', '2020-09-15 20:43:18');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:01:44', '2020-09-15 21:01:44');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:01:47', '2020-09-15 21:01:47');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-15 21:17:30', '2020-09-15 21:17:30');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-15 21:18:12', '2020-09-15 21:18:12');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:38:22', '2020-09-15 21:38:22');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:40:11', '2020-09-15 21:40:11');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:40:31', '2020-09-15 21:40:31');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:41:19', '2020-09-15 21:41:19');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:42:37', '2020-09-15 21:42:37');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:27', '2020-09-15 21:45:27');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:50', '2020-09-15 21:45:50');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:45:54', '2020-09-15 21:45:54');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:55', '2020-09-15 21:45:55');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:55', '2020-09-15 21:45:55');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:45:58', '2020-09-15 21:45:58');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:59', '2020-09-15 21:45:59');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:45:59', '2020-09-15 21:45:59');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:46:17', '2020-09-15 21:46:17');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:46:29', '2020-09-15 21:46:29');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:46:49', '2020-09-15 21:46:49');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:46:54', '2020-09-15 21:46:54');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:46:58', '2020-09-15 21:46:58');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:46:58', '2020-09-15 21:46:58');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:46:59', '2020-09-15 21:46:59');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:47:08', '2020-09-15 21:47:08');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:47:08', '2020-09-15 21:47:08');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:47:08', '2020-09-15 21:47:08');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:50:58', '2020-09-15 21:50:58');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:50:58', '2020-09-15 21:50:58');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:50:59', '2020-09-15 21:50:59');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:51:30', '2020-09-15 21:51:30');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:51:33', '2020-09-15 21:51:33');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:51:34', '2020-09-15 21:51:34');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-09-15 21:51:34', '2020-09-15 21:51:34');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/pro-label', 'GET', '127.0.0.1', '[]', '2020-09-15 21:51:41', '2020-09-15 21:51:41');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:51:46', '2020-09-15 21:51:46');
INSERT INTO `admin_operation_log` VALUES (918, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:53:53', '2020-09-15 21:53:53');
INSERT INTO `admin_operation_log` VALUES (919, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:54:07', '2020-09-15 21:54:07');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:57:41', '2020-09-15 21:57:41');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:58:02', '2020-09-15 21:58:02');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:58:10', '2020-09-15 21:58:10');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:59:17', '2020-09-15 21:59:17');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:59:19', '2020-09-15 21:59:19');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '[]', '2020-09-15 21:59:35', '2020-09-15 21:59:35');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"parent_id\":\"1\",\"class_name\":\"\\u7bee\\u7403\\u978b\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\"}', '2020-09-15 21:59:47', '2020-09-15 21:59:47');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 21:59:48', '2020-09-15 21:59:48');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 21:59:51', '2020-09-15 21:59:51');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"parent_id\":\"2\",\"class_name\":\"\\u8fd0\\u52a8\\u886b\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-15 22:00:03', '2020-09-15 22:00:03');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 22:00:03', '2020-09-15 22:00:03');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:00:39', '2020-09-15 22:00:39');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"parent_id\":\"3\",\"class_name\":\"\\u9632\\u6ed1\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-15 22:00:52', '2020-09-15 22:00:52');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 22:00:53', '2020-09-15 22:00:53');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:00:56', '2020-09-15 22:00:56');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"parent_id\":\"3\",\"class_name\":\"\\u51cf\\u9707\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-15 22:01:09', '2020-09-15 22:01:09');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 22:01:10', '2020-09-15 22:01:10');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:01:17', '2020-09-15 22:01:17');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:01:20', '2020-09-15 22:01:20');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-15 22:36:53', '2020-09-15 22:36:53');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/pro-info/create', 'GET', '127.0.0.1', '[]', '2020-09-15 22:37:02', '2020-09-15 22:37:02');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/pro-class', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:37:43', '2020-09-15 22:37:43');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/pro-class/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:37:46', '2020-09-15 22:37:46');
INSERT INTO `admin_operation_log` VALUES (943, 1, 'admin/pro-class', 'POST', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"parent_id\":\"0\",\"class_name\":\"\\u5176\\u4ed6\",\"status\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-class\"}', '2020-09-15 22:37:54', '2020-09-15 22:37:54');
INSERT INTO `admin_operation_log` VALUES (944, 1, 'admin/pro-class', 'GET', '127.0.0.1', '[]', '2020-09-15 22:37:55', '2020-09-15 22:37:55');
INSERT INTO `admin_operation_log` VALUES (945, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:38:11', '2020-09-15 22:38:11');
INSERT INTO `admin_operation_log` VALUES (946, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:38:13', '2020-09-15 22:38:13');
INSERT INTO `admin_operation_log` VALUES (947, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:38:30', '2020-09-15 22:38:30');
INSERT INTO `admin_operation_log` VALUES (948, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:40:04', '2020-09-15 22:40:04');
INSERT INTO `admin_operation_log` VALUES (949, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:42:37', '2020-09-15 22:42:37');
INSERT INTO `admin_operation_log` VALUES (950, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:43:23', '2020-09-15 22:43:23');
INSERT INTO `admin_operation_log` VALUES (951, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"second_class_id\":\"3\",\"third_class_id\":\"6\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_method\":\"PUT\"}', '2020-09-15 22:43:34', '2020-09-15 22:43:34');
INSERT INTO `admin_operation_log` VALUES (952, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-15 22:43:35', '2020-09-15 22:43:35');
INSERT INTO `admin_operation_log` VALUES (953, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:43:38', '2020-09-15 22:43:38');
INSERT INTO `admin_operation_log` VALUES (954, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"second_class_id\":\"3\",\"third_class_id\":\"6\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/pro-info\"}', '2020-09-15 22:44:13', '2020-09-15 22:44:13');
INSERT INTO `admin_operation_log` VALUES (955, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-15 22:44:14', '2020-09-15 22:44:14');
INSERT INTO `admin_operation_log` VALUES (956, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:44:18', '2020-09-15 22:44:18');
INSERT INTO `admin_operation_log` VALUES (957, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:45:10', '2020-09-15 22:45:10');
INSERT INTO `admin_operation_log` VALUES (958, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:46:30', '2020-09-15 22:46:30');
INSERT INTO `admin_operation_log` VALUES (959, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:49:25', '2020-09-15 22:49:25');
INSERT INTO `admin_operation_log` VALUES (960, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:51:04', '2020-09-15 22:51:04');
INSERT INTO `admin_operation_log` VALUES (961, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:51:30', '2020-09-15 22:51:30');
INSERT INTO `admin_operation_log` VALUES (962, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:52:09', '2020-09-15 22:52:09');
INSERT INTO `admin_operation_log` VALUES (963, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:52:45', '2020-09-15 22:52:45');
INSERT INTO `admin_operation_log` VALUES (964, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:53:00', '2020-09-15 22:53:00');
INSERT INTO `admin_operation_log` VALUES (965, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"second_class_id\":\"3\",\"third_class_id\":\"6\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_method\":\"PUT\"}', '2020-09-15 22:53:44', '2020-09-15 22:53:44');
INSERT INTO `admin_operation_log` VALUES (966, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-15 22:53:45', '2020-09-15 22:53:45');
INSERT INTO `admin_operation_log` VALUES (967, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:53:48', '2020-09-15 22:53:48');
INSERT INTO `admin_operation_log` VALUES (968, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:55:20', '2020-09-15 22:55:20');
INSERT INTO `admin_operation_log` VALUES (969, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:55:33', '2020-09-15 22:55:33');
INSERT INTO `admin_operation_log` VALUES (970, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:55:43', '2020-09-15 22:55:43');
INSERT INTO `admin_operation_log` VALUES (971, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:55:53', '2020-09-15 22:55:53');
INSERT INTO `admin_operation_log` VALUES (972, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:56:09', '2020-09-15 22:56:09');
INSERT INTO `admin_operation_log` VALUES (973, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:56:50', '2020-09-15 22:56:50');
INSERT INTO `admin_operation_log` VALUES (974, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"7\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"4MBe2fkiGw9jG5m1kyoN7IyusxB6BdobhElrg7s2\",\"_method\":\"PUT\"}', '2020-09-15 22:56:56', '2020-09-15 22:56:56');
INSERT INTO `admin_operation_log` VALUES (975, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-15 22:56:57', '2020-09-15 22:56:57');
INSERT INTO `admin_operation_log` VALUES (976, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-15 22:57:00', '2020-09-15 22:57:00');
INSERT INTO `admin_operation_log` VALUES (977, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:58:44', '2020-09-15 22:58:44');
INSERT INTO `admin_operation_log` VALUES (978, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 22:59:19', '2020-09-15 22:59:19');
INSERT INTO `admin_operation_log` VALUES (979, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:01:41', '2020-09-15 23:01:41');
INSERT INTO `admin_operation_log` VALUES (980, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:01:46', '2020-09-15 23:01:46');
INSERT INTO `admin_operation_log` VALUES (981, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:01:52', '2020-09-15 23:01:52');
INSERT INTO `admin_operation_log` VALUES (982, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:03:48', '2020-09-15 23:03:48');
INSERT INTO `admin_operation_log` VALUES (983, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:04:00', '2020-09-15 23:04:00');
INSERT INTO `admin_operation_log` VALUES (984, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:04:21', '2020-09-15 23:04:21');
INSERT INTO `admin_operation_log` VALUES (985, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-15 23:04:38', '2020-09-15 23:04:38');
INSERT INTO `admin_operation_log` VALUES (986, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:28:25', '2020-09-17 15:28:25');
INSERT INTO `admin_operation_log` VALUES (987, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"2\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"mV87KzoqX5nJtcI4J5k443jsX9s5nwChIioAIsAP\",\"_method\":\"PUT\"}', '2020-09-17 15:28:34', '2020-09-17 15:28:34');
INSERT INTO `admin_operation_log` VALUES (988, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-17 15:28:35', '2020-09-17 15:28:35');
INSERT INTO `admin_operation_log` VALUES (989, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:28:37', '2020-09-17 15:28:37');
INSERT INTO `admin_operation_log` VALUES (990, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:29:16', '2020-09-17 15:29:16');
INSERT INTO `admin_operation_log` VALUES (991, 1, 'admin/pro-info/1', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"pro_name\":\"\\u4e54\\u4e391\",\"original_price\":\"1112.33\",\"present_price\":\"1111.44\",\"description\":\"<p>\\u8349\\u8349\\u8349\\u8349<\\/p>\",\"detail_params\":{\"keys\":[\"\\u7ed9\\u4f60\\u770b\\u770b\"],\"values\":[\"\\u563f\\u563f\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"42\\\",\\\"43\\\",\\\"44\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u84dd\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\\\",\\\"price\\\":\\\"1299\\\",\\\"stock\\\":\\\"200\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"42\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"43\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"44\\\",\\\"\\u989c\\u8272\\\":\\\"\\u84dd\\u8272\\\",\\\"pic\\\":\\\"\\/upload\\/images\\/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\\\",\\\"price\\\":\\\"1100\\\",\\\"stock\\\":\\\"100\\\"}]}\",\"total_count\":\"100\",\"sale_count\":\"20\",\"freight_template_id\":\"3\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"mV87KzoqX5nJtcI4J5k443jsX9s5nwChIioAIsAP\",\"_method\":\"PUT\"}', '2020-09-17 15:29:23', '2020-09-17 15:29:23');
INSERT INTO `admin_operation_log` VALUES (992, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-17 15:29:24', '2020-09-17 15:29:24');
INSERT INTO `admin_operation_log` VALUES (993, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:29:31', '2020-09-17 15:29:31');
INSERT INTO `admin_operation_log` VALUES (994, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:29:32', '2020-09-17 15:29:32');
INSERT INTO `admin_operation_log` VALUES (995, 1, 'admin/pro-info/4', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"7\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"11.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"XXL\\\",\\\"XL\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u7eff\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"11\",\"freight_template_id\":\"1\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"mV87KzoqX5nJtcI4J5k443jsX9s5nwChIioAIsAP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8004\\/admin\\/pro-info\"}', '2020-09-17 15:29:49', '2020-09-17 15:29:49');
INSERT INTO `admin_operation_log` VALUES (996, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-17 15:29:50', '2020-09-17 15:29:50');
INSERT INTO `admin_operation_log` VALUES (997, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:29:52', '2020-09-17 15:29:52');
INSERT INTO `admin_operation_log` VALUES (998, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:29:54', '2020-09-17 15:29:54');
INSERT INTO `admin_operation_log` VALUES (999, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:24', '2020-09-17 15:30:24');
INSERT INTO `admin_operation_log` VALUES (1000, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:27', '2020-09-17 15:30:27');
INSERT INTO `admin_operation_log` VALUES (1001, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:36', '2020-09-17 15:30:36');
INSERT INTO `admin_operation_log` VALUES (1002, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:37', '2020-09-17 15:30:37');
INSERT INTO `admin_operation_log` VALUES (1003, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:30:41', '2020-09-17 15:30:41');
INSERT INTO `admin_operation_log` VALUES (1004, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:30:44', '2020-09-17 15:30:44');
INSERT INTO `admin_operation_log` VALUES (1005, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:45', '2020-09-17 15:30:45');
INSERT INTO `admin_operation_log` VALUES (1006, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:30:50', '2020-09-17 15:30:50');
INSERT INTO `admin_operation_log` VALUES (1007, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:30:57', '2020-09-17 15:30:57');
INSERT INTO `admin_operation_log` VALUES (1008, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:30:58', '2020-09-17 15:30:58');
INSERT INTO `admin_operation_log` VALUES (1009, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:31:55', '2020-09-17 15:31:55');
INSERT INTO `admin_operation_log` VALUES (1010, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:31:58', '2020-09-17 15:31:58');
INSERT INTO `admin_operation_log` VALUES (1011, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:32:01', '2020-09-17 15:32:01');
INSERT INTO `admin_operation_log` VALUES (1012, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:32:05', '2020-09-17 15:32:05');
INSERT INTO `admin_operation_log` VALUES (1013, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:32:06', '2020-09-17 15:32:06');
INSERT INTO `admin_operation_log` VALUES (1014, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:32:47', '2020-09-17 15:32:47');
INSERT INTO `admin_operation_log` VALUES (1015, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:32:52', '2020-09-17 15:32:52');
INSERT INTO `admin_operation_log` VALUES (1016, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:33:04', '2020-09-17 15:33:04');
INSERT INTO `admin_operation_log` VALUES (1017, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:33:09', '2020-09-17 15:33:09');
INSERT INTO `admin_operation_log` VALUES (1018, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:33:36', '2020-09-17 15:33:36');
INSERT INTO `admin_operation_log` VALUES (1019, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:33:47', '2020-09-17 15:33:47');
INSERT INTO `admin_operation_log` VALUES (1020, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:34:27', '2020-09-17 15:34:27');
INSERT INTO `admin_operation_log` VALUES (1021, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:34:32', '2020-09-17 15:34:32');
INSERT INTO `admin_operation_log` VALUES (1022, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:36:45', '2020-09-17 15:36:45');
INSERT INTO `admin_operation_log` VALUES (1023, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:36:49', '2020-09-17 15:36:49');
INSERT INTO `admin_operation_log` VALUES (1024, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:36:55', '2020-09-17 15:36:55');
INSERT INTO `admin_operation_log` VALUES (1025, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:37:10', '2020-09-17 15:37:10');
INSERT INTO `admin_operation_log` VALUES (1026, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:37:15', '2020-09-17 15:37:15');
INSERT INTO `admin_operation_log` VALUES (1027, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:38:35', '2020-09-17 15:38:35');
INSERT INTO `admin_operation_log` VALUES (1028, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:38:40', '2020-09-17 15:38:40');
INSERT INTO `admin_operation_log` VALUES (1029, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:38:59', '2020-09-17 15:38:59');
INSERT INTO `admin_operation_log` VALUES (1030, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:01', '2020-09-17 15:39:01');
INSERT INTO `admin_operation_log` VALUES (1031, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:06', '2020-09-17 15:39:06');
INSERT INTO `admin_operation_log` VALUES (1032, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:42', '2020-09-17 15:39:42');
INSERT INTO `admin_operation_log` VALUES (1033, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:47', '2020-09-17 15:39:47');
INSERT INTO `admin_operation_log` VALUES (1034, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:52', '2020-09-17 15:39:52');
INSERT INTO `admin_operation_log` VALUES (1035, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:39:58', '2020-09-17 15:39:58');
INSERT INTO `admin_operation_log` VALUES (1036, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:42:53', '2020-09-17 15:42:53');
INSERT INTO `admin_operation_log` VALUES (1037, 1, 'admin/pro-info/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:42:57', '2020-09-17 15:42:57');
INSERT INTO `admin_operation_log` VALUES (1038, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:43:06', '2020-09-17 15:43:06');
INSERT INTO `admin_operation_log` VALUES (1039, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:43:12', '2020-09-17 15:43:12');
INSERT INTO `admin_operation_log` VALUES (1040, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:48:48', '2020-09-17 15:48:48');
INSERT INTO `admin_operation_log` VALUES (1041, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:49:11', '2020-09-17 15:49:11');
INSERT INTO `admin_operation_log` VALUES (1042, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:49:15', '2020-09-17 15:49:15');
INSERT INTO `admin_operation_log` VALUES (1043, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:50:23', '2020-09-17 15:50:23');
INSERT INTO `admin_operation_log` VALUES (1044, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:50:24', '2020-09-17 15:50:24');
INSERT INTO `admin_operation_log` VALUES (1045, 1, 'admin/pro-info/4', 'PUT', '127.0.0.1', '{\"label_id\":\"1\",\"brand_id\":\"1\",\"class_id\":\"1\",\"second_class_id\":\"3\",\"third_class_id\":\"6\",\"pro_name\":\"1111\",\"original_price\":\"111.00\",\"present_price\":\"11.00\",\"description\":\"<p>111<\\/p>\",\"detail_params\":{\"keys\":[\"1\"],\"values\":[\"1\"]},\"sku_params\":\"{\\\"type\\\":\\\"many\\\",\\\"attrs\\\":{\\\"\\u5c3a\\u7801\\\":[\\\"XXL\\\",\\\"XL\\\"],\\\"\\u989c\\u8272\\\":[\\\"\\u7ea2\\u8272\\\",\\\"\\u7eff\\u8272\\\"]},\\\"sku\\\":[{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XXL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7ea2\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"},{\\\"\\u5c3a\\u7801\\\":\\\"XL\\\",\\\"\\u989c\\u8272\\\":\\\"\\u7eff\\u8272\\\",\\\"pic\\\":\\\"\\\",\\\"price\\\":\\\"100\\\",\\\"stock\\\":\\\"10\\\"}]}\",\"total_count\":\"111\",\"sale_count\":\"11\",\"freight_template_id\":\"1\",\"status\":\"on\",\"is_recommend\":\"on\",\"order_by\":\"10\",\"_token\":\"mV87KzoqX5nJtcI4J5k443jsX9s5nwChIioAIsAP\",\"_method\":\"PUT\"}', '2020-09-17 15:50:37', '2020-09-17 15:50:37');
INSERT INTO `admin_operation_log` VALUES (1046, 1, 'admin/pro-info', 'GET', '127.0.0.1', '[]', '2020-09-17 15:50:38', '2020-09-17 15:50:38');
INSERT INTO `admin_operation_log` VALUES (1047, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:50:40', '2020-09-17 15:50:40');
INSERT INTO `admin_operation_log` VALUES (1048, 1, 'admin/pro-info/4/edit', 'GET', '127.0.0.1', '[]', '2020-09-17 15:50:41', '2020-09-17 15:50:41');
INSERT INTO `admin_operation_log` VALUES (1049, 1, 'admin/pro-info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-17 15:50:46', '2020-09-17 15:50:46');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 10, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 12, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 13, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 18, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 20, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-08-10 14:55:55', '2020-08-10 14:55:55');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$uHjzT6IybE0cgwsp52FKVOaF1vrGlLgy1rqJwq7AuZb7n8pdIFswm', 'Administrator', NULL, 'iaEcNHf3syZrKlelOKSzZEMdbhyyer4JnItNf6cR32DT9YTegljZyM0Xcpi4', '2020-08-10 14:55:55', '2020-08-10 14:55:55');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `pro_id` int(11) NOT NULL COMMENT '产品id',
  `pro_sku_param` json NOT NULL COMMENT '选定产品的sku',
  `pro_count` int(11) NOT NULL COMMENT '购买数量',
  `pro_unit_price` decimal(10, 2) NOT NULL COMMENT '产品单价',
  `pro_total_price` decimal(10, 2) NOT NULL COMMENT '产品总价',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id_pro_id_idx`(`customer_id`, `pro_id`) USING BTREE,
  INDEX `pro_id_customer_id_idx`(`pro_id`, `customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (6, 1, 1, '{\"pic\": \"/upload/images/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"43\", \"颜色\": \"红色\"}', 2, 1100.00, 2200.00, '2020-09-11 02:58:59', '2020-09-17 15:29:23');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号',
  `wechat_openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '微信uid',
  `head_img_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '会员状态 0停用 1启用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '2020-09-04 14:02:47', '2020-09-04 15:05:48', 'Tom813210', '18102025228', '0a2cbc23-a9e8-44a8-88c2-fcc51d681a43', 'images/dcd40ef2dc7c7f048f1c0c72cbc44f97.jpg', 1);
INSERT INTO `customer` VALUES (2, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom740612', '18102025228', 'cac4526d-7ea8-47ba-8c3a-e841e82d0375', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (3, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom763427', '18102025228', '72c3e7e2-871b-4ecc-8e96-5ae73c3a3b6d', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (4, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom595303', '18102025228', 'c48cda45-c181-4962-8397-151dc35753bd', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (5, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom686232', '18102025228', '194bdda3-a26c-455c-86aa-385229964a67', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (6, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom645254', '18102025228', '5f03614c-b7d9-4802-b4dd-b78246536dca', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (7, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom667575', '18102025228', '3dbc7a25-b7c5-430a-8df4-3e7b7052c505', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (8, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom902114', '18102025228', 'a3e4207b-c61e-454e-8c3f-52efa89e9275', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (9, '2020-09-04 14:02:47', '2020-09-04 14:02:47', 'Tom507842', '18102025228', 'eb8cfaa0-4fb6-43f2-bb26-2c04c8f8caf5', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (10, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom832871', '18102025228', 'd643473a-418b-4164-9ac7-33ea5d59b71c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (11, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom640831', '18102025228', '6775d9c9-f3e0-44b7-8e37-670a752e3447', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (12, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom705539', '18102025228', 'a7884996-34dd-4f99-bd67-9e6847db2dbd', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (13, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom605205', '18102025228', 'e6d8c45c-2427-413c-9a32-7e64606f4ff5', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (14, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom909407', '18102025228', 'bd8e7834-e0dd-40c6-b2ea-8a4b7dcc81fa', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (15, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom731421', '18102025228', 'baf4e164-8ad1-4cf1-814d-7bbafb368a6e', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (16, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom928883', '18102025228', 'ac96b9ad-d28c-4ed6-90e7-4627ed4202f4', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (17, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom950152', '18102025228', '19977303-e080-4343-be80-0c0204b8c7ab', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (18, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom964111', '18102025228', '9035c030-607a-4d84-bf35-c458798aadb9', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (19, '2020-09-04 14:02:48', '2020-09-04 14:02:48', 'Tom970100', '18102025228', '9acefe20-7b12-449c-84dd-d7b737c091ff', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (20, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom958169', '18102025228', 'abf0308f-97a6-4ebb-8688-16cc2dca7446', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (21, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom880543', '18102025228', '34586924-e2e0-45c1-be49-672af5d86c30', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (22, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom528211', '18102025228', 'e82c6358-230d-4cf5-b404-2835c7888245', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (23, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom999424', '18102025228', 'cc3275bb-7e16-4cbf-a8c5-484bbd902b43', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (24, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom912491', '18102025228', 'cdd7340f-3ce5-4974-a682-357ddd255e2d', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (25, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom564181', '18102025228', 'fb5fdf3d-9617-493f-8ab7-13b459ebf023', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (26, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom583433', '18102025228', '73e3d20b-0a05-4889-a6b2-0ab534e6a65b', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (27, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom724623', '18102025228', '47e034d2-460f-4253-be48-60ad31938f0d', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (28, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom872818', '18102025228', 'b3605747-c154-4dcb-86b2-a76bffd973ed', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (29, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom690219', '18102025228', '3cb50935-55d2-433c-b888-f2c8b25b871b', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (30, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom832642', '18102025228', '8ed4493f-0e82-4984-a028-dcd7861ddbd5', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (31, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom592554', '18102025228', '8e1e1769-4a29-4a1c-ba8a-3cfb1c27e4ac', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (32, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom964843', '18102025228', '94e90d69-4689-4661-a027-a1a7f7ee380d', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (33, '2020-09-04 14:02:49', '2020-09-04 14:02:49', 'Tom546553', '18102025228', 'b810ea94-20c2-47cb-a4ac-6291a0ad0311', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (34, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom838239', '18102025228', '0b691d21-22af-4060-ae89-e35dbdb9b3ab', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (35, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom551535', '18102025228', 'a7d1955d-3151-45d8-97ac-3cccf19dbeec', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (36, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom742957', '18102025228', '8c1b6eab-3175-4197-b600-54350bd9a42c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (37, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom560183', '18102025228', '52da3ebf-28b1-44d4-9d95-db4330e28a9f', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (38, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom572043', '18102025228', '30fff11e-35ce-40cb-9e9b-23a286adaee0', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (39, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom679667', '18102025228', '68c8c85a-2222-4830-9e10-3bb420e23ec9', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (40, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom682207', '18102025228', '2842e2cb-2722-4a77-bc17-946bdda5d620', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (41, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom872033', '18102025228', 'c456f766-0c50-402b-8a8d-48f7ac7737d9', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (42, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom813547', '18102025228', '1c09b5c8-8063-4fc7-a7fc-a2c2ac95634b', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (43, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom951634', '18102025228', '7ecbc92f-f234-48ba-971c-10f64e368f90', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (44, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom817530', '18102025228', 'eb902785-c62f-46b8-b179-0d7e50b35a5e', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (45, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom732747', '18102025228', '95460892-69a5-4f93-a19a-808ee79acca7', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (46, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom711147', '18102025228', '65c85f1b-f71f-46fd-b6c2-6e69a9d05f4b', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (47, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom857496', '18102025228', '150fd747-328b-4937-9ef6-f9d9192bcb23', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (48, '2020-09-04 14:02:50', '2020-09-04 14:02:50', 'Tom654040', '18102025228', '133d4f31-9830-4024-a54d-faa73b119714', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (49, '2020-09-04 14:02:51', '2020-09-04 14:02:51', 'Tom697713', '18102025228', 'b72e9dd8-df48-4f45-bced-0dcd0019a376', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (50, '2020-09-04 14:02:51', '2020-09-04 14:02:51', 'Tom526445', '18102025228', '0c8a5a14-1e08-48f6-8c0e-95cb5df1350c', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyVmy6KibtfR6LSjTIzBibPpRib8OZfZPOKJzpgibbKwFWLtRtJ3cLsZj6zfW0NiaJlLoKmtibVMrWVIJA/132', 1);
INSERT INTO `customer` VALUES (51, '2020-09-13 15:40:53', '2020-09-13 15:40:53', '游客1600011653', '18102025227', '', NULL, 1);

-- ----------------------------
-- Table structure for freight_template
-- ----------------------------
DROP TABLE IF EXISTS `freight_template`;
CREATE TABLE `freight_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pro_country` int(11) NOT NULL,
  `pro_province` int(11) NULL DEFAULT NULL,
  `pro_city` int(11) NULL DEFAULT NULL,
  `pro_area` int(11) NULL DEFAULT NULL,
  `delivery_time` int(11) NOT NULL COMMENT '1 3 7 天内发货',
  `is_free_shipping` int(11) NOT NULL DEFAULT 0 COMMENT '是否包邮 0不包邮 1包邮',
  `default_template` json NULL,
  `other_template` json NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of freight_template
-- ----------------------------
INSERT INTO `freight_template` VALUES (1, '包邮模板', 1, 110000, 110100, 110101, 7, 1, NULL, NULL, 1, '2020-09-09 14:48:21', '2020-09-09 15:17:54');
INSERT INTO `freight_template` VALUES (2, '正常运费', 1, 110000, 110100, 110101, 3, 0, '{\"incr_piece\": \"1\", \"incr_price\": \"9\", \"default_piece\": \"1\", \"default_price\": \"11\"}', NULL, 1, '2020-09-09 14:48:53', '2020-09-10 02:44:58');
INSERT INTO `freight_template` VALUES (3, '特殊模板', 1, 110000, 110100, 110101, 3, 0, '{\"incr_piece\": \"3\", \"incr_price\": \"3\", \"default_piece\": \"3\", \"default_price\": \"3\"}', '[{\"text\": \"810000\", \"country\": \"1\", \"incr_piece\": \"1\", \"incr_price\": \"11\", \"default_piece\": \"1\", \"default_price\": \"11\"}, {\"text\": \"820000\", \"country\": \"1\", \"incr_piece\": \"1\", \"incr_price\": \"15\", \"default_piece\": \"1\", \"default_price\": \"80\"}]', 1, '2020-09-09 14:49:57', '2020-09-10 02:45:28');

-- ----------------------------
-- Table structure for map
-- ----------------------------
DROP TABLE IF EXISTS `map`;
CREATE TABLE `map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_code` int(11) NOT NULL,
  `lxid` int(5) NOT NULL,
  `status` int(10) NULL DEFAULT 0 COMMENT '0:锁定，不展示 1：开放',
  `shouzhong` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '起始重量',
  `shouzhong_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '初始运费',
  `zengliang` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '每次增加的重量',
  `zengliang_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '每增加相应的重量加多少钱',
  `country` int(11) NULL DEFAULT 1 COMMENT '国家 1中国 2其他',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  FULLTEXT INDEX `name_2`(`name`)
) ENGINE = MyISAM AUTO_INCREMENT = 3529 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of map
-- ----------------------------
INSERT INTO `map` VALUES (1, '110000', '北京市', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2, '120000', '天津市', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3, '130000', '河北省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (4, '140000', '山西省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (5, '150000', '内蒙古', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (6, '210000', '辽宁省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (7, '220000', '吉林省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (8, '230000', '黑龙江', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (9, '310000', '上海市', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (10, '320000', '江苏省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (11, '330000', '浙江省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (12, '340000', '安徽省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (13, '350000', '福建省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (14, '360000', '江西省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (15, '370000', '山东省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (16, '410000', '河南省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (17, '420000', '湖北省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (18, '430000', '湖南省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (19, '440000', '广东省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (20, '450000', '广  西', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (21, '460000', '海南省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (22, '500000', '重庆市', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (23, '510000', '四川省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (24, '520000', '贵州省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (25, '530000', '云南省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (26, '540000', '西  藏', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (27, '610000', '陕西省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (28, '620000', '甘肃省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (29, '630000', '青海省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (30, '640000', '宁  夏', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (31, '650000', '新  疆', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (32, '710000', '台湾省', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (33, '810000', '香  港', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (34, '820000', '澳  门', 0, 0, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (35, '110100', '北京市', 110000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (36, '130100', '石家庄市', 130000, 1, 1, 0.00, 15.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (37, '130200', '唐山市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (38, '130300', '秦皇岛市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (39, '130400', '邯郸市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (40, '130500', '邢台市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (41, '130600', '保定市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (42, '130700', '张家口市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (43, '130800', '承德市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (44, '130900', '沧州市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (45, '131000', '廊坊市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (46, '131100', '衡水市', 130000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (47, '140100', '太原市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (48, '140200', '大同市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (49, '140300', '阳泉市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (50, '140400', '长治市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (51, '140500', '晋城市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (52, '140600', '朔州市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (53, '140700', '晋中市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (54, '140800', '运城市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (55, '140900', '忻州市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (56, '141000', '临汾市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (57, '141100', '吕梁市', 140000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (58, '150100', '呼和浩特市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (59, '150200', '包头市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (60, '150300', '乌海市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (61, '150400', '赤峰市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (62, '150500', '通辽市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (63, '150600', '鄂尔多斯市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (64, '150700', '呼伦贝尔市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (65, '150800', '巴彦淖尔市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (66, '150900', '乌兰察布市', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (67, '152200', '兴安盟', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (68, '152500', '锡林郭勒盟', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (69, '152900', '阿拉善盟', 150000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (70, '210100', '沈阳市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (71, '210200', '大连市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (72, '210300', '鞍山市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (73, '210400', '抚顺市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (74, '210500', '本溪市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (75, '210600', '丹东市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (76, '210700', '锦州市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (77, '210800', '营口市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (78, '210900', '阜新市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (79, '211000', '辽阳市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (80, '211100', '盘锦市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (81, '211200', '铁岭市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (82, '211300', '朝阳市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (83, '211400', '葫芦岛市', 210000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (84, '220100', '长春市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (85, '220200', '吉林市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (86, '220300', '四平市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (87, '220400', '辽源市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (88, '220500', '通化市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (89, '220600', '白山市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (90, '220700', '松原市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (91, '220800', '白城市', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (92, '222400', '延边朝鲜族自治州', 220000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (93, '230100', '哈尔滨市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (94, '230200', '齐齐哈尔市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (95, '230300', '鸡西市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (96, '230400', '鹤岗市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (97, '230500', '双鸭山市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (98, '230600', '大庆市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (99, '230700', '伊春市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (100, '230800', '佳木斯市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (101, '230900', '七台河市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (102, '231000', '牡丹江市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (103, '231100', '黑河市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (104, '231200', '绥化市', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (105, '232700', '大兴安岭地区', 230000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (106, '310100', '市辖区', 310000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (107, '310200', '县', 310000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (108, '320100', '南京市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (109, '320200', '无锡市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (110, '320300', '徐州市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (111, '320400', '常州市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (112, '320500', '苏州市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (113, '320600', '南通市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (114, '320700', '连云港市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (115, '320800', '淮安市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (116, '320900', '盐城市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (117, '321000', '扬州市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (118, '321100', '镇江市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (119, '321200', '泰州市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (120, '321300', '宿迁市', 320000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (121, '330100', '杭州市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (122, '330200', '宁波市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (123, '330300', '温州市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (124, '330400', '嘉兴市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (125, '330500', '湖州市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (126, '330600', '绍兴市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (127, '330700', '金华市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (128, '330800', '衢州市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (129, '330900', '舟山市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (130, '331000', '台州市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (131, '331100', '丽水市', 330000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (132, '340100', '合肥市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (133, '340200', '芜湖市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (134, '340300', '蚌埠市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (135, '340400', '淮南市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (136, '340500', '马鞍山市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (137, '340600', '淮北市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (138, '340700', '铜陵市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (139, '340800', '安庆市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (140, '341000', '黄山市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (141, '341100', '滁州市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (142, '341200', '阜阳市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (143, '341300', '宿州市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (144, '341400', '巢湖市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (145, '341500', '六安市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (146, '341600', '亳州市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (147, '341700', '池州市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (148, '341800', '宣城市', 340000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (149, '350100', '福州市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (150, '350200', '厦门市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (151, '350300', '莆田市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (152, '350400', '三明市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (153, '350500', '泉州市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (154, '350600', '漳州市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (155, '350700', '南平市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (156, '350800', '龙岩市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (157, '350900', '宁德市', 350000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (158, '360100', '南昌市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (159, '360200', '景德镇市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (160, '360300', '萍乡市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (161, '360400', '九江市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (162, '360500', '新余市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (163, '360600', '鹰潭市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (164, '360700', '赣州市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (165, '360800', '吉安市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (166, '360900', '宜春市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (167, '361000', '抚州市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (168, '361100', '上饶市', 360000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (169, '370100', '济南市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (170, '370200', '青岛市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (171, '370300', '淄博市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (172, '370400', '枣庄市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (173, '370500', '东营市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (174, '370600', '烟台市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (175, '370700', '潍坊市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (176, '370800', '济宁市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (177, '370900', '泰安市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (178, '371000', '威海市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (179, '371100', '日照市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (180, '371200', '莱芜市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (181, '371300', '临沂市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (182, '371400', '德州市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (183, '371500', '聊城市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (184, '371600', '滨州市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (185, '371700', '荷泽市', 370000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (186, '410100', '郑州市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (187, '410200', '开封市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (188, '410300', '洛阳市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (189, '410400', '平顶山市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (190, '410500', '安阳市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (191, '410600', '鹤壁市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (192, '410700', '新乡市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (193, '410800', '焦作市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (194, '410900', '濮阳市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (195, '411000', '许昌市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (196, '411100', '漯河市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (197, '411200', '三门峡市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (198, '411300', '南阳市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (199, '411400', '商丘市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (200, '411500', '信阳市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (201, '411600', '周口市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (202, '411700', '驻马店市', 410000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (203, '420100', '武汉市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (204, '420200', '黄石市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (205, '420300', '十堰市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (206, '420500', '宜昌市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (207, '420600', '襄樊市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (208, '420700', '鄂州市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (209, '420800', '荆门市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (210, '420900', '孝感市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (211, '421000', '荆州市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (212, '421100', '黄冈市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (213, '421200', '咸宁市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (214, '421300', '随州市', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (215, '422800', '恩施土家族苗族自治州', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (216, '429000', '省直辖行政单位', 420000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (217, '430100', '长沙市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (218, '430200', '株洲市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (219, '430300', '湘潭市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (220, '430400', '衡阳市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (221, '430500', '邵阳市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (222, '430600', '岳阳市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (223, '430700', '常德市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (224, '430800', '张家界市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (225, '430900', '益阳市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (226, '431000', '郴州市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (227, '431100', '永州市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (228, '431200', '怀化市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (229, '431300', '娄底市', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (230, '433100', '湘西土家族苗族自治州', 430000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (231, '440100', '广州市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (232, '440200', '韶关市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (233, '440300', '深圳市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (234, '440400', '珠海市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (235, '440500', '汕头市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (236, '440600', '佛山市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (237, '440700', '江门市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (238, '440800', '湛江市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (239, '440900', '茂名市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (240, '441200', '肇庆市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (241, '441300', '惠州市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (242, '441400', '梅州市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (243, '441500', '汕尾市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (244, '441600', '河源市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (245, '441700', '阳江市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (246, '441800', '清远市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (247, '441900', '东莞市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (248, '442000', '中山市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (249, '445100', '潮州市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (250, '445200', '揭阳市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (251, '445300', '云浮市', 440000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (252, '450100', '南宁市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (253, '450200', '柳州市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (254, '450300', '桂林市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (255, '450400', '梧州市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (256, '450500', '北海市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (257, '450600', '防城港市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (258, '450700', '钦州市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (259, '450800', '贵港市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (260, '450900', '玉林市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (261, '451000', '百色市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (262, '451100', '贺州市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (263, '451200', '河池市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (264, '451300', '来宾市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (265, '451400', '崇左市', 450000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (266, '460100', '海口市', 460000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (267, '460200', '三亚市', 460000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (268, '469000', '省直辖县级行政单位', 460000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (269, '500100', '市辖区', 500000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (270, '500200', '县', 500000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (271, '500300', '市', 500000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (272, '510100', '成都市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (273, '510300', '自贡市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (274, '510400', '攀枝花市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (275, '510500', '泸州市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (276, '510600', '德阳市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (277, '510700', '绵阳市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (278, '510800', '广元市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (279, '510900', '遂宁市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (280, '511000', '内江市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (281, '511100', '乐山市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (282, '511300', '南充市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (283, '511400', '眉山市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (284, '511500', '宜宾市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (285, '511600', '广安市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (286, '511700', '达州市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (287, '511800', '雅安市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (288, '511900', '巴中市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (289, '512000', '资阳市', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (290, '513200', '阿坝藏族羌族自治州', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (291, '513300', '甘孜藏族自治州', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (292, '513400', '凉山彝族自治州', 510000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (293, '520100', '贵阳市', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (294, '520200', '六盘水市', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (295, '520300', '遵义市', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (296, '520400', '安顺市', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (297, '522200', '铜仁地区', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (298, '522300', '黔西南布依族苗族自治州', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (299, '522400', '毕节地区', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (300, '522600', '黔东南苗族侗族自治州', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (301, '522700', '黔南布依族苗族自治州', 520000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (302, '530100', '昆明市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (303, '530300', '曲靖市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (304, '530400', '玉溪市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (305, '530500', '保山市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (306, '530600', '昭通市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (307, '530700', '丽江市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (308, '530800', '思茅市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (309, '530900', '临沧市', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (310, '532300', '楚雄彝族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (311, '532500', '红河哈尼族彝族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (312, '532600', '文山壮族苗族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (313, '532800', '西双版纳傣族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (314, '532900', '大理白族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (315, '533100', '德宏傣族景颇族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (316, '533300', '怒江傈僳族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (317, '533400', '迪庆藏族自治州', 530000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (318, '540100', '拉萨市', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (319, '542100', '昌都地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (320, '542200', '山南地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (321, '542300', '日喀则地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (322, '542400', '那曲地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (323, '542500', '阿里地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (324, '542600', '林芝地区', 540000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (325, '610100', '西安市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (326, '610200', '铜川市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (327, '610300', '宝鸡市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (328, '610400', '咸阳市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (329, '610500', '渭南市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (330, '610600', '延安市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (331, '610700', '汉中市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (332, '610800', '榆林市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (333, '610900', '安康市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (334, '611000', '商洛市', 610000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (335, '620100', '兰州市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (336, '620200', '嘉峪关市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (337, '620300', '金昌市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (338, '620400', '白银市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (339, '620500', '天水市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (340, '620600', '武威市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (341, '620700', '张掖市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (342, '620800', '平凉市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (343, '620900', '酒泉市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (344, '621000', '庆阳市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (345, '621100', '定西市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (346, '621200', '陇南市', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (347, '622900', '临夏回族自治州', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (348, '623000', '甘南藏族自治州', 620000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (349, '630100', '西宁市', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (350, '632100', '海东地区', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (351, '632200', '海北藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (352, '632300', '黄南藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (353, '632500', '海南藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (354, '632600', '果洛藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (355, '632700', '玉树藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (356, '632800', '海西蒙古族藏族自治州', 630000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (357, '640100', '银川市', 640000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (358, '640200', '石嘴山市', 640000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (359, '640300', '吴忠市', 640000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (360, '640400', '固原市', 640000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (361, '640500', '中卫市', 640000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (362, '650100', '乌鲁木齐市', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (363, '650200', '克拉玛依市', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (364, '652100', '吐鲁番地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (365, '652200', '哈密地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (366, '652300', '昌吉回族自治州', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (367, '652700', '博尔塔拉蒙古自治州', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (368, '652800', '巴音郭楞蒙古自治州', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (369, '652900', '阿克苏地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (370, '653000', '克孜勒苏柯尔克孜自治州', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (371, '653100', '喀什地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (372, '653200', '和田地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (373, '654000', '伊犁哈萨克自治州', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (374, '654200', '塔城地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (375, '654300', '阿勒泰地区', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (376, '659000', '省直辖行政单位', 650000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (377, '110101', '东城区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (378, '110102', '西城区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (379, '110103', '崇文区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (380, '110104', '宣武区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (381, '110105', '朝阳区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (382, '110106', '丰台区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (383, '110107', '石景山区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (384, '110108', '海淀区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (385, '110109', '门头沟区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (386, '110111', '房山区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (387, '110112', '通州区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (388, '110113', '顺义区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (389, '110114', '昌平区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (390, '110115', '大兴区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (391, '110116', '怀柔区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (392, '110117', '平谷区', 110100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (393, '110228', '密云县', 110200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (394, '110229', '延庆县', 110200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (395, '120101', '和平区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (396, '120102', '河东区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (397, '120103', '河西区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (398, '120104', '南开区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (399, '120105', '河北区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (400, '120106', '红桥区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (401, '120107', '塘沽区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (402, '120108', '汉沽区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (403, '120109', '大港区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (404, '120110', '东丽区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (405, '120111', '西青区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (406, '120112', '津南区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (407, '120113', '北辰区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (408, '120114', '武清区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (409, '120115', '宝坻区', 120100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (410, '120221', '宁河县', 120200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (411, '120223', '静海县', 120200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (412, '120225', '蓟　县', 120200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (413, '130101', '市辖区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (414, '130102', '长安区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (415, '130103', '桥东区', 130100, 2, 1, 5.00, 10.00, 0.50, 2.00, 1);
INSERT INTO `map` VALUES (416, '130104', '桥西区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (417, '130105', '新华区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (418, '130107', '井陉矿区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (419, '130108', '裕华区', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (420, '130121', '井陉县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (421, '130123', '正定县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (422, '130124', '栾城县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (423, '130125', '行唐县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (424, '130126', '灵寿县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (425, '130127', '高邑县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (426, '130128', '深泽县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (427, '130129', '赞皇县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (428, '130130', '无极县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (429, '130131', '平山县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (430, '130132', '元氏县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (431, '130133', '赵　县', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (432, '130181', '辛集市', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (433, '130182', '藁城市', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (434, '130183', '晋州市', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (435, '130184', '新乐市', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (436, '130185', '鹿泉市', 130100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (437, '130201', '市辖区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (438, '130202', '路南区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (439, '130203', '路北区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (440, '130204', '古冶区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (441, '130205', '开平区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (442, '130207', '丰南区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (443, '130208', '丰润区', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (444, '130223', '滦　县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (445, '130224', '滦南县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (446, '130225', '乐亭县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (447, '130227', '迁西县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (448, '130229', '玉田县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (449, '130230', '唐海县', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (450, '130281', '遵化市', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (451, '130283', '迁安市', 130200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (452, '130301', '市辖区', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (453, '130302', '海港区', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (454, '130303', '山海关区', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (455, '130304', '北戴河区', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (456, '130321', '青龙满族自治县', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (457, '130322', '昌黎县', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (458, '130323', '抚宁县', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (459, '130324', '卢龙县', 130300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (460, '130401', '市辖区', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (461, '130402', '邯山区', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (462, '130403', '丛台区', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (463, '130404', '复兴区', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (464, '130406', '峰峰矿区', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (465, '130421', '邯郸县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (466, '130423', '临漳县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (467, '130424', '成安县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (468, '130425', '大名县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (469, '130426', '涉　县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (470, '130427', '磁　县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (471, '130428', '肥乡县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (472, '130429', '永年县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (473, '130430', '邱　县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (474, '130431', '鸡泽县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (475, '130432', '广平县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (476, '130433', '馆陶县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (477, '130434', '魏　县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (478, '130435', '曲周县', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (479, '130481', '武安市', 130400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (480, '130501', '市辖区', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (481, '130502', '桥东区', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (482, '130503', '桥西区', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (483, '130521', '邢台县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (484, '130522', '临城县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (485, '130523', '内丘县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (486, '130524', '柏乡县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (487, '130525', '隆尧县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (488, '130526', '任　县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (489, '130527', '南和县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (490, '130528', '宁晋县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (491, '130529', '巨鹿县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (492, '130530', '新河县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (493, '130531', '广宗县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (494, '130532', '平乡县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (495, '130533', '威　县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (496, '130534', '清河县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (497, '130535', '临西县', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (498, '130581', '南宫市', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (499, '130582', '沙河市', 130500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (500, '130601', '市辖区', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (501, '130602', '新市区', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (502, '130603', '北市区', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (503, '130604', '南市区', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (504, '130621', '满城县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (505, '130622', '清苑县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (506, '130623', '涞水县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (507, '130624', '阜平县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (508, '130625', '徐水县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (509, '130626', '定兴县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (510, '130627', '唐　县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (511, '130628', '高阳县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (512, '130629', '容城县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (513, '130630', '涞源县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (514, '130631', '望都县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (515, '130632', '安新县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (516, '130633', '易　县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (517, '130634', '曲阳县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (518, '130635', '蠡　县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (519, '130636', '顺平县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (520, '130637', '博野县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (521, '130638', '雄　县', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (522, '130681', '涿州市', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (523, '130682', '定州市', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (524, '130683', '安国市', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (525, '130684', '高碑店市', 130600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (526, '130701', '市辖区', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (527, '130702', '桥东区', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (528, '130703', '桥西区', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (529, '130705', '宣化区', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (530, '130706', '下花园区', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (531, '130721', '宣化县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (532, '130722', '张北县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (533, '130723', '康保县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (534, '130724', '沽源县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (535, '130725', '尚义县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (536, '130726', '蔚　县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (537, '130727', '阳原县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (538, '130728', '怀安县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (539, '130729', '万全县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (540, '130730', '怀来县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (541, '130731', '涿鹿县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (542, '130732', '赤城县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (543, '130733', '崇礼县', 130700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (544, '130801', '市辖区', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (545, '130802', '双桥区', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (546, '130803', '双滦区', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (547, '130804', '鹰手营子矿区', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (548, '130821', '承德县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (549, '130822', '兴隆县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (550, '130823', '平泉县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (551, '130824', '滦平县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (552, '130825', '隆化县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (553, '130826', '丰宁满族自治县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (554, '130827', '宽城满族自治县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (555, '130828', '围场满族蒙古族自治县', 130800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (556, '130901', '市辖区', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (557, '130902', '新华区', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (558, '130903', '运河区', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (559, '130921', '沧　县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (560, '130922', '青　县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (561, '130923', '东光县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (562, '130924', '海兴县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (563, '130925', '盐山县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (564, '130926', '肃宁县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (565, '130927', '南皮县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (566, '130928', '吴桥县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (567, '130929', '献　县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (568, '130930', '孟村回族自治县', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (569, '130981', '泊头市', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (570, '130982', '任丘市', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (571, '130983', '黄骅市', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (572, '130984', '河间市', 130900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (573, '131001', '市辖区', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (574, '131002', '安次区', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (575, '131003', '广阳区', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (576, '131022', '固安县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (577, '131023', '永清县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (578, '131024', '香河县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (579, '131025', '大城县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (580, '131026', '文安县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (581, '131028', '大厂回族自治县', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (582, '131081', '霸州市', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (583, '131082', '三河市', 131000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (584, '131101', '市辖区', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (585, '131102', '桃城区', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (586, '131121', '枣强县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (587, '131122', '武邑县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (588, '131123', '武强县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (589, '131124', '饶阳县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (590, '131125', '安平县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (591, '131126', '故城县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (592, '131127', '景　县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (593, '131128', '阜城县', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (594, '131181', '冀州市', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (595, '131182', '深州市', 131100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (596, '140101', '市辖区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (597, '140105', '小店区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (598, '140106', '迎泽区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (599, '140107', '杏花岭区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (600, '140108', '尖草坪区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (601, '140109', '万柏林区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (602, '140110', '晋源区', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (603, '140121', '清徐县', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (604, '140122', '阳曲县', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (605, '140123', '娄烦县', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (606, '140181', '古交市', 140100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (607, '140201', '市辖区', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (608, '140202', '城　区', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (609, '140203', '矿　区', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (610, '140211', '南郊区', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (611, '140212', '新荣区', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (612, '140221', '阳高县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (613, '140222', '天镇县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (614, '140223', '广灵县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (615, '140224', '灵丘县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (616, '140225', '浑源县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (617, '140226', '左云县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (618, '140227', '大同县', 140200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (619, '140301', '市辖区', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (620, '140302', '城　区', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (621, '140303', '矿　区', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (622, '140311', '郊　区', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (623, '140321', '平定县', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (624, '140322', '盂　县', 140300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (625, '140401', '市辖区', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (626, '140402', '城　区', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (627, '140411', '郊　区', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (628, '140421', '长治县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (629, '140423', '襄垣县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (630, '140424', '屯留县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (631, '140425', '平顺县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (632, '140426', '黎城县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (633, '140427', '壶关县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (634, '140428', '长子县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (635, '140429', '武乡县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (636, '140430', '沁　县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (637, '140431', '沁源县', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (638, '140481', '潞城市', 140400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (639, '140501', '市辖区', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (640, '140502', '城　区', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (641, '140521', '沁水县', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (642, '140522', '阳城县', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (643, '140524', '陵川县', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (644, '140525', '泽州县', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (645, '140581', '高平市', 140500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (646, '140601', '市辖区', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (647, '140602', '朔城区', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (648, '140603', '平鲁区', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (649, '140621', '山阴县', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (650, '140622', '应　县', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (651, '140623', '右玉县', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (652, '140624', '怀仁县', 140600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (653, '140701', '市辖区', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (654, '140702', '榆次区', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (655, '140721', '榆社县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (656, '140722', '左权县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (657, '140723', '和顺县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (658, '140724', '昔阳县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (659, '140725', '寿阳县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (660, '140726', '太谷县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (661, '140727', '祁　县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (662, '140728', '平遥县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (663, '140729', '灵石县', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (664, '140781', '介休市', 140700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (665, '140801', '市辖区', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (666, '140802', '盐湖区', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (667, '140821', '临猗县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (668, '140822', '万荣县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (669, '140823', '闻喜县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (670, '140824', '稷山县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (671, '140825', '新绛县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (672, '140826', '绛　县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (673, '140827', '垣曲县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (674, '140828', '夏　县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (675, '140829', '平陆县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (676, '140830', '芮城县', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (677, '140881', '永济市', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (678, '140882', '河津市', 140800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (679, '140901', '市辖区', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (680, '140902', '忻府区', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (681, '140921', '定襄县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (682, '140922', '五台县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (683, '140923', '代　县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (684, '140924', '繁峙县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (685, '140925', '宁武县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (686, '140926', '静乐县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (687, '140927', '神池县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (688, '140928', '五寨县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (689, '140929', '岢岚县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (690, '140930', '河曲县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (691, '140931', '保德县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (692, '140932', '偏关县', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (693, '140981', '原平市', 140900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (694, '141001', '市辖区', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (695, '141002', '尧都区', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (696, '141021', '曲沃县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (697, '141022', '翼城县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (698, '141023', '襄汾县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (699, '141024', '洪洞县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (700, '141025', '古　县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (701, '141026', '安泽县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (702, '141027', '浮山县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (703, '141028', '吉　县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (704, '141029', '乡宁县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (705, '141030', '大宁县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (706, '141031', '隰　县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (707, '141032', '永和县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (708, '141033', '蒲　县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (709, '141034', '汾西县', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (710, '141081', '侯马市', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (711, '141082', '霍州市', 141000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (712, '141101', '市辖区', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (713, '141102', '离石区', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (714, '141121', '文水县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (715, '141122', '交城县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (716, '141123', '兴　县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (717, '141124', '临　县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (718, '141125', '柳林县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (719, '141126', '石楼县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (720, '141127', '岚　县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (721, '141128', '方山县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (722, '141129', '中阳县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (723, '141130', '交口县', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (724, '141181', '孝义市', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (725, '141182', '汾阳市', 141100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (726, '150101', '市辖区', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (727, '150102', '新城区', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (728, '150103', '回民区', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (729, '150104', '玉泉区', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (730, '150105', '赛罕区', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (731, '150121', '土默特左旗', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (732, '150122', '托克托县', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (733, '150123', '和林格尔县', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (734, '150124', '清水河县', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (735, '150125', '武川县', 150100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (736, '150201', '市辖区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (737, '150202', '东河区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (738, '150203', '昆都仑区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (739, '150204', '青山区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (740, '150205', '石拐区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (741, '150206', '白云矿区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (742, '150207', '九原区', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (743, '150221', '土默特右旗', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (744, '150222', '固阳县', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (745, '150223', '达尔罕茂明安联合旗', 150200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (746, '150301', '市辖区', 150300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (747, '150302', '海勃湾区', 150300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (748, '150303', '海南区', 150300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (749, '150304', '乌达区', 150300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (750, '150401', '市辖区', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (751, '150402', '红山区', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (752, '150403', '元宝山区', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (753, '150404', '松山区', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (754, '150421', '阿鲁科尔沁旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (755, '150422', '巴林左旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (756, '150423', '巴林右旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (757, '150424', '林西县', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (758, '150425', '克什克腾旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (759, '150426', '翁牛特旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (760, '150428', '喀喇沁旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (761, '150429', '宁城县', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (762, '150430', '敖汉旗', 150400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (763, '150501', '市辖区', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (764, '150502', '科尔沁区', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (765, '150521', '科尔沁左翼中旗', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (766, '150522', '科尔沁左翼后旗', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (767, '150523', '开鲁县', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (768, '150524', '库伦旗', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (769, '150525', '奈曼旗', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (770, '150526', '扎鲁特旗', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (771, '150581', '霍林郭勒市', 150500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (772, '150602', '东胜区', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (773, '150621', '达拉特旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (774, '150622', '准格尔旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (775, '150623', '鄂托克前旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (776, '150624', '鄂托克旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (777, '150625', '杭锦旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (778, '150626', '乌审旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (779, '150627', '伊金霍洛旗', 150600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (780, '150701', '市辖区', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (781, '150702', '海拉尔区', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (782, '150721', '阿荣旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (783, '150722', '莫力达瓦达斡尔族自治旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (784, '150723', '鄂伦春自治旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (785, '150724', '鄂温克族自治旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (786, '150725', '陈巴尔虎旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (787, '150726', '新巴尔虎左旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (788, '150727', '新巴尔虎右旗', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (789, '150781', '满洲里市', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (790, '150782', '牙克石市', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (791, '150783', '扎兰屯市', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (792, '150784', '额尔古纳市', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (793, '150785', '根河市', 150700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (794, '150801', '市辖区', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (795, '150802', '临河区', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (796, '150821', '五原县', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (797, '150822', '磴口县', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (798, '150823', '乌拉特前旗', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (799, '150824', '乌拉特中旗', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (800, '150825', '乌拉特后旗', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (801, '150826', '杭锦后旗', 150800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (802, '150901', '市辖区', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (803, '150902', '集宁区', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (804, '150921', '卓资县', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (805, '150922', '化德县', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (806, '150923', '商都县', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (807, '150924', '兴和县', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (808, '150925', '凉城县', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (809, '150926', '察哈尔右翼前旗', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (810, '150927', '察哈尔右翼中旗', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (811, '150928', '察哈尔右翼后旗', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (812, '150929', '四子王旗', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (813, '150981', '丰镇市', 150900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (814, '152201', '乌兰浩特市', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (815, '152202', '阿尔山市', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (816, '152221', '科尔沁右翼前旗', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (817, '152222', '科尔沁右翼中旗', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (818, '152223', '扎赉特旗', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (819, '152224', '突泉县', 152200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (820, '152501', '二连浩特市', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (821, '152502', '锡林浩特市', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (822, '152522', '阿巴嘎旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (823, '152523', '苏尼特左旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (824, '152524', '苏尼特右旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (825, '152525', '东乌珠穆沁旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (826, '152526', '西乌珠穆沁旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (827, '152527', '太仆寺旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (828, '152528', '镶黄旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (829, '152529', '正镶白旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (830, '152530', '正蓝旗', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (831, '152531', '多伦县', 152500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (832, '152921', '阿拉善左旗', 152900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (833, '152922', '阿拉善右旗', 152900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (834, '152923', '额济纳旗', 152900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (835, '210101', '市辖区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (836, '210102', '和平区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (837, '210103', '沈河区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (838, '210104', '大东区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (839, '210105', '皇姑区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (840, '210106', '铁西区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (841, '210111', '苏家屯区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (842, '210112', '东陵区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (843, '210113', '新城子区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (844, '210114', '于洪区', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (845, '210122', '辽中县', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (846, '210123', '康平县', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (847, '210124', '法库县', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (848, '210181', '新民市', 210100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (849, '210201', '市辖区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (850, '210202', '中山区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (851, '210203', '西岗区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (852, '210204', '沙河口区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (853, '210211', '甘井子区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (854, '210212', '旅顺口区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (855, '210213', '金州区', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (856, '210224', '长海县', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (857, '210281', '瓦房店市', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (858, '210282', '普兰店市', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (859, '210283', '庄河市', 210200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (860, '210301', '市辖区', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (861, '210302', '铁东区', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (862, '210303', '铁西区', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (863, '210304', '立山区', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (864, '210311', '千山区', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (865, '210321', '台安县', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (866, '210323', '岫岩满族自治县', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (867, '210381', '海城市', 210300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (868, '210401', '市辖区', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (869, '210402', '新抚区', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (870, '210403', '东洲区', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (871, '210404', '望花区', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (872, '210411', '顺城区', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (873, '210421', '抚顺县', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (874, '210422', '新宾满族自治县', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (875, '210423', '清原满族自治县', 210400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (876, '210501', '市辖区', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (877, '210502', '平山区', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (878, '210503', '溪湖区', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (879, '210504', '明山区', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (880, '210505', '南芬区', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (881, '210521', '本溪满族自治县', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (882, '210522', '桓仁满族自治县', 210500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (883, '210601', '市辖区', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (884, '210602', '元宝区', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (885, '210603', '振兴区', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (886, '210604', '振安区', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (887, '210624', '宽甸满族自治县', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (888, '210681', '东港市', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (889, '210682', '凤城市', 210600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (890, '210701', '市辖区', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (891, '210702', '古塔区', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (892, '210703', '凌河区', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (893, '210711', '太和区', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (894, '210726', '黑山县', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (895, '210727', '义　县', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (896, '210781', '凌海市', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (897, '210782', '北宁市', 210700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (898, '210801', '市辖区', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (899, '210802', '站前区', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (900, '210803', '西市区', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (901, '210804', '鲅鱼圈区', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (902, '210811', '老边区', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (903, '210881', '盖州市', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (904, '210882', '大石桥市', 210800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (905, '210901', '市辖区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (906, '210902', '海州区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (907, '210903', '新邱区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (908, '210904', '太平区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (909, '210905', '清河门区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (910, '210911', '细河区', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (911, '210921', '阜新蒙古族自治县', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (912, '210922', '彰武县', 210900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (913, '211001', '市辖区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (914, '211002', '白塔区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (915, '211003', '文圣区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (916, '211004', '宏伟区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (917, '211005', '弓长岭区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (918, '211011', '太子河区', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (919, '211021', '辽阳县', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (920, '211081', '灯塔市', 211000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (921, '211101', '市辖区', 211100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (922, '211102', '双台子区', 211100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (923, '211103', '兴隆台区', 211100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (924, '211121', '大洼县', 211100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (925, '211122', '盘山县', 211100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (926, '211201', '市辖区', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (927, '211202', '银州区', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (928, '211204', '清河区', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (929, '211221', '铁岭县', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (930, '211223', '西丰县', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (931, '211224', '昌图县', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (932, '211281', '调兵山市', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (933, '211282', '开原市', 211200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (934, '211301', '市辖区', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (935, '211302', '双塔区', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (936, '211303', '龙城区', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (937, '211321', '朝阳县', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (938, '211322', '建平县', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (939, '211324', '喀喇沁左翼蒙古族自治县', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (940, '211381', '北票市', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (941, '211382', '凌源市', 211300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (942, '211401', '市辖区', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (943, '211402', '连山区', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (944, '211403', '龙港区', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (945, '211404', '南票区', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (946, '211421', '绥中县', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (947, '211422', '建昌县', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (948, '211481', '兴城市', 211400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (949, '220101', '市辖区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (950, '220102', '南关区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (951, '220103', '宽城区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (952, '220104', '朝阳区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (953, '220105', '二道区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (954, '220106', '绿园区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (955, '220112', '双阳区', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (956, '220122', '农安县', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (957, '220181', '九台市', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (958, '220182', '榆树市', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (959, '220183', '德惠市', 220100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (960, '220201', '市辖区', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (961, '220202', '昌邑区', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (962, '220203', '龙潭区', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (963, '220204', '船营区', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (964, '220211', '丰满区', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (965, '220221', '永吉县', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (966, '220281', '蛟河市', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (967, '220282', '桦甸市', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (968, '220283', '舒兰市', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (969, '220284', '磐石市', 220200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (970, '220301', '市辖区', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (971, '220302', '铁西区', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (972, '220303', '铁东区', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (973, '220322', '梨树县', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (974, '220323', '伊通满族自治县', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (975, '220381', '公主岭市', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (976, '220382', '双辽市', 220300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (977, '220401', '市辖区', 220400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (978, '220402', '龙山区', 220400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (979, '220403', '西安区', 220400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (980, '220421', '东丰县', 220400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (981, '220422', '东辽县', 220400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (982, '220501', '市辖区', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (983, '220502', '东昌区', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (984, '220503', '二道江区', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (985, '220521', '通化县', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (986, '220523', '辉南县', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (987, '220524', '柳河县', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (988, '220581', '梅河口市', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (989, '220582', '集安市', 220500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (990, '220601', '市辖区', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (991, '220602', '八道江区', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (992, '220621', '抚松县', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (993, '220622', '靖宇县', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (994, '220623', '长白朝鲜族自治县', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (995, '220625', '江源县', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (996, '220681', '临江市', 220600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (997, '220701', '市辖区', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (998, '220702', '宁江区', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (999, '220721', '前郭尔罗斯蒙古族自治县', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1000, '220722', '长岭县', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1001, '220723', '乾安县', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1002, '220724', '扶余县', 220700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1003, '220801', '市辖区', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1004, '220802', '洮北区', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1005, '220821', '镇赉县', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1006, '220822', '通榆县', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1007, '220881', '洮南市', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1008, '220882', '大安市', 220800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1009, '222401', '延吉市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1010, '222402', '图们市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1011, '222403', '敦化市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1012, '222404', '珲春市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1013, '222405', '龙井市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1014, '222406', '和龙市', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1015, '222424', '汪清县', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1016, '222426', '安图县', 222400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1017, '230101', '市辖区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1018, '230102', '道里区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1019, '230103', '南岗区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1020, '230104', '道外区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1021, '230106', '香坊区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1022, '230107', '动力区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1023, '230108', '平房区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1024, '230109', '松北区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1025, '230111', '呼兰区', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1026, '230123', '依兰县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1027, '230124', '方正县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1028, '230125', '宾　县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1029, '230126', '巴彦县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1030, '230127', '木兰县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1031, '230128', '通河县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1032, '230129', '延寿县', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1033, '230181', '阿城市', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1034, '230182', '双城市', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1035, '230183', '尚志市', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1036, '230184', '五常市', 230100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1037, '230201', '市辖区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1038, '230202', '龙沙区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1039, '230203', '建华区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1040, '230204', '铁锋区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1041, '230205', '昂昂溪区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1042, '230206', '富拉尔基区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1043, '230207', '碾子山区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1044, '230208', '梅里斯达斡尔族区', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1045, '230221', '龙江县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1046, '230223', '依安县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1047, '230224', '泰来县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1048, '230225', '甘南县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1049, '230227', '富裕县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1050, '230229', '克山县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1051, '230230', '克东县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1052, '230231', '拜泉县', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1053, '230281', '讷河市', 230200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1054, '230301', '市辖区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1055, '230302', '鸡冠区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1056, '230303', '恒山区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1057, '230304', '滴道区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1058, '230305', '梨树区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1059, '230306', '城子河区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1060, '230307', '麻山区', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1061, '230321', '鸡东县', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1062, '230381', '虎林市', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1063, '230382', '密山市', 230300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1064, '230401', '市辖区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1065, '230402', '向阳区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1066, '230403', '工农区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1067, '230404', '南山区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1068, '230405', '兴安区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1069, '230406', '东山区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1070, '230407', '兴山区', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1071, '230421', '萝北县', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1072, '230422', '绥滨县', 230400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1073, '230501', '市辖区', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1074, '230502', '尖山区', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1075, '230503', '岭东区', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1076, '230505', '四方台区', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1077, '230506', '宝山区', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1078, '230521', '集贤县', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1079, '230522', '友谊县', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1080, '230523', '宝清县', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1081, '230524', '饶河县', 230500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1082, '230601', '市辖区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1083, '230602', '萨尔图区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1084, '230603', '龙凤区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1085, '230604', '让胡路区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1086, '230605', '红岗区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1087, '230606', '大同区', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1088, '230621', '肇州县', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1089, '230622', '肇源县', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1090, '230623', '林甸县', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1091, '230624', '杜尔伯特蒙古族自治县', 230600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1092, '230701', '市辖区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1093, '230702', '伊春区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1094, '230703', '南岔区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1095, '230704', '友好区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1096, '230705', '西林区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1097, '230706', '翠峦区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1098, '230707', '新青区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1099, '230708', '美溪区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1100, '230709', '金山屯区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1101, '230710', '五营区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1102, '230711', '乌马河区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1103, '230712', '汤旺河区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1104, '230713', '带岭区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1105, '230714', '乌伊岭区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1106, '230715', '红星区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1107, '230716', '上甘岭区', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1108, '230722', '嘉荫县', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1109, '230781', '铁力市', 230700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1110, '230801', '市辖区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1111, '230802', '永红区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1112, '230803', '向阳区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1113, '230804', '前进区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1114, '230805', '东风区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1115, '230811', '郊　区', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1116, '230822', '桦南县', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1117, '230826', '桦川县', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1118, '230828', '汤原县', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1119, '230833', '抚远县', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1120, '230881', '同江市', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1121, '230882', '富锦市', 230800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1122, '230901', '市辖区', 230900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1123, '230902', '新兴区', 230900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1124, '230903', '桃山区', 230900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1125, '230904', '茄子河区', 230900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1126, '230921', '勃利县', 230900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1127, '231001', '市辖区', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1128, '231002', '东安区', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1129, '231003', '阳明区', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1130, '231004', '爱民区', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1131, '231005', '西安区', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1132, '231024', '东宁县', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1133, '231025', '林口县', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1134, '231081', '绥芬河市', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1135, '231083', '海林市', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1136, '231084', '宁安市', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1137, '231085', '穆棱市', 231000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1138, '231101', '市辖区', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1139, '231102', '爱辉区', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1140, '231121', '嫩江县', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1141, '231123', '逊克县', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1142, '231124', '孙吴县', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1143, '231181', '北安市', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1144, '231182', '五大连池市', 231100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1145, '231201', '市辖区', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1146, '231202', '北林区', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1147, '231221', '望奎县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1148, '231222', '兰西县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1149, '231223', '青冈县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1150, '231224', '庆安县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1151, '231225', '明水县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1152, '231226', '绥棱县', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1153, '231281', '安达市', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1154, '231282', '肇东市', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1155, '231283', '海伦市', 231200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1156, '232721', '呼玛县', 232700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1157, '232722', '塔河县', 232700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1158, '232723', '漠河县', 232700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1159, '310101', '黄浦区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1160, '310103', '卢湾区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1161, '310104', '徐汇区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1162, '310105', '长宁区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1163, '310106', '静安区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1164, '310107', '普陀区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1165, '310108', '闸北区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1166, '310109', '虹口区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1167, '310110', '杨浦区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1168, '310112', '闵行区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1169, '310113', '宝山区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1170, '310114', '嘉定区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1171, '310115', '浦东新区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1172, '310116', '金山区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1173, '310117', '松江区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1174, '310118', '青浦区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1175, '310119', '南汇区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1176, '310120', '奉贤区', 310100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1177, '310230', '崇明县', 310200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1178, '320101', '市辖区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1179, '320102', '玄武区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1180, '320103', '白下区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1181, '320104', '秦淮区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1182, '320105', '建邺区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1183, '320106', '鼓楼区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1184, '320107', '下关区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1185, '320111', '浦口区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1186, '320113', '栖霞区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1187, '320114', '雨花台区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1188, '320115', '江宁区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1189, '320116', '六合区', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1190, '320124', '溧水县', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1191, '320125', '高淳县', 320100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1192, '320201', '市辖区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1193, '320202', '崇安区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1194, '320203', '南长区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1195, '320204', '北塘区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1196, '320205', '锡山区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1197, '320206', '惠山区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1198, '320211', '滨湖区', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1199, '320281', '江阴市', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1200, '320282', '宜兴市', 320200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1201, '320301', '市辖区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1202, '320302', '鼓楼区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1203, '320303', '云龙区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1204, '320304', '九里区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1205, '320305', '贾汪区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1206, '320311', '泉山区', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1207, '320321', '丰　县', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1208, '320322', '沛　县', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1209, '320323', '铜山县', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1210, '320324', '睢宁县', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1211, '320381', '新沂市', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1212, '320382', '邳州市', 320300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1213, '320401', '市辖区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1214, '320402', '天宁区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1215, '320404', '钟楼区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1216, '320405', '戚墅堰区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1217, '320411', '新北区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1218, '320412', '武进区', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1219, '320481', '溧阳市', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1220, '320482', '金坛市', 320400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1221, '320501', '市辖区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1222, '320502', '沧浪区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1223, '320503', '平江区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1224, '320504', '金阊区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1225, '320505', '虎丘区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1226, '320506', '吴中区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1227, '320507', '相城区', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1228, '320581', '常熟市', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1229, '320582', '张家港市', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1230, '320583', '昆山市', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1231, '320584', '吴江市', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1232, '320585', '太仓市', 320500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1233, '320601', '市辖区', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1234, '320602', '崇川区', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1235, '320611', '港闸区', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1236, '320621', '海安县', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1237, '320623', '如东县', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1238, '320681', '启东市', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1239, '320682', '如皋市', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1240, '320683', '通州市', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1241, '320684', '海门市', 320600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1242, '320701', '市辖区', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1243, '320703', '连云区', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1244, '320705', '新浦区', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1245, '320706', '海州区', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1246, '320721', '赣榆县', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1247, '320722', '东海县', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1248, '320723', '灌云县', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1249, '320724', '灌南县', 320700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1250, '320801', '市辖区', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1251, '320802', '清河区', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1252, '320803', '楚州区', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1253, '320804', '淮阴区', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1254, '320811', '清浦区', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1255, '320826', '涟水县', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1256, '320829', '洪泽县', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1257, '320830', '盱眙县', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1258, '320831', '金湖县', 320800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1259, '320901', '市辖区', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1260, '320902', '亭湖区', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1261, '320903', '盐都区', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1262, '320921', '响水县', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1263, '320922', '滨海县', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1264, '320923', '阜宁县', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1265, '320924', '射阳县', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1266, '320925', '建湖县', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1267, '320981', '东台市', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1268, '320982', '大丰市', 320900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1269, '321001', '市辖区', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1270, '321002', '广陵区', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1271, '321003', '邗江区', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1272, '321011', '郊　区', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1273, '321023', '宝应县', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1274, '321081', '仪征市', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1275, '321084', '高邮市', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1276, '321088', '江都市', 321000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1277, '321101', '市辖区', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1278, '321102', '京口区', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1279, '321111', '润州区', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1280, '321112', '丹徒区', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1281, '321181', '丹阳市', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1282, '321182', '扬中市', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1283, '321183', '句容市', 321100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1284, '321201', '市辖区', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1285, '321202', '海陵区', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1286, '321203', '高港区', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1287, '321281', '兴化市', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1288, '321282', '靖江市', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1289, '321283', '泰兴市', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1290, '321284', '姜堰市', 321200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1291, '321301', '市辖区', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1292, '321302', '宿城区', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1293, '321311', '宿豫区', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1294, '321322', '沭阳县', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1295, '321323', '泗阳县', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1296, '321324', '泗洪县', 321300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1297, '330101', '市辖区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1298, '330102', '上城区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1299, '330103', '下城区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1300, '330104', '江干区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1301, '330105', '拱墅区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1302, '330106', '西湖区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1303, '330108', '滨江区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1304, '330109', '萧山区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1305, '330110', '余杭区', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1306, '330122', '桐庐县', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1307, '330127', '淳安县', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1308, '330182', '建德市', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1309, '330183', '富阳市', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1310, '330185', '临安市', 330100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1311, '330201', '市辖区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1312, '330203', '海曙区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1313, '330204', '江东区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1314, '330205', '江北区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1315, '330206', '北仑区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1316, '330211', '镇海区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1317, '330212', '鄞州区', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1318, '330225', '象山县', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1319, '330226', '宁海县', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1320, '330281', '余姚市', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1321, '330282', '慈溪市', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1322, '330283', '奉化市', 330200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1323, '330301', '市辖区', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1324, '330302', '鹿城区', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1325, '330303', '龙湾区', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1326, '330304', '瓯海区', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1327, '330322', '洞头县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1328, '330324', '永嘉县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1329, '330326', '平阳县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1330, '330327', '苍南县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1331, '330328', '文成县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1332, '330329', '泰顺县', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1333, '330381', '瑞安市', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1334, '330382', '乐清市', 330300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1335, '330401', '市辖区', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1336, '330402', '秀城区', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1337, '330411', '秀洲区', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1338, '330421', '嘉善县', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1339, '330424', '海盐县', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1340, '330481', '海宁市', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1341, '330482', '平湖市', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1342, '330483', '桐乡市', 330400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1343, '330501', '市辖区', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1344, '330502', '吴兴区', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1345, '330503', '南浔区', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1346, '330521', '德清县', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1347, '330522', '长兴县', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1348, '330523', '安吉县', 330500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1349, '330601', '市辖区', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1350, '330602', '越城区', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1351, '330621', '绍兴县', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1352, '330624', '新昌县', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1353, '330681', '诸暨市', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1354, '330682', '上虞市', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1355, '330683', '嵊州市', 330600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1356, '330701', '市辖区', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1357, '330702', '婺城区', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1358, '330703', '金东区', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1359, '330723', '武义县', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1360, '330726', '浦江县', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1361, '330727', '磐安县', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1362, '330781', '兰溪市', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1363, '330782', '义乌市', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1364, '330783', '东阳市', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1365, '330784', '永康市', 330700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1366, '330801', '市辖区', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1367, '330802', '柯城区', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1368, '330803', '衢江区', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1369, '330822', '常山县', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1370, '330824', '开化县', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1371, '330825', '龙游县', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1372, '330881', '江山市', 330800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1373, '330901', '市辖区', 330900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1374, '330902', '定海区', 330900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1375, '330903', '普陀区', 330900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1376, '330921', '岱山县', 330900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1377, '330922', '嵊泗县', 330900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1378, '331001', '市辖区', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1379, '331002', '椒江区', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1380, '331003', '黄岩区', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1381, '331004', '路桥区', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1382, '331021', '玉环县', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1383, '331022', '三门县', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1384, '331023', '天台县', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1385, '331024', '仙居县', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1386, '331081', '温岭市', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1387, '331082', '临海市', 331000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1388, '331101', '市辖区', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1389, '331102', '莲都区', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1390, '331121', '青田县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1391, '331122', '缙云县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1392, '331123', '遂昌县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1393, '331124', '松阳县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1394, '331125', '云和县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1395, '331126', '庆元县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1396, '331127', '景宁畲族自治县', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1397, '331181', '龙泉市', 331100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1398, '340101', '市辖区', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1399, '340102', '瑶海区', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1400, '340103', '庐阳区', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1401, '340104', '蜀山区', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1402, '340111', '包河区', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1403, '340121', '长丰县', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1404, '340122', '肥东县', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1405, '340123', '肥西县', 340100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1406, '340201', '市辖区', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1407, '340202', '镜湖区', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1408, '340203', '马塘区', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1409, '340204', '新芜区', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1410, '340207', '鸠江区', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1411, '340221', '芜湖县', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1412, '340222', '繁昌县', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1413, '340223', '南陵县', 340200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1414, '340301', '市辖区', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1415, '340302', '龙子湖区', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1416, '340303', '蚌山区', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1417, '340304', '禹会区', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1418, '340311', '淮上区', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1419, '340321', '怀远县', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1420, '340322', '五河县', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1421, '340323', '固镇县', 340300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1422, '340401', '市辖区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1423, '340402', '大通区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1424, '340403', '田家庵区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1425, '340404', '谢家集区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1426, '340405', '八公山区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1427, '340406', '潘集区', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1428, '340421', '凤台县', 340400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1429, '340501', '市辖区', 340500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1430, '340502', '金家庄区', 340500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1431, '340503', '花山区', 340500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1432, '340504', '雨山区', 340500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1433, '340521', '当涂县', 340500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1434, '340601', '市辖区', 340600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1435, '340602', '杜集区', 340600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1436, '340603', '相山区', 340600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1437, '340604', '烈山区', 340600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1438, '340621', '濉溪县', 340600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1439, '340701', '市辖区', 340700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1440, '340702', '铜官山区', 340700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1441, '340703', '狮子山区', 340700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1442, '340711', '郊　区', 340700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1443, '340721', '铜陵县', 340700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1444, '340801', '市辖区', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1445, '340802', '迎江区', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1446, '340803', '大观区', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1447, '340811', '郊　区', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1448, '340822', '怀宁县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1449, '340823', '枞阳县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1450, '340824', '潜山县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1451, '340825', '太湖县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1452, '340826', '宿松县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1453, '340827', '望江县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1454, '340828', '岳西县', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1455, '340881', '桐城市', 340800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1456, '341001', '市辖区', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1457, '341002', '屯溪区', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1458, '341003', '黄山区', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1459, '341004', '徽州区', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1460, '341021', '歙　县', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1461, '341022', '休宁县', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1462, '341023', '黟　县', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1463, '341024', '祁门县', 341000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1464, '341101', '市辖区', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1465, '341102', '琅琊区', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1466, '341103', '南谯区', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1467, '341122', '来安县', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1468, '341124', '全椒县', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1469, '341125', '定远县', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1470, '341126', '凤阳县', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1471, '341181', '天长市', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1472, '341182', '明光市', 341100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1473, '341201', '市辖区', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1474, '341202', '颍州区', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1475, '341203', '颍东区', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1476, '341204', '颍泉区', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1477, '341221', '临泉县', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1478, '341222', '太和县', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1479, '341225', '阜南县', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1480, '341226', '颍上县', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1481, '341282', '界首市', 341200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1482, '341301', '市辖区', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1483, '341302', '墉桥区', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1484, '341321', '砀山县', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1485, '341322', '萧　县', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1486, '341323', '灵璧县', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1487, '341324', '泗　县', 341300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1488, '341401', '市辖区', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1489, '341402', '居巢区', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1490, '341421', '庐江县', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1491, '341422', '无为县', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1492, '341423', '含山县', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1493, '341424', '和　县', 341400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1494, '341501', '市辖区', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1495, '341502', '金安区', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1496, '341503', '裕安区', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1497, '341521', '寿　县', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1498, '341522', '霍邱县', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1499, '341523', '舒城县', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1500, '341524', '金寨县', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1501, '341525', '霍山县', 341500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1502, '341601', '市辖区', 341600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1503, '341602', '谯城区', 341600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1504, '341621', '涡阳县', 341600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1505, '341622', '蒙城县', 341600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1506, '341623', '利辛县', 341600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1507, '341701', '市辖区', 341700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1508, '341702', '贵池区', 341700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1509, '341721', '东至县', 341700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1510, '341722', '石台县', 341700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1511, '341723', '青阳县', 341700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1512, '341801', '市辖区', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1513, '341802', '宣州区', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1514, '341821', '郎溪县', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1515, '341822', '广德县', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1516, '341823', '泾　县', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1517, '341824', '绩溪县', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1518, '341825', '旌德县', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1519, '341881', '宁国市', 341800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1520, '350101', '市辖区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1521, '350102', '鼓楼区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1522, '350103', '台江区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1523, '350104', '仓山区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1524, '350105', '马尾区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1525, '350111', '晋安区', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1526, '350121', '闽侯县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1527, '350122', '连江县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1528, '350123', '罗源县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1529, '350124', '闽清县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1530, '350125', '永泰县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1531, '350128', '平潭县', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1532, '350181', '福清市', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1533, '350182', '长乐市', 350100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1534, '350201', '市辖区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1535, '350203', '思明区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1536, '350205', '海沧区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1537, '350206', '湖里区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1538, '350211', '集美区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1539, '350212', '同安区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1540, '350213', '翔安区', 350200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1541, '350301', '市辖区', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1542, '350302', '城厢区', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1543, '350303', '涵江区', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1544, '350304', '荔城区', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1545, '350305', '秀屿区', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1546, '350322', '仙游县', 350300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1547, '350401', '市辖区', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1548, '350402', '梅列区', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1549, '350403', '三元区', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1550, '350421', '明溪县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1551, '350423', '清流县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1552, '350424', '宁化县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1553, '350425', '大田县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1554, '350426', '尤溪县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1555, '350427', '沙　县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1556, '350428', '将乐县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1557, '350429', '泰宁县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1558, '350430', '建宁县', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1559, '350481', '永安市', 350400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1560, '350501', '市辖区', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1561, '350502', '鲤城区', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1562, '350503', '丰泽区', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1563, '350504', '洛江区', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1564, '350505', '泉港区', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1565, '350521', '惠安县', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1566, '350524', '安溪县', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1567, '350525', '永春县', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1568, '350526', '德化县', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1569, '350527', '金门县', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1570, '350581', '石狮市', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1571, '350582', '晋江市', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1572, '350583', '南安市', 350500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1573, '350601', '市辖区', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1574, '350602', '芗城区', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1575, '350603', '龙文区', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1576, '350622', '云霄县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1577, '350623', '漳浦县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1578, '350624', '诏安县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1579, '350625', '长泰县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1580, '350626', '东山县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1581, '350627', '南靖县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1582, '350628', '平和县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1583, '350629', '华安县', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1584, '350681', '龙海市', 350600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1585, '350701', '市辖区', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1586, '350702', '延平区', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1587, '350721', '顺昌县', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1588, '350722', '浦城县', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1589, '350723', '光泽县', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1590, '350724', '松溪县', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1591, '350725', '政和县', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1592, '350781', '邵武市', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1593, '350782', '武夷山市', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1594, '350783', '建瓯市', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1595, '350784', '建阳市', 350700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1596, '350801', '市辖区', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1597, '350802', '新罗区', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1598, '350821', '长汀县', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1599, '350822', '永定县', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1600, '350823', '上杭县', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1601, '350824', '武平县', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1602, '350825', '连城县', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1603, '350881', '漳平市', 350800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1604, '350901', '市辖区', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1605, '350902', '蕉城区', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1606, '350921', '霞浦县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1607, '350922', '古田县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1608, '350923', '屏南县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1609, '350924', '寿宁县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1610, '350925', '周宁县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1611, '350926', '柘荣县', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1612, '350981', '福安市', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1613, '350982', '福鼎市', 350900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1614, '360101', '市辖区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1615, '360102', '东湖区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1616, '360103', '西湖区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1617, '360104', '青云谱区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1618, '360105', '湾里区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1619, '360111', '青山湖区', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1620, '360121', '南昌县', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1621, '360122', '新建县', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1622, '360123', '安义县', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1623, '360124', '进贤县', 360100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1624, '360201', '市辖区', 360200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1625, '360202', '昌江区', 360200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1626, '360203', '珠山区', 360200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1627, '360222', '浮梁县', 360200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1628, '360281', '乐平市', 360200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1629, '360301', '市辖区', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1630, '360302', '安源区', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1631, '360313', '湘东区', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1632, '360321', '莲花县', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1633, '360322', '上栗县', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1634, '360323', '芦溪县', 360300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1635, '360401', '市辖区', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1636, '360402', '庐山区', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1637, '360403', '浔阳区', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1638, '360421', '九江县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1639, '360423', '武宁县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1640, '360424', '修水县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1641, '360425', '永修县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1642, '360426', '德安县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1643, '360427', '星子县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1644, '360428', '都昌县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1645, '360429', '湖口县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1646, '360430', '彭泽县', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1647, '360481', '瑞昌市', 360400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1648, '360501', '市辖区', 360500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1649, '360502', '渝水区', 360500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1650, '360521', '分宜县', 360500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1651, '360601', '市辖区', 360600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1652, '360602', '月湖区', 360600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1653, '360622', '余江县', 360600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1654, '360681', '贵溪市', 360600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1655, '360701', '市辖区', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1656, '360702', '章贡区', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1657, '360721', '赣　县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1658, '360722', '信丰县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1659, '360723', '大余县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1660, '360724', '上犹县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1661, '360725', '崇义县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1662, '360726', '安远县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1663, '360727', '龙南县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1664, '360728', '定南县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1665, '360729', '全南县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1666, '360730', '宁都县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1667, '360731', '于都县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1668, '360732', '兴国县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1669, '360733', '会昌县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1670, '360734', '寻乌县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1671, '360735', '石城县', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1672, '360781', '瑞金市', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1673, '360782', '南康市', 360700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1674, '360801', '市辖区', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1675, '360802', '吉州区', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1676, '360803', '青原区', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1677, '360821', '吉安县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1678, '360822', '吉水县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1679, '360823', '峡江县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1680, '360824', '新干县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1681, '360825', '永丰县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1682, '360826', '泰和县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1683, '360827', '遂川县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1684, '360828', '万安县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1685, '360829', '安福县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1686, '360830', '永新县', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1687, '360881', '井冈山市', 360800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1688, '360901', '市辖区', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1689, '360902', '袁州区', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1690, '360921', '奉新县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1691, '360922', '万载县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1692, '360923', '上高县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1693, '360924', '宜丰县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1694, '360925', '靖安县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1695, '360926', '铜鼓县', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1696, '360981', '丰城市', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1697, '360982', '樟树市', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1698, '360983', '高安市', 360900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1699, '361001', '市辖区', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1700, '361002', '临川区', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1701, '361021', '南城县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1702, '361022', '黎川县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1703, '361023', '南丰县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1704, '361024', '崇仁县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1705, '361025', '乐安县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1706, '361026', '宜黄县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1707, '361027', '金溪县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1708, '361028', '资溪县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1709, '361029', '东乡县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1710, '361030', '广昌县', 361000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1711, '361101', '市辖区', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1712, '361102', '信州区', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1713, '361121', '上饶县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1714, '361122', '广丰县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1715, '361123', '玉山县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1716, '361124', '铅山县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1717, '361125', '横峰县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1718, '361126', '弋阳县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1719, '361127', '余干县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1720, '361128', '鄱阳县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1721, '361129', '万年县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1722, '361130', '婺源县', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1723, '361181', '德兴市', 361100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1724, '370101', '市辖区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1725, '370102', '历下区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1726, '370103', '市中区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1727, '370104', '槐荫区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1728, '370105', '天桥区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1729, '370112', '历城区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1730, '370113', '长清区', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1731, '370124', '平阴县', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1732, '370125', '济阳县', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1733, '370126', '商河县', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1734, '370181', '章丘市', 370100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1735, '370201', '市辖区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1736, '370202', '市南区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1737, '370203', '市北区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1738, '370205', '四方区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1739, '370211', '黄岛区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1740, '370212', '崂山区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1741, '370213', '李沧区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1742, '370214', '城阳区', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1743, '370281', '胶州市', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1744, '370282', '即墨市', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1745, '370283', '平度市', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1746, '370284', '胶南市', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1747, '370285', '莱西市', 370200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1748, '370301', '市辖区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1749, '370302', '淄川区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1750, '370303', '张店区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1751, '370304', '博山区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1752, '370305', '临淄区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1753, '370306', '周村区', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1754, '370321', '桓台县', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1755, '370322', '高青县', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1756, '370323', '沂源县', 370300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1757, '370401', '市辖区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1758, '370402', '市中区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1759, '370403', '薛城区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1760, '370404', '峄城区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1761, '370405', '台儿庄区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1762, '370406', '山亭区', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1763, '370481', '滕州市', 370400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1764, '370501', '市辖区', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1765, '370502', '东营区', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1766, '370503', '河口区', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1767, '370521', '垦利县', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1768, '370522', '利津县', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1769, '370523', '广饶县', 370500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1770, '370601', '市辖区', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1771, '370602', '芝罘区', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1772, '370611', '福山区', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1773, '370612', '牟平区', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1774, '370613', '莱山区', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1775, '370634', '长岛县', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1776, '370681', '龙口市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1777, '370682', '莱阳市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1778, '370683', '莱州市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1779, '370684', '蓬莱市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1780, '370685', '招远市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1781, '370686', '栖霞市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1782, '370687', '海阳市', 370600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1783, '370701', '市辖区', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1784, '370702', '潍城区', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1785, '370703', '寒亭区', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1786, '370704', '坊子区', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1787, '370705', '奎文区', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1788, '370724', '临朐县', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1789, '370725', '昌乐县', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1790, '370781', '青州市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1791, '370782', '诸城市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1792, '370783', '寿光市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1793, '370784', '安丘市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1794, '370785', '高密市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1795, '370786', '昌邑市', 370700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1796, '370801', '市辖区', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1797, '370802', '市中区', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1798, '370811', '任城区', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1799, '370826', '微山县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1800, '370827', '鱼台县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1801, '370828', '金乡县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1802, '370829', '嘉祥县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1803, '370830', '汶上县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1804, '370831', '泗水县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1805, '370832', '梁山县', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1806, '370881', '曲阜市', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1807, '370882', '兖州市', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1808, '370883', '邹城市', 370800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1809, '370901', '市辖区', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1810, '370902', '泰山区', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1811, '370903', '岱岳区', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1812, '370921', '宁阳县', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1813, '370923', '东平县', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1814, '370982', '新泰市', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1815, '370983', '肥城市', 370900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1816, '371001', '市辖区', 371000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1817, '371002', '环翠区', 371000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1818, '371081', '文登市', 371000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1819, '371082', '荣成市', 371000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1820, '371083', '乳山市', 371000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1821, '371101', '市辖区', 371100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1822, '371102', '东港区', 371100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1823, '371103', '岚山区', 371100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1824, '371121', '五莲县', 371100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1825, '371122', '莒　县', 371100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1826, '371201', '市辖区', 371200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1827, '371202', '莱城区', 371200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1828, '371203', '钢城区', 371200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1829, '371301', '市辖区', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1830, '371302', '兰山区', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1831, '371311', '罗庄区', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1832, '371312', '河东区', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1833, '371321', '沂南县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1834, '371322', '郯城县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1835, '371323', '沂水县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1836, '371324', '苍山县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1837, '371325', '费　县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1838, '371326', '平邑县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1839, '371327', '莒南县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1840, '371328', '蒙阴县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1841, '371329', '临沭县', 371300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1842, '371401', '市辖区', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1843, '371402', '德城区', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1844, '371421', '陵　县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1845, '371422', '宁津县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1846, '371423', '庆云县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1847, '371424', '临邑县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1848, '371425', '齐河县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1849, '371426', '平原县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1850, '371427', '夏津县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1851, '371428', '武城县', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1852, '371481', '乐陵市', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1853, '371482', '禹城市', 371400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1854, '371501', '市辖区', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1855, '371502', '东昌府区', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1856, '371521', '阳谷县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1857, '371522', '莘　县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1858, '371523', '茌平县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1859, '371524', '东阿县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1860, '371525', '冠　县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1861, '371526', '高唐县', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1862, '371581', '临清市', 371500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1863, '371601', '市辖区', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1864, '371602', '滨城区', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1865, '371621', '惠民县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1866, '371622', '阳信县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1867, '371623', '无棣县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1868, '371624', '沾化县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1869, '371625', '博兴县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1870, '371626', '邹平县', 371600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1871, '371701', '市辖区', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1872, '371702', '牡丹区', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1873, '371721', '曹　县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1874, '371722', '单　县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1875, '371723', '成武县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1876, '371724', '巨野县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1877, '371725', '郓城县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1878, '371726', '鄄城县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1879, '371727', '定陶县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1880, '371728', '东明县', 371700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1881, '410101', '市辖区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1882, '410102', '中原区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1883, '410103', '二七区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1884, '410104', '管城回族区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1885, '410105', '金水区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1886, '410106', '上街区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1887, '410108', '邙山区', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1888, '410122', '中牟县', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1889, '410181', '巩义市', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1890, '410182', '荥阳市', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1891, '410183', '新密市', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1892, '410184', '新郑市', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1893, '410185', '登封市', 410100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1894, '410201', '市辖区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1895, '410202', '龙亭区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1896, '410203', '顺河回族区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1897, '410204', '鼓楼区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1898, '410205', '南关区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1899, '410211', '郊　区', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1900, '410221', '杞　县', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1901, '410222', '通许县', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1902, '410223', '尉氏县', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1903, '410224', '开封县', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1904, '410225', '兰考县', 410200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1905, '410301', '市辖区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1906, '410302', '老城区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1907, '410303', '西工区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1908, '410304', '廛河回族区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1909, '410305', '涧西区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1910, '410306', '吉利区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1911, '410307', '洛龙区', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1912, '410322', '孟津县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1913, '410323', '新安县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1914, '410324', '栾川县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1915, '410325', '嵩　县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1916, '410326', '汝阳县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1917, '410327', '宜阳县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1918, '410328', '洛宁县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1919, '410329', '伊川县', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1920, '410381', '偃师市', 410300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1921, '410401', '市辖区', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1922, '410402', '新华区', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1923, '410403', '卫东区', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1924, '410404', '石龙区', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1925, '410411', '湛河区', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1926, '410421', '宝丰县', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1927, '410422', '叶　县', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1928, '410423', '鲁山县', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1929, '410425', '郏　县', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1930, '410481', '舞钢市', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1931, '410482', '汝州市', 410400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1932, '410501', '市辖区', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1933, '410502', '文峰区', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1934, '410503', '北关区', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1935, '410505', '殷都区', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1936, '410506', '龙安区', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1937, '410522', '安阳县', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1938, '410523', '汤阴县', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1939, '410526', '滑　县', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1940, '410527', '内黄县', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1941, '410581', '林州市', 410500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1942, '410601', '市辖区', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1943, '410602', '鹤山区', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1944, '410603', '山城区', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1945, '410611', '淇滨区', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1946, '410621', '浚　县', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1947, '410622', '淇　县', 410600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1948, '410701', '市辖区', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1949, '410702', '红旗区', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1950, '410703', '卫滨区', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1951, '410704', '凤泉区', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1952, '410711', '牧野区', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1953, '410721', '新乡县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1954, '410724', '获嘉县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1955, '410725', '原阳县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1956, '410726', '延津县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1957, '410727', '封丘县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1958, '410728', '长垣县', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1959, '410781', '卫辉市', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1960, '410782', '辉县市', 410700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1961, '410801', '市辖区', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1962, '410802', '解放区', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1963, '410803', '中站区', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1964, '410804', '马村区', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1965, '410811', '山阳区', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1966, '410821', '修武县', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1967, '410822', '博爱县', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1968, '410823', '武陟县', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1969, '410825', '温　县', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1970, '410881', '济源市', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1971, '410882', '沁阳市', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1972, '410883', '孟州市', 410800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1973, '410901', '市辖区', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1974, '410902', '华龙区', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1975, '410922', '清丰县', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1976, '410923', '南乐县', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1977, '410926', '范　县', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1978, '410927', '台前县', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1979, '410928', '濮阳县', 410900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1980, '411001', '市辖区', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1981, '411002', '魏都区', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1982, '411023', '许昌县', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1983, '411024', '鄢陵县', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1984, '411025', '襄城县', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1985, '411081', '禹州市', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1986, '411082', '长葛市', 411000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1987, '411101', '市辖区', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1988, '411102', '源汇区', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1989, '411103', '郾城区', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1990, '411104', '召陵区', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1991, '411121', '舞阳县', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1992, '411122', '临颍县', 411100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1993, '411201', '市辖区', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1994, '411202', '湖滨区', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1995, '411221', '渑池县', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1996, '411222', '陕　县', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1997, '411224', '卢氏县', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1998, '411281', '义马市', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (1999, '411282', '灵宝市', 411200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2000, '411301', '市辖区', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2001, '411302', '宛城区', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2002, '411303', '卧龙区', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2003, '411321', '南召县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2004, '411322', '方城县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2005, '411323', '西峡县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2006, '411324', '镇平县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2007, '411325', '内乡县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2008, '411326', '淅川县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2009, '411327', '社旗县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2010, '411328', '唐河县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2011, '411329', '新野县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2012, '411330', '桐柏县', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2013, '411381', '邓州市', 411300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2014, '411401', '市辖区', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2015, '411402', '梁园区', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2016, '411403', '睢阳区', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2017, '411421', '民权县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2018, '411422', '睢　县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2019, '411423', '宁陵县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2020, '411424', '柘城县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2021, '411425', '虞城县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2022, '411426', '夏邑县', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2023, '411481', '永城市', 411400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2024, '411501', '市辖区', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2025, '411502', '师河区', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2026, '411503', '平桥区', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2027, '411521', '罗山县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2028, '411522', '光山县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2029, '411523', '新　县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2030, '411524', '商城县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2031, '411525', '固始县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2032, '411526', '潢川县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2033, '411527', '淮滨县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2034, '411528', '息　县', 411500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2035, '411601', '市辖区', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2036, '411602', '川汇区', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2037, '411621', '扶沟县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2038, '411622', '西华县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2039, '411623', '商水县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2040, '411624', '沈丘县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2041, '411625', '郸城县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2042, '411626', '淮阳县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2043, '411627', '太康县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2044, '411628', '鹿邑县', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2045, '411681', '项城市', 411600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2046, '411701', '市辖区', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2047, '411702', '驿城区', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2048, '411721', '西平县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2049, '411722', '上蔡县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2050, '411723', '平舆县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2051, '411724', '正阳县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2052, '411725', '确山县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2053, '411726', '泌阳县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2054, '411727', '汝南县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2055, '411728', '遂平县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2056, '411729', '新蔡县', 411700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2057, '420101', '市辖区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2058, '420102', '江岸区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2059, '420103', '江汉区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2060, '420104', '乔口区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2061, '420105', '汉阳区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2062, '420106', '武昌区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2063, '420107', '青山区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2064, '420111', '洪山区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2065, '420112', '东西湖区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2066, '420113', '汉南区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2067, '420114', '蔡甸区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2068, '420115', '江夏区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2069, '420116', '黄陂区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2070, '420117', '新洲区', 420100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2071, '420201', '市辖区', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2072, '420202', '黄石港区', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2073, '420203', '西塞山区', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2074, '420204', '下陆区', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2075, '420205', '铁山区', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2076, '420222', '阳新县', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2077, '420281', '大冶市', 420200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2078, '420301', '市辖区', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2079, '420302', '茅箭区', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2080, '420303', '张湾区', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2081, '420321', '郧　县', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2082, '420322', '郧西县', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2083, '420323', '竹山县', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2084, '420324', '竹溪县', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2085, '420325', '房　县', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2086, '420381', '丹江口市', 420300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2087, '420501', '市辖区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2088, '420502', '西陵区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2089, '420503', '伍家岗区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2090, '420504', '点军区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2091, '420505', '猇亭区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2092, '420506', '夷陵区', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2093, '420525', '远安县', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2094, '420526', '兴山县', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2095, '420527', '秭归县', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2096, '420528', '长阳土家族自治县', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2097, '420529', '五峰土家族自治县', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2098, '420581', '宜都市', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2099, '420582', '当阳市', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2100, '420583', '枝江市', 420500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2101, '420601', '市辖区', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2102, '420602', '襄城区', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2103, '420606', '樊城区', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2104, '420607', '襄阳区', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2105, '420624', '南漳县', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2106, '420625', '谷城县', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2107, '420626', '保康县', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2108, '420682', '老河口市', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2109, '420683', '枣阳市', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2110, '420684', '宜城市', 420600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2111, '420701', '市辖区', 420700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2112, '420702', '梁子湖区', 420700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2113, '420703', '华容区', 420700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2114, '420704', '鄂城区', 420700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2115, '420801', '市辖区', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2116, '420802', '东宝区', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2117, '420804', '掇刀区', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2118, '420821', '京山县', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2119, '420822', '沙洋县', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2120, '420881', '钟祥市', 420800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2121, '420901', '市辖区', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2122, '420902', '孝南区', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2123, '420921', '孝昌县', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2124, '420922', '大悟县', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2125, '420923', '云梦县', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2126, '420981', '应城市', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2127, '420982', '安陆市', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2128, '420984', '汉川市', 420900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2129, '421001', '市辖区', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2130, '421002', '沙市区', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2131, '421003', '荆州区', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2132, '421022', '公安县', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2133, '421023', '监利县', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2134, '421024', '江陵县', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2135, '421081', '石首市', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2136, '421083', '洪湖市', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2137, '421087', '松滋市', 421000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2138, '421101', '市辖区', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2139, '421102', '黄州区', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2140, '421121', '团风县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2141, '421122', '红安县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2142, '421123', '罗田县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2143, '421124', '英山县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2144, '421125', '浠水县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2145, '421126', '蕲春县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2146, '421127', '黄梅县', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2147, '421181', '麻城市', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2148, '421182', '武穴市', 421100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2149, '421201', '市辖区', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2150, '421202', '咸安区', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2151, '421221', '嘉鱼县', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2152, '421222', '通城县', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2153, '421223', '崇阳县', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2154, '421224', '通山县', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2155, '421281', '赤壁市', 421200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2156, '421301', '市辖区', 421300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2157, '421302', '曾都区', 421300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2158, '421381', '广水市', 421300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2159, '422801', '恩施市', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2160, '422802', '利川市', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2161, '422822', '建始县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2162, '422823', '巴东县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2163, '422825', '宣恩县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2164, '422826', '咸丰县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2165, '422827', '来凤县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2166, '422828', '鹤峰县', 422800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2167, '429004', '仙桃市', 429000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2168, '429005', '潜江市', 429000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2169, '429006', '天门市', 429000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2170, '429021', '神农架林区', 429000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2171, '430101', '市辖区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2172, '430102', '芙蓉区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2173, '430103', '天心区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2174, '430104', '岳麓区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2175, '430105', '开福区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2176, '430111', '雨花区', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2177, '430121', '长沙县', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2178, '430122', '望城县', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2179, '430124', '宁乡县', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2180, '430181', '浏阳市', 430100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2181, '430201', '市辖区', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2182, '430202', '荷塘区', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2183, '430203', '芦淞区', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2184, '430204', '石峰区', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2185, '430211', '天元区', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2186, '430221', '株洲县', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2187, '430223', '攸　县', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2188, '430224', '茶陵县', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2189, '430225', '炎陵县', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2190, '430281', '醴陵市', 430200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2191, '430301', '市辖区', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2192, '430302', '雨湖区', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2193, '430304', '岳塘区', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2194, '430321', '湘潭县', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2195, '430381', '湘乡市', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2196, '430382', '韶山市', 430300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2197, '430401', '市辖区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2198, '430405', '珠晖区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2199, '430406', '雁峰区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2200, '430407', '石鼓区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2201, '430408', '蒸湘区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2202, '430412', '南岳区', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2203, '430421', '衡阳县', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2204, '430422', '衡南县', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2205, '430423', '衡山县', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2206, '430424', '衡东县', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2207, '430426', '祁东县', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2208, '430481', '耒阳市', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2209, '430482', '常宁市', 430400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2210, '430501', '市辖区', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2211, '430502', '双清区', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2212, '430503', '大祥区', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2213, '430511', '北塔区', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2214, '430521', '邵东县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2215, '430522', '新邵县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2216, '430523', '邵阳县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2217, '430524', '隆回县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2218, '430525', '洞口县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2219, '430527', '绥宁县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2220, '430528', '新宁县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2221, '430529', '城步苗族自治县', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2222, '430581', '武冈市', 430500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2223, '430601', '市辖区', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2224, '430602', '岳阳楼区', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2225, '430603', '云溪区', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2226, '430611', '君山区', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2227, '430621', '岳阳县', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2228, '430623', '华容县', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2229, '430624', '湘阴县', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2230, '430626', '平江县', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2231, '430681', '汨罗市', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2232, '430682', '临湘市', 430600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2233, '430701', '市辖区', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2234, '430702', '武陵区', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2235, '430703', '鼎城区', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2236, '430721', '安乡县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2237, '430722', '汉寿县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2238, '430723', '澧　县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2239, '430724', '临澧县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2240, '430725', '桃源县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2241, '430726', '石门县', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2242, '430781', '津市市', 430700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2243, '430801', '市辖区', 430800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2244, '430802', '永定区', 430800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2245, '430811', '武陵源区', 430800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2246, '430821', '慈利县', 430800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2247, '430822', '桑植县', 430800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2248, '430901', '市辖区', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2249, '430902', '资阳区', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2250, '430903', '赫山区', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2251, '430921', '南　县', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2252, '430922', '桃江县', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2253, '430923', '安化县', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2254, '430981', '沅江市', 430900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2255, '431001', '市辖区', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2256, '431002', '北湖区', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2257, '431003', '苏仙区', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2258, '431021', '桂阳县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2259, '431022', '宜章县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2260, '431023', '永兴县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2261, '431024', '嘉禾县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2262, '431025', '临武县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2263, '431026', '汝城县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2264, '431027', '桂东县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2265, '431028', '安仁县', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2266, '431081', '资兴市', 431000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2267, '431101', '市辖区', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2268, '431102', '芝山区', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2269, '431103', '冷水滩区', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2270, '431121', '祁阳县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2271, '431122', '东安县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2272, '431123', '双牌县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2273, '431124', '道　县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2274, '431125', '江永县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2275, '431126', '宁远县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2276, '431127', '蓝山县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2277, '431128', '新田县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2278, '431129', '江华瑶族自治县', 431100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2279, '431201', '市辖区', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2280, '431202', '鹤城区', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2281, '431221', '中方县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2282, '431222', '沅陵县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2283, '431223', '辰溪县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2284, '431224', '溆浦县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2285, '431225', '会同县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2286, '431226', '麻阳苗族自治县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2287, '431227', '新晃侗族自治县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2288, '431228', '芷江侗族自治县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2289, '431229', '靖州苗族侗族自治县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2290, '431230', '通道侗族自治县', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2291, '431281', '洪江市', 431200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2292, '431301', '市辖区', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2293, '431302', '娄星区', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2294, '431321', '双峰县', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2295, '431322', '新化县', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2296, '431381', '冷水江市', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2297, '431382', '涟源市', 431300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2298, '433101', '吉首市', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2299, '433122', '泸溪县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2300, '433123', '凤凰县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2301, '433124', '花垣县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2302, '433125', '保靖县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2303, '433126', '古丈县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2304, '433127', '永顺县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2305, '433130', '龙山县', 433100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2306, '440101', '市辖区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2307, '440102', '东山区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2308, '440103', '荔湾区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2309, '440104', '越秀区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2310, '440105', '海珠区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2311, '440106', '天河区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2312, '440107', '芳村区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2313, '440111', '白云区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2314, '440112', '黄埔区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2315, '440113', '番禺区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2316, '440114', '花都区', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2317, '440183', '增城市', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2318, '440184', '从化市', 440100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2319, '440201', '市辖区', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2320, '440203', '武江区', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2321, '440204', '浈江区', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2322, '440205', '曲江区', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2323, '440222', '始兴县', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2324, '440224', '仁化县', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2325, '440229', '翁源县', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2326, '440232', '乳源瑶族自治县', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2327, '440233', '新丰县', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2328, '440281', '乐昌市', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2329, '440282', '南雄市', 440200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2330, '440301', '市辖区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2331, '440303', '罗湖区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2332, '440304', '福田区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2333, '440305', '南山区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2334, '440306', '宝安区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2335, '440307', '龙岗区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2336, '440308', '盐田区', 440300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2337, '440401', '市辖区', 440400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2338, '440402', '香洲区', 440400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2339, '440403', '斗门区', 440400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2340, '440404', '金湾区', 440400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2341, '440501', '市辖区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2342, '440507', '龙湖区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2343, '440511', '金平区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2344, '440512', '濠江区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2345, '440513', '潮阳区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2346, '440514', '潮南区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2347, '440515', '澄海区', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2348, '440523', '南澳县', 440500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2349, '440601', '市辖区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2350, '440604', '禅城区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2351, '440605', '南海区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2352, '440606', '顺德区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2353, '440607', '三水区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2354, '440608', '高明区', 440600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2355, '440701', '市辖区', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2356, '440703', '蓬江区', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2357, '440704', '江海区', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2358, '440705', '新会区', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2359, '440781', '台山市', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2360, '440783', '开平市', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2361, '440784', '鹤山市', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2362, '440785', '恩平市', 440700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2363, '440801', '市辖区', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2364, '440802', '赤坎区', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2365, '440803', '霞山区', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2366, '440804', '坡头区', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2367, '440811', '麻章区', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2368, '440823', '遂溪县', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2369, '440825', '徐闻县', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2370, '440881', '廉江市', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2371, '440882', '雷州市', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2372, '440883', '吴川市', 440800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2373, '440901', '市辖区', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2374, '440902', '茂南区', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2375, '440903', '茂港区', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2376, '440923', '电白县', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2377, '440981', '高州市', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2378, '440982', '化州市', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2379, '440983', '信宜市', 440900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2380, '441201', '市辖区', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2381, '441202', '端州区', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2382, '441203', '鼎湖区', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2383, '441223', '广宁县', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2384, '441224', '怀集县', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2385, '441225', '封开县', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2386, '441226', '德庆县', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2387, '441283', '高要市', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2388, '441284', '四会市', 441200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2389, '441301', '市辖区', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2390, '441302', '惠城区', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2391, '441303', '惠阳区', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2392, '441322', '博罗县', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2393, '441323', '惠东县', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2394, '441324', '龙门县', 441300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2395, '441401', '市辖区', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2396, '441402', '梅江区', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2397, '441421', '梅　县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2398, '441422', '大埔县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2399, '441423', '丰顺县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2400, '441424', '五华县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2401, '441426', '平远县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2402, '441427', '蕉岭县', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2403, '441481', '兴宁市', 441400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2404, '441501', '市辖区', 441500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2405, '441502', '城　区', 441500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2406, '441521', '海丰县', 441500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2407, '441523', '陆河县', 441500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2408, '441581', '陆丰市', 441500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2409, '441601', '市辖区', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2410, '441602', '源城区', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2411, '441621', '紫金县', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2412, '441622', '龙川县', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2413, '441623', '连平县', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2414, '441624', '和平县', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2415, '441625', '东源县', 441600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2416, '441701', '市辖区', 441700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2417, '441702', '江城区', 441700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2418, '441721', '阳西县', 441700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2419, '441723', '阳东县', 441700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2420, '441781', '阳春市', 441700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2421, '441801', '市辖区', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2422, '441802', '清城区', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2423, '441821', '佛冈县', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2424, '441823', '阳山县', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2425, '441825', '连山壮族瑶族自治县', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2426, '441826', '连南瑶族自治县', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2427, '441827', '清新县', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2428, '441881', '英德市', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2429, '441882', '连州市', 441800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2430, '445101', '市辖区', 445100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2431, '445102', '湘桥区', 445100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2432, '445121', '潮安县', 445100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2433, '445122', '饶平县', 445100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2434, '445201', '市辖区', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2435, '445202', '榕城区', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2436, '445221', '揭东县', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2437, '445222', '揭西县', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2438, '445224', '惠来县', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2439, '445281', '普宁市', 445200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2440, '445301', '市辖区', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2441, '445302', '云城区', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2442, '445321', '新兴县', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2443, '445322', '郁南县', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2444, '445323', '云安县', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2445, '445381', '罗定市', 445300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2446, '450101', '市辖区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2447, '450102', '兴宁区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2448, '450103', '青秀区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2449, '450105', '江南区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2450, '450107', '西乡塘区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2451, '450108', '良庆区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2452, '450109', '邕宁区', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2453, '450122', '武鸣县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2454, '450123', '隆安县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2455, '450124', '马山县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2456, '450125', '上林县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2457, '450126', '宾阳县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2458, '450127', '横　县', 450100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2459, '450201', '市辖区', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2460, '450202', '城中区', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2461, '450203', '鱼峰区', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2462, '450204', '柳南区', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2463, '450205', '柳北区', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2464, '450221', '柳江县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2465, '450222', '柳城县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2466, '450223', '鹿寨县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2467, '450224', '融安县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2468, '450225', '融水苗族自治县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2469, '450226', '三江侗族自治县', 450200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2470, '450301', '市辖区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2471, '450302', '秀峰区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2472, '450303', '叠彩区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2473, '450304', '象山区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2474, '450305', '七星区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2475, '450311', '雁山区', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2476, '450321', '阳朔县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2477, '450322', '临桂县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2478, '450323', '灵川县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2479, '450324', '全州县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2480, '450325', '兴安县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2481, '450326', '永福县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2482, '450327', '灌阳县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2483, '450328', '龙胜各族自治县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2484, '450329', '资源县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2485, '450330', '平乐县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2486, '450331', '荔蒲县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2487, '450332', '恭城瑶族自治县', 450300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2488, '450401', '市辖区', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2489, '450403', '万秀区', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2490, '450404', '蝶山区', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2491, '450405', '长洲区', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2492, '450421', '苍梧县', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2493, '450422', '藤　县', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2494, '450423', '蒙山县', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2495, '450481', '岑溪市', 450400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2496, '450501', '市辖区', 450500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2497, '450502', '海城区', 450500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2498, '450503', '银海区', 450500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2499, '450512', '铁山港区', 450500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2500, '450521', '合浦县', 450500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2501, '450601', '市辖区', 450600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2502, '450602', '港口区', 450600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2503, '450603', '防城区', 450600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2504, '450621', '上思县', 450600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2505, '450681', '东兴市', 450600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2506, '450701', '市辖区', 450700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2507, '450702', '钦南区', 450700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2508, '450703', '钦北区', 450700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2509, '450721', '灵山县', 450700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2510, '450722', '浦北县', 450700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2511, '450801', '市辖区', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2512, '450802', '港北区', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2513, '450803', '港南区', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2514, '450804', '覃塘区', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2515, '450821', '平南县', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2516, '450881', '桂平市', 450800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2517, '450901', '市辖区', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2518, '450902', '玉州区', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2519, '450921', '容　县', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2520, '450922', '陆川县', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2521, '450923', '博白县', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2522, '450924', '兴业县', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2523, '450981', '北流市', 450900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2524, '451001', '市辖区', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2525, '451002', '右江区', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2526, '451021', '田阳县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2527, '451022', '田东县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2528, '451023', '平果县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2529, '451024', '德保县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2530, '451025', '靖西县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2531, '451026', '那坡县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2532, '451027', '凌云县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2533, '451028', '乐业县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2534, '451029', '田林县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2535, '451030', '西林县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2536, '451031', '隆林各族自治县', 451000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2537, '451101', '市辖区', 451100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2538, '451102', '八步区', 451100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2539, '451121', '昭平县', 451100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2540, '451122', '钟山县', 451100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2541, '451123', '富川瑶族自治县', 451100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2542, '451201', '市辖区', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2543, '451202', '金城江区', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2544, '451221', '南丹县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2545, '451222', '天峨县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2546, '451223', '凤山县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2547, '451224', '东兰县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2548, '451225', '罗城仫佬族自治县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2549, '451226', '环江毛南族自治县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2550, '451227', '巴马瑶族自治县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2551, '451228', '都安瑶族自治县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2552, '451229', '大化瑶族自治县', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2553, '451281', '宜州市', 451200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2554, '451301', '市辖区', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2555, '451302', '兴宾区', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2556, '451321', '忻城县', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2557, '451322', '象州县', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2558, '451323', '武宣县', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2559, '451324', '金秀瑶族自治县', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2560, '451381', '合山市', 451300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2561, '451401', '市辖区', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2562, '451402', '江洲区', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2563, '451421', '扶绥县', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2564, '451422', '宁明县', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2565, '451423', '龙州县', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2566, '451424', '大新县', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2567, '451425', '天等县', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2568, '451481', '凭祥市', 451400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2569, '460101', '市辖区', 460100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2570, '460105', '秀英区', 460100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2571, '460106', '龙华区', 460100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2572, '460107', '琼山区', 460100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2573, '460108', '美兰区', 460100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2574, '460201', '市辖区', 460200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2575, '469001', '五指山市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2576, '469002', '琼海市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2577, '469003', '儋州市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2578, '469005', '文昌市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2579, '469006', '万宁市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2580, '469007', '东方市', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2581, '469025', '定安县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2582, '469026', '屯昌县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2583, '469027', '澄迈县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2584, '469028', '临高县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2585, '469030', '白沙黎族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2586, '469031', '昌江黎族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2587, '469033', '乐东黎族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2588, '469034', '陵水黎族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2589, '469035', '保亭黎族苗族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2590, '469036', '琼中黎族苗族自治县', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2591, '469037', '西沙群岛', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2592, '469038', '南沙群岛', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2593, '469039', '中沙群岛的岛礁及其海域', 469000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2594, '500101', '万州区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2595, '500102', '涪陵区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2596, '500103', '渝中区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2597, '500104', '大渡口区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2598, '500105', '江北区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2599, '500106', '沙坪坝区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2600, '500107', '九龙坡区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2601, '500108', '南岸区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2602, '500109', '北碚区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2603, '500110', '万盛区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2604, '500111', '双桥区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2605, '500112', '渝北区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2606, '500113', '巴南区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2607, '500114', '黔江区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2608, '500115', '长寿区', 500100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2609, '500222', '綦江县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2610, '500223', '潼南县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2611, '500224', '铜梁县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2612, '500225', '大足县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2613, '500226', '荣昌县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2614, '500227', '璧山县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2615, '500228', '梁平县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2616, '500229', '城口县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2617, '500230', '丰都县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2618, '500231', '垫江县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2619, '500232', '武隆县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2620, '500233', '忠　县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2621, '500234', '开　县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2622, '500235', '云阳县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2623, '500236', '奉节县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2624, '500237', '巫山县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2625, '500238', '巫溪县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2626, '500240', '石柱土家族自治县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2627, '500241', '秀山土家族苗族自治县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2628, '500242', '酉阳土家族苗族自治县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2629, '500243', '彭水苗族土家族自治县', 500200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2630, '500381', '江津市', 500300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2631, '500382', '合川市', 500300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2632, '500383', '永川市', 500300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2633, '500384', '南川市', 500300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2634, '510101', '市辖区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2635, '510104', '锦江区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2636, '510105', '青羊区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2637, '510106', '金牛区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2638, '510107', '武侯区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2639, '510108', '成华区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2640, '510112', '龙泉驿区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2641, '510113', '青白江区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2642, '510114', '新都区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2643, '510115', '温江区', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2644, '510121', '金堂县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2645, '510122', '双流县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2646, '510124', '郫　县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2647, '510129', '大邑县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2648, '510131', '蒲江县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2649, '510132', '新津县', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2650, '510181', '都江堰市', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2651, '510182', '彭州市', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2652, '510183', '邛崃市', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2653, '510184', '崇州市', 510100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2654, '510301', '市辖区', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2655, '510302', '自流井区', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2656, '510303', '贡井区', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2657, '510304', '大安区', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2658, '510311', '沿滩区', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2659, '510321', '荣　县', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2660, '510322', '富顺县', 510300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2661, '510401', '市辖区', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2662, '510402', '东　区', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2663, '510403', '西　区', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2664, '510411', '仁和区', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2665, '510421', '米易县', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2666, '510422', '盐边县', 510400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2667, '510501', '市辖区', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2668, '510502', '江阳区', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2669, '510503', '纳溪区', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2670, '510504', '龙马潭区', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2671, '510521', '泸　县', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2672, '510522', '合江县', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2673, '510524', '叙永县', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2674, '510525', '古蔺县', 510500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2675, '510601', '市辖区', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2676, '510603', '旌阳区', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2677, '510623', '中江县', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2678, '510626', '罗江县', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2679, '510681', '广汉市', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2680, '510682', '什邡市', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2681, '510683', '绵竹市', 510600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2682, '510701', '市辖区', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2683, '510703', '涪城区', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2684, '510704', '游仙区', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2685, '510722', '三台县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2686, '510723', '盐亭县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2687, '510724', '安　县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2688, '510725', '梓潼县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2689, '510726', '北川羌族自治县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2690, '510727', '平武县', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2691, '510781', '江油市', 510700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2692, '510801', '市辖区', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2693, '510802', '市中区', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2694, '510811', '元坝区', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2695, '510812', '朝天区', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2696, '510821', '旺苍县', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2697, '510822', '青川县', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2698, '510823', '剑阁县', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2699, '510824', '苍溪县', 510800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2700, '510901', '市辖区', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2701, '510903', '船山区', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2702, '510904', '安居区', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2703, '510921', '蓬溪县', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2704, '510922', '射洪县', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2705, '510923', '大英县', 510900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2706, '511001', '市辖区', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2707, '511002', '市中区', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2708, '511011', '东兴区', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2709, '511024', '威远县', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2710, '511025', '资中县', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2711, '511028', '隆昌县', 511000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2712, '511101', '市辖区', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2713, '511102', '市中区', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2714, '511111', '沙湾区', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2715, '511112', '五通桥区', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2716, '511113', '金口河区', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2717, '511123', '犍为县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2718, '511124', '井研县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2719, '511126', '夹江县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2720, '511129', '沐川县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2721, '511132', '峨边彝族自治县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2722, '511133', '马边彝族自治县', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2723, '511181', '峨眉山市', 511100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2724, '511301', '市辖区', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2725, '511302', '顺庆区', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2726, '511303', '高坪区', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2727, '511304', '嘉陵区', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2728, '511321', '南部县', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2729, '511322', '营山县', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2730, '511323', '蓬安县', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2731, '511324', '仪陇县', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2732, '511325', '西充县', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2733, '511381', '阆中市', 511300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2734, '511401', '市辖区', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2735, '511402', '东坡区', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2736, '511421', '仁寿县', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2737, '511422', '彭山县', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2738, '511423', '洪雅县', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2739, '511424', '丹棱县', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2740, '511425', '青神县', 511400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2741, '511501', '市辖区', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2742, '511502', '翠屏区', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2743, '511521', '宜宾县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2744, '511522', '南溪县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2745, '511523', '江安县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2746, '511524', '长宁县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2747, '511525', '高　县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2748, '511526', '珙　县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2749, '511527', '筠连县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2750, '511528', '兴文县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2751, '511529', '屏山县', 511500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2752, '511601', '市辖区', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2753, '511602', '广安区', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2754, '511621', '岳池县', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2755, '511622', '武胜县', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2756, '511623', '邻水县', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2757, '511681', '华莹市', 511600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2758, '511701', '市辖区', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2759, '511702', '通川区', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2760, '511721', '达　县', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2761, '511722', '宣汉县', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2762, '511723', '开江县', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2763, '511724', '大竹县', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2764, '511725', '渠　县', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2765, '511781', '万源市', 511700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2766, '511801', '市辖区', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2767, '511802', '雨城区', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2768, '511821', '名山县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2769, '511822', '荥经县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2770, '511823', '汉源县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2771, '511824', '石棉县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2772, '511825', '天全县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2773, '511826', '芦山县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2774, '511827', '宝兴县', 511800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2775, '511901', '市辖区', 511900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2776, '511902', '巴州区', 511900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2777, '511921', '通江县', 511900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2778, '511922', '南江县', 511900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2779, '511923', '平昌县', 511900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2780, '512001', '市辖区', 512000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2781, '512002', '雁江区', 512000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2782, '512021', '安岳县', 512000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2783, '512022', '乐至县', 512000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2784, '512081', '简阳市', 512000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2785, '513221', '汶川县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2786, '513222', '理　县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2787, '513223', '茂　县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2788, '513224', '松潘县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2789, '513225', '九寨沟县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2790, '513226', '金川县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2791, '513227', '小金县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2792, '513228', '黑水县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2793, '513229', '马尔康县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2794, '513230', '壤塘县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2795, '513231', '阿坝县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2796, '513232', '若尔盖县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2797, '513233', '红原县', 513200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2798, '513321', '康定县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2799, '513322', '泸定县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2800, '513323', '丹巴县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2801, '513324', '九龙县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2802, '513325', '雅江县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2803, '513326', '道孚县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2804, '513327', '炉霍县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2805, '513328', '甘孜县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2806, '513329', '新龙县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2807, '513330', '德格县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2808, '513331', '白玉县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2809, '513332', '石渠县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2810, '513333', '色达县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2811, '513334', '理塘县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2812, '513335', '巴塘县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2813, '513336', '乡城县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2814, '513337', '稻城县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2815, '513338', '得荣县', 513300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2816, '513401', '西昌市', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2817, '513422', '木里藏族自治县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2818, '513423', '盐源县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2819, '513424', '德昌县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2820, '513425', '会理县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2821, '513426', '会东县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2822, '513427', '宁南县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2823, '513428', '普格县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2824, '513429', '布拖县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2825, '513430', '金阳县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2826, '513431', '昭觉县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2827, '513432', '喜德县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2828, '513433', '冕宁县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2829, '513434', '越西县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2830, '513435', '甘洛县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2831, '513436', '美姑县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2832, '513437', '雷波县', 513400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2833, '520101', '市辖区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2834, '520102', '南明区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2835, '520103', '云岩区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2836, '520111', '花溪区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2837, '520112', '乌当区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2838, '520113', '白云区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2839, '520114', '小河区', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2840, '520121', '开阳县', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2841, '520122', '息烽县', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2842, '520123', '修文县', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2843, '520181', '清镇市', 520100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2844, '520201', '钟山区', 520200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2845, '520203', '六枝特区', 520200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2846, '520221', '水城县', 520200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2847, '520222', '盘　县', 520200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2848, '520301', '市辖区', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2849, '520302', '红花岗区', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2850, '520303', '汇川区', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2851, '520321', '遵义县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2852, '520322', '桐梓县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2853, '520323', '绥阳县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2854, '520324', '正安县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2855, '520325', '道真仡佬族苗族自治县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2856, '520326', '务川仡佬族苗族自治县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2857, '520327', '凤冈县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2858, '520328', '湄潭县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2859, '520329', '余庆县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2860, '520330', '习水县', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2861, '520381', '赤水市', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2862, '520382', '仁怀市', 520300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2863, '520401', '市辖区', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2864, '520402', '西秀区', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2865, '520421', '平坝县', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2866, '520422', '普定县', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2867, '520423', '镇宁布依族苗族自治县', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2868, '520424', '关岭布依族苗族自治县', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2869, '520425', '紫云苗族布依族自治县', 520400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2870, '522201', '铜仁市', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2871, '522222', '江口县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2872, '522223', '玉屏侗族自治县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2873, '522224', '石阡县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2874, '522225', '思南县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2875, '522226', '印江土家族苗族自治县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2876, '522227', '德江县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2877, '522228', '沿河土家族自治县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2878, '522229', '松桃苗族自治县', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2879, '522230', '万山特区', 522200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2880, '522301', '兴义市', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2881, '522322', '兴仁县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2882, '522323', '普安县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2883, '522324', '晴隆县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2884, '522325', '贞丰县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2885, '522326', '望谟县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2886, '522327', '册亨县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2887, '522328', '安龙县', 522300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2888, '522401', '毕节市', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2889, '522422', '大方县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2890, '522423', '黔西县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2891, '522424', '金沙县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2892, '522425', '织金县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2893, '522426', '纳雍县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2894, '522427', '威宁彝族回族苗族自治县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2895, '522428', '赫章县', 522400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2896, '522601', '凯里市', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2897, '522622', '黄平县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2898, '522623', '施秉县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2899, '522624', '三穗县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2900, '522625', '镇远县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2901, '522626', '岑巩县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2902, '522627', '天柱县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2903, '522628', '锦屏县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2904, '522629', '剑河县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2905, '522630', '台江县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2906, '522631', '黎平县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2907, '522632', '榕江县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2908, '522633', '从江县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2909, '522634', '雷山县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2910, '522635', '麻江县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2911, '522636', '丹寨县', 522600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2912, '522701', '都匀市', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2913, '522702', '福泉市', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2914, '522722', '荔波县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2915, '522723', '贵定县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2916, '522725', '瓮安县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2917, '522726', '独山县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2918, '522727', '平塘县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2919, '522728', '罗甸县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2920, '522729', '长顺县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2921, '522730', '龙里县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2922, '522731', '惠水县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2923, '522732', '三都水族自治县', 522700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2924, '530101', '市辖区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2925, '530102', '五华区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2926, '530103', '盘龙区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2927, '530111', '官渡区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2928, '530112', '西山区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2929, '530113', '东川区', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2930, '530121', '呈贡县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2931, '530122', '晋宁县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2932, '530124', '富民县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2933, '530125', '宜良县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2934, '530126', '石林彝族自治县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2935, '530127', '嵩明县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2936, '530128', '禄劝彝族苗族自治县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2937, '530129', '寻甸回族彝族自治县', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2938, '530181', '安宁市', 530100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2939, '530301', '市辖区', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2940, '530302', '麒麟区', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2941, '530321', '马龙县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2942, '530322', '陆良县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2943, '530323', '师宗县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2944, '530324', '罗平县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2945, '530325', '富源县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2946, '530326', '会泽县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2947, '530328', '沾益县', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2948, '530381', '宣威市', 530300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2949, '530401', '市辖区', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2950, '530402', '红塔区', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2951, '530421', '江川县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2952, '530422', '澄江县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2953, '530423', '通海县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2954, '530424', '华宁县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2955, '530425', '易门县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2956, '530426', '峨山彝族自治县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2957, '530427', '新平彝族傣族自治县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2958, '530428', '元江哈尼族彝族傣族自治县', 530400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2959, '530501', '市辖区', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2960, '530502', '隆阳区', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2961, '530521', '施甸县', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2962, '530522', '腾冲县', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2963, '530523', '龙陵县', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2964, '530524', '昌宁县', 530500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2965, '530601', '市辖区', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2966, '530602', '昭阳区', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2967, '530621', '鲁甸县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2968, '530622', '巧家县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2969, '530623', '盐津县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2970, '530624', '大关县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2971, '530625', '永善县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2972, '530626', '绥江县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2973, '530627', '镇雄县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2974, '530628', '彝良县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2975, '530629', '威信县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2976, '530630', '水富县', 530600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2977, '530701', '市辖区', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2978, '530702', '古城区', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2979, '530721', '玉龙纳西族自治县', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2980, '530722', '永胜县', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2981, '530723', '华坪县', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2982, '530724', '宁蒗彝族自治县', 530700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2983, '530801', '市辖区', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2984, '530802', '翠云区', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2985, '530821', '普洱哈尼族彝族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2986, '530822', '墨江哈尼族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2987, '530823', '景东彝族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2988, '530824', '景谷傣族彝族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2989, '530825', '镇沅彝族哈尼族拉祜族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2990, '530826', '江城哈尼族彝族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2991, '530827', '孟连傣族拉祜族佤族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2992, '530828', '澜沧拉祜族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2993, '530829', '西盟佤族自治县', 530800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2994, '530901', '市辖区', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2995, '530902', '临翔区', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2996, '530921', '凤庆县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2997, '530922', '云　县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2998, '530923', '永德县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (2999, '530924', '镇康县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3000, '530925', '双江拉祜族佤族布朗族傣族自治县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3001, '530926', '耿马傣族佤族自治县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3002, '530927', '沧源佤族自治县', 530900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3003, '532301', '楚雄市', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3004, '532322', '双柏县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3005, '532323', '牟定县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3006, '532324', '南华县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3007, '532325', '姚安县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3008, '532326', '大姚县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3009, '532327', '永仁县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3010, '532328', '元谋县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3011, '532329', '武定县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3012, '532331', '禄丰县', 532300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3013, '532501', '个旧市', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3014, '532502', '开远市', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3015, '532522', '蒙自县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3016, '532523', '屏边苗族自治县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3017, '532524', '建水县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3018, '532525', '石屏县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3019, '532526', '弥勒县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3020, '532527', '泸西县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3021, '532528', '元阳县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3022, '532529', '红河县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3023, '532530', '金平苗族瑶族傣族自治县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3024, '532531', '绿春县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3025, '532532', '河口瑶族自治县', 532500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3026, '532621', '文山县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3027, '532622', '砚山县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3028, '532623', '西畴县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3029, '532624', '麻栗坡县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3030, '532625', '马关县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3031, '532626', '丘北县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3032, '532627', '广南县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3033, '532628', '富宁县', 532600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3034, '532801', '景洪市', 532800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3035, '532822', '勐海县', 532800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3036, '532823', '勐腊县', 532800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3037, '532901', '大理市', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3038, '532922', '漾濞彝族自治县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3039, '532923', '祥云县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3040, '532924', '宾川县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3041, '532925', '弥渡县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3042, '532926', '南涧彝族自治县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3043, '532927', '巍山彝族回族自治县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3044, '532928', '永平县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3045, '532929', '云龙县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3046, '532930', '洱源县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3047, '532931', '剑川县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3048, '532932', '鹤庆县', 532900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3049, '533102', '瑞丽市', 533100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3050, '533103', '潞西市', 533100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3051, '533122', '梁河县', 533100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3052, '533123', '盈江县', 533100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3053, '533124', '陇川县', 533100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3054, '533321', '泸水县', 533300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3055, '533323', '福贡县', 533300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3056, '533324', '贡山独龙族怒族自治县', 533300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3057, '533325', '兰坪白族普米族自治县', 533300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3058, '533421', '香格里拉县', 533400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3059, '533422', '德钦县', 533400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3060, '533423', '维西傈僳族自治县', 533400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3061, '540101', '市辖区', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3062, '540102', '城关区', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3063, '540121', '林周县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3064, '540122', '当雄县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3065, '540123', '尼木县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3066, '540124', '曲水县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3067, '540125', '堆龙德庆县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3068, '540126', '达孜县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3069, '540127', '墨竹工卡县', 540100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3070, '542121', '昌都县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3071, '542122', '江达县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3072, '542123', '贡觉县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3073, '542124', '类乌齐县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3074, '542125', '丁青县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3075, '542126', '察雅县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3076, '542127', '八宿县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3077, '542128', '左贡县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3078, '542129', '芒康县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3079, '542132', '洛隆县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3080, '542133', '边坝县', 542100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3081, '542221', '乃东县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3082, '542222', '扎囊县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3083, '542223', '贡嘎县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3084, '542224', '桑日县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3085, '542225', '琼结县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3086, '542226', '曲松县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3087, '542227', '措美县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3088, '542228', '洛扎县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3089, '542229', '加查县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3090, '542231', '隆子县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3091, '542232', '错那县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3092, '542233', '浪卡子县', 542200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3093, '542301', '日喀则市', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3094, '542322', '南木林县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3095, '542323', '江孜县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3096, '542324', '定日县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3097, '542325', '萨迦县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3098, '542326', '拉孜县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3099, '542327', '昂仁县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3100, '542328', '谢通门县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3101, '542329', '白朗县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3102, '542330', '仁布县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3103, '542331', '康马县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3104, '542332', '定结县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3105, '542333', '仲巴县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3106, '542334', '亚东县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3107, '542335', '吉隆县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3108, '542336', '聂拉木县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3109, '542337', '萨嘎县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3110, '542338', '岗巴县', 542300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3111, '542421', '那曲县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3112, '542422', '嘉黎县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3113, '542423', '比如县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3114, '542424', '聂荣县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3115, '542425', '安多县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3116, '542426', '申扎县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3117, '542427', '索　县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3118, '542428', '班戈县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3119, '542429', '巴青县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3120, '542430', '尼玛县', 542400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3121, '542521', '普兰县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3122, '542522', '札达县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3123, '542523', '噶尔县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3124, '542524', '日土县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3125, '542525', '革吉县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3126, '542526', '改则县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3127, '542527', '措勤县', 542500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3128, '542621', '林芝县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3129, '542622', '工布江达县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3130, '542623', '米林县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3131, '542624', '墨脱县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3132, '542625', '波密县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3133, '542626', '察隅县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3134, '542627', '朗　县', 542600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3135, '610101', '市辖区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3136, '610102', '新城区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3137, '610103', '碑林区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3138, '610104', '莲湖区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3139, '610111', '灞桥区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3140, '610112', '未央区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3141, '610113', '雁塔区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3142, '610114', '阎良区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3143, '610115', '临潼区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3144, '610116', '长安区', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3145, '610122', '蓝田县', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3146, '610124', '周至县', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3147, '610125', '户　县', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3148, '610126', '高陵县', 610100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3149, '610201', '市辖区', 610200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3150, '610202', '王益区', 610200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3151, '610203', '印台区', 610200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3152, '610204', '耀州区', 610200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3153, '610222', '宜君县', 610200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3154, '610301', '市辖区', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3155, '610302', '渭滨区', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3156, '610303', '金台区', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3157, '610304', '陈仓区', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3158, '610322', '凤翔县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3159, '610323', '岐山县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3160, '610324', '扶风县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3161, '610326', '眉　县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3162, '610327', '陇　县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3163, '610328', '千阳县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3164, '610329', '麟游县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3165, '610330', '凤　县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3166, '610331', '太白县', 610300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3167, '610401', '市辖区', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3168, '610402', '秦都区', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3169, '610403', '杨凌区', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3170, '610404', '渭城区', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3171, '610422', '三原县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3172, '610423', '泾阳县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3173, '610424', '乾　县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3174, '610425', '礼泉县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3175, '610426', '永寿县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3176, '610427', '彬　县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3177, '610428', '长武县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3178, '610429', '旬邑县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3179, '610430', '淳化县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3180, '610431', '武功县', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3181, '610481', '兴平市', 610400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3182, '610501', '市辖区', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3183, '610502', '临渭区', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3184, '610521', '华　县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3185, '610522', '潼关县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3186, '610523', '大荔县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3187, '610524', '合阳县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3188, '610525', '澄城县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3189, '610526', '蒲城县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3190, '610527', '白水县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3191, '610528', '富平县', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3192, '610581', '韩城市', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3193, '610582', '华阴市', 610500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3194, '610601', '市辖区', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3195, '610602', '宝塔区', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3196, '610621', '延长县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3197, '610622', '延川县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3198, '610623', '子长县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3199, '610624', '安塞县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3200, '610625', '志丹县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3201, '610626', '吴旗县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3202, '610627', '甘泉县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3203, '610628', '富　县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3204, '610629', '洛川县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3205, '610630', '宜川县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3206, '610631', '黄龙县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3207, '610632', '黄陵县', 610600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3208, '610701', '市辖区', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3209, '610702', '汉台区', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3210, '610721', '南郑县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3211, '610722', '城固县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3212, '610723', '洋　县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3213, '610724', '西乡县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3214, '610725', '勉　县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3215, '610726', '宁强县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3216, '610727', '略阳县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3217, '610728', '镇巴县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3218, '610729', '留坝县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3219, '610730', '佛坪县', 610700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3220, '610801', '市辖区', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3221, '610802', '榆阳区', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3222, '610821', '神木县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3223, '610822', '府谷县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3224, '610823', '横山县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3225, '610824', '靖边县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3226, '610825', '定边县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3227, '610826', '绥德县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3228, '610827', '米脂县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3229, '610828', '佳　县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3230, '610829', '吴堡县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3231, '610830', '清涧县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3232, '610831', '子洲县', 610800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3233, '610901', '市辖区', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3234, '610902', '汉滨区', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3235, '610921', '汉阴县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3236, '610922', '石泉县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3237, '610923', '宁陕县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3238, '610924', '紫阳县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3239, '610925', '岚皋县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3240, '610926', '平利县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3241, '610927', '镇坪县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3242, '610928', '旬阳县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3243, '610929', '白河县', 610900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3244, '611001', '市辖区', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3245, '611002', '商州区', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3246, '611021', '洛南县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3247, '611022', '丹凤县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3248, '611023', '商南县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3249, '611024', '山阳县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3250, '611025', '镇安县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3251, '611026', '柞水县', 611000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3252, '620101', '市辖区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3253, '620102', '城关区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3254, '620103', '七里河区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3255, '620104', '西固区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3256, '620105', '安宁区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3257, '620111', '红古区', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3258, '620121', '永登县', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3259, '620122', '皋兰县', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3260, '620123', '榆中县', 620100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3261, '620201', '市辖区', 620200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3262, '620301', '市辖区', 620300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3263, '620302', '金川区', 620300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3264, '620321', '永昌县', 620300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3265, '620401', '市辖区', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3266, '620402', '白银区', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3267, '620403', '平川区', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3268, '620421', '靖远县', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3269, '620422', '会宁县', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3270, '620423', '景泰县', 620400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3271, '620501', '市辖区', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3272, '620502', '秦城区', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3273, '620503', '北道区', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3274, '620521', '清水县', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3275, '620522', '秦安县', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3276, '620523', '甘谷县', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3277, '620524', '武山县', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3278, '620525', '张家川回族自治县', 620500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3279, '620601', '市辖区', 620600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3280, '620602', '凉州区', 620600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3281, '620621', '民勤县', 620600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3282, '620622', '古浪县', 620600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3283, '620623', '天祝藏族自治县', 620600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3284, '620701', '市辖区', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3285, '620702', '甘州区', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3286, '620721', '肃南裕固族自治县', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3287, '620722', '民乐县', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3288, '620723', '临泽县', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3289, '620724', '高台县', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3290, '620725', '山丹县', 620700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3291, '620801', '市辖区', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3292, '620802', '崆峒区', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3293, '620821', '泾川县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3294, '620822', '灵台县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3295, '620823', '崇信县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3296, '620824', '华亭县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3297, '620825', '庄浪县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3298, '620826', '静宁县', 620800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3299, '620901', '市辖区', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3300, '620902', '肃州区', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3301, '620921', '金塔县', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3302, '620922', '安西县', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3303, '620923', '肃北蒙古族自治县', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3304, '620924', '阿克塞哈萨克族自治县', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3305, '620981', '玉门市', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3306, '620982', '敦煌市', 620900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3307, '621001', '市辖区', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3308, '621002', '西峰区', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3309, '621021', '庆城县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3310, '621022', '环　县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3311, '621023', '华池县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3312, '621024', '合水县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3313, '621025', '正宁县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3314, '621026', '宁　县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3315, '621027', '镇原县', 621000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3316, '621101', '市辖区', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3317, '621102', '安定区', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3318, '621121', '通渭县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3319, '621122', '陇西县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3320, '621123', '渭源县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3321, '621124', '临洮县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3322, '621125', '漳　县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3323, '621126', '岷　县', 621100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3324, '621201', '市辖区', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3325, '621202', '武都区', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3326, '621221', '成　县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3327, '621222', '文　县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3328, '621223', '宕昌县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3329, '621224', '康　县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3330, '621225', '西和县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3331, '621226', '礼　县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3332, '621227', '徽　县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3333, '621228', '两当县', 621200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3334, '622901', '临夏市', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3335, '622921', '临夏县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3336, '622922', '康乐县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3337, '622923', '永靖县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3338, '622924', '广河县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3339, '622925', '和政县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3340, '622926', '东乡族自治县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3341, '622927', '积石山保安族东乡族撒拉族自治县', 622900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3342, '623001', '合作市', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3343, '623021', '临潭县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3344, '623022', '卓尼县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3345, '623023', '舟曲县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3346, '623024', '迭部县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3347, '623025', '玛曲县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3348, '623026', '碌曲县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3349, '623027', '夏河县', 623000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3350, '630101', '市辖区', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3351, '630102', '城东区', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3352, '630103', '城中区', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3353, '630104', '城西区', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3354, '630105', '城北区', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3355, '630121', '大通回族土族自治县', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3356, '630122', '湟中县', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3357, '630123', '湟源县', 630100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3358, '632121', '平安县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3359, '632122', '民和回族土族自治县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3360, '632123', '乐都县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3361, '632126', '互助土族自治县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3362, '632127', '化隆回族自治县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3363, '632128', '循化撒拉族自治县', 632100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3364, '632221', '门源回族自治县', 632200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3365, '632222', '祁连县', 632200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3366, '632223', '海晏县', 632200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3367, '632224', '刚察县', 632200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3368, '632321', '同仁县', 632300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3369, '632322', '尖扎县', 632300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3370, '632323', '泽库县', 632300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3371, '632324', '河南蒙古族自治县', 632300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3372, '632521', '共和县', 632500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3373, '632522', '同德县', 632500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3374, '632523', '贵德县', 632500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3375, '632524', '兴海县', 632500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3376, '632525', '贵南县', 632500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3377, '632621', '玛沁县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3378, '632622', '班玛县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3379, '632623', '甘德县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3380, '632624', '达日县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3381, '632625', '久治县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3382, '632626', '玛多县', 632600, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3383, '632721', '玉树县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3384, '632722', '杂多县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3385, '632723', '称多县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3386, '632724', '治多县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3387, '632725', '囊谦县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3388, '632726', '曲麻莱县', 632700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3389, '632801', '格尔木市', 632800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3390, '632802', '德令哈市', 632800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3391, '632821', '乌兰县', 632800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3392, '632822', '都兰县', 632800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3393, '632823', '天峻县', 632800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3394, '640101', '市辖区', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3395, '640104', '兴庆区', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3396, '640105', '西夏区', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3397, '640106', '金凤区', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3398, '640121', '永宁县', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3399, '640122', '贺兰县', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3400, '640181', '灵武市', 640100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3401, '640201', '市辖区', 640200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3402, '640202', '大武口区', 640200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3403, '640205', '惠农区', 640200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3404, '640221', '平罗县', 640200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3405, '640301', '市辖区', 640300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3406, '640302', '利通区', 640300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3407, '640323', '盐池县', 640300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3408, '640324', '同心县', 640300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3409, '640381', '青铜峡市', 640300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3410, '640401', '市辖区', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3411, '640402', '原州区', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3412, '640422', '西吉县', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3413, '640423', '隆德县', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3414, '640424', '泾源县', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3415, '640425', '彭阳县', 640400, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3416, '640501', '市辖区', 640500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3417, '640502', '沙坡头区', 640500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3418, '640521', '中宁县', 640500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3419, '640522', '海原县', 640500, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3420, '650101', '市辖区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3421, '650102', '天山区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3422, '650103', '沙依巴克区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3423, '650104', '新市区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3424, '650105', '水磨沟区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3425, '650106', '头屯河区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3426, '650107', '达坂城区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3427, '650108', '东山区', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3428, '650121', '乌鲁木齐县', 650100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3429, '650201', '市辖区', 650200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3430, '650202', '独山子区', 650200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3431, '650203', '克拉玛依区', 650200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3432, '650204', '白碱滩区', 650200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3433, '650205', '乌尔禾区', 650200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3434, '652101', '吐鲁番市', 652100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3435, '652122', '鄯善县', 652100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3436, '652123', '托克逊县', 652100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3437, '652201', '哈密市', 652200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3438, '652222', '巴里坤哈萨克自治县', 652200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3439, '652223', '伊吾县', 652200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3440, '652301', '昌吉市', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3441, '652302', '阜康市', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3442, '652303', '米泉市', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3443, '652323', '呼图壁县', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3444, '652324', '玛纳斯县', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3445, '652325', '奇台县', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3446, '652327', '吉木萨尔县', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3447, '652328', '木垒哈萨克自治县', 652300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3448, '652701', '博乐市', 652700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3449, '652722', '精河县', 652700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3450, '652723', '温泉县', 652700, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3451, '652801', '库尔勒市', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3452, '652822', '轮台县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3453, '652823', '尉犁县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3454, '652824', '若羌县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3455, '652825', '且末县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3456, '652826', '焉耆回族自治县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3457, '652827', '和静县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3458, '652828', '和硕县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3459, '652829', '博湖县', 652800, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3460, '652901', '阿克苏市', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3461, '652922', '温宿县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3462, '652923', '库车县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3463, '652924', '沙雅县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3464, '652925', '新和县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3465, '652926', '拜城县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3466, '652927', '乌什县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3467, '652928', '阿瓦提县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3468, '652929', '柯坪县', 652900, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3469, '653001', '阿图什市', 653000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3470, '653022', '阿克陶县', 653000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3471, '653023', '阿合奇县', 653000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3472, '653024', '乌恰县', 653000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3473, '653101', '喀什市', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3474, '653121', '疏附县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3475, '653122', '疏勒县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3476, '653123', '英吉沙县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3477, '653124', '泽普县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3478, '653125', '莎车县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3479, '653126', '叶城县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3480, '653127', '麦盖提县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3481, '653128', '岳普湖县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3482, '653129', '伽师县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3483, '653130', '巴楚县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3484, '653131', '塔什库尔干塔吉克自治县', 653100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3485, '653201', '和田市', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3486, '653221', '和田县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3487, '653222', '墨玉县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3488, '653223', '皮山县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3489, '653224', '洛浦县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3490, '653225', '策勒县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3491, '653226', '于田县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3492, '653227', '民丰县', 653200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3493, '654002', '伊宁市', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3494, '654003', '奎屯市', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3495, '654021', '伊宁县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3496, '654022', '察布查尔锡伯自治县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3497, '654023', '霍城县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3498, '654024', '巩留县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3499, '654025', '新源县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3500, '654026', '昭苏县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3501, '654027', '特克斯县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3502, '654028', '尼勒克县', 654000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3503, '654201', '塔城市', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3504, '654202', '乌苏市', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3505, '654221', '额敏县', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3506, '654223', '沙湾县', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3507, '654224', '托里县', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3508, '654225', '裕民县', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3509, '654226', '和布克赛尔蒙古自治县', 654200, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3510, '654301', '阿勒泰市', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3511, '654321', '布尔津县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3512, '654322', '富蕴县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3513, '654323', '福海县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3514, '654324', '哈巴河县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3515, '654325', '青河县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3516, '654326', '吉木乃县', 654300, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3517, '659001', '石河子市', 659000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3518, '659002', '阿拉尔市', 659000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3519, '659003', '图木舒克市', 659000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3520, '659004', '五家渠市', 659000, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3521, '120100', '市辖区', 120000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3522, '120200', '县', 120000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3523, '820100', '澳门', 820000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3524, '820101', '澳门', 820100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3525, '810100', '香港', 810000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3526, '810101', '香港', 810100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3527, '710100', '台湾省', 710000, 1, 1, 0.00, 0.00, 0.00, 0.00, 1);
INSERT INTO `map` VALUES (3528, '110101', '台湾省', 710100, 2, 1, 0.00, 0.00, 0.00, 0.00, 1);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2020_07_20_011607_create_shop', 1);
INSERT INTO `migrations` VALUES (5, '2020_09_04_133547_create_customer', 2);
INSERT INTO `migrations` VALUES (6, '2020_09_05_022637_create_address', 3);
INSERT INTO `migrations` VALUES (7, '2020_09_06_134113_create_pro_label', 4);
INSERT INTO `migrations` VALUES (8, '2020_09_06_140834_create_pro_brand', 5);
INSERT INTO `migrations` VALUES (9, '2020_09_07_014457_create_pro_class', 6);
INSERT INTO `migrations` VALUES (10, '2020_09_07_025306_create_pro_info', 7);
INSERT INTO `migrations` VALUES (11, '2020_09_07_092909_create_pro_specs_class', 8);
INSERT INTO `migrations` VALUES (12, '2020_09_07_104228_create_pro_specs_detail', 9);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pro_brand
-- ----------------------------
DROP TABLE IF EXISTS `pro_brand`;
CREATE TABLE `pro_brand`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `label_id` int(11) NOT NULL COMMENT '标签Id',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `brand_image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'logo',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  `order_by` int(11) NULL DEFAULT 10 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_brand_label_id_index`(`label_id`, `order_by`) USING BTREE,
  INDEX `order_by_idx`(`order_by`, `label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_brand
-- ----------------------------
INSERT INTO `pro_brand` VALUES (1, '2020-09-06 14:45:27', '2020-09-12 13:01:25', 1, 'nike', '测试测试测试', 'images/2ff58ce7b1fb12635514126c7330038d.jpg', 1, 10);
INSERT INTO `pro_brand` VALUES (2, '2020-09-07 01:41:49', '2020-09-07 01:41:49', 2, '香奈儿', '测试测试测试', 'images/8172efaed851ce401b0d68385b4caee1.png', 1, 10);
INSERT INTO `pro_brand` VALUES (3, '2020-09-07 01:42:25', '2020-09-07 02:14:53', 3, '二狗', '测试', 'images/7ee858d41fbc851722cf3dafb2a0e19e.jpg', 1, 11);

-- ----------------------------
-- Table structure for pro_brand_collection
-- ----------------------------
DROP TABLE IF EXISTS `pro_brand_collection`;
CREATE TABLE `pro_brand_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id_brand_id_idx`(`customer_id`, `brand_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_brand_collection
-- ----------------------------
INSERT INTO `pro_brand_collection` VALUES (1, 51, 1, '2020-09-15 17:36:38', '2020-09-15 17:36:38');
INSERT INTO `pro_brand_collection` VALUES (2, 51, 3, '2020-09-15 17:36:44', '2020-09-15 17:36:44');

-- ----------------------------
-- Table structure for pro_class
-- ----------------------------
DROP TABLE IF EXISTS `pro_class`;
CREATE TABLE `pro_class`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `label_id` int(11) NOT NULL COMMENT '标签id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  `order_by` int(11) NOT NULL DEFAULT 10 COMMENT '排序值',
  `parent_id` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_class_label_id_index`(`label_id`) USING BTREE,
  INDEX `order_by_brand_id_idx`(`order_by`, `brand_id`) USING BTREE,
  INDEX `pro_class_brand_id_index`(`brand_id`, `order_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_class
-- ----------------------------
INSERT INTO `pro_class` VALUES (1, '2020-09-07 02:10:35', '2020-09-12 13:01:26', 1, 1, '鞋子', 1, 10, 0);
INSERT INTO `pro_class` VALUES (2, '2020-09-07 02:10:45', '2020-09-12 13:01:26', 1, 1, '衣服', 1, 10, 0);
INSERT INTO `pro_class` VALUES (3, '2020-09-15 21:59:47', '2020-09-15 21:59:47', 1, 1, '篮球鞋', 1, 10, 1);
INSERT INTO `pro_class` VALUES (4, '2020-09-15 22:00:03', '2020-09-15 22:00:03', 1, 1, '运动衫', 1, 10, 2);
INSERT INTO `pro_class` VALUES (5, '2020-09-15 22:00:52', '2020-09-15 22:00:52', 1, 1, '防滑', 1, 10, 3);
INSERT INTO `pro_class` VALUES (6, '2020-09-15 22:01:10', '2020-09-15 22:01:10', 1, 1, '减震', 1, 10, 3);
INSERT INTO `pro_class` VALUES (7, '2020-09-15 22:37:55', '2020-09-15 22:37:55', 1, 1, '其他', 1, 10, 0);

-- ----------------------------
-- Table structure for pro_info
-- ----------------------------
DROP TABLE IF EXISTS `pro_info`;
CREATE TABLE `pro_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `label_id` int(11) NOT NULL COMMENT '标签id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `class_id` int(11) NOT NULL COMMENT '分类id',
  `second_class_id` int(11) NULL DEFAULT 0 COMMENT '二级分类',
  `third_class_id` int(11) NULL DEFAULT 0 COMMENT '三级分类',
  `pro_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `original_price` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '原价 单位为分',
  `present_price` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '现价 单位为分',
  `cover_image_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图',
  `detail_image_url` json NULL COMMENT '详情图',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `detail_params` json NOT NULL COMMENT '参数详情',
  `sku_params` json NULL COMMENT 'sku详情',
  `total_count` int(11) NOT NULL DEFAULT 0 COMMENT '库存总计',
  `sale_count` int(11) NOT NULL DEFAULT 0 COMMENT '销量总计',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  `order_by` int(11) NOT NULL DEFAULT 10 COMMENT '排序值',
  `is_recommend` tinyint(1) NULL DEFAULT NULL COMMENT '相关推荐 0否 1是',
  `freight_template_id` int(11) NULL DEFAULT 0 COMMENT '运费模板id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_info_order_by_index`(`order_by`) USING BTREE,
  INDEX `pro_info_label_id_index`(`label_id`) USING BTREE,
  INDEX `pro_info_brand_id_order_by_index`(`brand_id`, `order_by`) USING BTREE,
  INDEX `pro_info_class_id_order_by_index`(`class_id`, `order_by`) USING BTREE,
  INDEX `is_recommend`(`is_recommend`, `order_by`) USING BTREE,
  INDEX `second_class_id`(`second_class_id`, `order_by`) USING BTREE,
  INDEX `thrid_class_id`(`third_class_id`, `order_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_info
-- ----------------------------
INSERT INTO `pro_info` VALUES (1, '2020-09-07 08:38:43', '2020-09-17 15:29:23', 1, 1, 1, 3, 6, '乔丹1', 1112.33, 1111.44, 'images/a0e1dae065e894e8cfedaab0285d4dea.jpg', '[\"images/f465e3b004c1b0571b3b781bff968679.jpg\", \"images/7723f01d385d7f5555bca218a23c4302.jpg\", \"images/528f448634e0c2ea4b2476b845d45166.jpg\"]', '<p>草草草草</p>', '{\"给你看看\": \"嘿嘿\"}', '{\"sku\": [{\"pic\": \"/upload/images/Geh9a2FhxKiatMdrp8fOlulaWpJ8CE8y0j9erN02.jpeg\", \"price\": \"1299\", \"stock\": \"200\", \"尺码\": \"42\", \"颜色\": \"红色\"}, {\"pic\": \"/upload/images/XojYVBEyRqV7gS7L3cY4cvu9GXVimSYK6iXEunkg.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"42\", \"颜色\": \"蓝色\"}, {\"pic\": \"/upload/images/0cPhAAwcRak91TbSnneAnP99aGiJprSQxc9dQMjX.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"43\", \"颜色\": \"红色\"}, {\"pic\": \"/upload/images/KToaercX27YFOVbucYWKR6ZX0PLg4riB2WCiHzE0.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"43\", \"颜色\": \"蓝色\"}, {\"pic\": \"/upload/images/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"44\", \"颜色\": \"红色\"}, {\"pic\": \"/upload/images/cRBR96k7XVYHycY8PfEccPjBE7tBFpcZcciIwNMt.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"44\", \"颜色\": \"蓝色\"}], \"type\": \"many\", \"attrs\": {\"尺码\": [\"42\", \"43\", \"44\"], \"颜色\": [\"红色\", \"蓝色\"]}}', 100, 20, 1, 10, 1, 3);
INSERT INTO `pro_info` VALUES (4, '2020-09-12 14:21:53', '2020-09-17 15:50:37', 1, 1, 1, 3, 6, '1111', 111.00, 11.00, 'images/18fe8decc31cffd81c164649a83b5b35.jpg', NULL, '<p>111</p>', '{\"1\": \"1\"}', '{\"sku\": [{\"pic\": \"\", \"price\": \"100\", \"stock\": \"10\", \"尺码\": \"XXL\", \"颜色\": \"红色\"}, {\"pic\": \"\", \"price\": \"100\", \"stock\": \"10\", \"尺码\": \"XXL\", \"颜色\": \"绿色\"}, {\"pic\": \"\", \"price\": \"100\", \"stock\": \"10\", \"尺码\": \"XL\", \"颜色\": \"红色\"}, {\"pic\": \"\", \"price\": \"100\", \"stock\": \"10\", \"尺码\": \"XL\", \"颜色\": \"绿色\"}], \"type\": \"many\", \"attrs\": {\"尺码\": [\"XXL\", \"XL\"], \"颜色\": [\"红色\", \"绿色\"]}}', 111, 11, 1, 10, 1, 1);

-- ----------------------------
-- Table structure for pro_info_collection
-- ----------------------------
DROP TABLE IF EXISTS `pro_info_collection`;
CREATE TABLE `pro_info_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id_pro_id_idx`(`customer_id`, `pro_id`) USING BTREE,
  INDEX `pro_id_idx`(`pro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_info_collection
-- ----------------------------
INSERT INTO `pro_info_collection` VALUES (2, 51, 1, '2020-09-15 14:55:24', '2020-09-15 14:55:24');

-- ----------------------------
-- Table structure for pro_label
-- ----------------------------
DROP TABLE IF EXISTS `pro_label`;
CREATE TABLE `pro_label`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签名称',
  `order_by` int(11) NOT NULL DEFAULT 10 COMMENT '排序值',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_label
-- ----------------------------
INSERT INTO `pro_label` VALUES (1, '2020-09-06 13:56:19', '2020-09-06 14:25:16', '运动', 10, 1);
INSERT INTO `pro_label` VALUES (2, '2020-09-06 13:56:26', '2020-09-06 13:56:26', '时尚', 10, 1);
INSERT INTO `pro_label` VALUES (3, '2020-09-06 13:56:32', '2020-09-06 13:58:04', '文艺', 16, 1);

-- ----------------------------
-- Table structure for pro_specs_class
-- ----------------------------
DROP TABLE IF EXISTS `pro_specs_class`;
CREATE TABLE `pro_specs_class`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `brand_id` int(11) NULL DEFAULT NULL,
  `class_id` int(11) NOT NULL COMMENT '分类id',
  `specs_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格分类名称',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  `order_by` int(11) NOT NULL DEFAULT 10 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_specs_class
-- ----------------------------
INSERT INTO `pro_specs_class` VALUES (1, '2020-09-07 10:28:51', '2020-09-07 10:28:51', 1, 1, '颜色', 1, 10);
INSERT INTO `pro_specs_class` VALUES (2, '2020-09-07 10:29:00', '2020-09-07 10:29:00', 1, 1, '尺码', 1, 10);

-- ----------------------------
-- Table structure for pro_specs_detail
-- ----------------------------
DROP TABLE IF EXISTS `pro_specs_detail`;
CREATE TABLE `pro_specs_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `class_id` int(11) NOT NULL COMMENT '分类id',
  `specs_class_id` int(11) NOT NULL COMMENT '规格分类id',
  `detail_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格名称',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架',
  `order_by` int(11) NOT NULL DEFAULT 10 COMMENT '排序值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_specs_detail_brand_id_order_by_index`(`brand_id`, `order_by`) USING BTREE,
  INDEX `pro_specs_detail_class_id_order_by_index`(`class_id`, `order_by`) USING BTREE,
  INDEX `pro_specs_detail_specs_class_id_order_by_index`(`specs_class_id`, `order_by`) USING BTREE,
  INDEX `pro_specs_detail_order_by_index`(`order_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_specs_detail
-- ----------------------------
INSERT INTO `pro_specs_detail` VALUES (1, '2020-09-08 08:27:29', '2020-09-08 08:27:29', 1, 1, 1, '红色', 1, 10);
INSERT INTO `pro_specs_detail` VALUES (2, '2020-09-08 08:27:38', '2020-09-08 08:27:38', 1, 1, 1, '白色', 1, 10);
INSERT INTO `pro_specs_detail` VALUES (3, '2020-09-08 08:27:49', '2020-09-08 08:27:49', 1, 1, 2, '42', 1, 10);
INSERT INTO `pro_specs_detail` VALUES (4, '2020-09-08 08:27:57', '2020-09-08 08:27:57', 1, 1, 2, '43', 1, 10);

-- ----------------------------
-- Table structure for retail_order
-- ----------------------------
DROP TABLE IF EXISTS `retail_order`;
CREATE TABLE `retail_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `retail_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `total_original_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原总价',
  `total_actual_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '成交总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id_idx`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retail_order
-- ----------------------------
INSERT INTO `retail_order` VALUES (11, '2020-09-13 14:59:58', '2020-09-13 14:59:58', '202009131459580000000001585', 1, 1, 0.00, 13002.00);
INSERT INTO `retail_order` VALUES (13, '2020-09-13 15:11:52', '2020-09-13 15:11:52', '2020091315115200000000013502', 1, 1, 0.00, 4412.00);

-- ----------------------------
-- Table structure for retail_order_line
-- ----------------------------
DROP TABLE IF EXISTS `retail_order_line`;
CREATE TABLE `retail_order_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `retail_order_id` int(11) NOT NULL,
  `retail_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号(冗余字段)',
  `customer_id` int(11) NOT NULL COMMENT '客户id(冗余字段)',
  `pro_id` int(11) NOT NULL COMMENT '产品Id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `pro_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `pro_sku` json NOT NULL COMMENT 'sku参数',
  `unit_price` decimal(10, 2) NOT NULL COMMENT '单品价格',
  `unit_count` int(11) NOT NULL COMMENT '单品数量',
  `freight` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `pay_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付类型 0未支付 1支付宝 2微信 3其他',
  `pay_status` tinyint(1) NOT NULL COMMENT '订单状态 0待支付 1待发货 2待签收 3退换货',
  `pay_serial_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` timestamp(0) NULL DEFAULT NULL COMMENT '发货时间',
  `sign_time` timestamp(0) NULL DEFAULT NULL COMMENT '签收时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `retail_order_id`(`retail_order_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `pro_id`(`pro_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retail_order_line
-- ----------------------------
INSERT INTO `retail_order_line` VALUES (1, '2020-09-13 14:59:58', '2020-09-13 14:59:58', 11, '202009131459580000000001585', 1, 1, 1, '测试11', '{\"pic\": \"/upload/images/05pPX5pqP9GnEgpOnx90rYeWagLp9ETqtJiCZLhv.jpeg\", \"price\": \"1299\", \"stock\": \"200\", \"尺码\": \"42\", \"颜色\": \"红色\"}', 1299.00, 10, 12.00, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `retail_order_line` VALUES (2, '2020-09-13 15:11:52', '2020-09-13 15:11:52', 13, '2020091315115200000000013502', 1, 1, 1, '乔丹1', '{\"pic\": \"/upload/images/eTLHBTFgJVWRC8wwIMWgFq4lsWk3xYgaUDOiNwGU.jpeg\", \"price\": \"1100\", \"stock\": \"100\", \"尺码\": \"43\", \"颜色\": \"蓝色\"}', 1100.00, 4, 12.00, 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `business_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '营业状态：0休业 1营业',
  `business_timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '营业时间段',
  `province` int(11) NOT NULL COMMENT '省',
  `city` int(11) NOT NULL COMMENT '市',
  `area` int(11) NOT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `attention` int(11) NOT NULL DEFAULT 0 COMMENT '关注量',
  `is_branch` int(11) NULL DEFAULT 0 COMMENT '是否是分店：0不是 1是',
  `parent_branch` int(11) NULL DEFAULT 0 COMMENT '父级店铺id',
  `extention` json NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
