/* CAST Funtionns
 * 
 * 명시적 형변환 (Explicit Conversion)
 * cast (expression as 데이터 형식[ (길이)]
 * convert (expression, 데이터 형식 [(길이)]
 * 데이터 형식으로 가능한 것은 Binary, Chay, Date, Datetime, decimal
 * json, Signed Integer, Time, unsigned integer등이 있다.
 */

SELECT avg(menu_price) FROM tbl_menu;
SELECT CAST (avg(menu_price), signed integer)AS '평군가격' FROM tbl_menu;
SELECT CONVERT  (avg(menu_price), signed integer)AS '평군가격' FROM tbl_menu;

SELECT CAST ('2023$05$30' AS date);
SELECT CAST ('2023/05/30' AS date);
SELECT CAST ('2023@05@30' AS date);

SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that 
SQL Error [1584] [42000]: Incorrect parameters in the call to stored function `CAST`