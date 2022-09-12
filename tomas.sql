/*
 Navicat Premium Data Transfer

 Source Server         : MyProject
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : tomas

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 11/09/2022 19:52:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `views` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_delete` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_87bb15395540ae06337a486a77a` (`user_id`),
  CONSTRAINT `FK_87bb15395540ae06337a486a77a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for articles_tags_rel
-- ----------------------------
DROP TABLE IF EXISTS `articles_tags_rel`;
CREATE TABLE `articles_tags_rel` (
  `tag_id` int NOT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`article_id`),
  KEY `IDX_a917db0815973ab2d6fdc9dcbf` (`tag_id`),
  KEY `IDX_95184f5f919de5eb71fe23dbc3` (`article_id`),
  CONSTRAINT `FK_95184f5f919de5eb71fe23dbc3d` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `FK_a917db0815973ab2d6fdc9dcbf1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of articles_tags_rel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4c675567d2a58f0b07cef09c13d` (`user_id`),
  KEY `FK_e9b498cca509147e73808f9e593` (`article_id`),
  CONSTRAINT `FK_4c675567d2a58f0b07cef09c13d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_e9b498cca509147e73808f9e593` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `follow_count` int NOT NULL,
  `article_count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tags_users_rel
-- ----------------------------
DROP TABLE IF EXISTS `tags_users_rel`;
CREATE TABLE `tags_users_rel` (
  `tag_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`user_id`),
  KEY `IDX_39f2ccf9937fc026a7679dd2e5` (`tag_id`),
  KEY `IDX_17d88c98ecd03d87737d4b4227` (`user_id`),
  CONSTRAINT `FK_17d88c98ecd03d87737d4b42271` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_39f2ccf9937fc026a7679dd2e5a` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tags_users_rel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_auths
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identity_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `credential` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4a4582307bc3a80b309a207adb6` (`user_id`),
  CONSTRAINT `FK_4a4582307bc3a80b309a207adb6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_auths
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `introduce` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
