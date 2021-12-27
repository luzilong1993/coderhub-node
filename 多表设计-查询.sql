# 1.获取到的是笛卡尔乘积
SELECT * FROM `products`,`brand`;
# 获取到的笛卡尔乘积进行筛选
SELECT * FROM `products`,`brand` WHERE products.brand_id = brand.id;

# 左连接
# 2.1查询所有的手机（包括没有品牌的手机）
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id;
# 2.2查询没有对应品牌数据的手机
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE brand.id IS NULL;

# 右连接
# 3.1查询所有的品牌以及对应的手机数据（没有对应的手机，品牌也显示出来）
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id;
# 3.2查询没有对应手机品牌的信息
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL;

# 4.内联接
SELECT * FROM `products` JOIN `brand` ON products.brand_id = brand.id;
SELECT * FROM `products` JOIN `brand` ON products.brand_id = brand.id WHERE price = 4884;

# 5.全联接
# mysql 不支持full join
-- SELECT * FROM `products` FULL JOIN `brand` ON products.brand_id = brand.id;

(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id) 
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id)

(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE brand.id IS NULL) 
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL)