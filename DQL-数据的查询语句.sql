# 准备数据库表

CREATE TABLE IF NOT EXISTS `products`(
 `id` INT PRIMARY KEY AUTO_INCREMENT,
 `brand` VARCHAR(20),
 `title` VARCHAR(100) NOT NULL,
 `price` DOUBLE NOT NULL,
 `score` DECIMAL(2,1),
 `voteCnt` INT,
 `url` VARCHAR(100),
 `pid` INT
);

# 1.基本查询
## 查询表中所有字段
SELECT * FROM `products`;

## 查询指定字段
SELECT title,price FROM `products`;

## 对字段结果起别名
SELECT title AS phoneTitle,price AS currentPrice FROM `products`;


# 2.where条件
## 2.1 条件判断语句
# 案例：价格小于1000的手机
SELECT * FROM `products` WHERE price < 1000;

# 案例2：价格等于899的手机
SELECT * FROM `products` WHERE price = 899;

# 案例3：价格不等于899的手机
SELECT * FROM `products` WHERE price != 899;
SELECT * FROM `products` WHERE price <> 899;

# 案例4: 查询品牌是华为的手机
SELECT * FROM `products` WHERE brand = '华为';

## 2.2 逻辑运算语句
# 案例1：价格大于等于1000，小于2000的手机
SELECT * FROM `products` WHERE price >= 1000 AND price < 2000;
SELECT * FROM `products` WHERE price >= 1000 && price < 2000;
SELECT * FROM `products` WHERE price BETWEEN 1000 AND 2000; # 包含等于

## 案例2: 价格在5000以上，或者品牌是华为的手机
SELECT * FROM `products` WHERE price >= 5000 OR brand = '华为';

# 将某些值设置为null
UPDATE `products` SET url = NULL WHERE id >= 85 AND id <= 88;
# 查询某些值为null
SELECT * FROM `products` WHERE url IS NULL;
# 查询某些值不为null
SELECT * FROM `products` WHERE url IS NOT NULL;

# 2.3.模糊查询
SELECT * FROM `products` WHERE title LIKE '%v%';

SELECT * FROM `products` WHERE title LIKE '_p%';

# 2.4.IN表示取多个值中一个即可
SELECT * FROM `products` WHERE brand = '华为' OR brand = '小米';
SELECT * FROM `products` WHERE brand IN ('华为','小米','三星');

# 3.查询结果排序
SELECT * FROM `products` WHERE brand IN ('华为','小米','三星') ORDER BY price ASC,score DESC;

# 4.分页查询
# 4.1 LIMIT OFFSET
SELECT * FROM `products` LIMIT 20 OFFSET 0;
SELECT * FROM `products` LIMIT 20 OFFSET 20;
## 4.2 LIMIT
SELECT * FROM `products` LIMIT 0,20;



