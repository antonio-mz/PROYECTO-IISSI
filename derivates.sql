-- Atributo derivado serviceTime de orders
DELIMITER //
CREATE OR REPLACE PROCEDURE procServiceTime(orderId INT)
	BEGIN
 		DECLARE `time` INT;
 		SET `time` = (SELECT TIMESTAMPDIFF(MINUTE, creationDate, deliveryDate) FROM orders o
			WHERE o.orderId=orderId);
		UPDATE orders SET orders.serviceTime = `time` WHERE orders.orderId = orderId;
	END //

DELIMITER ;

CALL procServiceTime(1);
CALL procServiceTime(2);
CALL procServiceTime(3);
CALL procServiceTime(4);
CALL procServiceTime(5);
CALL procServiceTime(6);
CALL procServiceTime(7);
CALL procServiceTime(8);
CALL procServiceTime(9);
CALL procServiceTime(10);

-- Atributo derivado totalPrice de productsOrders
DELIMITER //
CREATE OR REPLACE PROCEDURE procTotalPrice(productOrderId INT)
	BEGIN
 		DECLARE tPrice DECIMAL(4,2);
 		SET tPrice = (SELECT (productsorders.productUnits * products.price) FROM products
			JOIN productsorders ON (products.productId = productsorders.productId)
			WHERE productsorders.productOrderId = productOrderId);
  		UPDATE productsorders SET productsorders.totalPrice = tPrice
			WHERE productsorders.productOrderId = productOrderId;
	END //
DELIMITER ;

CALL procTotalPrice(1);
CALL procTotalPrice(2);
CALL procTotalPrice(3);
CALL procTotalPrice(4);
CALL procTotalPrice(5);
CALL procTotalPrice(6);
CALL procTotalPrice(7);
CALL procTotalPrice(8);
CALL procTotalPrice(9);
CALL procTotalPrice(10);
CALL procTotalPrice(11);
CALL procTotalPrice(12);
CALL procTotalPrice(13);
CALL procTotalPrice(14);
CALL procTotalPrice(15);
CALL procTotalPrice(16);
CALL procTotalPrice(17);
CALL procTotalPrice(18);
CALL procTotalPrice(19);
CALL procTotalPrice(20);
CALL procTotalPrice(21);
CALL procTotalPrice(22);
CALL procTotalPrice(23);
CALL procTotalPrice(24);
CALL procTotalPrice(25);
CALL procTotalPrice(26);
CALL procTotalPrice(27);
CALL procTotalPrice(28);
CALL procTotalPrice(29);
CALL procTotalPrice(30);

-- Atributo derivado productsToTalPrice de orders
DELIMITER //
CREATE OR REPLACE PROCEDURE procProductsTotalPrice(orderId INT)
	BEGIN
 		DECLARE ptPrice INT;
 		SET ptPrice = (SELECT SUM(totalPrice) FROM productsOrders WHERE productsorders.orderId=orderId);
  		UPDATE orders SET orders.productsTotalPrice = ptPrice WHERE orders.orderId = orderId;
	END //
DELIMITER ;

CALL procProductsTotalPrice(1);
CALL procProductsTotalPrice(2);
CALL procProductsTotalPrice(3);
CALL procProductsTotalPrice(4);
CALL procProductsTotalPrice(5);
CALL procProductsTotalPrice(6);
CALL procProductsTotalPrice(7);
CALL procProductsTotalPrice(8);
CALL procProductsTotalPrice(9);
CALL procProductsTotalPrice(10);

-- Atributo derivado averageServiceTime de restaurants
DELIMITER //
CREATE OR REPLACE PROCEDURE procAverageServiceTime(restaurantId INT)
	BEGIN
 		DECLARE avgServiceTime DECIMAL;
 		SET avgServiceTime = (SELECT AVG(serviceTime) FROM orders
		 	WHERE orders.restaurantId = restaurantId);
  		UPDATE restaurants SET restaurants.averageServiceTime = avgServiceTime
		  	WHERE restaurants.restaurantId = restaurantId;
	END //
DELIMITER ;

CALL procAverageServiceTime(1);
CALL procAverageServiceTime(2);
CALL procAverageServiceTime(3);
CALL procAverageServiceTime(4);
CALL procAverageServiceTime(5);
CALL procAverageServiceTime(6);

-- Atributo derivado averageRating de restaurants
DELIMITER //
CREATE OR REPLACE PROCEDURE procAverageRating(restaurantId INT)
	BEGIN
 		DECLARE avgRating DECIMAL(2,1);
 		SET avgRating = (SELECT AVG(rating) FROM orders o WHERE o.restaurantId=restaurantId AND o.rated
			AND o.rating NOT IN ('No valorado'));
		UPDATE restaurants r SET r.averageRating = avgRating WHERE r.restaurantId=restaurantId;
	END //
DELIMITER ;

CALL procAverageRating(1);
CALL procAverageRating(2);
CALL procAverageRating(3);
CALL procAverageRating(4);
CALL procAverageRating(5);
CALL procAverageRating(6);

-- Atributo derivado shippingCosts de orders
DELIMITER //
CREATE OR REPLACE PROCEDURE procShippingCost(orderId INT)
	BEGIN
 		DECLARE precio DECIMAL;
 		DECLARE sc DECIMAL;
 		SET precio = (SELECT productsTotalPrice FROM orders o WHERE o.orderId = orderId);
 		IF (precio > 10) THEN
  			SET sc = 0;
  		ELSE
  			SET sc = (SELECT r.shippingCosts FROM restaurants r JOIN orders o
				ON r.restaurantId = o.restaurantId WHERE o.orderId = orderId);
		END IF;
		UPDATE orders SET orders.shippingCosts = sc WHERE orders.orderId = orderId;
	END //
DELIMITER ;

CALL procShippingCost(1);
CALL procShippingCost(2);
CALL procShippingCost(3);
CALL procShippingCost(4);
CALL procShippingCost(5);
CALL procShippingCost(6);
CALL procShippingCost(7);
CALL procShippingCost(8);
CALL procShippingCost(9);
CALL procShippingCost(10);