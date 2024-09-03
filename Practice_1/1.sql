USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `MonstersIncEmployees` (
	`EmployeeID` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`MonsterName` VARCHAR(75) NOT NULL,
	`Type` VARCHAR(255) NOT NULL DEFAULT 'Монстр',
	`Department` VARCHAR(100) NOT NULL DEFAULT 'Нулевой отдел',
	`MonsterColor` INT(6));

ALTER TABLE `MonstersIncEmployees`
	DROP COLUMN `MonsterColor`,
	ADD COLUMN `ScareLevel` TINYINT CHECK ( `ScareLevel` >= 1 AND `ScareLevel` <= 10);
	

INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Mike Wazowski', 'Пугало', 'Отдел пуганий', 7);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('James P. Sullivan', 'Пугало', 'Отдел пуганий', 10);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Randall Boggs', 'Пугало', 'Отдел пуганий', 8);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Celia Mae', 'Администратор', 'Отдел поддержки', 3);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Roz', 'Администратор', 'Отдел документации', 2);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('George Sanderson', 'Пугало', 'Отдел пуганий', 5);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Henry J. Waternoose', 'Администратор', 'Управление', 4);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Fungus', 'Помощник', 'Отдел пуганий', 6);

INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Needleman', 'Помощник', 'Отдел документации', 4);
	
INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`)
	VALUES ('Smitty', 'Помощник', 'Отдел поддержки', 5);
	

