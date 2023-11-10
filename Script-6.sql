/* CONSTRAINTS*/

/*
제약 조건
테이블 작성 시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수 있다.
데이터 무결성 보장을 목적으로 한다.
입력/수정하는 데이터에 문제가 없는지 자동으로 검삭해 주게 하기 위한 목적이다.
PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY
*/

-- not null
-- null 값을 허용하지 않는다.

DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull (
	USER_no int NOT NULL,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255)
) ENGINE = innodb;


	
INSERT INTO user_notnull
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
 	(1, 'user01','pass01','홍길동','남','010-2322-2323','hong123@gmail.com'),
	(2, 'user01','pass01','김길동','여','010-2322-2323','kim123@gmail.com'),
	(3, 'user01','pass01','고길동','남','010-2322-2323','ko123@gmail.com');


SELECT *FROM  user_notnull;

INSERT INTO user_notnull
	(user_no, user_id, user_pwd, USER_name, gender, phone)
VALUES
	(4, 'user01','pass01','고길동','남','010-2322-2323');

-- not null  제약 조건은 null을 허용하지 않기 때문에 오류 발생
-- 값을 넣어주거나 기본값 설정을 해주어야 한다.
INSERT INTO user_notnull
	(user_no, user_id, user_pwd, USER_name, gender)
VALUES
	(4, 'user01','pass01','고길동','남');

/*unique 제약조건*/
-- unique제약조건은 중복되는 값을 허용하지 않는 제약조건이다.
DROP TABLE IF EXISTS user_unique;

CREATE TABLE If NOT EXISTS user_unique(
	USER_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255),
	UNIQUE (phone)
	) ENGINE = innodb;

INSERT INTO user_unique
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
 	(1, 'user01','pass01','홍길동','남','010-2322-2324','hong123@gmail.com'),
	(2, 'user01','pass01','김길동','여','010-2322-23235','kim123@gmail.com'),
	(3, 'user01','pass01','고길동','남','010-2322-23236','ko123@gmail.com');
-- 유티크가 붙은 것은 값이 완벽하게 일치하면 등록되지 않음

SELECT *FROM user_unique;


-- unique test
 DROP TABLE IF EXISTS user_unique_test;

CREATE TABLE If NOT EXISTS user_unique_test(
	USER_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255),
	email varchar(255),
	UNIQUE (phone)
	) ENGINE = innodb;

-- 아래의 경우 null을 값으로 인식하지 않기 때문에 unique제약조건을 위배하지 않음
INSERT INTO user_unique_test
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
 	(1, 'user01','pass01','홍길동','남',null,'hong123@gmail.com'),
	(2, 'user01','pass01','김길동','여',null,'kim123@gmail.com'),
	(3, 'user01','pass01','고길동','남',null,'ko123@gmail.com');


-- 값을 넣어주는 과정에서 중복되는 값을 넣으면 에러 발생
UPDATE user_unique_test 	
	SET phone = "123456"
	WHERE USER NO IN (1,2,3);

SELECT *FROM user_unique_test;

/*primary key*/
/* 테이블에서 한 행의 정보를 찾기 위해 사용할 컬링을 의미한다.
 * 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
 * not nulll + unique 제약조건을 의미
 * 한 테이블당 한개만 설정할 수 있다.
 * 컬럼 레벨, 테이블 레벨 둘다 설정 가능하다
 * 한개 컬럼에 설정할 수있으며 여러개의 컬럼을 묶어서 설정하는 것도 가능하다.
 */

DROP TABLE IF EXISTS user_primarykey;


CREATE TABLE If NOT EXISTS user_primarykey(
	USER_no int ,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255),
	email varchar(255),
	PRIMARY key (user_no)
	) ENGINE = innodb;

SELECT * FROM user_primarykey;
-- 오토 인크리먼트는 자동이 아님

INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
 	(1, 'user01','pass01','홍길동','남',null,'hong123@gmail.com'),
	(2, 'user01','pass01','김길동','여',null,'kim123@gmail.com'),
	(3, 'user01','pass01','고길동','남',null,'ko123@gmail.com');

