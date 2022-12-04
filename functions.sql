-- Dado un id de un producto devuelva el número de unidades vendidas
DELIMITER //
CREATE OR REPLACE FUNCTION soldUnits (idProduct INT) RETURNS INT
BEGIN 
	DECLARE total INT;
	SET total = (SELECT SUM(productUnits) FROM productsorders po WHERE po.productId=idProduct);
	if (total IS NULL) then
		SET total = 0;
	END if;
	RETURN total;
END //
DELIMITER ;

SELECT productId, soldUnits(productId) FROM products;


-- Dinero total obtenido de todas las ventas entre 2 fechas
DELIMITER //
CREATE OR REPLACE FUNCTION soldDate (initialDate DATETIME, finalDate DATETIME) RETURNS DECIMAL
BEGIN
	DECLARE total DECIMAL;
	SET total = (SELECT SUM(productsTotalPrice)
					FROM orders 
					WHERE creationDate>initialDate AND creationDate<finalDate);
	if (total IS NULL) then
		SET total = 0;
	END if;		
	RETURN total;
END //
DELIMITER ;

SELECT soldDate("2010-12-01 00:00:00.000", "2022-12-01 00:00:00.000") FROM orders LIMIT 1;


-- Dado un año y un nombre del restaurante, devuelve el pedido con mayor valoración
DELIMITER //
CREATE OR REPLACE FUNCTION bestRatedOrder (`year` INT, `name` VARCHAR(100)) RETURNS INT
BEGIN
	DECLARE bestRated INT;
	SET bestRated = (SELECT orderId FROM orders o JOIN restaurants r WHERE YEAR(o.deliveryDate)=`year`
		AND r.`name`=`name` AND o.rated AND o.rating IN ('5') LIMIT 1);
	RETURN bestRated;
END //
DELIMITER ;

SELECT * FROM orders WHERE orderId=bestRatedOrder(2022, 'McDonalds');