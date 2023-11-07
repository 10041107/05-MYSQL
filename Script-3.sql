-- DISTINCT : 중복되는 값을 제거한다.

SELECT 
	CATEGORY_CODE
	FROM tbl_menu
	ORDER BY category_code;

-- 
SELECT 
	DISTINCT CATEGORY_CODE
	FROM tbl_menu
	ORDER BY category_code;
	
-- 
SELECT 
	COUNT(DISTINCT CATEGORY_CODE)
	FROM tbl_menu
	ORDER BY category_code;

-- NULL값을 포함한 열의 DISTINCT
SELECT 
	REF_CATEGORY_CODE
	FROM tbl_category;

SELECT 
	DISTINCT REF_CATEGORY_CODE
	FROM tbl_category;

-- 열이 여러개인 값의 중복 제거
SELECT DISTINCT 
	category_code,
	ORDERABLE_STATUS
	FROM tbl_menu
	ORDER BY category_code;

-- DIFTINCT가 없으면 중복값도 모두 표기됨
SELECT
	category_code,
	ORDERABLE_STATUS
	FROM tbl_menu
	ORDER BY category_code;

