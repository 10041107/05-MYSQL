/* 서브쿼리 */
-- query

SELECT
	menu_code,
	menu_price,
	menu_name,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE category_code = (
 		SELECT
			category_code
		  FROM tbl_menu
	 	 WHERE menu_name = '민트미역국');

-- 가장 많은 메뉴가 포함된 카테고리
-- 서브쿼리
SELECT 
	category_code,
	count(*) 
  FROM tbl_menu
 GROUP BY category_code;

-- 
SELECT max(menu_price) FROM tbl_menu;

SELECT 
	max(count)
  FROM (
  	SELECT
  		count(*) AS 'count'
  	  FROM tbl_menu
  	 GROUP BY category_code) AS conutMenu;
 
 -- 카테고리 평균 가격보다 높은 가격의 메뉴 조회
 SELECT 
 	menu_code,
 	menu_name,
 	menu_price,
 	category_code,
 	orderable_status
   FROM tbl_menu a
  WHERE menu_price >(
  			SELECT
  				avg(menu_price)
  			  FROM tbl_menu );
  			  
SELECT 
    category_code
  FROM tbl_category  a
 WHERE EXISTS (
 	SELECT 
 		1
 	  FROM tbl_menu b
 	 WHERE b.category_code = a.category_code 
 );


-- common table 
WITH menucate AS (
	SELECT 
		a.menu_name,
		b.category_name AS cname
	  FROM tbl_menu a
	  JOIN tbl_category b ON (a.category_code = b.category_code)
)
SELECT 
	cname
  FROM menucate
 GROUP BY cname;
