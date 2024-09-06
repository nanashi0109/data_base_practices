USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `Employees` (
	`EmployeeID` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`FirstName` VARCHAR(50) NOT NULL,
	`LastName` VARCHAR(50) NOT NULL,
	`DateOfBirth` DATE NOT NULL,
	`HireDate` DATE NOT NULL,
	`MiddleName` VARCHAR(50) NOT NULL,
	`Salary` INT);

ALTER TABLE `Employees` 
	DROP COLUMN `MiddleName`,
	ADD COLUMN `Position` VARCHAR(100) NOT NULL;

	
INSERT INTO `Employees` (`FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Salary`, `Position`) VALUES 
	('Иван', 'Иванов', '1980-01-15', '2010-06-01', 75000.00, 'Менеджер'),
	('Анна', 'Петрова', '1985-07-23', '2012-08-15', 68000.00, 'Инженер'),
	('Михаил', 'Смирнов', '1990-03-12', '2015-01-30', 72000.00, 'Программист'),
	('Елена', 'Сидорова', '1992-05-14', '2016-09-21', 70000.00, 'Аналитик'),
	('Алексей', 'Кузнецов', '1975-11-02', '2005-10-10', 90000.00, 'Руководитель отдела'),
	('Ольга', 'Васильева', '1988-04-22', '2014-03-05', 65000.00, 'Маркетолог'),
	('Дмитрий', 'Попов', '1993-08-19', '2017-11-11', 71000.00, 'Программист'),
	('Мария', 'Козлова', '1983-02-10', '2010-04-07', 66000.00, 'HR-менеджер'),
	('Сергей', 'Лебедев', '1979-12-01', '2008-07-01', 80000.00, 'Менеджер проектов'),
	('Наталья', 'Морозова', '1986-09-09', '2013-12-18', 69000.00, 'Дизайнер');
