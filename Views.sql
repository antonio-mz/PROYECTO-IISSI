-- vista que contiene los restaurantes cuyo codigo postal es 41010
CREATE OR REPLACE VIEW ViewZipCode AS
	SELECT * FROM Restaurants WHERE zipCode = '41010';

SELECT * FROM viewzipcode;
SELECT COUNT(*) FROM ViewZipCode;


-- vista a partir de la anterior que me muestra los restaurante cuyo codigo postal es 41010 y tienen gastos de envio menores de 3.00 €	
CREATE OR REPLACE VIEW ViewZipCodeShippingCosts AS 
	SELECT * FROM ViewZipCode WHERE shippingCosts<=3;

SELECT * FROM ViewZipCodeShippingCosts;


-- Número máximo y mínimo de pedidos por un restaurante 
CREATE OR REPLACE VIEW MoreOrders AS  
	SELECT restaurantId, COUNT(*) AS numPedidos FROM Orders GROUP BY restaurantId;

SELECT * FROM moreorders;
SELECT MAX(numPedidos) FROM MoreOrders;
SELECT MIN(numPedidos) FROM MoreOrders;


-- Nombre de 2 restaurantes ordenados ordenados alfabéticamente que son de Sevilla y aceptan pedidos, sabiendo que el código postal de los restaurantes 
-- de Sevilla empieza por 410
CREATE OR REPLACE VIEW RestaurantsSeville AS 
	SELECT `name` FROM Restaurants WHERE zipCode LIKE '410%' AND `status` = 'acepta pedidos'
	ORDER BY `name` LIMIT 2;
	  
SELECT * FROM RestaurantsSeville;