/* DME (data Manipulation Language)

INSERT, UPDATE, DELETE, select(dql)
데이터 조작언어, 테이블에 값을 사빕하거나, 수정하거나, 삭제하거나, 조회하는 언어 */

-- 컬럼을 기술하지 않는 경우
-- 대상 TABLE에 컬럼 순서를 따라간다
-- 값을 등록하는 경우 아래의 내용을 주의해야 한다.
-- 1. 데이터 타입 ex.varchar(8)
-- 					case 1 : column(varchat(8)) = 10 <=숫자를 넣는 경우
-- 					case 2 : column(varchat(8)) = "8자리 이상의 문자를 넣는 경우"
-- 2. 제약 조건
-- 제약 조건에 위배되는 값은 넣을 수 없다. (제약조건 종류 이후 확인)

INSERT INTO tbl_menu
VALUES (
	NULL, -- menu_code // 오토인크리먼트가 설정된 상태. 위에 menu_code만 등록하고 null값을 부여하지 않음: 오류남 = 대입할 값의 개수가 맞지 않아서
	'바나나해장국', -- menu_name
	8500, -- menu_price
	4, -- category_code
	'Y' -- orderable_status
	);

-- 아래와 같이 값을 추가해서 넣는 것도 가능하다.
-- 단 자주 사용하지는 않는다.
INSERT INTO tbl_menu  VALUES(
   NULL, -- menu_code
   '순대국밥', -- menu_name
   8500, -- menu_price
   (SELECT category_code FROM tbl_category WHERE category_name = '한식'), -- status
   'Y'   
);

-- 컬럼을 기술하는 경우
-- 

-- 포함한다 어디에 (이름) 값을 ( 뭐를 );
INSERT INTO tbl_menu
( /*여기가 생략됨*/
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
) VALUES (
	NULL, -- menu_code // 오토인크리먼트가 설정된 상태. 위에 menu_code만 등록하고 null값을 부여하지 않음: 오류남 = 대입할 값의 개수가 맞지 않아서
	'바나나해장국', -- menu_name
	8500, -- menu_price
	4, -- category_code
	'Y' -- orderable_status
	);

-- 컬럼의 순서가 변경되는 경우
-- 순서에 맞춰주면 된다

INSERT INTO tbl_menu
(
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
) -- 여기까지 생략됨

INSERT INTO tbl_menu
VALUES (
	NULL, -- menu_code // 오토인크리먼트가 설정된 상태. 위에 menu_code만 등록하고 null값을 부여하지 않음: 오류남 = 대입할 값의 개수가 맞지 않아서
	'바나나해장국', -- menu_name
	8500, -- menu_price
	4, -- category_code
	'Y' -- orderable_status
	);

-- 값을 한번에 여러개 등록하는 경우
-- value 뒤에 (), 를 추가로 기술하면 된다
INSERT INTO tbl_menu
VALUES
	(NULL, '참치맛아이스크림', 1700, 12, 'Y'),
	(NULL, '멸치맛아이스크림', 1500, 11, 'Y'),
	(NULL, '소시지맛커피', 2500, 8, 'Y');
	
	
-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다
-- 테이블의 전체 행 갯수는 변화가 없다
SELECT
	menu_code,
	category_code
	FROM tbl_menu
	WHERE menu_name = '바나나해장국';

-- UPDATE 구문
UPDATE tbl_menu 
SET menu_name = "델몬트바나나"
WHERE menu_name ="바나나해장국";

ROLLBACK;

-- WHERE조건이 없으면 모든 값이 바뀌니 주의


SELECT
	*
FROM  tbl_menu
WHERE menu_name = "델몬트바나나";


SELECT * FROM tbl_menu;

-- update조건에서 subquery사용하기
UPDATE tbl_menu 
SET category_code = 6
WHERE menu_price = (SELECT menu_price
                    FROM (SELECT * FROM tbl_menu) as a
                    WHERE menu_code = 23);
-- 연산이 끝나지 않은 카테고리를 참조했기 때문에 오류 발생. 오라클에서는 가능하다고 함
/*
 * sql에서 동일한 테이블을 업데이트하고 서브쿼리 참조하는 경우 오류가 발생할 수 있는데,
 * 임시 테이블을 생성하거나 JOIN문을 사용해 문제를 해결할 수 있음
 * tbl_menu를 업데이트 하는 동안 동잏한 테이블을 서브쿼리에서 참조하는 문제를 해결할 수있다.
 * 서브쿼리에서 사용되는 테이블을 사실상 임시 테이블이기 때문이다. 당장 업데이트중인 본 테이블이 아니기 때문에 가능함.
 */
                   
UPDATE tbl_menu 
SET category_code = 6
WHERE menu_price = ( SELECT
					menu_price
					FROM tbl_menu
					WHERE menu_name = "델몬트=바나나")
-- 위의 오류를 해결하기 위해서는 아래와 같이 가상의 테이블을 형성해서 작업을 진행한다.
-- update의 겨우 컬럼의 타입과 제약조건을 신경써서 값을 수정해야 한다.

					UPDATE tbl_menu 
SET category_code = 6
WHERE menu_price = ( SELECT
					menu_price
					FROM (SELECT * FROM tbl_menu) AS a
					WHERE menu_name = "델몬트=바나나")
                   
-- delecte
-- delete의 경우 제약조건을 따지지 않으나 유일하게 따지는 것은 fk 제약 조건이다.
-- 우리의 실습 데이터에서 예시를 들면
-- tbl_category라는 테이블은 tbl_menu에서 참고하고 있는 상태이다.
-- 이러한 경우 tbl_category를 삭제하고자 할때 fk 제약조건에 옵션을 지정해야 삭제가 가능하며
-- 옵션에 따라 삭제가 가능하거나 불가능하게 된다.
-- 만약 삭제가 가능한 옵션으르 지정하는 경우 null로 변경된다.
DELETE FROM tbl_menu 
WHERE menu_name = "델몬트바나나";
-- 테이블 값이 다 지워짐

SELECT * FROM tbl_menu;

-- truncate : 오토 인큐에이트를 포함한 테이블 전체를 초기화함
 
-- delect limit :딜리트에 리밋 걸기
DELETE FROM tbl_menu 
ORDER BY menu_code DESC
LIMIT 2; -- 끝에거 두개를 지운다

-- 테이블의 값을 전체 삭제하는 경우
DELECT FROM tbl_menu; -- 시행하지 않는 것이 좋다. 

SELECT *FROM  tbl_menu
WHERE orderable_status = "Y";

-- 현업에서는 데이터를 중요하게 관리해야 하기 때문에
-- delete query를 잘 사용하지 않으며
-- 삭제를 해야하는 경우 아래와 같이 상태를 업데이트 하는 방식으로 진행한다.
UPDATE tbl_menu
SET orderable_status = "N"
WHERE menu_code = 26;

-- insert시 primary key 또는 unique key( primary key가 아니어도 나와 같은 테이블에서 내 이름의 키는 나만 가지도록 제한함) 가 충돌이 발생할 수 있다면
-- replace를 통해 중복된 데이터를 덮어쓸 수 있다.
-- REPLACE: 없으면 등록, 있으면 수정

INSERT INTO tbl_menu VALUES (17,"참기름라떼", 5000, 10, 'Y');
REPLACE INTO tbl_menu VALUES (27,"더 벤티 참기름라떼", 5000, 10, 'Y');
SELECT * FROM tbl_menu;

SELECT * FROM  tbl_category;






