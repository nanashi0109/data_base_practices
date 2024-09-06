USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `students_table` 	
	(`№` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`Фамилия` VARCHAR(50) NOT NULL,
	`Пол` VARCHAR(1) NOT NULL,
	`Дата рождения` DATE NOT NULL,
	`СНИЛС` VARCHAR(14) NOT NULL UNIQUE,
	`Курс` TINYINT NOT NULL DEFAULT 1,
	`Группа` VARCHAR(10) NOT NULL,
	`Средний балл` FLOAT NOT NULL,
	`Хобби` VARCHAR(255));

INSERT INTO `students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`, `Хобби`) VALUES
	('Горбунова Е.А.', 'ж', '1993-07-21', '128-389-457 23', 3, 'АУС-36', 86.3, 'Плавание'),
	('Ильин Л.И.', 'м', '1993-12-25', '279-237-417 25', 3, 'АУС-36', 98.1, 'Чтение'),
	('Борисенко С.Д.', 'м', '1994-11-01', '872-954-736 94', 2, 'АВМ-41', 92.4, 'Шахматы'),
	('Макаров С.С.', 'м', '1995-05-23', '864-278-354 11', 1, 'ЭОП-118', 82.0, 'Альпинизм'),
	('Курилин Д.В.', 'м', '1992-04-16', '711-257-696 85', 3, 'АУС-36', 63.7, 'Плавание'),
	('Иноземцева Д.Д.', 'ж', '1993-08-12', '112-598-478 23', 3, 'АУС-36', 91.8, 'Дайвинг');
	
INSERT INTO `students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`)
	VALUES ('Шипунов Р.Е.', 'м', '1995-03-04', '996-478-258 75', 1, 'ЭОП-238', 75.4);
	
INSERT INTO `students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`, `Хобби`) VALUES
	('Скородумов Д.Б.', 'м', '1994-01-14', '359-489-269 66', 1, 'ЭОП-118', 72.6, 'Бильярд'),
	('Пикулина С.А.', 'ж', '1995-03-02', '234-217-598 89', 1, 'ЭОП-238', 86.4, 'Шахматы'),
	('Сафронова М.Д.', 'ж', '1993-08-19', '887-555-124 17', 3, 'АУС-36', 90.1, 'Плавание'),
	('Ковшова Э.А.', 'ж', '1995-09-26', '469-489-557 12', 1, 'ЭОП-238', 65.8, 'Бильярд'),
	('Зайцев К.С.', 'м', '1993-12-15', '689-565-487 38', 3, 'АУС-35', 72.6, 'Чтение');

INSERT INTO `students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`)
	VALUES ('Антонова С.Д.', 'ж', '1992-12-19', '773-557-986 12', 3, 'АУС-35', 99.6 );

INSERT INTO `students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`, `Хобби`) VALUES 
	('Кондрашова Е.В.', 'ж', '1993-02-08', '669-476-123 76', 3, 'АУС-35', 97.7, 'Чтение'),
	('Кукушкина Е.В.', 'ж', '1995-10-14', '369-568-559 56', 2, 'АВМ-41', 90.2, 'Шахматы');


-- 1
SELECT * FROM `students_table`;

-- 2
SELECT * FROM `students_table`
	WHERE `Курс` = 3;
	
-- 3
SELECT * FROM `students_table`
	WHERE `Дата рождения` > '1994-02-03';

-- 4.1
SELECT * FROM `students_table`
	WHERE `Средний балл` >= 70 AND `Средний балл` <= 85;
	
-- 4.2
SELECT * FROM `students_table`
	WHERE `Средний балл` BETWEEN 70 AND 85;
	
-- 5.1
SELECT * FROM `students_table`
	WHERE `Курс` = 3 OR `Курс` = 2;

-- 5.2
SELECT * FROM `students_table`
	WHERE `Курс` IN (2, 3);
	
-- 6
SELECT * FROM `students_table`
	WHERE `Фамилия` LIKE('С%') OR `Фамилия` LIKE('К%');
	
-- 7
SELECT * FROM `students_table`
	WHERE `Группа` LIKE ('АУС%');

-- 8
SELECT * FROM `students_table`
	WHERE `Хобби` IS NULL;

-- 9
SELECT `Курс` FROM `students_table`
	GROUP BY `Курс`;
	
-- 10 
SELECT * FROM `students_table`
	ORDER BY `Средний балл` DESC
	LIMIT 5
	OFFSET 10;
	
-- 11 
SELECT * FROM `students_table`
	ORDER BY `Средний балл` ASC
	LIMIT 10
	OFFSET 5;

-- 12
SELECT COUNT(*) FROM `students_table`;

SELECT COUNT(*) FROM `students_table`
	WHERE `Хобби` IS NULL;

SELECT MAX(`Средний балл`) FROM `students_table`;

SELECT MIN(`Средний балл`) FROM `students_table`;

SELECT AVG(`Средний балл`) FROM `students_table`;


-- 13
SELECT `Курс`, COUNT(*) FROM `students_table`
	GROUP BY `Курс`;

-- 14
SELECT `Пол`, AVG(`Средний балл`) FROM `students_table`
	GROUP BY `Пол`;

-- 15
SELECT MAX(`Средний балл`) FROM `students_table`
	WHERE `Курс` = 3 AND `Дата рождения` >= '1993-01-01'
	GROUP BY `Курс`;
	
-- 16
SELECT `Фамилия`, `Средний балл`, CASE
	 WHEN `Средний балл` BETWEEN 0 AND 55 THEN 'Неудовлетворительно'
	 WHEN `Средний балл` BETWEEN 56 AND 70 THEN 'Удовлетворительно'
	 WHEN `Средний балл` BETWEEN 71 AND 85 THEN 'Хорошо'
	 WHEN `Средний балл` BETWEEN 86 AND 100 THEN 'Отлично'
	END AS 'Оценка'
	FROM `students_table`;
	
	