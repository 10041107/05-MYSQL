USE testtes;

-- Create the Artisan_Build table

DROP TABLE IF EXISTS `Artisan_Build`;

-- Create the Artisan_Build table
CREATE TABLE `Artisan_Build` (
    `userNum` INT(10) NOT NULL COMMENT '유저번호',
    `masterNum` INT(10) NOT NULL COMMENT '장인번호',
    `buildNum` INT(10) NOT NULL COMMENT '빌드번호',
    `runeNum` INT(10) NOT NULL COMMENT '룬번호',
    `spellNum` INT(10) NOT NULL COMMENT '스펠번호',
    `itemNum` INT(10) NOT NULL COMMENT '아이템번호',
    `skillMasterNum` INT(10) NOT NULL COMMENT '스킬선마번호',
    PRIMARY KEY (`userNum`, `masterNum`, `buildNum`, `skillMasterNum`)
) COMMENT = '장인빌드';

-- Drop the Artisan_Build_PK index if it exists
DROP INDEX IF EXISTS `Artisan_Build_PK` ON `Artisan_Build`;

-- Add the PRIMARY KEY constraint
ALTER TABLE `Artisan_Build`
ADD CONSTRAINT `Artisan_Build_PK` PRIMARY KEY (`userNum`, `masterNum`, `buildNum`, `skillMasterNum`);

DROP INDEX `testtes`.`Artisan_Build_PK`;

CREATE UNIQUE INDEX `testtes`.`Artisan_Build_PK` ON `testtes`.`Artisan_Build`
( `userNum`,`masterNum`,`buildNum`,`skillMasterNum` );


DROP TABLE `testtes`.`Artisan_Ranking`;

CREATE TABLE `testtes`.`Artisan_Ranking`
(
    `userNick`    VARCHAR(255) NOT NULL COMMENT '유저닉네임',
    `masterNum`    INT(10) NOT NULL COMMENT '장인번호',
    `champNum`    INT(10) NOT NULL COMMENT '챔피언번호',
    `champName`    VARCHAR(255) NOT NULL COMMENT '챔피언이름',
    `games`    VARCHAR(255) NOT NULL COMMENT '판수',
    `winnig`    VARCHAR(255) NOT NULL COMMENT '승률',
    `tier`    VARCHAR(255) NOT NULL COMMENT '티어',
    `userNum`    INT(10) NOT NULL COMMENT '유저번호',
 PRIMARY KEY ( `userNum`,`masterNum` )
) COMMENT = '장인랭킹';

ALTER TABLE `Artisan_Ranking`
 ADD CONSTRAINT `Artisan_Ranking_PK` PRIMARY KEY ( `userNum`,`masterNum` );

DROP INDEX `testtes`.`Artisan_Ranking_PK`;

CREATE UNIQUE INDEX `testtes`.`Artisan_Ranking_PK` ON `testtes`.`Artisan_Ranking`
( `userNum`,`masterNum` );


DROP TABLE `testtes`.`Champion`;

CREATE TABLE `testtes`.`Champion`
(
    `champNum`    INT(10) NOT NULL COMMENT '챔피언번호',
    `champName`    VARCHAR(255) NOT NULL COMMENT '챔피언이름',
    `buildNum`    INT(10) NOT NULL COMMENT '빌드번호',
    `role`    VARCHAR(255) NOT NULL COMMENT '역할군',
    `type`    VARCHAR(255) NOT NULL COMMENT '타입',
    `userNum`    INT(10) COMMENT '유저번호',
    `masterNum`    INT(10) COMMENT '장인번호',
    `skillMasterNum`    INT(10) COMMENT '스킬선마번호',
 PRIMARY KEY ( `buildNum`,`champNum` )
) COMMENT = '챔피언';

ALTER TABLE `Champion`
 ADD CONSTRAINT `Champion_PK` PRIMARY KEY ( `buildNum`,`champNum` );

DROP INDEX `testtes`.`Champion_PK`;

