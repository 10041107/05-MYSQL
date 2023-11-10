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
-- 오토 인크리먼트 : 자동으로 고유번호를 지정해줌
-- insert시 primary키에 해당하는 컬럼에 자동으로 번호를 발생 (중복되지 않게) 시켜 저장할 수 있다.

CREATE TABLE IF NOT EXISTS tb2(
	pk int AUTO_INCREMENT PRIMARY KEY, -- 프라이머리키: 기본적으로 null을 허용할 수 없음. 
	fk int, 
	coll varchar(255),
	check(coll IN ('y','n'))
	) ENGINE=INNODB;

DESCRIBE tb2;
INSERT INTO tb2 VALUES (NULL,10,'y');
SELECT * FROM tb2;
INSERT INTO tb2 VALUES (NULL, 10, 'n');
SELECT * FROM tb2;
-- INSERT INTO tb2 VALUES (NULL, 30, 'f');
-- check 제약 조건에 위배된다

/*alter
 * 테이블에 추가, 변경, 삭제, 수정되는 모든 것은 alter명령어를 사용해 적용한다.
 * 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다
 */

-- 테이블 구조를 변경하겠다 tb2의. add한다 col2를 int 널을 허용하지 않는 조건의
ALTER TABLE tb2
ADD col2 int NOT NULL;
DESCRIBE tb2;

-- 테이블의 컬럼을 삭제함
ALTER TABLE tb2
DROP column col2;

DESCRIBE tb2;

-- 열의 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk CHANGE_ke int NOT NULL;

-- 컬럼 수정 시 컬럼의 값을 덮어씌운다 생각해야함
-- alter table tb2
-- change column change ke fk2;
DESCRIBE tb2;

-- 열의 제약조건 추가 및 삭제
-- 실행시 auto increment으로 인해 오류가 발생된다
ALTER TABLE tb2;
DROP PRIMARY KEY;

-- auto_increment가 걸려 있는 컬럼은 primary key 제거가 안되므로
-- auto_increment를 modify 명령으로 제거한다
ALTER TABLE tb2
MODIFY pk int;

-- auto increment옵션을 제거하여 primary key 제약 조건을 제거할 수 있다
ALTER TABLE tb2
DROP PRIMARY KEY;

-- primeny key 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY key(pk);

DESCRIBE tb2;

-- 컬럼 여러개 추가
ALTER TABLE tb2
ADD col3 date NOT NULL,
ADD col4 tinyint NOT NULL;

DELETE FROM tb2;

DESCRIBE tb2;

-- date형이 0으로 추가가 안되는 것은 mysql 5.7 버전 select @@Global.sql_mode 했을때
-- 나온 결과
-- ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
-- 에서 no_zero_date 때문이며 0으로 채워진 Date컬럼이 존재하면 안되기 때문이다.

-- root계정으로 실행해야 한다. (localhost에 새로 있음)
SELECT @@global.sql_mode;
SET GLOBAL sql_mode = ' ';

select * from tb2;

/*drop*/
-- 테이블을 삭제하기 위한 구문
-- if exists를 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- drop [TEMPORARY] table  [IF EXISTS] table_name [, table_name]....

-- tb3 테이블 생성
CREATE TABLE if NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	coll varchar(255),
	CHECK(coll IN('y','n'))
	) ENGINE = INNODB;

DROP TABLE IF EXISTS tb3;
DROP TABLE TB3; -- IF EXISTS유뮤의 차이 
-- 삭제하고자 하는 테이블이 없는 경우 위 코드는 에러를 발생시킨다.
-- 보통 테이블 생성 구문으 여러개의 테이블을 한번에 생성하기 때문에 위와 같은 오류가 발생되면 열받는다...
SHOW TABLES;

-- 다중 삭제를 위해서 여러개의 테이블을 생성한다. 
CREATE TABLE if NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	coll varchar(255),
	CHECK(coll IN('y','n'))
	) ENGINE = INNODB;

CREATE TABLE if NOT EXISTS tb4(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	coll varchar(255),
	CHECK(coll IN('y','n'))
	) ENGINE = INNODB;

SHOW TABLES;

-- 여러 개의 테이블을 삭제하는 경우 아래와 같이 ,로 나열한
DROP TABLE tb3, tb4;
DROP TABLE IF EXISTS tb3, tb4;
SHOW tables;


-- 테이블을 초기화하는 구문
CREATE TABLE if NOT EXISTS tb5(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	coll varchar(255),
	CHECK(coll IN('y','n'))
	) ENGINE = INNODB;

INSERT INTO tb5 VALUES (NULL,1,'y');
INSERT INTO tb5 VALUES (NULL,1,'y');

INSERT INTO tb5 VALUES (NULL,1,'y');

INSERT INTO tb5 VALUES (NULL,1,'y');

SELECT * FROM tb5;

DELETE 
 FROM tb5
  WHERE  pk = 4;
 
 SELECT  *FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'y');

-- 초기화
truncate tb5;

SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'y');








