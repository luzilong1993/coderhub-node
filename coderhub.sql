/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : coderhub

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/12/2021 15:56:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of avatar
-- ----------------------------
BEGIN;
INSERT INTO `avatar` VALUES (1, '39d07596a3544d15ac012a27e0183122', 'image/jpeg', 12652, 5, '2021-12-27 10:56:40', '2021-12-27 10:56:40');
INSERT INTO `avatar` VALUES (2, 'a2d3b69cebe0340bb8be11d3aaddcd84', 'image/jpeg', 12652, 5, '2021-12-27 11:33:54', '2021-12-27 11:33:54');
INSERT INTO `avatar` VALUES (3, 'cf1c5eb2688abc20ce5227d0425289fe', 'image/jpeg', 12652, 5, '2021-12-27 11:40:25', '2021-12-27 11:40:25');
COMMIT;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `phoneRank` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
BEGIN;
INSERT INTO `brand` VALUES (2, '??????', 'www.xiaomi.com', 3);
INSERT INTO `brand` VALUES (3, '??????', 'www.hongmi.com', 4);
INSERT INTO `brand` VALUES (4, '??????', 'www.chuizi.com', 5);
INSERT INTO `brand` VALUES (5, 'oppo', 'www.oppo.com', 10);
INSERT INTO `brand` VALUES (6, '??????', 'www.sanxing.com', 30);
INSERT INTO `brand` VALUES (7, '??????', 'www.rongyao.com', 11);
INSERT INTO `brand` VALUES (8, 'vivo', 'www.vivo.com', 23);
INSERT INTO `brand` VALUES (9, '??????', 'www.tianji.com', 1000);
INSERT INTO `brand` VALUES (10, '??????', 'www.lianxiang.com', 101);
INSERT INTO `brand` VALUES (11, '??????', 'www.jingdong.com', 8);
INSERT INTO `brand` VALUES (12, '??????', 'www.google.com', 9);
INSERT INTO `brand` VALUES (100, '??????', 'www.huawei.com', 2);
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `moment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `moment_id` (`moment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (3, '??????????????????', 2, 5, NULL, '2021-12-23 14:37:41', '2021-12-23 14:37:41');
INSERT INTO `comment` VALUES (4, '??????', 2, 5, NULL, '2021-12-23 14:37:53', '2021-12-23 14:37:53');
INSERT INTO `comment` VALUES (5, '??????', 2, 5, NULL, '2021-12-23 14:37:55', '2021-12-23 14:37:55');
INSERT INTO `comment` VALUES (6, '??????', 2, 5, NULL, '2021-12-23 14:37:56', '2021-12-23 14:37:56');
INSERT INTO `comment` VALUES (7, '??????', 2, 5, NULL, '2021-12-23 14:37:57', '2021-12-23 14:37:57');
INSERT INTO `comment` VALUES (8, '??????', 2, 5, NULL, '2021-12-23 14:37:58', '2021-12-23 14:37:58');
INSERT INTO `comment` VALUES (9, '??????', 3, 5, NULL, '2021-12-23 14:38:04', '2021-12-23 14:38:04');
INSERT INTO `comment` VALUES (10, '??????', 3, 5, NULL, '2021-12-23 14:38:05', '2021-12-23 14:38:05');
INSERT INTO `comment` VALUES (11, '??????', 3, 5, NULL, '2021-12-23 14:38:05', '2021-12-23 14:38:05');
INSERT INTO `comment` VALUES (12, '??????', 3, 5, NULL, '2021-12-23 14:38:06', '2021-12-23 14:38:06');
INSERT INTO `comment` VALUES (14, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:24', '2021-12-23 14:38:24');
INSERT INTO `comment` VALUES (15, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:25', '2021-12-23 14:38:25');
INSERT INTO `comment` VALUES (16, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:26', '2021-12-23 14:38:26');
INSERT INTO `comment` VALUES (17, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:27', '2021-12-23 14:38:27');
INSERT INTO `comment` VALUES (18, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:27', '2021-12-23 14:38:27');
INSERT INTO `comment` VALUES (19, '?????????????????????', 2, 5, 3, '2021-12-23 14:38:28', '2021-12-23 14:38:28');
COMMIT;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN;
INSERT INTO `courses` VALUES (1, '??????', 100);
INSERT INTO `courses` VALUES (2, '??????', 666);
INSERT INTO `courses` VALUES (3, '??????', 888);
INSERT INTO `courses` VALUES (4, '??????', 99);
INSERT INTO `courses` VALUES (5, '??????', 999);
INSERT INTO `courses` VALUES (6, '??????', 333);
INSERT INTO `courses` VALUES (13, '??????', 100);
INSERT INTO `courses` VALUES (14, '??????', 666);
INSERT INTO `courses` VALUES (15, '??????', 888);
INSERT INTO `courses` VALUES (16, '??????', 99);
INSERT INTO `courses` VALUES (17, '??????', 999);
INSERT INTO `courses` VALUES (18, '??????', 333);
INSERT INTO `courses` VALUES (19, '??????', 100);
INSERT INTO `courses` VALUES (20, '??????', 666);
INSERT INTO `courses` VALUES (21, '??????', 888);
INSERT INTO `courses` VALUES (22, '??????', 99);
INSERT INTO `courses` VALUES (23, '??????', 999);
INSERT INTO `courses` VALUES (24, '??????', 333);
COMMIT;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `moment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  KEY `moment_id` (`moment_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of file
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES (1, '0ff3bf990a4b936c98b654d6bfbd6b83', 'image/jpeg', 12652, 2, 5, '2021-12-27 12:00:38', '2021-12-27 12:00:38');
INSERT INTO `file` VALUES (2, 'e1ab5cc6e9085ab269dfe6853d2060f5', 'image/jpeg', 12652, 2, 5, '2021-12-27 12:00:38', '2021-12-27 12:00:38');
INSERT INTO `file` VALUES (3, 'c0a347f610b7dca572e5e54f9a16bcc8', 'image/jpeg', 12652, 2, 5, '2021-12-27 14:18:36', '2021-12-27 14:18:36');
INSERT INTO `file` VALUES (4, 'c90addeb7d1499034bf385e616de07f8', 'image/jpeg', 12652, 2, 5, '2021-12-27 14:18:37', '2021-12-27 14:18:37');
INSERT INTO `file` VALUES (5, '9386b21de62dcfc9f7d069191758e874', 'image/jpeg', 12652, 2, 5, '2021-12-27 14:21:12', '2021-12-27 14:21:12');
INSERT INTO `file` VALUES (6, '2c4a961ea68c0a6e000e413edb6fde5c', 'image/jpeg', 12652, 2, 5, '2021-12-27 14:21:12', '2021-12-27 14:21:12');
INSERT INTO `file` VALUES (7, '0ed2173e19c7b86d3a0ef3b7d4357dfe', 'image/png', 25783, 2, 5, '2021-12-27 14:22:56', '2021-12-27 14:22:56');
INSERT INTO `file` VALUES (8, '5a0e5d732db04e4dd795329490f29021', 'image/png', 25783, 2, 5, '2021-12-27 14:22:56', '2021-12-27 14:22:56');
COMMIT;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of label
-- ----------------------------
BEGIN;
INSERT INTO `label` VALUES (1, '??????', '2021-12-23 15:40:06', '2021-12-23 15:40:06');
INSERT INTO `label` VALUES (2, '??????', '2021-12-23 15:42:38', '2021-12-23 15:42:38');
INSERT INTO `label` VALUES (3, '??????', '2021-12-23 15:42:42', '2021-12-23 15:42:42');
INSERT INTO `label` VALUES (4, '??????', '2021-12-23 15:42:46', '2021-12-23 15:42:46');
INSERT INTO `label` VALUES (5, '?????????', '2021-12-23 16:37:23', '2021-12-23 16:37:23');
INSERT INTO `label` VALUES (6, '?????????', '2021-12-23 16:38:33', '2021-12-23 16:38:33');
INSERT INTO `label` VALUES (7, '?????????', '2021-12-23 16:54:32', '2021-12-23 16:54:32');
COMMIT;

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `user_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of moment
-- ----------------------------
BEGIN;
INSERT INTO `moment` VALUES (2, '????????????????????????????????????????????????????????????????????????????????????????????????', 1, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (3, '??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 2, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (4, '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 3, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (5, '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 4, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (6, '??????????????????????????????????????????????????????????????????????????????????????????', 5, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (7, '??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (8, '????????????????????????????????????????????????????????????', 2, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (9, '???????????????????????????????????????????????????', 3, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (10, '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 3, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (11, '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 4, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (12, '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 2, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
INSERT INTO `moment` VALUES (13, '??????????????????????????????????????????????????????????????????????????????', 3, '2021-12-22 12:08:33', '2021-12-22 12:08:33');
COMMIT;

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label` (
  `moment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`,`label_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
BEGIN;
INSERT INTO `moment_label` VALUES (6, 5, '2021-12-23 16:54:14', '2021-12-23 16:54:14');
INSERT INTO `moment_label` VALUES (6, 6, '2021-12-23 16:54:14', '2021-12-23 16:54:14');
INSERT INTO `moment_label` VALUES (6, 7, '2021-12-23 16:54:32', '2021-12-23 16:54:32');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `score` decimal(2,1) DEFAULT NULL,
  `voteCnt` int DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (1, '??????', '??????1', 35666, 8.0, 60, 'www.baidu.com', 2134, 3);
INSERT INTO `products` VALUES (2, '??????', '??????0', 5123, 2.9, 44, 'www.baidu.com', 64828, 2);
INSERT INTO `products` VALUES (3, 'oppo', '??????3', 4927, 6.4, 34, 'www.baidu.com', 57965, 5);
INSERT INTO `products` VALUES (4, '??????', '??????4', 5233, 5.1, 39, 'www.baidu.com', 76965, 3);
INSERT INTO `products` VALUES (5, '??????', '??????0', 903, 9.8, 9, 'www.baidu.com', 24580, 7);
INSERT INTO `products` VALUES (6, '??????', '??????7', 4884, 9.2, 59, 'www.baidu.com', 91678, 2);
INSERT INTO `products` VALUES (7, '??????', '??????8', 9941, 8.8, 14, 'www.baidu.com', 70825, 7);
INSERT INTO `products` VALUES (8, 'vivo', '??????7', 9048, 0.0, 23, 'www.baidu.com', 35959, 8);
INSERT INTO `products` VALUES (9, 'oppo', '??????1', 571, 5.8, 25, 'www.baidu.com', 14705, 5);
INSERT INTO `products` VALUES (10, '??????', '??????2', 4074, 9.6, 71, 'www.baidu.com', 32350, 6);
INSERT INTO `products` VALUES (11, '??????', '??????4', 9300, 7.6, 79, 'www.baidu.com', 81830, NULL);
INSERT INTO `products` VALUES (12, '??????', 'oppo7', 1928, 7.1, 45, 'www.baidu.com', 25196, 2);
INSERT INTO `products` VALUES (13, '??????', '??????7', 6258, 1.3, 24, 'www.baidu.com', 60419, 100);
INSERT INTO `products` VALUES (14, '??????', '??????3', 557, 9.2, 30, 'www.baidu.com', 88519, 3);
INSERT INTO `products` VALUES (15, '??????', '??????7', 4120, 3.4, 14, 'www.baidu.com', 23466, NULL);
INSERT INTO `products` VALUES (16, '??????', '??????8', 7373, 5.7, 29, 'www.baidu.com', 85909, 6);
INSERT INTO `products` VALUES (17, '??????', 'oppo6', 5446, 8.8, 19, 'www.baidu.com', 22496, 4);
INSERT INTO `products` VALUES (18, '??????', 'oppo2', 3316, 8.9, 86, 'www.baidu.com', 52499, 4);
INSERT INTO `products` VALUES (19, '??????', '??????8', 7176, 3.5, 66, 'www.baidu.com', 68613, 2);
INSERT INTO `products` VALUES (20, '??????', '??????9', 8701, 9.2, 7, 'www.baidu.com', 52188, 2);
INSERT INTO `products` VALUES (21, 'vivo', '??????6', 5485, 9.5, 50, 'www.baidu.com', 96557, 8);
INSERT INTO `products` VALUES (22, '??????', 'oppo8', 1126, 7.2, 7, 'www.baidu.com', 6352, NULL);
INSERT INTO `products` VALUES (23, '??????', '??????9', 4690, 3.9, 2, 'www.baidu.com', 93993, 100);
INSERT INTO `products` VALUES (24, '??????', 'oppo8', 2166, 8.6, 52, 'www.baidu.com', 37098, 100);
INSERT INTO `products` VALUES (25, '??????', 'oppo9', 9211, 0.9, 11, 'www.baidu.com', 11715, 4);
INSERT INTO `products` VALUES (26, '??????', '??????1', 7369, 2.5, 17, 'www.baidu.com', 41919, NULL);
INSERT INTO `products` VALUES (27, '??????', '??????7', 7978, 5.0, 71, 'www.baidu.com', 24279, NULL);
INSERT INTO `products` VALUES (28, '??????', '??????6', 2085, 9.1, 50, 'www.baidu.com', 42722, 3);
INSERT INTO `products` VALUES (29, '??????', '??????5', 5076, 3.4, 98, 'www.baidu.com', 55275, 2);
INSERT INTO `products` VALUES (30, 'vivo', '??????8', 1456, 4.3, 73, 'www.baidu.com', 31949, 8);
INSERT INTO `products` VALUES (31, '??????', '??????4', 7486, 0.3, 56, 'www.baidu.com', 70787, 6);
INSERT INTO `products` VALUES (32, '??????', '??????8', 763, 8.6, 6, 'www.baidu.com', 15001, 100);
INSERT INTO `products` VALUES (33, 'oppo', 'vivo2', 4835, 2.6, 91, 'www.baidu.com', 93741, 5);
INSERT INTO `products` VALUES (34, '??????', 'oppo0', 1041, 5.7, 55, 'www.baidu.com', 97856, NULL);
INSERT INTO `products` VALUES (35, '??????', 'vivo7', 4814, 6.5, 36, 'www.baidu.com', 1965, 2);
INSERT INTO `products` VALUES (36, 'vivo', '??????5', 5648, 7.8, 93, 'www.baidu.com', 72199, 8);
INSERT INTO `products` VALUES (37, '??????', '??????1', 2566, 3.0, 94, 'www.baidu.com', 28979, 2);
INSERT INTO `products` VALUES (38, 'oppo', '??????5', 8835, 8.7, 67, 'www.baidu.com', 12695, 5);
INSERT INTO `products` VALUES (39, '??????', '??????6', 2936, 1.7, 59, 'www.baidu.com', 40791, 6);
INSERT INTO `products` VALUES (40, '??????', '??????0', 3863, 0.7, 53, 'www.baidu.com', 84981, NULL);
INSERT INTO `products` VALUES (41, '??????', '??????1', 4778, 4.5, 54, 'www.baidu.com', 75097, 2);
INSERT INTO `products` VALUES (42, 'vivo', '??????1', 156, 5.2, 28, 'www.baidu.com', 65936, 8);
INSERT INTO `products` VALUES (43, '??????', '??????4', 5750, 7.1, 94, 'www.baidu.com', 48843, 2);
INSERT INTO `products` VALUES (44, '??????', '??????2', 2311, 2.7, 50, 'www.baidu.com', 99472, NULL);
INSERT INTO `products` VALUES (45, '??????', '??????0', 362, 2.2, 27, 'www.baidu.com', 59589, 2);
INSERT INTO `products` VALUES (46, 'vivo', '??????8', 4752, 6.2, 73, 'www.baidu.com', 7071, 8);
INSERT INTO `products` VALUES (47, 'oppo', '??????5', 8259, 1.9, 59, 'www.baidu.com', 39509, 5);
INSERT INTO `products` VALUES (48, '??????', 'oppo5', 2711, 4.9, 12, 'www.baidu.com', 90788, 4);
INSERT INTO `products` VALUES (49, '??????', '??????7', 3776, 5.4, 8, 'www.baidu.com', 47776, 4);
INSERT INTO `products` VALUES (50, '??????', '??????9', 1671, 9.9, 44, 'www.baidu.com', 36231, 3);
INSERT INTO `products` VALUES (51, '??????', '??????1', 8044, 5.7, 10, 'www.baidu.com', 93776, NULL);
INSERT INTO `products` VALUES (52, '??????', 'oppo7', 4990, 1.5, 19, 'www.baidu.com', 60515, 4);
INSERT INTO `products` VALUES (53, 'vivo', '??????6', 4729, 4.1, 91, 'www.baidu.com', 2595, 8);
INSERT INTO `products` VALUES (54, '??????', '??????1', 4523, 1.7, 8, 'www.baidu.com', 15414, 7);
INSERT INTO `products` VALUES (55, '??????', '??????6', 6301, 7.7, 3, 'www.baidu.com', 46352, NULL);
INSERT INTO `products` VALUES (56, '??????', '??????3', 6655, 3.2, 53, 'www.baidu.com', 31214, 3);
INSERT INTO `products` VALUES (57, '??????', '??????3', 6675, 6.5, 58, 'www.baidu.com', 90353, 6);
INSERT INTO `products` VALUES (58, 'oppo', '??????3', 4504, 0.6, 23, 'www.baidu.com', 20894, 5);
INSERT INTO `products` VALUES (59, 'oppo', '??????1', 8035, 6.9, 37, 'www.baidu.com', 95393, 5);
INSERT INTO `products` VALUES (60, '??????', '??????4', 2578, 4.7, 49, 'www.baidu.com', 22375, 100);
INSERT INTO `products` VALUES (61, 'vivo', 'oppo1', 5150, 9.6, 26, 'www.baidu.com', 73408, 8);
INSERT INTO `products` VALUES (62, '??????', '??????0', 9259, 8.0, 62, 'www.baidu.com', 42455, NULL);
INSERT INTO `products` VALUES (63, '??????', '??????5', 1428, 1.6, 25, 'www.baidu.com', 79155, 2);
INSERT INTO `products` VALUES (64, 'vivo', '??????6', 35, 8.7, 54, 'www.baidu.com', 59100, 8);
INSERT INTO `products` VALUES (65, 'oppo', '??????6', 7722, 1.4, 92, 'www.baidu.com', 71863, 5);
INSERT INTO `products` VALUES (66, '??????', '??????5', 8617, 0.6, 23, 'www.baidu.com', 81725, 100);
INSERT INTO `products` VALUES (67, '??????', '??????8', 8431, 5.7, 14, 'www.baidu.com', 17796, 7);
INSERT INTO `products` VALUES (68, '??????', '??????2', 7896, 1.4, 73, 'www.baidu.com', 68067, 2);
INSERT INTO `products` VALUES (69, '??????', 'oppo9', 4370, 1.3, 49, 'www.baidu.com', 7409, 4);
INSERT INTO `products` VALUES (70, '??????', 'vivo8', 1394, 7.3, 70, 'www.baidu.com', 20613, 100);
INSERT INTO `products` VALUES (71, '??????', '??????3', 7219, 9.9, 65, 'www.baidu.com', 64919, 100);
INSERT INTO `products` VALUES (72, '??????', 'vivo1', 4475, 6.8, 1, 'www.baidu.com', 87851, 3);
INSERT INTO `products` VALUES (73, '??????', '??????0', 9618, 1.6, 69, 'www.baidu.com', 37889, NULL);
INSERT INTO `products` VALUES (74, '??????', '??????8', 899, 3.6, 25, 'www.baidu.com', 32810, 7);
INSERT INTO `products` VALUES (75, '??????', '??????1', 3391, 3.9, 98, 'www.baidu.com', 41770, 100);
INSERT INTO `products` VALUES (76, '??????', 'oppo4', 6001, 1.8, 88, 'www.baidu.com', 76842, 3);
INSERT INTO `products` VALUES (77, '??????', 'oppo8', 3357, 4.5, 53, 'www.baidu.com', 35698, 7);
INSERT INTO `products` VALUES (78, '??????', '??????0', 8823, 4.3, 84, 'www.baidu.com', 80039, NULL);
INSERT INTO `products` VALUES (79, 'vivo', '??????0', 957, 7.7, 38, 'www.baidu.com', 9812, 8);
INSERT INTO `products` VALUES (80, '??????', '??????3', 2992, 5.2, 89, 'www.baidu.com', 58682, 3);
INSERT INTO `products` VALUES (81, '??????', '??????5', 3640, 4.5, 50, 'www.baidu.com', 82013, 7);
INSERT INTO `products` VALUES (82, 'vivo', '??????7', 9500, 0.5, 42, 'www.baidu.com', 58763, 8);
INSERT INTO `products` VALUES (83, '??????', 'vivo4', 9185, 6.8, 24, 'www.baidu.com', 26901, NULL);
INSERT INTO `products` VALUES (84, '??????', '??????0', 1641, 8.3, 31, 'www.baidu.com', 41423, 7);
INSERT INTO `products` VALUES (85, '??????', '??????4', 8374, 6.9, 30, NULL, 89009, NULL);
INSERT INTO `products` VALUES (86, '??????', 'vivo2', 127, 5.7, 94, NULL, 85011, 4);
INSERT INTO `products` VALUES (87, 'oppo', '??????1', 8497, 0.8, 77, NULL, 17016, 5);
INSERT INTO `products` VALUES (88, 'oppo', '??????3', 7491, 8.5, 51, NULL, 35604, 5);
INSERT INTO `products` VALUES (89, 'vivo', '??????0', 8696, 7.9, 29, 'www.baidu.com', 70456, 8);
INSERT INTO `products` VALUES (90, 'oppo', '??????3', 2333, 2.7, 18, 'www.baidu.com', 93982, 5);
INSERT INTO `products` VALUES (91, '??????', '??????6', 6478, 4.3, 52, 'www.baidu.com', 1105, 3);
INSERT INTO `products` VALUES (92, '??????', '??????2', 8987, 6.4, 68, 'www.baidu.com', 49719, 3);
INSERT INTO `products` VALUES (93, '??????', '??????9', 110, 9.4, 87, 'www.baidu.com', 56316, 3);
INSERT INTO `products` VALUES (94, 'vivo', '??????8', 4555, 1.8, 24, 'www.baidu.com', 61195, 8);
INSERT INTO `products` VALUES (95, '??????', 'oppo7', 9573, 6.6, 66, 'www.baidu.com', 79421, 3);
INSERT INTO `products` VALUES (96, '??????', '??????4', 130, 2.9, 19, 'www.baidu.com', 12994, 7);
INSERT INTO `products` VALUES (97, '??????', 'vivo0', 7468, 5.6, 18, 'www.baidu.com', 40057, NULL);
INSERT INTO `products` VALUES (98, '??????', '??????2', 8652, 8.7, 69, 'www.baidu.com', 10539, NULL);
INSERT INTO `products` VALUES (99, '??????', '??????3', 3415, 7.6, 86, 'www.baidu.com', 29393, 100);
INSERT INTO `products` VALUES (100, '??????', '??????0', 5238, 4.4, 95, 'www.baidu.com', 3524, NULL);
INSERT INTO `products` VALUES (101, NULL, '??????nova', 8888, 5.4, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of students
-- ----------------------------
BEGIN;
INSERT INTO `students` VALUES (1, 'why', 18);
INSERT INTO `students` VALUES (2, 'tom', 22);
INSERT INTO `students` VALUES (3, 'lilei', 25);
INSERT INTO `students` VALUES (4, 'lucy', 16);
INSERT INTO `students` VALUES (5, 'lily', 20);
INSERT INTO `students` VALUES (16, 'why', 18);
INSERT INTO `students` VALUES (17, 'tom', 22);
INSERT INTO `students` VALUES (18, 'lilei', 25);
INSERT INTO `students` VALUES (19, 'lucy', 16);
INSERT INTO `students` VALUES (20, 'lily', 20);
INSERT INTO `students` VALUES (21, 'why', 18);
INSERT INTO `students` VALUES (22, 'tom', 22);
INSERT INTO `students` VALUES (23, 'lilei', 25);
INSERT INTO `students` VALUES (24, 'lucy', 16);
INSERT INTO `students` VALUES (25, 'lily', 20);
COMMIT;

-- ----------------------------
-- Table structure for students_select_courses
-- ----------------------------
DROP TABLE IF EXISTS `students_select_courses`;
CREATE TABLE `students_select_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `students_select_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `students_select_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of students_select_courses
-- ----------------------------
BEGIN;
INSERT INTO `students_select_courses` VALUES (1, 1, 1);
INSERT INTO `students_select_courses` VALUES (2, 1, 3);
INSERT INTO `students_select_courses` VALUES (3, 1, 4);
INSERT INTO `students_select_courses` VALUES (7, 3, 2);
INSERT INTO `students_select_courses` VALUES (8, 3, 4);
INSERT INTO `students_select_courses` VALUES (9, 5, 3);
INSERT INTO `students_select_courses` VALUES (10, 5, 4);
INSERT INTO `students_select_courses` VALUES (18, 1, 1);
INSERT INTO `students_select_courses` VALUES (19, 1, 3);
INSERT INTO `students_select_courses` VALUES (20, 1, 4);
INSERT INTO `students_select_courses` VALUES (21, 3, 2);
INSERT INTO `students_select_courses` VALUES (22, 3, 4);
INSERT INTO `students_select_courses` VALUES (23, 5, 3);
INSERT INTO `students_select_courses` VALUES (24, 5, 4);
INSERT INTO `students_select_courses` VALUES (25, 1, 1);
INSERT INTO `students_select_courses` VALUES (26, 1, 3);
INSERT INTO `students_select_courses` VALUES (27, 1, 4);
INSERT INTO `students_select_courses` VALUES (28, 3, 2);
INSERT INTO `students_select_courses` VALUES (29, 3, 4);
INSERT INTO `students_select_courses` VALUES (30, 5, 3);
INSERT INTO `students_select_courses` VALUES (31, 5, 4);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'why', '12345', '2021-12-16 16:55:16', '2021-12-16 16:55:16', NULL);
INSERT INTO `users` VALUES (2, 'kobe', '123', '2021-12-16 17:51:31', '2021-12-16 17:51:31', NULL);
INSERT INTO `users` VALUES (3, 'six', '12345', '2021-12-17 09:52:26', '2021-12-17 09:52:26', NULL);
INSERT INTO `users` VALUES (4, 'lilei', '12345', '2021-12-17 10:22:11', '2021-12-17 10:22:11', NULL);
INSERT INTO `users` VALUES (5, 'lucy', '827ccb0eea8a706c4c34a16891f84e7b', '2021-12-17 10:43:06', '2021-12-27 11:40:25', 'http://localhost:8888/users/5/avatar');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