CREATE UNIQUE INDEX `testtes`.`Champion_PK` ON `testtes`.`Champion`
( `buildNum`,`champNum` );


DROP TABLE `testtes`.`Champion_Skill`;

CREATE TABLE `testtes`.`Champion_Skill`
(
    `buildNum`    INT(10) NOT NULL COMMENT '빌드번호',
    `skillMasterNum`    INT(10) NOT NULL COMMENT '스킬선마번호',
    `skillMaster` NOT NULL COMMENT '스킬선마',
    `champNum`    INT(10) COMMENT '챔피언번호',
    `userNum`    INT(10) COMMENT '유저번호',
    `masterNum`    INT(10) COMMENT '장인번호',
 PRIMARY KEY ( `buildNum`,`skillMasterNum` )
) COMMENT = '챔피언스킬';

ALTER TABLE `Champion_Skill`
 ADD CONSTRAINT `Champion_Skill_PK` PRIMARY KEY ( `buildNum`,`skillMasterNum` );

DROP INDEX `testtes`.`Champion_Skill_PK`;

CREATE UNIQUE INDEX `testtes`.`Champion_Skill_PK` ON `testtes`.`Champion_Skill`
( `buildNum`,`skillMasterNum` );


DROP TABLE `testtes`.`item`;

CREATE TABLE `testtes`.`item`
(
    `buildNum`    INT(10) NOT NULL COMMENT '빌드번호',
    `itemNum`    INT(10) NOT NULL COMMENT '아이템번호',
    `startItem`    VARCHAR(255) NOT NULL COMMENT '시작 아이템',
    `shoesItem`    VARCHAR(255) NOT NULL COMMENT '신발 아이템',
    `fisrtCore`    VARCHAR(255) NOT NULL COMMENT '1코어 아이템',
    `secondCore`    VARCHAR(255) NOT NULL COMMENT '2코어 아이템',
    `thirdCore`    VARCHAR(255) NOT NULL COMMENT '3코어 아이템',
    `fourthCore`    VARCHAR(255) NOT NULL COMMENT '4코어 아이템',
    `champNum`    INT(10) COMMENT '챔피언번호',
 PRIMARY KEY ( `buildNum`,`itemNum` )
) COMMENT = '아이템';

ALTER TABLE `item`
 ADD CONSTRAINT `item_PK` PRIMARY KEY ( `buildNum`,`itemNum` );

DROP INDEX `testtes`.`item_PK`;

CREATE UNIQUE INDEX `testtes`.`item_PK` ON `testtes`.`item`
( `buildNum`,`itemNum` );


DROP TABLE `testtes`.`Lun_1`;

CREATE TABLE `testtes`.`Lun_1`
(
    `buildNum`    INT(10) NOT NULL COMMENT '빌드번호',
    `runeNum`    INT(10) NOT NULL COMMENT '룬번호',
    `firstMain`    VARCHAR(255) NOT NULL COMMENT '첫번째 메인룬(핵심룬)',
    `champNum`    INT(10) COMMENT '챔피언번호',
 PRIMARY KEY ( `buildNum` )
) COMMENT = '룬_1';

ALTER TABLE `Lun_1`
 ADD CONSTRAINT `Lun_1_PK` PRIMARY KEY ( `buildNum` );

DROP INDEX `testtes`.`Lun_1_PK`;

CREATE UNIQUE INDEX `testtes`.`Lun_1_PK` ON `testtes`.`Lun_1`
( `buildNum` );


DROP TABLE `testtes`.`Main`;

CREATE TABLE `testtes`.`Main`
(
    `userNum`    INT(10) NOT NULL COMMENT '유저번호',
    `userName`    VARCHAR(255) NOT NULL COMMENT '유저명',
    `tier` NOT NULL COMMENT '티어',
    `userNick`    VARCHAR(255) NOT NULL COMMENT '유저닉네임',
 PRIMARY KEY ( `userNum` )
) COMMENT = '전체유저(Main)';

