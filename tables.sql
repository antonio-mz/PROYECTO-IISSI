USE deliverus;

DROP TABLE if EXISTS ProductsOrders;
DROP TABLE if EXISTS AlertsStatus;
DROP TABLE if EXISTS Alerts;
DROP TABLE if EXISTS Products;
DROP TABLE if EXISTS Orders;
DROP TABLE if EXISTS OwnersRestaurants;
DROP TABLE if EXISTS ManagersRestaurants;
DROP TABLE if EXISTS Restaurants;
DROP TABLE if EXISTS Managers;
DROP TABLE if EXISTS Owners;
DROP TABLE if EXISTS Customers;

CREATE TABLE Customers(
	customerId INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
	username VARCHAR(15) NOT NULL UNIQUE,
	`name` VARCHAR(100) NOT NULL,
	surname VARCHAR(200) NOT NULL,
	phoneNumber VARCHAR(15) NOT NULL UNIQUE,
	avatar VARCHAR(200),
	address VARCHAR(200) NOT NULL,
	zipCode VARCHAR(5) NOT NULL,
	`password` VARCHAR(16) NOT NULL,
	PRIMARY KEY (customerId)
);

CREATE TABLE Owners(
	ownerId INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
	username VARCHAR(15) NOT NULL UNIQUE,
	`name` VARCHAR(100) NOT NULL,
	surname VARCHAR(200) NOT NULL,
	phoneNumber VARCHAR(15) NOT NULL UNIQUE,
	avatar VARCHAR(200),
	address VARCHAR(200) NOT NULL,
	zipCode VARCHAR(5) NOT NULL,
	`password` VARCHAR(16) NOT NULL,
	PRIMARY KEY (ownerId)
);

CREATE TABLE Managers(
	managerId INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
	username VARCHAR(15) NOT NULL UNIQUE,
	`name` VARCHAR(100) NOT NULL,
	surname VARCHAR(200) NOT NULL,
	phoneNumber VARCHAR(15) NOT NULL UNIQUE,
	avatar VARCHAR(200),
	address VARCHAR(200) NOT NULL,
	zipCode VARCHAR(5) NOT NULL,
	`password` VARCHAR(16) NOT NULL,
	PRIMARY KEY (managerId)
);

CREATE TABLE Restaurants(
	restaurantId INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
	address VARCHAR(200) NOT NULL,
	zipCode VARCHAR(5) NOT NULL,
	url VARCHAR(200) NOT NULL UNIQUE,
	`name` VARCHAR(100) NOT NULL,
	phoneNumber VARCHAR(15) NOT NULL UNIQUE,
	logo VARCHAR(200) NOT NULL,
	mainImage VARCHAR(200) NOT NULL,
	shippingCosts DECIMAL(4,2) NOT NULL,
	averageServiceTime DECIMAL DEFAULT(NULL),
	`status` VARCHAR(30) NOT NULL,
	category VARCHAR(50),
	averageRating DECIMAL(2,1) DEFAULT(NULL),
	PRIMARY KEY (restaurantId),
	UNIQUE(address, zipCode),
	CONSTRAINT invalidRestaurantStatus CHECK (`status` IN ('Acepta Pedidos',
																				'No disponible',
																				'Cerrado Temporalmente',
																				'Cerrado Permanentemente')),
	CONSTRAINT invalidRestaurantCategory CHECK (category IN ('Comida Rápida',
																				'Italiano',
																				'Indio',
																				'Mexicano',
																				'Japonés',
																				'Chino',
																				'Americano',
																				'Comida Local')),
	CONSTRAINT invalidRestaurantShippingCosts CHECK (shippingCosts>=0)
);

CREATE TABLE ManagersRestaurants(
	managerRestaurantId INT NOT NULL AUTO_INCREMENT,
	managerId INT NOT NULL,
	restaurantId INT NOT NULL,
	PRIMARY KEY (managerRestaurantId),
	FOREIGN KEY (managerId) REFERENCES Managers (managerId) ON DELETE CASCADE,
	FOREIGN KEY (restaurantId) REFERENCES Restaurants (restaurantId) ON DELETE CASCADE,
	UNIQUE(managerId, restaurantId)
);

