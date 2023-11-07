/*WHERE*/

-- 값이 같은 것을 조회하는 방법
SELECT 
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE , 
	ORDERABLE_STATUS
	FROM TBL_MENU
	WHERE orderable_status  = 'Y';
	

SELECT 
	MENU_NAME,
	MENU_PRICE,
	ORDERABLE_STATUS
	FROM tbl_menu
	WHERE menu_PRICE = 13000;
	
-- 같지 않은 상태를 조회하는 방법
SELECT 
	MENU_CODE,
	MENU_NAME,
	ORDERABLE_STATUS
	FROM TBL_MENU
	WHERE
	-- orderable_status () 'Y';
	ORDERABLE_STATUS != 'Y';
	

-- 가격이 20000원 이상인 메뉴를 조회해주세요
-- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순으로 정렬해주세요

SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
	FROM tbl_menu
	WHERE MENU_PRICE >= 20000 ORDER BY MENU_CODE DESC;

-- 가격이 5000 이상이면서 판매중인 제품을 조회
-- && = AND 로 사용 가능

SELECT 
 	MENU_CODE,
 	MENU_NAME,
 	MENU_PRICE,
 	ORDERABLE_STATUS
-- 	FROM tbl_menu
-- 	WHERE menu_price >=5000
-- 	ORDER BY orderable_status != 'Y';
  	FROM tbl_menu
 	WHERE menu_price >=5000
 	AND orderable_status = 'Y';
 
 -- 제품이 판매 중이거나 혹은 CATEGORY_CODE가 10인 목록 조히
 
 SELECT 
 	MENU_CODE,
 	MENU_NAME,
 	MENU_PRICE,
 	CATEGORY_CODE,
 	ORDERABLE_STATUS
 	FROM tbl_menu
 	WHERE orderable_status = 'Y'
 	OR CATEGORY_CODE = 10;
 
 -- 작동 순서: FROM(TBL_MENU에서) >> WHERE(조건식) >> SELECT(어디 카테고리를 불러올까) >> ORDER BY(이 기준점으로 정렬해라)
 
 SELECT *FROM tbl_menu;

SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE,
	CATEGORY_CODE,
	ORDERABLE_STATUS
	FROM tbl_menu
	WHERE category_code = 4
	OR menu_price  = 9000
	AND menu_code >10;


SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE,
	CATEGORY_CODE,
	ORDERABLE_STATUS
	FROM TBL_MENU
	WHERE MENU_PRICE >= 10000
	AND MENU_PRICE <= 25000
	ORDER BY MENU_PRICE;

-- SELECT *
-- 	FROM tbl_order
-- 	WHERE ORDER_DATE = '2023-11-07'
-- NOW();

SELECT 
	MENU_NAME,
	MENU_PRICE,
	CATEGORY_CODE
	FROM tbl_menu
	WHERE MENU_PRICE BETWEEN 10000 AND 25000;

-- 범위에 해당되지 않은 목록 조회
 SELECT
 menu_name,
 MENU-PRICE,
 CATEGORY_CODE
 FROM tbl_menu
 WHERE MENU_PRICE NOT BETWEEN 10000 AND 25000
 ORDER BY MENY_PRICE DESC;

SELECT 	
	MENU_NAME,
	MENU,PRICE,
	CATEGORY_CODE
	FROM tbl_menu
	WHERE MENU_NAME LIKE ;2%리조또%''
	ORDER BY MENU PRICE DESC;


SELECT 	
	MENU_NAME,
	MENU,PRICE,
	CATEGORY_CODE
	FROM tbl_menu
	WHERE MENU_NAME LIKE ;%마늘%''
	ORDER BY MENU PRICE DESC;


-- 가격이 5천원 이상이고 코드가 10인 녀석 중 갈치라는 이름이 포함된 메뉴를 조회해라
-- code, name, category code,price

SELECT 
	menu_code
	menu_name
	category_code
	FLRK

--ikk의 부정문
WHERE Menu_price > 5000
AND category_code = 10
AND menu_name NOT LIKE '%갈치%';
SELECT * FROM tbl_category tc ;

-- 함식, 주식(, 일식(6) 메뉴를 조회하자
SELECT 
menu_name , 
CATEGORY_code
FROM tbl_menu tm
WHERE CATEGORY_CODE = 5
OR CATEGORY_CODE = 6
OR CATEGORY_CODE = 4;

-- 포함된 값을 조회 IN()
SELECT 
menu_name , 
CATEGORY_code
FROM tbl_menu
WHERE CATEGORY_CODE IN (4,5,6);

-- 포함되지 않은 값을 조회 NOT IN()
SELECT 
menu_name , 
CATEGORY_code
FROM tbl_menu
WHERE CATEGORY_CODE NOT IN (4,5,6);

-- :: NULL을 값으로 취급하지 않기 때문에 NULL로 뭘 할수가 없음. NULL 선언하는 방법
SELECT 
	CATEGORY_CODE,
	CATEGORY_NAME,
	REF_CATEGORY_CODE
	FROM tbl_category
	WHERE REF_CATEGORY_CODE IS NULL;

-- NULL이 아닌 목록 조회
	SELECT 
	CATEGORY_CODE,
	CATEGORY_NAME,
	REF_CATEGORY_CODE
	FROM tbl_category
	WHERE REF_CATEGORY_CODE IS NOT NULL;
	
	
	
	
	
	


 
 
 
	



