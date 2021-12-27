# 将联合查询到的转换成对象（应用场景：一对多时）
SELECT 
	products.id id,products.title title,products.price price,
	JSON_OBJECT('id',brand.id,'name',brand.name,'website',brand.website) AS brand
FROM `products` 
LEFT JOIN `brand` ON products.brand_id = brand.id;


# 将我们查询到的多条数据组织成对象放入到数组中
SELECT 
	stu.id id,stu.name name,stu.age age,
	JSON_ARRAYAGG(JSON_OBJECT('id',cs.id,'name',cs.name,'price',cs.price)) AS courses
FROM `students` stu 
JOIN `students_select_courses` ssc ON stu.id = ssc.student_id
JOIN `courses` cs ON ssc.course_id = cs.id
GROUP BY stu.id;



























