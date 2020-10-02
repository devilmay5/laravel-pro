/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : laravel-test

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 02/10/2020 22:28:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for retail_refund
-- ----------------------------
DROP TABLE IF EXISTS `retail_refund`;
CREATE TABLE `retail_refund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retail_order_line_id` int(11) NOT NULL COMMENT '关联订单id',
  `refuse_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '退货原因描述',
  `refuse_image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '1 待审核\r\n2 审核中\r\n3 已审核\r\n4 已退款',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `submit_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `accept_time` datetime(0) NULL DEFAULT NULL COMMENT '受理时间',
  `exam_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `refund_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retail_refund
-- ----------------------------
INSERT INTO `retail_refund` VALUES (1, 1, 'aaaaaaa', 'images/V3MRTJ8K8aeFspALW3LqYieW2wzMejWL5Bn4yG6V.jpeg', 1, '2020-10-02 18:11:17', '2020-10-02 18:11:17', '2020-10-02 18:11:15', NULL, NULL, NULL, 51);
INSERT INTO `retail_refund` VALUES (2, 1, 'aaaaaaa', 'images/FIXhMuambP8zCfoLvwXOd75X95xb8uqyRiIcnFYn.jpeg', 1, '2020-10-02 21:56:31', '2020-10-02 21:56:31', '2020-10-02 21:56:30', NULL, NULL, NULL, 51);

SET FOREIGN_KEY_CHECKS = 1;
