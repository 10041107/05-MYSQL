-- DISTINCT

-- 중복되는 값을 제거한다.
SELECT 
	CATEGORY_CODE
  FROM tbl_menu
 ORDER BY category_code;
 
SELECT 
	DISTINCT CATEGORY_CODE
  FROM tbl_menu
 ORDER BY category_code;

SELECT 
	count(DISTINCT CATEGORY_CODE)
  FROM tbl_menu
 ORDER BY category_code;


-- NULL값을 포함한 열의 DISTINCT
SELECT
	REF_CATEGORY_CODE
  FROM tbl_category ;

SELECT
	DISTINCT REF_CATEGORY_CODE
  FROM tbl_category ;
  

-- 열이 여러개인 값의 중복 제거
SELECT DISTINCT
	category_code, 
	orderable_status
  FROM tbl_menu 
 ORDER BY category_code;
 
SELECT  
	category_code ,
	orderable_status 
  FROM tbl_menu 
 ORDER BY category_code;
  