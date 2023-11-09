/* join */

-- inner join
-- on은 테이블간의 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다. 
SELECT 
	a.menu_name ,
	b.category_name
  FROM tbl_menu as a
--   INNER JOIN tbl_category b on(a.category_code = b.category_code);
  JOIN tbl_category as b on (a.category_code = b.category_code);

-- Right join
SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- cross join
SELECT 
	b.category_name,
    a.menu_name
FROM 
    tbl_category b
CROSS JOIN  tbl_menu a;

-- outer join 

SELECT
	a.menu_name,
	b.category_name
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
  WHERE a.menu_name IS NULL;
 
 
-- self join
SELECT
	b.category_code AS 'b의 code',
	a.category_code AS 'a의 code',
	a.category_name , 
	b.category_name 
  FROM tbl_category a
  JOIN tbl_category b ON (a.category_code = b.ref_category_code);
SELECT * FROM tbl_category ;