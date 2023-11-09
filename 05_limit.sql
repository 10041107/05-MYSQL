/* LIMIT */
-- 출력 값을 제한함

SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
  FROM TBL_MENU
 ORDER BY menu_price DESC;

SELECT
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu 
 ORDER BY menu_code
 LIMIT 6,3;

SELECT 
	MENU_CODE,
	menu_name, 
	MENU_PRICE
  FROM tbl_menu  
 ORDER BY 
 	menu_price DESC,
    menu_name ASC
 LIMIT 5;

 
