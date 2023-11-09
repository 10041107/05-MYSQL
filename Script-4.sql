/*
COMMIT
트렌지션 차링 처리되는 AQL명령문 중 하나로
트렌직션은 데이터베이스 작업의 논리적인 단위를 나타내며, 
여러 AQL문을 하나의 트랜직션으로 그룹화할 수 있으며
데이터 무결성을 보장하기 위해서 중요한 내용이다.

ROLLBACK
MYSQL에서 드렌지션 처리에 사용되는 SQL명령문 중 하나로 트랙직션은
데이터베이스의 작업의 논리적인 단위를 나타내며, 여러 SQL문을 하나의 트렌지션으로
그룹화할 수 있다. ROOLBACK을 사용하면 트챈지션 내에서 수행한 변경 사항을 취소하고
이전상태로 되돌릴 수 있다.

*/

SELECT * FROM tbl_menu;
-- AUTOCOMMIT을 활성화 시킴 // 커밋을 1로 활성화시킨다.
SET AUTOCOMMIT = 1;

-- COMMIT을 활성화시킴 (=AUTOCOMIT과 같음)
SET AUTOCOMMIT = ON;

-- AUTOCOMMIT을 비활성화시킴 
SET AUTOCOMMIT = 0;

-- AUTOCOMMIT을 비활성화시킴
SET AUTOCOMMIT = OFF;

-- @Transcrtion; //일련의 행위를 하나의 묶음으로 만들어서 작업이 잘 안될시 롤백하거나 되돌릴 수 있도록 함
-- 데이터 베이스의 상태를 변화시킬 수 있는 일련의 행위의 묶음을 transaction이라고 한다.
START TRANSACTION; -- 묶은 단위 (트렌지션: 데이터의 상태 변화를 일으키는 것) : 커밋을 하면 끝남.
SELECT * FROM  tbl_menu;
INSERT INTO tbl_menu values(NULL, "바나나해장국", 8500, 4, 'Y'); -- 바나나해장국 추가
UPDATE tbl_menu SET menu_name = "수정된메뉴" WHERE menu_code = 5; -- 5번 "수정된 메뉴"로 변경
DELETE FROM tbl_menu WHERE menu_code = 7; -- 7번 삭제

SELECT * FROM tbl_menu;

ROLLBACK; -- 이전으로 롤백

SELECT * FROM tbl_menu;






