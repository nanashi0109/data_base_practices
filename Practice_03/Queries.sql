USE `seschool_03`;

-- 1
SELECT `Customers`.`name`, `Orders`.`order_date` 
	FROM `Customers` INNER JOIN `Orders` ON `Orders`.`customer_id` = `Customers`.`id`
	ORDER BY `Customers`.`Name` ASC, `Orders`.`order_date` ASC;

-- 2
SELECT `Customers`.`name` AS `Customer name`, `Dishes`.`name` AS `Dishes name` 
	FROM `Order_Dishes` INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Customers` ON `Orders`.`customer_id` = `Customers`.`id`
	ORDER BY `Customers`.`name` ASC, `Dishes`.`name` ASC;

-- 3 
SELECT `Customers`.`name`, SUM(`Dishes`.`price`) AS `Order_sum` 
	FROM `Order_Dishes` 
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	INNER JOIN `Customers` ON `Orders`.`customer_id` = `Customers`.`id`
	GROUP BY `Customers`.`Name`
	ORDER BY `Order_sum` DESC;

-- 4
SELECT `Customers`.`name`, COUNT(*) AS `Count orders` 
	FROM `Order_Dishes` 
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	INNER JOIN `Customers` ON `Orders`.`customer_id` = `Customers`.`id`
	GROUP BY `Customers`.`Name`
	ORDER BY `Count orders` DESC;
    
-- 5
SELECT `Dishes`.`name`, COUNT(*) + SUM(`Order_Dishes`.`quantity`) AS `Count dishes`
	FROM `Order_Dishes` 
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	GROUP BY `Dishes`.`name` 
	ORDER BY `Count dishes` DESC;
    
-- 6
SELECT `Customers`.`name` 
	FROM `Order_Dishes`
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	INNER JOIN `Customers` ON `Orders`.`customer_id` = `Customers`.`id`
	WHERE `Dishes`.`price` > 50
	GROUP BY `Customers`.`name`;

-- 7 
SELECT `Customers`.`name`, `Orders`.`order_date`, `Order_Dishes`.`quantity`
	FROM `Order_Dishes`
	INNER JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	INNER JOIN `Customers` ON `Orders`.`customer_id` = `Customers`.`id`
	ORDER BY `Customers`.`name`, `Orders`.`order_date`;
	
-- 8
SELECT `Dishes`.`category`, COUNT(*)
	FROM `Order_Dishes`
	INNER JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	GROUP BY `Dishes`.`category`
	ORDER BY COUNT(*) DESC;