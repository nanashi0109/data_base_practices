USE `seschool_03`;


-- 1
SELECT * FROM `products` 
    WHERE `price` > (SELECT AVG(`price`) FROM `products`);
    
-- 2.1
SELECT DISTINCT `categories`.`category_name` FROM `categories` 
    INNER JOIN `products` ON `categories`.`category_id` = `categories`.`category_id`
WHERE `products`.`price` > 100;

-- 2.2
SELECT `category_name` FROM `categories`
    WHERE `category_id` IN (SELECT `category_id` FROM `products` WHERE `price` > 100);

-- 3
SELECT `product_name`, (
    SELECT COUNT(*) FROM `categories` 
    	WHERE `products`.`category_id` = `categories`.`category_id`
    	GROUP BY `categories`.`category_id`) 
FROM `products`;

-- 4
SELECT * FROM `products`
    WHERE `price` > (SELECT AVG(`price`) FROM `products`);

-- 5
SELECT `categories`.`category_name` 
FROM `products` 
    INNER JOIN `categories` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING AVG(`price`) > (SELECT AVG(`price`) FROM `products`);


-- 6.1
SELECT `categories`.`category_name`, MAX(`products`.`price`) 
FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`;

-- 6.2
SELECT `categories`.`category_name`, (
	SELECT MAX(`products`.`price`) FROM `products`
		WHERE `categories`.`category_id` = `products`.`category_id`
		GROUP BY `products`.`category_id`) 
FROM `categories`;

-- 7
SELECT * FROM `products`
	GROUP BY `category_id`
	HAVING `price` = (
		SELECT MAX(`price`) FROM `products` 
			GROUP BY `category_id`); 
			
			
-- 8
SELECT `categories`.*  FROM `categories` 
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(*) > AVG((SELECT COUNT(*) FROM `products` GROUP BY `category_id`));

-- 9
SELECT `p1`.* FROM `products` AS `p1`
	HAVING `price` > AVG((
		SELECT `price` FROM `products` AS `p2`
			GROUP BY `category_id` 
			HAVING `p1`.`category_id` = `p2`.`category_id`));
			
-- 10
SELECT `categories`.* FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING MIN(`products`.`price`) > AVG((SELECT `price` FROM `products`)); 

-- 11
SELECT * FROM `products`
	HAVING `price` < MIN((
		SELECT `price` FROM `products` 
		WHERE `category_id` IS NOT NULL));
		
-- 12
SELECT `categories`.* FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(*) = MAX((
	SELECT COUNT(*) FROM `products` 
		GROUP BY `category_id`));
		
-- 13
SELECT * FROM `products` AS `p1`
	HAVING `price` < MIN((
		SELECT `price` FROM `products` AS `p2`
			WHERE `p1`.`category_id` != `p2`.`category_id`));
			
-- 14 Найти категории, где количество продуктов меньше, чем в категории с минимальным количеством продуктов.
-- Существуют ли такие категории вообще?
SELECT `categories`.* FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id` 
HAVING COUNT(*) < MIN((SELECT COUNT(*) FROM `products` GROUP BY `category_id`));


-- 15
SELECT * FROM `products`
	HAVING `price` > AVG((
		SELECT `price` FROM `products` 
			GROUP BY `category_id` 
			HAVING COUNT(*) > 5));
			
-- 16.1
SELECT DISTINCT `categories`.`category_name` FROM `categories`
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
WHERE `price` > 200;

-- 16.2
SELECT `categories`.* FROM `categories`
	WHERE `category_id` IN (SELECT `category_id` FROM `products` WHERE `price` > 200);
	
-- 17
SELECT * FROM `products` AS `p1`
	WHERE `price` > (
		SELECT MAX(`price`) FROM `products` AS `p2` 
			WHERE `p1`.`category_id` != `p2`.`category_id`);
			
-- 18.1
SELECT `categories`.* FROM `categories` 
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
HAVING AVG(`products`.`price`) >  150;

-- 18.2
SELECT * FROM `categories` 
	WHERE `category_id` IN (
		SELECT `category_id` FROM `products` 
			GROUP BY `category_id` 
			HAVING AVG(`price`) > 150);
			
-- 19
SELECT * FROM `products` AS `p1`
	WHERE `price` < (
		SELECT MIN(`price`) * 2 FROM `products` AS `p2` 
			WHERE `p1`.`category_id` = `p2`.`category_id`);
			
-- 20
SELECT `categories`.* FROM `categories` 
	INNER JOIN `products` ON `categories`.`category_id` = `products`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(*) > AVG((
		SELECT COUNT(*) FROM `products` 
			GROUP BY `category_id`))
	AND AVG(`products`.`price`) < AVG((
		SELECT `price` FROM `products` 
			WHERE `category_id` IS NOT NULL 
			GROUP BY `category_id`));