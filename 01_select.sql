-- sql의 기본 select 구문
select MENU_NAME from TBL_MENU;

-- 포매팅을 통해 보기 좋은 형태로 출력함
SELECT 
	menu_code ,
	menu_name ,
	menu_price 
  FROM tbl_menu;

-- CODE,이름, 가격, STATUS(상태), 카테고리를 조회해주세요
SELECT 
	menu_code ,
	menu_name ,
	menu_price ,
	category_code,
	orderable_status
  FROM tbl_menu;
 

-- *을 이용하여 모든 컬럼을 조회함
select 
	*
  from TBL_MENU;
 
 -- 연산을 바로 실행함
select 6 +3;
SELECT 6*3;

-- 내장 함수를 사용함
SELECT NOW(); 
select CONCAT('홍.','         ','길동');
-- 별칭을 지정함
select CONCAT('홍.','         ','길동') as 'NAME';

 
 