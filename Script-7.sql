
-- root계정으로 실행해야 한다.
SELECT @@global.sql_mode;
SET GLOBAL sql_mode = ' ';

select * from tb2;

/*drop*/
-- 테이블을 삭제하기 위한 구문
-- if exists를 적용