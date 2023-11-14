/*
TRIGGER
트리거는 사전적 의미로 방아쇠를 당기다는 뜻을 가지고 있다.
mysql에서 트리거는 테이블에서 어떤 이벤트가 발생했을 때, 실행하고자 하는
작업들을 자동으로 수행할 수 있도록 미리 설정하는 기능이다.
*/
-- 트리거와 프로시절을 시작하기 전 super권한을 가진 계정이 필요하다. (로컬호스트에서 실행함)
-- GRANT superon *.* TO 'menu'@'%'


-- Delimiter
/*
 * 구분자를 정의하는 명령어로 Trigger와 proceduer와 같은 것을 정의하게 된다.
 * 내부에서 프로그램 종료부인 ;(구분자)를 추가하게 되는데 이때 정상적으로 동작하지 않는 문제가 발생하여
 * 구분자를 ;에서 다른 것으로 변경 처리하고 내부 기능을 정의할 수 있도록 하기 위해서 사용한다. 
 */
/*행 트리거
테이블 안에 영향을 받는 각각의 행에 대하여 실행한다.
OLD = 변경 전의 데이터로 DELETE 또는 update로 변경되기 전의 데이터를 의미한다.
NEW = 변경 후 데이터로 insert또는 update로 변경된 데이터를 의미한다.

OLD: insert는 변경 전의 데이터가 아니기 때문에 old에서 감지를 할 수 없다.
NEW : delete의 경우 변경 후의 값이 존재하지 않기 때문에 new에서 조회할 수 없다.

AFTER : 쿼리 수행 이후
BEFORE : 쿼리 이벤트 동작 이후

INSERT : 등록
UPDATE : 변경
DELETE : 삭제
*/

delimiter $$
CREATE TRIGGER t_order_nemu  -- 트리거의 이름
AFTER INSERT ON tbl_order -- ( after | before , insert | update | delete ). 어느 시점에 동작되는 트리거인지 표기
FOR EACH ROW
BEGIN 
	INSERT INTO tbl_order_menu (order_code, menu_code, order_amount)
	VALUES (NEW.order_code, 2, 10000);  -- . = this와 유사. NEW. = 새로운것을 작성. this의 order_code)
END; $$
delimiter ;

SHOW TRIGGERs;



-- 테이블에 날자를 넣기 위해서 변경함
-- ALTER TABLE tbl_order 
-- MODIFY COLUMN order_date date;
-- 
-- ALTER TABLE tbl_order 
-- MODIFY COLUMN order_time date;

INSERT INTO tbl_order
VALUES (NULL, current_date(), current_time(), 10000);

SELECT * FROM tbl_order_menu;

-- 트리거 삭제
DROP TRIGGER t_order_nemu;


