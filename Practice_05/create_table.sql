USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `categories` (
	`category_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`category_name` VARCHAR(50));

CREATE TABLE IF NOT EXISTS `products` (
	`product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`product_name` VARCHAR(50),
	`category_id` INT,
	`price` FLOAT,
	FOREIGN KEY(`category_id`) REFERENCES `categories` (`category_id`));
	
