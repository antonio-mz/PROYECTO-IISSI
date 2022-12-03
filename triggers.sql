USE deliverus;

-- un pedido solo puede incluir productos de un restaurante
delimiter //
CREATE OR REPLACE TRIGGER triggerSingleRestaurantProducts
	BEFORE INSERT ON productsorders FOR EACH ROW
	BEGIN
		DECLARE restId1 INT;
		DECLARE restId2 INT;
		SET restId1 = (SELECT restaurantId FROM Orders WHERE NEW.orderId=orders.orderId);
		SET restId2 = (SELECT restaurantId FROM Products WHERE NEW.productId=products.productId);
		if(restId1 != restId2) then
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
				'Un pedido solo puede incluir productos de un mismo restaurante.';
		END if;
	END//
delimiter ;


-- una vez entregado el pedido, se tendrá que puntuar con estrellas
delimiter //
CREATE OR REPLACE TRIGGER triggerRatedOrder
	AFTER INSERT ON orders FOR EACH ROW
	BEGIN
		if(NEW.rated IS FALSE AND NEW.deliveryDate=deliveryDate.now) then -- por fecha
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
				'Un pedido debe estar valorado antes de hacer cualquier otra operación.';
		END if;
	END//
delimiter;


-- Solo se podrán hacer pedidos a los restaurantes situados en la misma provincia que el cliente que 
-- hace el pedido.
DELIMITER //
CREATE OR REPLACE TRIGGER triggerSameProvince 
	BEFORE INSERT ON Orders
	FOR EACH ROW
	BEGIN 
		DECLARE zipCodeRest VARCHAR(5);
		DECLARE zipCodeCust VARCHAR(5);
		SET zipCodeRest = (SELECT zipCode FROM Restaurants WHERE NEW.restaurantId=restaurantId);
		SET zipCodeCust = (SELECT zipCode FROM Customers WHERE NEW.customerId=customerId);
		IF(SUBSTRING(zipCodeRest, 0, 2) != SUBSTRING(zipCodeCust, 0, 2)) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo se podrán hacer pedidos a los restaurantes
				situados en la misma provincia que el cliente que hace el pedido.';
		END IF;
	END //
DELIMITER ;


-- cuando se alcance una cantidad mínima de un determinado producto, el sistema deberá avisar
delimiter //
CREATE OR REPLACE TRIGGER triggerMinAvailability
	AFTER UPDATE ON products FOR EACH ROW
	BEGIN
		if(NEW.availability < 4) then
			INSERT INTO alerts(`dateTime`, productId, sent, postponed)
			VALUES (CURRENT_TIMESTAMP, NEW.productId, FALSE, FALSE);
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
				'Quedan pocas unidades del producto.';
		END if;
	END //
delimiter ;