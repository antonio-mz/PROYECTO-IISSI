-- Procedimiento que elimina un producto
DELIMITER //
CREATE OR REPLACE PROCEDURE procDeleteProduct(productId INT)
	BEGIN 
	DELETE FROM products WHERE products.productId=productId;
	DELETE FROM productsOrders WHERE productsOrders.productId = productId;
	END //
DELIMITER ;

CALL procDeleteProduct(2);

-- Procedimiento que registra un cliente nuevo o lo actualiza
DELIMITER //
CREATE OR REPLACE PROCEDURE procInsertUpdateCustomer(
	email VARCHAR(100), 
	username VARCHAR(15),
	`name` VARCHAR(100),
	surname VARCHAR(200),
	phoneNumber VARCHAR(15),
	avatar VARCHAR(200),
	address VARCHAR(200),
	zipCode VARCHAR(5),
	`password` VARCHAR(16))
	BEGIN 
	DECLARE correoRepetido VARCHAR(100);
	DECLARE usernameRepetido VARCHAR(15);
	DECLARE phoneNumberRepetido VARCHAR(15);
	SELECT COUNT(*) INTO correoRepetido FROM Customers WHERE Customers.email=email;
		SELECT COUNT(*) INTO usernameRepetido FROM Customers WHERE Customers.username=username;
	SELECT COUNT(*) INTO phoneNumberRepetido FROM Customers WHERE Customers.phoneNumber=phoneNumber;
	if((correoRepetido=0) and (usernameRepetido=0) AND (phoneNumberRepetido=0))then 
		INSERT INTO Customers(email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
			`password`) VALUES (email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
			`password`);
	END if;
	if ((usernameRepetido=1) or (correoRepetido=1) OR (phoneNumberRepetido=1))then 
		UPDATE Customers
		SET 
		Customers.`name`=`name`,
		Customers.surname=surname,
		Customers.avatar=avatar,
		Customers.address=address,
		Customers.zipCode=zipCode,
		customers.`password`=`password`
		WHERE customers.email=email;
	END if;	
END //
DELIMITER ;

CALL procInsertUpdateCustomer('manolito@gmail.com', 'manupl', 'Manuel', 'Pérez López', 
	'963258741', 'https://n9.cl/f87w9', 'Calle Feria, 9', '41023', '123456');

-- Procedimiento que registra un propietario nuevo o lo actualiza
DELIMITER //
CREATE OR REPLACE PROCEDURE procInsertUpdateOwner(
	email VARCHAR(100), 
	username VARCHAR(15),
	`name` VARCHAR(100),
	surname VARCHAR(200),
	phoneNumber VARCHAR(15),
	avatar VARCHAR(200),
	address VARCHAR(200),
	zipCode VARCHAR(5),
	`password` VARCHAR(16))
	BEGIN 
	DECLARE correoRepetido VARCHAR(100);
	DECLARE usernameRepetido  VARCHAR(15);
	DECLARE phoneNumberRepetido VARCHAR(15);
	SELECT COUNT(*) INTO correoRepetido FROM Owners WHERE Owners.email=email;
	SELECT COUNT(*) INTO usernameRepetido FROM owners WHERE owners.username=username;
	SELECT COUNT(*) INTO phoneNumberRepetido FROM owners WHERE owners.phoneNumber=phoneNumber;
	if((correoRepetido=0) and (usernameRepetido=0) AND (phoneNumberRepetido=0))then 
		INSERT INTO Owners(email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
			`password`) VALUES (email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
				`password`);
	END if;
	if ((usernameRepetido=1) or (correoRepetido=1) OR (phoneNumberRepetido=1))then 
		UPDATE Owners
		SET 
		Owners.`name`=`name`,
		Owners.surname=surname,
		Owners.avatar=avatar,
		Owners.address=address,
		Owners.zipCode=zipCode,
		owners.`password`=`password`;
	END if;		

END //
DELIMITER ;

CALL procInsertUpdateOwner('lorenzo@gmail.com', 'loren', 'Lorenzo', 'Peña López', 
	'963589141', 'https://n9.cl/f87w9', 'Calle Salados, 19', '41743', '123456256');

-- Procedimiento que registra un gerente nuevo o lo actualiza
DELIMITER //
CREATE OR REPLACE PROCEDURE procInsertUpdateManager(
	email VARCHAR(100), 
	username VARCHAR(15),
	`name` VARCHAR(100),
	surname VARCHAR(200),
	phoneNumber VARCHAR(15),
	avatar VARCHAR(200),
	address VARCHAR(200),
	zipCode VARCHAR(5),
	`password` VARCHAR(16))
	BEGIN 
	DECLARE correoRepetido VARCHAR(100);
	DECLARE usernameRepetido  VARCHAR(15);
	DECLARE phoneNumberRepetido VARCHAR(15);
	SELECT COUNT(*) INTO correoRepetido FROM Managers WHERE Managers.email=email;
	SELECT COUNT(*) INTO usernameRepetido FROM Managers WHERE Managers.username=username;
	SELECT COUNT(*) INTO phoneNumberRepetido FROM Managers WHERE Managers.phoneNumber=phoneNumber;
	if((correoRepetido=0) and (usernameRepetido=0) AND (phoneNumberRepetido=0))then 
		INSERT INTO Managers(email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
			`password`) VALUES (email, username, `name`, surname, phoneNumber, avatar, address, zipCode,
			`password`);
	END if;
	if ((usernameRepetido=1) or (correoRepetido=1) OR (phoneNumberRepetido=1))then 
		UPDATE Managers
		SET 
		Managers.`name`=`name`,
		Managers.surname=surname,
		Managers.avatar=avatar,
		Managers.address=address,
		Managers.zipCode=zipCode,
		managers.`password`=`password`;
	END if;	
