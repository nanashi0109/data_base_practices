USE `seschool_03`;

-- 1
SELECT * FROM `Players`
	WHERE `experience_points` > 
	(SELECT `experience_points` FROM `Players` 
		WHERE `player_name` = 'Марк');
		
-- 2
SELECT * FROM `Players`
	WHERE `Players`.`player_id` = 
	(SELECT `player_id` FROM `Items` 
		WHERE `item_type` = 'броня' 
		GROUP BY `Items`.`player_id`);

-- 3
SELECT `Items`.`item_name` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` = 
	(SELECT MAX(`guild_level`) FROM `Guilds`);
	
-- 4
SELECT * FROM `Players`
	WHERE `Players`.`player_id` = 
	(SELECT `player_id` FROM `Items` 
		WHERE `rarity` = 'редкий' 
		GROUP BY `Items`.`player_id`);
	
-- 5
SELECT DISTINCT `Players`.*
	FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
HAVING COUNT(*) = 
	(SELECT COUNT(*) 
		FROM `Players`
		INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id` 	
		WHERE `player_name` = 'Екатерина');

-- 6
SELECT DISTINCT `guild_name` FROM `Guilds`
	WHERE `Guilds`.`guild_id` = (SELECT `guild_id` FROM `Players` WHERE `level` > 20);

-- 7 
SELECT * FROM `Players`
	WHERE `player_id` = (SELECT `player_id` FROM `Items` WHERE `item_type` = 'оружие') AND
		`player_id` =  (SELECT `player_id` FROM `Items` WHERE `item_type` != 'зелье')
	GROUP BY `player_id`;

-- 8 
SELECT `item_name` FROM `Items` 
	WHERE `player_id` = (
		SELECT `player_id` 
		FROM `Players` 
		INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`guild_id`
		WHERE `Guilds`.`guild_name` = 'Стражи Севера');

-- 9
SELECT * FROM `Players`
	WHERE `player_id` = (SELECT `player_id` FROM `Items` WHERE `rarity` = 'эпический') AND
		`player_id` IN (
		SELECT `Players`.`player_id` 
		FROM `Items`
			INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
		GROUP BY `Players`.`player_id` 
		HAVING COUNT(*) > 1);

-- 10
SELECT * FROM `Players`
	WHERE `experience_points` > (SELECT AVG(`experience_points`) FROM `Players`);


-- 11
SELECT `Items`.`item_name` 
FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `guild_level` > (SELECT AVG(`guild_level`) FROM `Guilds`);
	
--  12
SELECT DISTINCT `Players`.* 
FROM `Players`
	INNER JOIN `Items` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = 'редкий' AND
`Players`.`experience_points` > (
	SELECT `experience_points` FROM `Players`
 		WHERE `player_name` = 'Дмитрий');
 		
-- 13 ?
SELECT DISTINCT `Guilds`.`guild_name` 
FROM `Guilds`
	INNER JOIN `Players` ON `Players`.`guild_id` = `Guilds`.`guild_id`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`player_id` NOT IN (
	SELECT `Players`.`player_id` 
	FROM `Players`
		INNER JOIN `Items` ON `Items`.`player_Id` = `Players`.`player_Id`
	WHERE `Items`.`item_type` = 'броня');

-- 14 
SELECT * FROM `Players`
	WHERE (`guild_id` IS NOT NULL) AND
	`experience_points` > (
		SELECT SUM(`Players`.`experience_points`) 
		FROM `Players` 
			INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
		WHERE `guild_name` = 'Легион');


-- 15
SELECT `Players`.*
FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
GROUP BY `Players`.`player_id`
HAVING COUNT(*) > (
	SELECT AVG(`count_items`) 
		FROM (SELECT COUNT(*) AS `count_items` FROM `Items`
			INNER JOIN `Players` ON `Players`.`player_Id` = `Items`.`player_Id`
		GROUP BY `Players`.`player_id`) AS `table_counter`);

-- 16
SELECT * FROM `Players` 
	WHERE `experience_points` > (
		SELECT SUM(`experience_points`) 
		FROM `Players` 
			INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
			WHERE `Guilds`.`guild_name` = 'Темный Братство'); 


-- 17
SELECT `Items`.* FROM `Items`
	INNER JOIN `Players` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `experience_points` > (
	SELECT SUM(`experience_points`) 
		FROM `Players` 
			INNER JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
		WHERE `Guilds`.`guild_name` = 'Львы'); 

-- 18 
SELECT * 
FROM `Players` AS `base_players`
	INNER JOIN `Guilds` AS `base_guilds` ON `base_players`.`guild_id` = `base_guilds`.`guild_id`
WHERE `base_players`.`experience_points` > (
	SELECT AVG(`Players`.`experience_points`)
	FROM `Players`
		INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`player_id`
	WHERE `base_guilds`.`guild_id` = `Guilds`.`guild_id`);


-- 19
SELECT DISTINCT `Players`.* FROM `Players`
	INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_Id`
WHERE `Players`.`guild_id` IS NULL 
	AND `Players`.`experience_points` > 1000
	AND `Items`.`rarity` = 'редкий';
	
-- 20
SELECT * FROM `Players` 
	WHERE `experience_points` > (
		SELECT MAX(`experience_points`) 
		FROM `Players` 
			INNER JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
		WHERE `Items`.`rarity` = 'эпический'
		GROUP BY `Players`.`player_id`);








