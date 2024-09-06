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
	

INSERT INTO `MonstersIncEmployees` (`MonsterName`, `Type`,`Department`, `ScareLevel`) VALUES 
	('Mike Wazowski', 'Пугало', 'Отдел пуганий', 7),
	('James P. Sullivan', 'Пугало', 'Отдел пуганий', 10),
	('Randall Boggs', 'Пугало', 'Отдел пуганий', 8),
	('Celia Mae', 'Администратор', 'Отдел поддержки', 3),
	('Roz', 'Администратор', 'Отдел документации', 2),
	('George Sanderson', 'Пугало', 'Отдел пуганий', 5),
	('Henry J. Waternoose', 'Администратор', 'Управление', 4),
	('Fungus', 'Помощник', 'Отдел пуганий', 6),
	('Needleman', 'Помощник', 'Отдел документации', 4),
	('Smitty', 'Помощник', 'Отдел поддержки', 5);
	

