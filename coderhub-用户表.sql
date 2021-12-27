CREATE TABLE IF NOT EXISTS `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL UNIQUE,
	`password` VARCHAR(20) NOT NULL,
	`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `users` MODIFY `password` VARCHAR(40);


CREATE TABLE IF NOT EXISTS `moment`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`content` VARCHAR(1000) NOT NULL,
	`user_id` INT NOT NULL,
	`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO moment (content,user_id) VALUES (?,?);

SELECT * FROM moment WHERE id = ?;

SELECT
  m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	JSON_OBJECT('id',u.id,'name',u.name) user
	FROM moment m
	LEFT JOIN users u ON m.user_id = u.id
	WHERE m.id = 1;
	
INSERT INTO moment (content,user_id) VALUES ('我可以微笑着听你说你们的故事，但真的打不起笑脸听你说你们的关系。',1);

INSERT INTO moment (content,user_id) VALUES ('有人说，青春仿佛是朵素洁的昙花，来不及铺张、来不及遐思，甚至来不及弥补欠缺和瑕庛，就那么匆匆地谢了。',2);
INSERT INTO moment (content,user_id) VALUES ('多少次又多少次，回忆把生活划成一个圈，而我们在原地转了无数次，无法解脱。总是希望回到最初相识的地点，如果能够再一次选择的话，以为可以爱得更单纯。',3);

INSERT INTO moment (content,user_id) VALUES ('人生就像一座山，重要的不是它的高低，而在于灵秀；人生就像一场雨，重要的不是它的大小，而在于及时。',4);

INSERT INTO moment (content,user_id) VALUES ('想洗澡吗？不要到外面等待下雨；想成功吗？不要空等机遇的到来。',5);
INSERT INTO moment (content,user_id) VALUES ('因为爱心，流浪的人们才能重返家园；因为爱心，疲惫的灵魂才能活力如初。渴望爱心，如同星光渴望彼此辉映；渴望爱心，如同世纪之歌渴望永远被唱下去。',1);


INSERT INTO moment (content,user_id) VALUES ('放开你，不是因为我不爱你，是因为我太爱你',2);

INSERT INTO moment (content,user_id) VALUES ('如果爱情只是路过，又何必到此一游。',3);
INSERT INTO moment (content,user_id) VALUES ('母爱是一缕阳光，让你的心灵即便在寒冷的冬天也能感受到温暖如春；母爱是一泓清泉，让你的情感即使蒙上岁月的风尘仍然清澈澄净。',3);


INSERT INTO moment (content,user_id) VALUES ('爱是一盏灯，黑暗中照亮前行的远方；爱是一首诗，冰冷中温暖渴求的心房；爱是夏日的风，是冬日的阳，是春日的雨，是秋日的果。',4);

INSERT INTO moment (content,user_id) VALUES ('有一种爱，明明是深爱，却说不出来；有一种爱，明明想放弃，却无法放弃；有一种爱，明知是煎熬，却又躱不开；有一种爱，明知无前路，心却早已收不回来。',2);
INSERT INTO moment (content,user_id) VALUES ('听见某个名字，想起某些事情，这个城市安静的让人心颤。',3);


INSERT INTO moment (content,user_id) VALUES ('我可以微笑着听你说你们的故事，但真的打不起笑脸听你说你们的关系。',1);

INSERT INTO moment (content,user_id) VALUES ('有人说，青春仿佛是朵素洁的昙花，来不及铺张、来不及遐思，甚至来不及弥补欠缺和瑕庛，就那么匆匆地谢了。',2);
INSERT INTO moment (content,user_id) VALUES ('多少次又多少次，回忆把生活划成一个圈，而我们在原地转了无数次，无法解脱。总是希望回到最初相识的地点，如果能够再一次选择的话，以为可以爱得更单纯。',3);


SELECT
  m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
	JSON_OBJECT('id',u.id,'name',u.name) author,
	(SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id) commentCount
	FROM moment m
	LEFT JOIN users u ON m.user_id = u.id
	LIMIT 0,10;
	
	
	SELECT * FROM moment WHERE id = ? AND user_id = ?;
	
	UPDATE moment SET content = ? WHERE id = ?;
	
	
	
# 评论表
CREATE TABLE IF NOT EXISTS `comment` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`content` VARCHAR(1000) NOT NULL,
`moment_id` INT NOT NULL,
`user_id` INT NOT NULL,
`comment_id` INT DEFAULT NULL,
`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(comment_id) REFERENCES comment(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO comment (content,moment_id,user_id) VALUES (?, ?, ?);


SELECT
  m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
  JSON_OBJECT('id',u.id,'name',u.name) author,
	JSON_ARRAYAGG(
	 JSON_OBJECT('id',c.id,'content',c.content,'commentId',c.comment_id,'createTime',c.createAt,
	    'user',JSON_OBJECT('id',cu.id,'name',cu.name))
	) comments
  FROM moment m
  LEFT JOIN users u ON m.user_id = u.id
	LEFT JOIN comment c ON c.moment_id = m.id
	LEFT JOIN users cu ON c.user_id = cu.id
  WHERE m.id = 2;




# 创建标签表
CREATE TABLE IF NOT EXISTS `label`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL UNIQUE,
`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

# 标签关系表
CREATE TABLE IF NOT EXISTS `moment_label`(
 `moment_id` INT NOT NULL,
 `label_id` INT NOT NULL,
 `createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(moment_id,label_id),
	FOREIGN KEY (moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE CASCADE ON UPDATE CASCADE
);


SELECT 
	m.id id,m.content content, m.createAt createTime, m.updateAt updateTime,
	JSON_OBJECT('id', u.id,'name', u.name) author,
	(SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id) commentCount,
	(SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id = m.id) labelCount
FROM moment m
LEFT JOIN users u ON m.user_id = u.id
LIMIT 0,10;



SELECT
        m.id id,m.content content,m.createAt createTime,m.updateAt updateTime,
				JSON_OBJECT('id',u.id,'name',u.name,'avatarUrl',u.avatar_url) author,
				
					IF(COUNT(l.id),JSON_ARRAYAGG(
						JSON_OBJECT('id',l.id,'name',l.name)
					),NULL) labels,
					(SELECT IF(COUNT(c.id), JSON_ARRAYAGG(
           JSON_OBJECT('id',c.id,'content',c.content,'commentId',c.comment_id,'createTime',c.createAt,
              'user',JSON_OBJECT('id',cu.id,'name',cu.name,'avatarUrl',cu.avatar_url))
          ) ,NULL) FROM comment c LEFT JOIN users cu ON c.user_id = cu.id WHERE m.id = c.moment_id) comments,
					(SELECT JSON_ARRAYAGG(CONCAT('http://localhost:8888/moment/images',file.filename)) FROM file WHERE m.id = moment_id) images
					
        FROM moment m
        LEFT JOIN users u ON m.user_id = u.id
        
					LEFT JOIN moment_label ml ON m.id = ml.moment_id 
					LEFT JOIN label l ON ml.label_id = l.id
        WHERE m.id = 2
				GROUP BY m.id;



# 头像表
CREATE TABLE IF NOT EXISTS `avatar` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`filename` VARCHAR(100) NOT NULL UNIQUE,
	`mimetype` VARCHAR(30),
	`size` INT,
	`user_id` INT,
	`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


# 用户表添加字段

ALTER TABLE `users` ADD `avatar_url` VARCHAR(200);

# 文件表
CREATE TABLE IF NOT EXISTS `file` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`filename` VARCHAR(100) NOT NULL UNIQUE,
	`mimetype` VARCHAR(30),
	`size` INT,
	`moment_id` INT,
	`user_id` INT,
	
	`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE
);















