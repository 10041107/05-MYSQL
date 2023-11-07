/* LIMIT */

SELECT
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
	FROM tbl_menu
	ORDER BY MENU_PRICE DESC;

-- LIMIT 몇번부터(0번이 시작), 몇개를 ;
SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
	FROM tbl_menu
	ORDER BY menu_code
	LIMIT 1,4;

-- LIMIT 최상위부터 개수만 제한할 시 하나만 작성하면 됨
SELECT 
	MENU_CODE,
	MENU_NAME,
	MENU_PRICE
	FROM tbl_menu
	ORDER BY MENU_PRICE DESC,
	MENU_NAME ASC
	LIMIT 5;

/*
USED_GOODS_BOARD와 USED_GOODS_REPLY 테이블에서
USED_GOODS_BOARD
2022년 10월에 작성된
게시글 제목,TITLE

USED_GOODS_REPLY
게시글 ID, BOARD_ID
댓글 ID, REPLY_ID
댓글 작성자 ID, WRITER_ID
댓글 내용, CONTENTS
댓글 작성일 CREATED_DATE
을 조회하는 SQL문을 작성해주세요.
결과는
댓글 작성일 CREATED_DATE
을 기준으로 오름차순 정렬해주시고,
댓글 작성일이 같다면
게시글 제목 TITLE
을 기준으로 오름차순 정렬해주세요.


=========================================

CAR_RENTAL_COMPANY_CAR 테이블에서
'네비게이션' 옵션이 포함된
자동차 리스트를 출력하는 SQL문을 작성해주세요.
CAR_ID
CAR_TYPE
DAILY_FEE	
OPTIONS
결과는
자동차 ID CAR_ID
를 기준으로 내림차순 DESC
 정렬해주세요.
 
 
 ========================================
 
 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서
 대여 시작일이 2022년 9월에 속하는 대여 기록에 대해서
 대여 기간이 30일 이상이면 '장기 대여'
 그렇지 않으면 '단기 대여'
 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가하여
 대여기록을 출력하는 SQL문을 작성해주세요.
 결과는 대여 기록 ID HISTORY_ID
 를 기준으로 내림차순 DESC
  정렬해주세요.
 
SELECT
    SUBSTRING(START_DATE, 1, 10) AS CREATED_DATE
    
WHERE SUBSTRING(START_DATE, 1, 10) BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY CREATED_DATE DESC, ugb.TITLE DESC;



	


