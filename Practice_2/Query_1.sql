USE `seschool_03`;

CREATE TABLE IF NOT EXISTS `Movies` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`title` VARCHAR(100) NOT NULL,
	`release_year` YEAR NOT NULL,
	`genre` VARCHAR(255) NOT NULL,
	`rating` DECIMAL(3,1) NOT NULL CHECK (`rating` BETWEEN 1 AND 10));
	
CREATE TABLE IF NOT EXISTS `Actors` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(25) NOT NULL,
	`birth_year` YEAR NOT NULL,
	`nationality` VARCHAR(50) NOT NULL);
	
CREATE TABLE IF NOT EXISTS `Movie_Actors` (
	`movie_id` INT NOT NULL,
	`actor_id`INT NOT NULL,
	`role` VARCHAR(255) NOT NULL,
	FOREIGN KEY (`movie_id`) REFERENCES `Movies` (`id`),
	FOREIGN KEY (`actor_id`) REFERENCES `Actors` (`id`));

INSERT INTO `Movies` (`title`, `release_year`, `genre`, `rating`) VALUES
	('First movie', 1980, 'some genre 1', 4.2),
	('Second movie', 2001, 'some genre 2', 8.5),
	('Third movie', 2011, 'some genre 3', 2.0),
	('Fourth movie', 2002, 'some genre 2', 4.7),
	('Fifth movie', 1999, 'some genre 3', 9.3),
	('Sixth movie', 2021, 'some genre 1', 8.6),
	('Seventh movie', 2023, 'Sci-Fi', 9.6),
	('Eighth movie', 2000, 'some genre 4', 7.4),
	('Ninth movie', 1979, 'some genre 3', 2.5),
	('Tenth movie', 2024, 'Sci-Fi', 10.0),
	('The 11th movie', 2012, 'some genre 4', 8.1),
	('The 12th movie', 2003, 'some genre 3', 5.8),
	('The 13th movie', 2021, 'some genre 1', 10.0),
	('The 14th movie', 2000, 'some genre 1', 10.0),
	('The 15th movie', 2001, 'some genre 1', 10.0),
	('The 16th movie', 2021, 'some genre 1', 10.0),
	('The 17th movie', 2000, 'some genre 2', 10.0),
	('The 18th movie', 2000, 'some genre 2', 10.0),
	('The 19th movie', 2021, 'some genre 2', 10.0),
	('The 20th movie', 2021, 'some genre 2', 9.8),
	('The 21th movie', 2000, 'some genre 1', 7.2),
	('The 22th movie', 2021, 'some genre 1', 8.3),
	('The 23th movie', 1979, 'some genre 2', 9.1),
	('The 24th movie', 1998, 'some genre 2', 8.6),
	('The 25th movie', 2000, 'some genre 2', 7.5);

INSERT INTO `Actors` (`name`, `birth_year`, `nationality`) VALUES
	('First actor', 1962, 'some nationality 1'),
	('Second actor', 1979, 'some nationality 2'),
	('Third actor', 2000, 'some nationality 3'),
	('Fourth actor', 1969, 'some nationality 2'),
	('Fifth actor', 2001, 'some nationality 1');

INSERT INTO `Movie_Actors` (`actor_id`, `movie_id`, `role`) VALUES
	(1, 1, 'some role 1'),
	(1, 2, 'some role 1'),
	(1, 3, 'some role 1'),
	(1, 4, 'some role 1'),
	(1, 5, 'some role 1'),
	(1, 6, 'some role 1'),
	(2, 1, 'some role 1'),
	(2, 2, 'some role 1'),
	(2, 3, 'some role 1'),
	(2, 4, 'some role 1'),
	(2, 5, 'some role 1'),
	(2, 6, 'some role 1'),
	(3, 1, 'some role 1'),
	(3, 2, 'some role 1'),
	(3, 3, 'some role 1'),
	(1, 1, 'some role 2'),
	(1, 1, 'some role 3'),
	(1, 1, 'some role 4'),
	(1, 1, 'some role 5'),
	(1, 2, 'some role 2'),
	(1, 1, 'some role 3'),
	(2, 1, 'some role 2'),
	(2, 1, 'some role 3');

-- -- --

-- 1.1
SELECT * FROM `Movies`
   WHERE `release_year` > 2010 AND `rating` > 8.0
   ORDER BY `rating` DESC;
    
-- 1.2
SELECT `genre` FROM `Movies`
   GROUP BY `genre`
   ORDER BY `genre` ASC;
    
-- 1.3
SELECT * FROM `Movies`
   ORDER BY `rating` DESC
   LIMIT 10
   OFFSET 10;
    
