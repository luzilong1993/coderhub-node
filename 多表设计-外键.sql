# 1.创建brand的表
CREATE TABLE IF NOT EXISTS `brand`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	`website` VARCHAR(100),
	`phoneRank` INT
)


INSERT INTO `brand` (name,website,phoneRank) VALUES ('华为','www.huawei.com',2);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('小米','www.xiaomi.com',3);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('红米','www.hongmi.com',4);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('锤子','www.chuizi.com',5);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('oppo','www.oppo.com',10);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('三星','www.sanxing.com',30);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('荣耀','www.rongyao.com',11);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('vivo','www.vivo.com',23);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('天际','www.tianji.com',1000);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('联想','www.lianxiang.com',101);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('京东','www.jingdong.com',8);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('谷歌','www.google.com',9);

# 2.给products创建外键约束
-- 	添加一个brand_id字段
ALTER TABLE `products` ADD `brand_id` INT;

-- 修改brand_id为外键
ALTER TABLE `products` ADD FOREIGN KEY(brand_id) REFERENCES brand(id);


-- 设置brand_id的值

UPDATE `products` SET `brand_id` = 1 WHERE `brand` = '华为';
UPDATE `products` SET `brand_id` = 2 WHERE `brand` = '小米';
UPDATE `products` SET `brand_id` = 3 WHERE `brand` = '红米';
UPDATE `products` SET `brand_id` = 4 WHERE `brand` = '锤子';
UPDATE `products` SET `brand_id` = 5 WHERE `brand` = 'oppo';
UPDATE `products` SET `brand_id` = 6 WHERE `brand` = '三星';
UPDATE `products` SET `brand_id` = 7 WHERE `brand` = '荣耀';
UPDATE `products` SET `brand_id` = 8 WHERE `brand` = 'vivo';


# 3.修改和删除外键引用的id
UPDATE `brand` SET `id` = 100 WHERE `id` = 1;

# 4.修改原来的brand_id关联外键时的action
## 4.1获取到目前的外键的名称
SHOW CREATE TABLE `products`;

-- CREATE TABLE `products` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `brand` varchar(20) DEFAULT NULL,
--   `title` varchar(100) NOT NULL,
--   `price` double NOT NULL,
--   `score` decimal(2,1) DEFAULT NULL,
--   `voteCnt` int DEFAULT NULL,
--   `url` varchar(100) DEFAULT NULL,
--   `pid` int DEFAULT NULL,
--   `brand_id` int DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `brand_id` (`brand_id`),
--   CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

# 4.2根据名称将外键删除
ALTER TABLE `products` DROP FOREIGN KEY products_ibfk_1;

# 4.3重新添加外键约束
ALTER TABLE `products` ADD FOREIGN KEY (brand_id) REFERENCES brand(id)
																						ON UPDATE CASCADE
																						ON DELETE RESTRICT;








