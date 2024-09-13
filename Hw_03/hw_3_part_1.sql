USE `seschool_03`;


-- 1
SELECT * FROM `Players`;

-- 2
SELECT * FROM `Players`
	WHERE `guild_id` = 3;

-- 3	
SELECT `player_name`, `level` FROM `Players`
	WHERE `level` >= 10;
	
-- 4
SELECT `Items`.`item_name` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`player_name` = 'Алекс';

-- 5
SELECT * FROM `Items`
	WHERE `rarity` = 'редкий';
	
-- 6
SELECT `Items`.`item_name` FROM `Items`
	WHERE `item_type` = 'оружие';

-- 7 
SELECT `Guilds`.`guild_name`, COUNT(*) AS `count players` 
	FROM `Players`
	INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`guild_id`
GROUP BY `Guilds`.`guild_name`;

-- 8
SELECT `Players`.`player_name` 
	FROM `Items` 
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`item_type` = 'броня'
GROUP BY `Players`.`player_id`;
	
-- 9
SELECT `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Guilds`
	INNER JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `Players`.`level` > 5 AND `Guilds`.`guild_level` >= 2;

-- 10
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id`
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` =  'эпический';

-- 11
SELECT `Items`.`item_name` 
	FROM `Items`
	INNER JOIN `Players` ON  `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`level` > 15;

-- 12
SELECT `Items`.`item_id`, `Items`.`item_name`, `Items`.`rarity`, `Items`.`item_type`, `Items`.`player_id`
	FROM `Items`
	INNER JOIN `Players` ON  `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `Guilds`.`guild_name` = 'Клан Дракона';

-- 13
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Items`
	RIGHT JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`player_id` IS NULL
GROUP BY `Players`.`player_id`;

-- 14 
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`item_type` = 'зелье' AND `Players`.`level` > 8
GROUP BY `Players`.`player_id`;

-- 15
SELECT `Items`.`item_name`
	FROM `Items`
	INNER JOIN `Players` ON  `Items`.`player_id` = `Players`.`player_id`
	INNER JOIN `Guilds` ON `Guilds`.`guild_id` = `Players`.`guild_id`
WHERE `Guilds`.`guild_level` > 3;

-- 16
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`experience_points` > 500 AND `Items`.`item_type` = 'оружие';

-- 17 
SELECT `Guilds`.`guild_name` 
	FROM `Guilds`
	LEFT JOIN `Players` ON `Guilds`.`guild_id` = `Players`.`guild_id`
	WHERE `Players`.`player_id` IS NULL
GROUP BY `Guilds`.`guild_id`;

-- 18
SELECT `Players`.`player_name`, `Items`.`item_name`
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = 'редкий';

-- 19 
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id` AND `Items`.`item_type` != 'зелье';
	
-- 20 
SELECT `Players`.`player_id`, `Players`.`player_name`, `Players`.`level`, `Players`.`experience_points`, `Players`.`guild_id` 
	FROM `Items`
	INNER JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = 'эпический' AND `Players`.`level` = 20
GROUP BY `Players`.`player_id`;
 











