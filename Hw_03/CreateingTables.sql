USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `Guilds` (
	`guild_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`guild_name` VARCHAR(50),
	`guild_level` INT);

CREATE TABLE IF NOT EXISTS `Players` (
	`player_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`player_name` VARCHAR(50),
	`level` INT,
	`experience_points` INT,
	`guild_id` INT,
	FOREIGN KEY (`guild_id`) REFERENCES `Guilds` (`guild_id`));
	
CREATE TABLE IF NOT EXISTS `Items` (
	`item_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`item_name` VARCHAR(50),
	`rarity` VARCHAR(50),
	`item_type` VARCHAR(20),
	`player_id` INT,
	FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`));
	