-- primary key는 unique 제약조건으로 인해 중복되는 값을 허용하지 않는다.
INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
	(3, 'user01','pass01','고길동','남',null,'ko123@gmail.com');

-- 업데이트도 불가능함 : 없는 값으로 업데이트는 가능
UPDATE USER primarykey
	SET USER _no = 2
	WHERE user_no = 1;

-- not null로 인해 null 허용안됨
INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
	(null, 'user01','pass01','고길동','남',null,'ko123@gmail.com');

-- foreign key
-- 참조 (references)된 다른 테이블에서 제공하는 값만 사용할 수있다
-- 참조 무결성을 위배하지 않기 위해서 사용
-- foreing key 제약조건에 의해서
-- 테이블 간의 관계 (relatioship)가 형성됨
-- 제공되는 값 외에는 null을 사용할 수 없음

DROP TABLE IF EXISTS user_grade;

CREATE TABLE IF NOT exists user_grade(
	grade_code int NOT NULL UNIQUE,
	grade_name varchar(255) NOT NULL
	) ENGINE = innodb;

INSERT INTO user_grade
VALUES
(10, "일반회원"),
(20, "우수회원"),
(30, "특별회원");

DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
	USER_no int PRIMARY KEY, -- PRIMARY key는 하나만 지정해줘도 됨.
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255),
	FOREIGN KEY (USER_no) REFERENCES user_grade (grade_code)
	-- 내거에 어떤 컬럼을 참조할지 지정해줘야 함. references가 필수
	-- 체크 제약조건이 10,20,30으로 걸려있음(생략된 상태)
) ENGINE = innodb;

SELECT *FROM user_grade;
     
INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES 
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);



라해릐 htfr_code 는


	USER_no int PRIMARY KEY, -- PRIMARY key는 하나만 지정해줘도 됨.
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255),
	FOREIGN KEY (USER_no) REFERENCES user_grade (grade_code)
	refrences user_grand(grade code)
	ON UPDATE SET NULL;
	-- 내거에 어떤 컬럼을 참조할지 지정해줘야 함. references가 필수
	-- 체크 제약조건이 10,20,30으로 걸려있음(생략된 상태)
) ENGINE = innodb;

INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, USER_name, gender, phone, email)
VALUES
 	(1, 'user01','pass01','홍길동','남',null,'hong123@gmail.com'),
	(2, 'user01','pass01','김길동','여',null,'kim123@gmail.com')
;


UPDATE  USER_grade
SET grade_code = NULL
WHERE grade_code = 10;

descrive USER grag=de;

alter TABLE user_grade MODIFY frade_code int;

SELECT * FROM  user_grade
WHERE grade _ code = 20;

-- check 제약 조건 위반시 적용되지 않음
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS USER_check(
user_no int AUTO_INCREMENT PRIMARY KEY,
user_name varchar(255) NOT NULL,
gender verchar(3) CHECK 
age int check( age>= 19)

INSERT INTO user_check
VALUES
(NULL, '신사임당', '여', 33);

SELECT * FROM user_check;

INSERT  INTO user_check
VALUES (NULL, '안중근', '남', 27);

-- age 의 check 제약조건을 확인하면 age >= 19로 설정이 되어있기 때문에 오류가 나는 것이다.
INSERT INTO user_check
VALUES
 (NULL,'유관순', '여', 17);

/*
 * default
 * 컬럼에 null 대신 기본 값을 적용
 * 컬럼 타입이 date일시 current_date만 가능
 * 컬럼 타입이 dateTime일시 curryent_time과 current_timestamp, now() 모두 가능
 */

DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country(

  country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
) ENGINE = innodb;

SELECT *FROM tbl_country;

INSERT INTO tbl_country
VALUES (NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT, );

INSERT INTO tbl_country
	(counrty_code)
VALUES (NULL);

SELECT *FROM tbl_country;





