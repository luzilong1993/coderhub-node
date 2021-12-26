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
				JSON_OBJECT('id',u.id,'name',u.name) author,
				
					IF(COUNT(l.id),JSON_ARRAYAGG(
						JSON_OBJECT('id',l.id,'name',l.name)
					),NULL) labels,
					(SELECT IF(COUNT(c.id), JSON_ARRAYAGG(
           JSON_OBJECT('id',c.id,'content',c.content,'commentId',c.comment_id,'createTime',c.createAt,
              'user',JSON_OBJECT('id',cu.id,'name',cu.name))
          ) ,NULL) FROM comment c LEFT JOIN users cu ON c.user_id = cu.id WHERE m.id = c.moment_id) comments
        FROM moment m
        LEFT JOIN users u ON m.user_id = u.id
        
					LEFT JOIN moment_label ml ON m.id = ml.moment_id 
					LEFT JOIN label l ON ml.label_id = l.id
        WHERE m.id = 2
				GROUP BY m.id;
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				