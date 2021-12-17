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

 Date: 17/12/2021 15:40:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `brand` VALUES (2, '小米', 'www.xiaomi.com', 3);
INSERT INTO `brand` VALUES (3, '红米', 'www.hongmi.com', 4);
INSERT INTO `brand` VALUES (4, '锤子', 'www.chuizi.com', 5);
INSERT INTO `brand` VALUES (5, 'oppo', 'www.oppo.com', 10);
INSERT INTO `brand` VALUES (6, '三星', 'www.sanxing.com', 30);
INSERT INTO `brand` VALUES (7, '荣耀', 'www.rongyao.com', 11);
INSERT INTO `brand` VALUES (8, 'vivo', 'www.vivo.com', 23);
INSERT INTO `brand` VALUES (9, '天际', 'www.tianji.com', 1000);
INSERT INTO `brand` VALUES (10, '联想', 'www.lianxiang.com', 101);
INSERT INTO `brand` VALUES (11, '京东', 'www.jingdong.com', 8);
INSERT INTO `brand` VALUES (12, '谷歌', 'www.google.com', 9);
INSERT INTO `brand` VALUES (100, '华为', 'www.huawei.com', 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN;
INSERT INTO `courses` VALUES (1, '英语', 100);
INSERT INTO `courses` VALUES (2, '语文', 666);
INSERT INTO `courses` VALUES (3, '数学', 888);
INSERT INTO `courses` VALUES (4, '历史', 99);
INSERT INTO `courses` VALUES (5, '物理', 999);
INSERT INTO `courses` VALUES (6, '地理', 333);
INSERT INTO `courses` VALUES (13, '英语', 100);
INSERT INTO `courses` VALUES (14, '语文', 666);
INSERT INTO `courses` VALUES (15, '数学', 888);
INSERT INTO `courses` VALUES (16, '历史', 99);
INSERT INTO `courses` VALUES (17, '物理', 999);
INSERT INTO `courses` VALUES (18, '地理', 333);
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
INSERT INTO `products` VALUES (1, '红米', '天际1', 35666, 8.0, 60, 'www.baidu.com', 2134, 3);
INSERT INTO `products` VALUES (2, '小米', '天际0', 5123, 2.9, 44, 'www.baidu.com', 64828, 2);
INSERT INTO `products` VALUES (3, 'oppo', '天际3', 4927, 6.4, 34, 'www.baidu.com', 57965, 5);
INSERT INTO `products` VALUES (4, '红米', '三星4', 5233, 5.1, 39, 'www.baidu.com', 76965, 3);
INSERT INTO `products` VALUES (5, '荣耀', '联想0', 903, 9.8, 9, 'www.baidu.com', 24580, 7);
INSERT INTO `products` VALUES (6, '小米', '华为7', 4884, 9.2, 59, 'www.baidu.com', 91678, 2);
INSERT INTO `products` VALUES (7, '荣耀', '联想8', 9941, 8.8, 14, 'www.baidu.com', 70825, 7);
INSERT INTO `products` VALUES (8, 'vivo', '华为7', 9048, 0.0, 23, 'www.baidu.com', 35959, 8);
INSERT INTO `products` VALUES (9, 'oppo', '联想1', 571, 5.8, 25, 'www.baidu.com', 14705, 5);
INSERT INTO `products` VALUES (10, '三星', '荣耀2', 4074, 9.6, 71, 'www.baidu.com', 32350, 6);
INSERT INTO `products` VALUES (11, '联想', '红米4', 9300, 7.6, 79, 'www.baidu.com', 81830, NULL);
INSERT INTO `products` VALUES (12, '小米', 'oppo7', 1928, 7.1, 45, 'www.baidu.com', 25196, 2);
INSERT INTO `products` VALUES (13, '华为', '三星7', 6258, 1.3, 24, 'www.baidu.com', 60419, 100);
INSERT INTO `products` VALUES (14, '红米', '荣耀3', 557, 9.2, 30, 'www.baidu.com', 88519, 3);
INSERT INTO `products` VALUES (15, '天际', '三星7', 4120, 3.4, 14, 'www.baidu.com', 23466, NULL);
INSERT INTO `products` VALUES (16, '三星', '联想8', 7373, 5.7, 29, 'www.baidu.com', 85909, 6);
INSERT INTO `products` VALUES (17, '锤子', 'oppo6', 5446, 8.8, 19, 'www.baidu.com', 22496, 4);
INSERT INTO `products` VALUES (18, '锤子', 'oppo2', 3316, 8.9, 86, 'www.baidu.com', 52499, 4);
INSERT INTO `products` VALUES (19, '小米', '锤子8', 7176, 3.5, 66, 'www.baidu.com', 68613, 2);
INSERT INTO `products` VALUES (20, '小米', '天际9', 8701, 9.2, 7, 'www.baidu.com', 52188, 2);
INSERT INTO `products` VALUES (21, 'vivo', '三星6', 5485, 9.5, 50, 'www.baidu.com', 96557, 8);
INSERT INTO `products` VALUES (22, '联想', 'oppo8', 1126, 7.2, 7, 'www.baidu.com', 6352, NULL);
INSERT INTO `products` VALUES (23, '华为', '三星9', 4690, 3.9, 2, 'www.baidu.com', 93993, 100);
INSERT INTO `products` VALUES (24, '华为', 'oppo8', 2166, 8.6, 52, 'www.baidu.com', 37098, 100);
INSERT INTO `products` VALUES (25, '锤子', 'oppo9', 9211, 0.9, 11, 'www.baidu.com', 11715, 4);
INSERT INTO `products` VALUES (26, '天际', '华为1', 7369, 2.5, 17, 'www.baidu.com', 41919, NULL);
INSERT INTO `products` VALUES (27, '联想', '天际7', 7978, 5.0, 71, 'www.baidu.com', 24279, NULL);
INSERT INTO `products` VALUES (28, '红米', '荣耀6', 2085, 9.1, 50, 'www.baidu.com', 42722, 3);
INSERT INTO `products` VALUES (29, '小米', '三星5', 5076, 3.4, 98, 'www.baidu.com', 55275, 2);
INSERT INTO `products` VALUES (30, 'vivo', '锤子8', 1456, 4.3, 73, 'www.baidu.com', 31949, 8);
INSERT INTO `products` VALUES (31, '三星', '荣耀4', 7486, 0.3, 56, 'www.baidu.com', 70787, 6);
INSERT INTO `products` VALUES (32, '华为', '天际8', 763, 8.6, 6, 'www.baidu.com', 15001, 100);
INSERT INTO `products` VALUES (33, 'oppo', 'vivo2', 4835, 2.6, 91, 'www.baidu.com', 93741, 5);
INSERT INTO `products` VALUES (34, '天际', 'oppo0', 1041, 5.7, 55, 'www.baidu.com', 97856, NULL);
INSERT INTO `products` VALUES (35, '小米', 'vivo7', 4814, 6.5, 36, 'www.baidu.com', 1965, 2);
INSERT INTO `products` VALUES (36, 'vivo', '荣耀5', 5648, 7.8, 93, 'www.baidu.com', 72199, 8);
INSERT INTO `products` VALUES (37, '小米', '荣耀1', 2566, 3.0, 94, 'www.baidu.com', 28979, 2);
INSERT INTO `products` VALUES (38, 'oppo', '联想5', 8835, 8.7, 67, 'www.baidu.com', 12695, 5);
INSERT INTO `products` VALUES (39, '三星', '天际6', 2936, 1.7, 59, 'www.baidu.com', 40791, 6);
INSERT INTO `products` VALUES (40, '联想', '红米0', 3863, 0.7, 53, 'www.baidu.com', 84981, NULL);
INSERT INTO `products` VALUES (41, '小米', '天际1', 4778, 4.5, 54, 'www.baidu.com', 75097, 2);
INSERT INTO `products` VALUES (42, 'vivo', '小米1', 156, 5.2, 28, 'www.baidu.com', 65936, 8);
INSERT INTO `products` VALUES (43, '小米', '小米4', 5750, 7.1, 94, 'www.baidu.com', 48843, 2);
INSERT INTO `products` VALUES (44, '联想', '天际2', 2311, 2.7, 50, 'www.baidu.com', 99472, NULL);
INSERT INTO `products` VALUES (45, '小米', '天际0', 362, 2.2, 27, 'www.baidu.com', 59589, 2);
INSERT INTO `products` VALUES (46, 'vivo', '小米8', 4752, 6.2, 73, 'www.baidu.com', 7071, 8);
INSERT INTO `products` VALUES (47, 'oppo', '三星5', 8259, 1.9, 59, 'www.baidu.com', 39509, 5);
INSERT INTO `products` VALUES (48, '锤子', 'oppo5', 2711, 4.9, 12, 'www.baidu.com', 90788, 4);
INSERT INTO `products` VALUES (49, '锤子', '天际7', 3776, 5.4, 8, 'www.baidu.com', 47776, 4);
INSERT INTO `products` VALUES (50, '红米', '小米9', 1671, 9.9, 44, 'www.baidu.com', 36231, 3);
INSERT INTO `products` VALUES (51, '天际', '荣耀1', 8044, 5.7, 10, 'www.baidu.com', 93776, NULL);
INSERT INTO `products` VALUES (52, '锤子', 'oppo7', 4990, 1.5, 19, 'www.baidu.com', 60515, 4);
INSERT INTO `products` VALUES (53, 'vivo', '华为6', 4729, 4.1, 91, 'www.baidu.com', 2595, 8);
INSERT INTO `products` VALUES (54, '荣耀', '荣耀1', 4523, 1.7, 8, 'www.baidu.com', 15414, 7);
INSERT INTO `products` VALUES (55, '天际', '华为6', 6301, 7.7, 3, 'www.baidu.com', 46352, NULL);
INSERT INTO `products` VALUES (56, '红米', '联想3', 6655, 3.2, 53, 'www.baidu.com', 31214, 3);
INSERT INTO `products` VALUES (57, '三星', '联想3', 6675, 6.5, 58, 'www.baidu.com', 90353, 6);
INSERT INTO `products` VALUES (58, 'oppo', '小米3', 4504, 0.6, 23, 'www.baidu.com', 20894, 5);
INSERT INTO `products` VALUES (59, 'oppo', '联想1', 8035, 6.9, 37, 'www.baidu.com', 95393, 5);
INSERT INTO `products` VALUES (60, '华为', '天际4', 2578, 4.7, 49, 'www.baidu.com', 22375, 100);
INSERT INTO `products` VALUES (61, 'vivo', 'oppo1', 5150, 9.6, 26, 'www.baidu.com', 73408, 8);
INSERT INTO `products` VALUES (62, '天际', '荣耀0', 9259, 8.0, 62, 'www.baidu.com', 42455, NULL);
INSERT INTO `products` VALUES (63, '小米', '天际5', 1428, 1.6, 25, 'www.baidu.com', 79155, 2);
INSERT INTO `products` VALUES (64, 'vivo', '三星6', 35, 8.7, 54, 'www.baidu.com', 59100, 8);
INSERT INTO `products` VALUES (65, 'oppo', '锤子6', 7722, 1.4, 92, 'www.baidu.com', 71863, 5);
INSERT INTO `products` VALUES (66, '华为', '小米5', 8617, 0.6, 23, 'www.baidu.com', 81725, 100);
INSERT INTO `products` VALUES (67, '荣耀', '锤子8', 8431, 5.7, 14, 'www.baidu.com', 17796, 7);
INSERT INTO `products` VALUES (68, '小米', '荣耀2', 7896, 1.4, 73, 'www.baidu.com', 68067, 2);
INSERT INTO `products` VALUES (69, '锤子', 'oppo9', 4370, 1.3, 49, 'www.baidu.com', 7409, 4);
INSERT INTO `products` VALUES (70, '华为', 'vivo8', 1394, 7.3, 70, 'www.baidu.com', 20613, 100);
INSERT INTO `products` VALUES (71, '华为', '联想3', 7219, 9.9, 65, 'www.baidu.com', 64919, 100);
INSERT INTO `products` VALUES (72, '红米', 'vivo1', 4475, 6.8, 1, 'www.baidu.com', 87851, 3);
INSERT INTO `products` VALUES (73, '天际', '荣耀0', 9618, 1.6, 69, 'www.baidu.com', 37889, NULL);
INSERT INTO `products` VALUES (74, '荣耀', '三星8', 899, 3.6, 25, 'www.baidu.com', 32810, 7);
INSERT INTO `products` VALUES (75, '华为', '联想1', 3391, 3.9, 98, 'www.baidu.com', 41770, 100);
INSERT INTO `products` VALUES (76, '红米', 'oppo4', 6001, 1.8, 88, 'www.baidu.com', 76842, 3);
INSERT INTO `products` VALUES (77, '荣耀', 'oppo8', 3357, 4.5, 53, 'www.baidu.com', 35698, 7);
INSERT INTO `products` VALUES (78, '天际', '天际0', 8823, 4.3, 84, 'www.baidu.com', 80039, NULL);
INSERT INTO `products` VALUES (79, 'vivo', '红米0', 957, 7.7, 38, 'www.baidu.com', 9812, 8);
INSERT INTO `products` VALUES (80, '红米', '红米3', 2992, 5.2, 89, 'www.baidu.com', 58682, 3);
INSERT INTO `products` VALUES (81, '荣耀', '小米5', 3640, 4.5, 50, 'www.baidu.com', 82013, 7);
INSERT INTO `products` VALUES (82, 'vivo', '华为7', 9500, 0.5, 42, 'www.baidu.com', 58763, 8);
INSERT INTO `products` VALUES (83, '联想', 'vivo4', 9185, 6.8, 24, 'www.baidu.com', 26901, NULL);
INSERT INTO `products` VALUES (84, '荣耀', '联想0', 1641, 8.3, 31, 'www.baidu.com', 41423, 7);
INSERT INTO `products` VALUES (85, '联想', '红米4', 8374, 6.9, 30, NULL, 89009, NULL);
INSERT INTO `products` VALUES (86, '锤子', 'vivo2', 127, 5.7, 94, NULL, 85011, 4);
INSERT INTO `products` VALUES (87, 'oppo', '华为1', 8497, 0.8, 77, NULL, 17016, 5);
INSERT INTO `products` VALUES (88, 'oppo', '小米3', 7491, 8.5, 51, NULL, 35604, 5);
INSERT INTO `products` VALUES (89, 'vivo', '红米0', 8696, 7.9, 29, 'www.baidu.com', 70456, 8);
INSERT INTO `products` VALUES (90, 'oppo', '华为3', 2333, 2.7, 18, 'www.baidu.com', 93982, 5);
INSERT INTO `products` VALUES (91, '红米', '三星6', 6478, 4.3, 52, 'www.baidu.com', 1105, 3);
INSERT INTO `products` VALUES (92, '红米', '三星2', 8987, 6.4, 68, 'www.baidu.com', 49719, 3);
INSERT INTO `products` VALUES (93, '红米', '荣耀9', 110, 9.4, 87, 'www.baidu.com', 56316, 3);
INSERT INTO `products` VALUES (94, 'vivo', '联想8', 4555, 1.8, 24, 'www.baidu.com', 61195, 8);
INSERT INTO `products` VALUES (95, '红米', 'oppo7', 9573, 6.6, 66, 'www.baidu.com', 79421, 3);
INSERT INTO `products` VALUES (96, '荣耀', '红米4', 130, 2.9, 19, 'www.baidu.com', 12994, 7);
INSERT INTO `products` VALUES (97, '联想', 'vivo0', 7468, 5.6, 18, 'www.baidu.com', 40057, NULL);
INSERT INTO `products` VALUES (98, '联想', '联想2', 8652, 8.7, 69, 'www.baidu.com', 10539, NULL);
INSERT INTO `products` VALUES (99, '华为', '荣耀3', 3415, 7.6, 86, 'www.baidu.com', 29393, 100);
INSERT INTO `products` VALUES (100, '天际', '小米0', 5238, 4.4, 95, 'www.baidu.com', 3524, NULL);
INSERT INTO `products` VALUES (101, NULL, '三星nova', 8888, 5.4, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'why', '12345', '2021-12-16 16:55:16', '2021-12-16 16:55:16');
INSERT INTO `users` VALUES (2, 'kobe', '123', '2021-12-16 17:51:31', '2021-12-16 17:51:31');
INSERT INTO `users` VALUES (3, 'six', '12345', '2021-12-17 09:52:26', '2021-12-17 09:52:26');
INSERT INTO `users` VALUES (4, 'lilei', '12345', '2021-12-17 10:22:11', '2021-12-17 10:22:11');
INSERT INTO `users` VALUES (5, 'lucy', '827ccb0eea8a706c4c34a16891f84e7b', '2021-12-17 10:43:06', '2021-12-17 10:43:06');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
