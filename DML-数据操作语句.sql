# DML

## 插入语句

INSERT INTO `users` VALUES (111,'why','020-1233333','2020-11-11','2021-11-11');
INSERT INTO `users` (`name`,`telPhone`,`createTime`,`updataTime`) 
		VALUES ('kobe','020-218282','2020-10-11','2021-10-20');

INSERT INTO `users` (`name`,`telPhone`) 
		VALUES ('kobe','020-2182822');
		
INSERT INTO `users` (`name`,`telPhone`) 
		VALUES ('lilei','020-21828222');

INSERT INTO `users` (`name`,`telPhone`) 
		VALUES ('lili','020-21828121');
	
# 需求：createTime 和 updataTime 可以自动更新
ALTER TABLE `users` MODIFY `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `users` MODIFY `updataTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


# 删除数据
## 删除所有数据
DELETE FROM `users`;

## 删除符合条件的数据
DELETE FROM `users` WHERE id = 110;


# 跟新数据
UPDATE `users` SET `name` = 'lilei',`telPhone` = '010-2222222' WHERE `id` = 115;

