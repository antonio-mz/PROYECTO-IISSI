-- número de pedidos por cada cliente
SELECT customerId, COUNT(*) FROM orders GROUP BY customerId;

-- media de precios de todos los productos en cada restaurante
SELECT r.`name`, AVG(p.price) 
	FROM restaurants r
	JOIN products p ON (p.restaurantId=r.restaurantId)
	GROUP BY r.`name`;
	
-- todos los productos cuyo nombre tenga 15 caracteres
SELECT * FROM products WHERE `name` LIKE('_______________');