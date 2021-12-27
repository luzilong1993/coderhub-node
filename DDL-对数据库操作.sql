# 查看所有的数据库
SHOW DATABASES;

# 选择某一个数据库
USE bili;

# 查看当前正在使用的数据库
SELECT DATABASE();


# 新建数据库
-- CREATE DATABASE douyu;

-- 如果不存在就创建
-- CREATE DATABASE IF NOT EXISTS douyu;
CREATE DATABASE IF NOT EXISTS huya DEFAULT CHARACTER SET utf8mb4
				COLLATE utf8mb4_0900_ai_ci;
				
# 删除数据库		
DROP DATABASE IF EXISTS douyu；;

# 修改数据库编码
ALTER DATABASE huya CHARACTER SET = utf8 
    COLLATE = utf8_unicode_ci;

