/* DDL(DATA DEFINITION LANGUAGE)*/
/* create */

-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.
-- 테이블의 컬럼 설정
-- column_name data_type(length)
-- [not null(null값을 허용하지 않겠다)] [default value] [auto_increment] column_constraint(제약조건);

-- 테이블 생성
-- 혹시 중복되는 테이블이 있으면 이거로 바꾸겠다. (=replace)
CREATE TABLE IF NOT EXISTS tb1 (
	pk int PRIMARY KEY,
	fk int ,
	coll varchar(255),
	CHECK (coll IN ('Y','N')) -- col1에 들어갈수 있는 값을 y, n으로 제한한다.
) ENGINE = INNODB;

DESCRIBE tb1;

-- INSERT INTO tb1 VALUES(1,10,"f"); -- 프라이머리 키 값 중복
-- INSERT INTO tb1 VALUES(null,10,"f"); -- 프라이머리 키는 null값을 가질 수 없음(기본적으로 not null제약조건을 가진다)
INSERT INTO tb1 VALUES(3,"10","f"); -- 데이터 타입 주의

SELECT * FROM tbl;

/*Auto_Increment */
-- insert시 primary키에 해당하는 컬럼에 자동으로 번호를 발생 (중복되지 않게) 시켜 저장할 수 있다.