-- 1.4
SELECT * FROM `Actors` 
   WHERE `birth_year` < 1980
   ORDER BY `birth_year` ASC;
    
-- 1.5
SELECT * FROM `Movies`
   WHERE `genre` = 'Sci-Fi'
   ORDER BY `title` ASC;
    
-- 1.6
SELECT * FROM `Actors`
   GROUP BY `nationality`
   ORDER BY `nationality` DESC;
    
-- 1.7
SELECT `title`, `rating` FROM `Movies`
	WHERE `rating` < 5.0
	ORDER BY `rating` ASC;
	
-- 1.8
SELECT * FROM `Movies`
	ORDER BY `release_year` DESC
	LIMIT 5;
	
-- 1.9
SELECT * FROM `Actors`
	ORDER BY `birth_year` ASC
	LIMIT 3;	

-- -- --

-- 2.1
SELECT `genre`, AVG(`rating`) FROM `Movies`
	GROUP BY `genre`
	ORDER BY `rating` DESC;	

-- 2.2
SELECT `release_year`, COUNT(*) AS `Count movies` FROM `Movies`
	GROUP BY `release_year`
	ORDER BY `release_year` ASC;
	
-- 2.3
SELECT `genre`, COUNT(*) AS `Count movies` FROM `Movies`
	GROUP BY `genre`
	HAVING `Count movies` > 5
	ORDER BY `Count movies` ASC;
	
-- 2.4
SELECT `genre`, SUM(`rating`) AS `Rating sum` FROM `Movies`
	GROUP BY `genre`
	HAVING `Rating sum` > 50
	ORDER BY `rating` ASC;
	
-- 2.5
SELECT `release_year` FROM `Movies`
	WHERE `rating` > 7.0
	GROUP BY `release_year`
	HAVING COUNT(*) > 5
	ORDER BY COUNT(*);


CREATE TABLE IF NOT EXISTS `subscriptions` (
	`sb_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`sb_subscriber` INT,
	`sb_book` INT,
	`sb_start` DATE,
	`sb_is_active` VARCHAR(1) CHECK (`sb_is_active` IN ('Y', 'N')));


INSERT INTO `subscriptions` (`sb_subscriber`, `sb_book`, `sb_start`, `sb_is_active`) VALUES
	(1, 1, '1970-01-01', 'Y'),
	(2, 2, '1970-01-01', 'Y'),
	(3, 3, '1970-01-01', 'N'),
	(1, 4, '1970-01-01', 'Y'),
	(3, 3, '1970-01-01', 'N'),
	(2, 2, '1970-01-01', 'Y'),
	(2, 4, '1970-01-01', 'N'),
	(1, 1, '1970-01-01', 'Y'),
	(3, 4, '1970-01-01', 'Y'),
	(1, 1, '1970-01-01', 'Y');

-- 2.6 
SELECT `sb_book` FROM `subscriptions`
	WHERE `sb_is_active` = 'Y'
	GROUP BY `sb_book`;
	
-- 2.7
SELECT `sb_book`, COUNT(*) AS `Count` FROM `subscriptions`
	WHERE `sb_is_active` = 'Y'
	GROUP BY `sb_book`;

INSERT INTO `Movies` (`title`, `release_year`, `genre`, `rating`) VALUES
	('The 26th movie', 2000, 'some genre 1', 7.5),
	('The 27th movie', 2000, 'some genre 1', 7.5),
	('The 28th movie', 2000, 'some genre 1', 7.5),
	('The 29th movie', 2000, 'some genre 2', 7.5),
	('The 30th movie', 2000, 'some genre 2', 7.5);


-- 3.1
SELECT `genre` FROM `Movies`
	GROUP BY `genre`
	HAVING AVG(`rating`) > 6.5 AND COUNT(*) > 10
	ORDER BY AVG(`genre`) DESC;
	
-- 3.2
SELECT `release_year`, MIN(`rating`) AS `Min rating` FROM `Movies`
	GROUP BY `release_year`
	HAVING COUNT(*) > 3
	ORDER BY `release_year` ASC;
	
-- 3.3
-- ???

-- 3.4
SELECT AVG(`rating`) FROM `Movies`
	WHERE `release_year` < 2000
	GROUP BY `genre`
	HAVING COUNT(*) > 3
	ORDER BY AVG(`rating`) DESC;
	
-- 3.5
SELECT `genre`, MIN(`rating`) AS `Min rating` FROM `Movies`
	GROUP BY `genre`
	HAVING COUNT(*) > 8
	ORDER BY `rating`ASC;	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
