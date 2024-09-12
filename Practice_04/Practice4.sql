USE `seschool_03`;

-- 1
SELECT `User`.`id`, `User`.`name`, `User`.`age`, `User`.`country`
	FROM `Reviews`
	INNER JOIN `Users` ON `Reviews`.`id_user` = `User`.`id`
	INNER JOIN `Orders` ON `Rewiews`.`id_user` = `Orders`.`id_user`
WHERE `Rewiews`.`grade` > 4;

-- 2
SELECT `User`.`name`, `User`.`age` 
	FROM `Orders`
	INNER JOIN `Users` ON `Orders`.`id_user` = `Users`.`id`
WHERE `Orders`.`order_sum` > 1000;

-- 3
SELECT `Orders`.`id`, `Orders`.`id_user`, `Orders`.`orders_sum`, `Orders`.`order_date`
	FROM `Orders`
	INNER JOIN `Users` ON `Orders`.`id_user` = `Users`.`id`;

-- 4
SELECT `Users`.`name`, `User`.`country` 
	FROM `Rewiews`
	INNER JOIN `User` ON `Rewiews`.`id_user` = `User`.`id`
GROUP BY `Rewiews`.`id_user`
HAVING COUNT(*) > 1;

-- 5
SELECT `Orders`.`id`, `Orders`.`id_user`, `Orders`.`order_sum`, `Orders`.`order_date`
	FROM `Rewiews`
	INNER JOIN `Orders` ON `Rewiews`.`id_user` = `Orders`.`id_user`
WHERE `Rewiews`.`grade` < 3;

-- 6
SELECT `Users`.`name`, `Users`.`age`, `Users`.`Country`, `Rewiews`.`grade`, `Rewiews`.`rewiew_text`
	FROM `Users`
	INNER JOIN `Orders` ON `Orders`.`id_user` = `User`.`id`
	INNER JOIN `Rewiews` ON `Rewiews`.`id_user` = `User`.`id`
WHERE `Orders`.`date_order` > '2024-09-01';

-- 7
SELECT AVG(`order_sum`) 
	FROM  `Orders` 
	INNER JOIN `Users` ON `Orders`.`id_user` = `Users`.`id`
GROUP BY `Orders`.`id_user`;

-- 8
SELECT `Users`.`name`, `Users`.`age`, `Users`.`country` 
	FROM `Rewiews`
	INNER JOIN `Orders` ON `Rewiews`.`id_user` = `Orders`.`id_user`
	INNER JOIN `Users` ON `Rewiews`.`id_user` = `Users`.`id`
WHERE `Users`.`country` = 'Россия' AND `Rewiews`.`grade` > 3;

-- 9 
SELECT `Users`.`name`
	FROM `Rewiews`
	RIGHT JOIN `Users` ON `Rewiews`.`id_user` != `Users`.`id`;
	
-- 10
SELECT `Rewiews`.`id_order`, `Rewiews`.`id_user`, `Rewiews`.`grade`, `Rewiews`.`rewiew_text`
	FROM `Rewiews`
	INNER JOIN `Orders` ON `Rewiews`.`id_user` = `Orders`.`id_user`
WHERE `Orders`.`order_sum` < 2000;