CREATE TABLE OwnersRestaurants(
	ownerRestaurantId INT NOT NULL AUTO_INCREMENT,
	ownerId INT NOT NULL,
	restaurantId INT NOT NULL,
	PRIMARY KEY (ownerRestaurantId),
	FOREIGN KEY (ownerId) REFERENCES Owners (ownerId) ON DELETE CASCADE,
	FOREIGN KEY (restaurantId) REFERENCES Restaurants (restaurantId) ON DELETE CASCADE,
	UNIQUE(ownerId, restaurantId)
);

CREATE TABLE Orders(
	orderId INT NOT NULL AUTO_INCREMENT,
	creationDate DATETIME NOT NULL,
	startDate DATETIME,
	shipDate DATETIME,
	deliveryDate DATETIME,
	restaurantId INT NOT NULL,
	customerId INT NOT NULL,
	productsTotalPrice DECIMAL(6,2) DEFAULT(NULL),
	serviceTime INT DEFAULT(5),
	address VARCHAR(200) NOT NULL,
	zipCode VARCHAR(5) NOT NULL,
	shippingCosts DECIMAL(2,2) NOT NULL DEFAULT(0),
	rated BOOLEAN NOT NULL,
	rating VARCHAR(20) DEFAULT('1'),
	PRIMARY KEY (orderId),
	FOREIGN KEY (restaurantId) REFERENCES Restaurants (restaurantId) ON DELETE CASCADE,
	FOREIGN KEY (customerId) REFERENCES Customers (customerId) ON DELETE CASCADE,
	CONSTRAINT invalidOrderRating CHECK (rating IN ('1',
																	'2',
																	'3',
																	'4',
																	'5',
																	'No valorado')),
	CONSTRAINT invalidOrderServiceTime CHECK (serviceTime > 0),
	CONSTRAINT invalidOrderProductsTotalPrice CHECK (productsTotalPrice > 0),
	CONSTRAINT invalidOrderDates CHECK (creationDate < startDate and
													startDate < shipDate and
													shipDate < deliveryDate)
);

CREATE TABLE Products(
	productId INT NOT NULL AUTO_INCREMENT,
	restaurantId INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	description VARCHAR(500),
	price DECIMAL(4,2) NOT NULL,
	image VARCHAR(200),
	availability INT NOT NULL,
	PRIMARY KEY (productId),
	FOREIGN KEY (restaurantId) REFERENCES Restaurants (restaurantId) ON DELETE CASCADE,
	CONSTRAINT invalidProductPrice CHECK (price > 0),
	CONSTRAINT invalidProductAvailability CHECK (availability >= 0)
);

CREATE TABLE Alerts(
	alertId INT NOT NULL AUTO_INCREMENT,
	`dateTime` DATETIME NOT NULL,
	productId INT NOT NULL,
	sent BOOLEAN NOT NULL,
	postponed BOOLEAN NOT NULL,
	PRIMARY KEY (alertId),
	FOREIGN KEY (productId) REFERENCES Products (productId) ON DELETE CASCADE,
	UNIQUE (`dateTime`, productId)
);

CREATE TABLE AlertsStatus(
	alertStatusId INT NOT NULL AUTO_INCREMENT,
	`read` BOOLEAN NOT NULL,
	alertId INT NOT NULL,
	managerId INT NOT NULL,
	PRIMARY KEY (alertStatusId),
	UNIQUE(`read`, alertId),
	FOREIGN KEY (alertId) REFERENCES Alerts (alertId) ON DELETE CASCADE,
	FOREIGN KEY (managerId) REFERENCES Managers (managerId) ON DELETE CASCADE
);

CREATE TABLE ProductsOrders(
	productOrderId INT NOT NULL AUTO_INCREMENT,
	orderId INT NOT NULL,
	productId INT NOT NULL,
	productUnits INT NOT NULL,
	totalPrice DECIMAL(4,2) DEFAULT(0.1),
	PRIMARY KEY (productOrderId),
	UNIQUE(orderId, productId),
	FOREIGN KEY (orderId) REFERENCES Orders (orderId) ON DELETE CASCADE,
	FOREIGN KEY (productId) REFERENCES Products (productId) ON DELETE CASCADE,
	CONSTRAINT invalidProductsOrdersTotalUnits CHECK (productUnits > 0),
	CONSTRAINT invalidProductsOrdersTotalPrice CHECK (totalPrice > 0)
);