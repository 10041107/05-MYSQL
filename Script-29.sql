SHOW DATABASES;

-- C USER 'testtes'@'%' IDENTIFIED BY 'testtes';


CREATE DATABASE testtes;

CREATE USER 'testtes'@'%' IDENTIFIED BY 'testtes';

GRANT ALL PRIVILEGES ON testtes.* TO 'testtes'@'%';

SHOW grants FOR 'testtes'@'%';

USE testtes;

SHOW tables;

use MYSQL;
select * from user;