END //
DELIMITER ;

CALL procInsertUpdateManager('mairajuana@gmail.com', 'Marianita', 'Maria Juana', 'de los Santos López', 
	'636985412', 'https://n9.cl/f87w9', 'Avenida de la constitución, 23', '41056', 'contrasena');

-- Procedimiento que aumenta de precio un producto en concreto
DELIMITER //
CREATE OR REPLACE PROCEDURE procIncreasePrice(producto INT, aumentoPrecio DECIMAL(4,2))
BEGIN 
	DECLARE precio DECIMAL(4,2);
	DECLARE nuevoPrecio DECIMAL(4,2);
	SET precio = (SELECT price FROM products WHERE productId = producto);
	SET nuevoPrecio = precio + aumentoPrecio;
	UPDATE products SET price = nuevoPrecio WHERE productId = producto;
END //
DELIMITER ; 

CALL procIncreasePrice(1, 2.50);

-- Aumentar cantidad producto
DELIMITER //
	CREATE OR REPLACE PROCEDURE procIncreaseCant(producto INT, aumento INT)
	BEGIN 
		DECLARE cant INT;
		DECLARE nuevaCant INT;
		SET cant = (SELECT availability FROM products WHERE productId = producto);
		SET nuevaCant = cant + aumento;
		UPDATE products SET availability = nuevaCant WHERE productId = producto;
	END //
DELIMITER ;

-- Decrementar cantidad producto
DELIMITER //
	CREATE OR REPLACE PROCEDURE procDecreaseCant(producto INT, disminucion INT)
	BEGIN
		DECLARE nuevaCant INT;	
		DECLARE disponibilidad INT;
		SET disponibilidad = (SELECT availability FROM products p WHERE p.productId = producto);
		SET nuevaCant = disponibilidad - disminucion;
		UPDATE products SET availability = nuevaCant WHERE productId = producto ;
	END //
DELIMITER ;

CALL procIncreaseCant(9, 500);
CALL procDecreaseCant(9, 500);

-- Procedimiento para crear pedido
delimiter //
CREATE OR REPLACE PROCEDURE procMakeOrder(orderId INT, restaurantName VARCHAR(100),
	usernameCliente VARCHAR(15), prodId INT, units INT)
BEGIN
	DECLARE restId INT;
	DECLARE custId INT;
	DECLARE dir VARCHAR(200);
	DECLARE cp VARCHAR(5);
	DECLARE productopedido INT;
	SET restId = (SELECT restaurantId FROM restaurants r WHERE r.`name`=restaurantName);
	SET custId = (SELECT customerId FROM customers c WHERE c.username=usernameCliente);
	SET dir = (SELECT address FROM customers c WHERE c.customerId = custId);
	SET cp = (SELECT zipCode FROM customers c WHERE c.customerId = custId);
	if NOT EXISTS (SELECT * FROM orders o WHERE o.orderId=orderId) then
		INSERT INTO orders(orderId, creationDate, startDate, shipDate, deliveryDate, restaurantId,
			customerId, address, zipCode, rated) VALUES
			(orderId, CURRENT_TIMESTAMP, NULL, NULL, NULL, restId, custId, dir, cp, FALSE);
	ELSE
		UPDATE orders o SET o.creationDate=CURRENT_TIMESTAMP, o.startDate=NULL, o.shipDate=NULL,
		o.deliveryDate=NULL, o.restaurantId=restId, o.customerId=custId, o.address=dir, o.zipCode=cp,
		o.rated=FALSE WHERE o.orderId=orderId;
	END if;
	if NOT EXISTS (SELECT * FROM productsorders po WHERE (po.orderId=orderId AND po.productId=prodId
			AND po.productUnits=units)) then
		INSERT INTO productsorders(orderId, productId, productUnits) VALUES (orderId, prodId, units);
		SET productopedido = (SELECT productOrderId FROM productsorders po WHERE po.orderId=orderId
			AND po.productId=prodId AND po.productUnits=units);
	ELSE
		UPDATE productsorders po
		SET po.productUnits=units WHERE po.orderId=orderId AND po.productId=prodId;	
	END if;
	SET productopedido = (SELECT productOrderId FROM productsorders po WHERE po.orderId=orderId
		AND po.productId=prodId AND po.productUnits=units);
	CALL procDecreaseCant(prodId, units);
	CALL procTotalPrice(productoPedido);
	CALL procProductsTotalPrice(orderId);
	CALL procAverageServiceTime(restId);
	CALL procShippingCost(orderId);
END//
delimiter ;

CALL procMakeOrder(11, 'McDonalds', 'morkhahor', 5, 3);

-- Procedimiento para valorar pedido
delimiter //
CREATE OR REPLACE PROCEDURE procRateOrder(orderId INT, rating VARCHAR(20))
BEGIN
	DECLARE restId INT;
	SET restId = (SELECT restaurantId FROM orders WHERE orders.orderId=orderId);
	if EXISTS (SELECT * FROM orders o WHERE o.orderId=orderId) then
		UPDATE orders SET
		orders.deliveryDate=CURRENT_TIMESTAMP,
		orders.rating=rating,
		orders.rated=TRUE
		WHERE orders.orderId=orderId;
		CALL procAverageRating(restId);
		CALL procServiceTime(orderId);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pedido a valorar inexistente.';
	END if;
END //
delimiter ;

CALL procRateOrder(11, 'No valorado');