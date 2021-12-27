# 1.聚合函数的使用
## 1.1求所有手机价格的总和
SELECT SUM(price) totalPrice FROM `products`;
### 求一下华为手机总价格的总和
SELECT SUM(price) FROM `products` WHERE `brand` = '华为';

### 求华为手机价格平均价
SELECT AVG(price) FROM `products` WHERE `brand` = '华为';

## 最高价格和最低价格
SELECT MAX(price) FROM `products` WHERE `brand` = '华为';
SELECT MIN(price) FROM `products` WHERE `brand` = '华为';

## 华为手机的个数
SELECT COUNT(*) FROM `products` WHERE `brand` = '华为';

SELECT COUNT(url) FROM `products` WHERE `brand` = '华为';
# 去除重复
SELECT COUNT(DISTINCT price) FROM `products`;


# 2. GROUP BY使用
SELECT brand,AVG(price),COUNT(*),AVG(score) FROM `products` GROUP BY brand;


# 3. 品牌里面平均价格大于5000的手机使用having
SELECT brand,AVG(price) avgPrice,COUNT(*),AVG(score) FROM `products` GROUP BY brand HAVING avgPrice > 5000;

# 4需求：求score大于7.5分的手机的平均价格
SELECT AVG(price) FROM `products` WHERE score > 7.5;
# 升级:score大于7.5分的手机进行品牌分类，并算出平均价格
SELECT brand, AVG(price) FROM `products` WHERE score > 7.5 GROUP BY brand;