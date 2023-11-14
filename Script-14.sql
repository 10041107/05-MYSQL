CREATE VIEW hansic AS
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
FROM tbl_menu tm 
WHERE category_code = 4;

SELECT * FROM hansic;
