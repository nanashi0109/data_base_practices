USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `books_table` 
	(`Name` VARCHAR(64) NOT NULL PRIMARY KEY,
	`Author` VARCHAR(64),
	`Year` INT UNSIGNED,
	`Reader` VARCHAR(64));
	
SHOW TABLES;

DESC `books_table`;

INSERT INTO `books_table` (`Name`, `Author`, `Year`, `Reader`) VALUES 
	('Война и мир', 'Толстой Л.Н.', 1990, 'Сидоров И.Д.'),
	('Капитанская дочка', 'Пушкин А.С.', 2004, 'Дмитриев С.Л.'),
	('Горе от ума', 'Грибоедов А.С.', 2012, 'Some reader');
	
SELECT * FROM `books_table`;

ALTER TABLE `books_table` 
	ADD `Publisher` VARCHAR(64);
	
DESC `books_table`;

ALTER TABLE `books_table` 
	MODIFY `Publisher` VARCHAR(64) DEFAULT 'Художественная литература';

INSERT INTO `books_table` (`Name`, `Author`, `Year`, `Reader`)
	VALUES ('Три сестры', 'Чехов А.П.', 2000, 'Малинин Д.С.');

UPDATE `books_table`
	SET `Reader` = 'Иванов А.В.',
	`Publisher` = 'Русская литература'
	WHERE `Name` = 'Горе от ума';
	
DELETE FROM `books_table`
	WHERE `Name` = 'Война и мир';
	
/*
INSERT INTO `books_table` (`Name`, `Author`, `Year`, `Reader`)
	VALUES (NULL, 'Некрасов Н.А.', 1998, 'Петров О.Д.');
				♠ при создании тоблицы было, что этот атрибут не может быть пустым.
				Тут же мы указываем, что оно равно пустоте
*/

DESC `books_table`;
SELECT * FROM `books_table`;

DELETE FROM `books_table`;

DROP TABLE `books_table`;