ALTER TABLE `Main`
 ADD CONSTRAINT `Main_PK` PRIMARY KEY ( `userNum` );

DROP INDEX `testtes`.`Main_PK`;

CREATE UNIQUE INDEX `testtes`.`Main_PK` ON `testtes`.`Main`
( `userNum` );


DROP TABLE `testtes`.`Search_User`;

CREATE TABLE `testtes`.`Search_User`
(
    `userNum`    INT(10) NOT NULL COMMENT '유저번호',
    `masterNum`    INT(10) NOT NULL COMMENT '장인번호',
 PRIMARY KEY ( `userNum`,`masterNum` )
) COMMENT = '검색유저';

ALTER TABLE `Search_User`
 ADD CONSTRAINT `Search_User_PK` PRIMARY KEY ( `userNum`,`masterNum` );

DROP INDEX `testtes`.`Search_User_PK`;

CREATE UNIQUE INDEX `testtes`.`Search_User_PK` ON `testtes`.`Search_User`
( `userNum`,`masterNum` );


DROP TABLE `testtes`.`Skill`;

CREATE TABLE `testtes`.`Skill`
(
    `champNum`    INT(10) NOT NULL COMMENT '챔피언번호',
    `SkillP`    VARCHAR(255) NOT NULL COMMENT '스킬P',
    `SkillQ`    VARCHAR(255) NOT NULL COMMENT '스킬Q',
    `SkillW`    VARCHAR(255) NOT NULL COMMENT '스킬W',
    `SkillE`    VARCHAR(255) NOT NULL COMMENT '스킬E',
    `SkillR`    VARCHAR(255) NOT NULL COMMENT '스킬R',
    `buildNum`    INT(10) COMMENT '빌드번호',
    `skillMasterNum`    INT(10) COMMENT '스킬선마번호',
 PRIMARY KEY ( `champNum` )
) COMMENT = '스킬정보';

ALTER TABLE `Skill`
 ADD CONSTRAINT `Skill_PK` PRIMARY KEY ( `champNum` );

DROP INDEX `testtes`.`Skill_PK`;

CREATE UNIQUE INDEX `testtes`.`Skill_PK` ON `testtes`.`Skill`
( `champNum` );




DROP TABLE `testtes`.`Spell`;

CREATE TABLE `testtes`.`Spell`
(
    `buildNum`    INT(10) NOT NULL COMMENT '빌드번호',
    `spellNum`    INT(10) NOT NULL COMMENT '스펠번호',
    `D`    VARCHAR(255) NOT NULL COMMENT '스펠 D',
    `F`    VARCHAR(255) NOT NULL COMMENT '스펠 F',
    `champNum`    INT(10) COMMENT '챔피언번호',
 PRIMARY KEY ( `buildNum`,`spellNum` )
) COMMENT = '스펠';

ALTER TABLE `Spell`
 ADD CONSTRAINT `Spell_PK` PRIMARY KEY ( `buildNum`,`spellNum` );

DROP INDEX `testtes`.`Spell_PK`;

CREATE UNIQUE INDEX `testtes`.`Spell_PK` ON `testtes`.`Spell`
( `buildNum`,`spellNum` );


DROP TABLE `testtes`.`Subscription_Table`;

CREATE TABLE `testtes`.`Subscription_Table`
(
    `userNum`    INT(10) NOT NULL COMMENT '유저번호',
    `masterNum`    INT(10) NOT NULL COMMENT '장인번호',
 PRIMARY KEY ( `userNum`,`masterNum` )
) COMMENT = '구독테이블';

ALTER TABLE `Subscription_Table`
 ADD CONSTRAINT `Subscription_Table_PK` PRIMARY KEY ( `userNum`,`masterNum` );

DROP INDEX `testtes`.`Subscription_Table_PK`;

CREATE UNIQUE INDEX `testtes`.`Subscription_Table_PK` ON `testtes`.`Subscription_Table`
( `userNum`,`masterNum` );



