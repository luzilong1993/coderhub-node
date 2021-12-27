# 查看所有的表
SHOW TABLES;

# 新建表
CREATE TABLE IF NOT EXISTS `students` (
`name` VARCHAR(10) NOT NULL,
`age` INT,
`score` INT,
`height` DECIMAL(10,2),
`birthday` YEAR,
`phoneNum` VARCHAR(20) UNIQUE
);

# 删除表
DROP TABLE IF EXISTS `users`;

# 查看当前表的结构
DESC `students`;

# 查看创建表时的sql语句
SHOW CREATE TABLE `students`;

# 完整的创建表的语法
CREATE TABLE IF NOT EXISTS `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	`age` INT DEFAULT 0,
	`phoneNum` VARCHAR(20) UNIQUE DEFAULT '',
	`createTime` TIMESTAMP
);

# 修改表
## 1.修改表的名字
ALTER TABLE `user` RENAME TO `users`;

## 2.添加一个新的列
ALTER TABLE `users` ADD `updataTime` TIMESTAMP;

## 3.修改某一个字段的名称
ALTER TABLE `users` CHANGE `phoneNum` `telPhone` VARCHAR(20);

## 4.修改字段的类型
ALTER TABLE `users` MODIFY `name` VARCHAR(30);

## 5.删除某一个字段
ALTER TABLE `users` DROP `age`;

# 补充
## 根据一个表结构去创建另外一张表
CREATE TABLE `user1` LIKE `users`;
## 根据另外一个表中所有内容创建一个新的表
CREATE TABLE `user2` (SELECT * FROM `users`);