/* group by */

SELECT 
	category_code
  FROM tbl_menu 
 GROUP BY category_code; 

SELECT 
	DISTINCT category_code
-- 	count() 
  FROM tbl_menu ;
 GROUP BY category_code; 
 

SELECT 
	category_code,
	count(*) 
  FROM tbl_menu 
 GROUP BY category_code; 

-- sum()
SELECT 
	category_code ,
 	menu_price  
  FROM tbl_menu;

SELECT 
	category_code ,
	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code;
 
-- avg()함수
SELECT 
	category_code,
	avg(menu_price)
  FROM tbl_menu
 GROUP BY category_code;

-- 다중열 묶음
SELECT 
	category_code,
	menu_price ,
	count(*)
  FROM tbl_menu
 GROUP BY category_code , menu_price;

-- 그룹에 대한 조건을 걸때 having을 사용한다.
SELECT 
	category_code,
	count(*) 
  FROM tbl_menu 
  JOIN tbl_category 
 WHERE menu_name NOT IN ('과메기커틀릿')
 GROUP BY category_code 
HAVING category_code BETWEEN 5 AND 8;

-- Rollup 
SELECT 
	category_code,
	orderable_status ,
	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code, orderable_status  
 WITH ROLLUP;



