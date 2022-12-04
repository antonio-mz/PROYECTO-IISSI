USE deliverus;

DELETE FROM customers;
DELETE FROM restaurants;
DELETE FROM products;
DELETE FROM owners;
DELETE FROM managers;
DELETE FROM managersrestaurants;
DELETE FROM ownersrestaurants;
DELETE FROM alerts;
DELETE FROM orders;
DELETE FROM productsorders;

INSERT INTO customers(customerId, email, username, `name`, surname, phoneNumber, avatar, address, zipCode, `password`) VALUES
	(1, 'celiaplazita08@gmail.com', 'celplamac', 'Celia', 'Plaza Machado', '683246017', 'https://acortar.link/Yk5vKM', 'c\ Calígula, 48', '41089', '09876'),
	(2, 'deividsan@gmail.com', 'davsanala', 'David', 'Sánchez Álamo', '657896219', 'https://acortar.link/Jnfzd9', 'c\ Fragata, 4', '41012', '12345'),
	(3, 'natpelpar@gmail.com', 'natpelpar4', 'Natalia', 'Peluso Parra', '658302865', 'https://acortar.link/X6Biex', 'Plaza la Tona, 39', '41007', '7342340'),
	(4, 'marantmuñsol@gmail.com', 'marantmuñsol', 'Marco Antonio', 'Muñiz Solís', '614081596', 'https://acortar.link/pNKA9L', 'Mercado de las Candelarias puesto nº26, C. Gaviota', '41006', '1237q34503'),
	(5, 'morkhahor@gmail.com', 'morkhahor', 'Morad', 'El Khattouti El Horami', '629019602', 'https://acortar.link/CMODAM', 'Carrer Set, 3', '08130', 'motorola777');
	
INSERT INTO owners(ownerId, email, username , `name`, surname, phoneNumber, avatar, address, zipCode, `password`) VALUES
	(1, 'fmp@gmail.com', 'FranJMonPer', 'Francisco José', 'Montero Perea', '639348649', NULL, 'Calle Alberto Durero, 6', '41018', 'pacopepe'),
	(2, 'flc@gmail.com', 'FranLopCas', 'Francisca', 'Lopera Castillo', '697237698', NULL, 'Calle Jiménez Aranda', '41018', 'francisquita'),
	(3, 'mjo@gmail.com', 'MarJimOlm', 'María', 'Jimenez Olmo', '698302847', NULL, 'Calle Flor de Azalea', '41019', 'marialachulita'),
	(4, 'cristiniti04@gmail.com', 'CrisGarDel', 'Cristina', 'García Delgado', '6890238407',NULL, 'Calle Alejandro Sawa, 14', '41008', 'cristinilla04'),
	(5, 'manolito93@gmail.com', 'ManPerGonz', 'Manuel', 'Perez Gonzalez', '680384636', NULL, 'Calle Fray Francisco de Pareja, 25', '41007', 'manolitogafotas'),
	(6, 'gatitavoluntaria76@gmail.com', 'MartLopGuer', 'Martina', 'Lopez Guerrero', '628758328', NULL, 'Calle Nana de Espinas, 20', '41006', 'gigi'),
	(7, 'omarmontesofficial@gmail.com', 'OmarMontMore', 'Omar', 'Montes Moreno', '666927110', NULL, 'Calle Ramon Serrano, 8', '28025', 'omarsito'),
	(8, 'illojuan73@gmail.com', 'JuanAlGarGam', 'Juan Alberto', 'Garcia Gamez', '669117023', NULL, 'Calle Rodrigo de Triana, 8', '29640', 'illojuanymasi'),
	(9, 'luisitocomunica@gmail.com', 'Luisito', 'Luis', 'Villar Sudek', '62293740', NULL, 'De la Lima 153', '59386', 'luisillo');
	
INSERT INTO managers(managerId, email, username , `name`, surname, phoneNumber, avatar, address, zipCode, `password`) VALUES
	(1, 'morenita33@gmail.com', 'SusVazRuiz', 'Susana', 'Vazquez Ruiz', '611093854', NULL, 'Calle Andres Bernaldez, 8', '41005', 'susanitaraton'),
	(2, 'aitorga@gmail.com', 'AitGilMar', 'Aitor', 'Gil Marquez', '6293882044', NULL, 'Calle Juan de Ledesma, 60', '41006', 'aitortilla'),
	(3, 'reyesblanco4@gmail.com', 'ReyBlanCar', 'Reyes', 'Blanco Carmona', '620330159', NULL, 'Calle Juan de Robles, 14', '41009', 'pipasreyes'),
	(4, 'juanito27@gmail.com', 'JuanPerLop', 'Juan', 'Perez Lopez', '622094881', NULL, 'Av. de Miraflores, 55', '41008', 'juanitojuan'),
	(5, 'elenagortari48@gmail.com', 'ElenGorBel', 'Elena', 'Gortari Bellido', '67770018', NULL, 'Calle Ulises, 60', '41020', 'elenuchi');

INSERT INTO restaurants(restaurantId, email, address, zipCode, url, `name`, phoneNumber, logo, mainImage, shippingCosts, `STATUS`, category) VALUES
	(1, 'atencionconsumidor@es.mcd.com', 'av.Alcalde Luis Uruñuela', '41020', 'https://www.mcdonald.es', 'McDonalds', '954518228', 'https://acortar.link/IEPqmT', 'https://acortar.link/fQ3wyQ', 2.99, 'acepta pedidos', 'comida rápida'),
	(2, 'tacobell@gmail.com', 'Calle Campana, 6', '41002', 'https://tacobell.es',  'Taco Bell', '603824531', 'https://cdn.lovesavingsgroup.com/logos/taco-bell.png', 'https://acortar.link/bAz0E3', 2.59, 'acepta pedidos', 'mexicano' ),
	(3, 'info@mesoncasapaco.es', 'Calle Bami 15-17', '41010', 'https://mesoncasapaco.es/', 'Mesón Casa Paco', '954237504', 'https://acortar.link/dqjVgk', 'https://acortar.link/odujwh', 2.99, 'acepta pedidos', 'comida local' ),
	(4, 'lachillonasanpablo@gmail.com', 'Plaza de la Tona', '41007', 'https://lachillona.es/contacto', 'La Chillona', '648884527', 'https://acortar.link/tU8hne', 'https://acortar.link/tU8hne', 3.19, 'no disponible', 'comida local'),
	(5, 'lsan@gmail.com', 'Calle Diego Angulo Íñiguez, 10', '59018', 'https://www.restaurantelsan.com/contacto', 'LSan', '854529408', 'https://acortar.link/KD9wBx', 'https://acortar.link/KD9wBx', 2.49, 'cerrado temporalmente', 'japones'),
	(6, 'granfamiliamediterranea@gmail.com', 'Calle Betania, 4', '41007', 'https://lagranfamiliamediterranea.com/', 'La Gran Familia Mediterranea', '911083816', 'https://acortar.link/u3vFPm', 'https://acortar.link/u3vFPm', 1.99, 'acepta pedidos', 'comida local');
	

INSERT INTO managersrestaurants(managerRestaurantId, managerId, restaurantId) VALUES
	(1, 1, 1),
	(2, 2, 5),
	(3, 5, 3),
	(4, 4, 1),
	(5, 4, 2),
	(6, 5, 4),
	(7, 2, 2),
	(8, 2, 3);
	
INSERT INTO ownersrestaurants(ownerRestaurantId, ownerId, restaurantId) VALUES 
	(1, 5, 1),
	(2, 4, 4),
	(3, 2, 2),
	(4, 2, 3),
	(5, 3, 5),
	(6, 8, 6);
	
INSERT INTO orders (orderId, creationDate, startDate, shipDate, deliveryDate, restaurantId, customerId, address, zipCode, rated, rating) VALUES
	(1, "2022-10-27 21:18:45.000", "2022-10-27 21:18:50.000", "2022-10-27 21:23:54.125", "2022-10-27 21:44:22.226", 1, 1, 'c\ Calígula, 48', '41089', TRUE, 5),
	(2, "2022-10-25 14:36:32.028", "2022-10-25 14:41:24.018", "2022-10-25 15:07:11.262", "2022-10-25 15:29:32.028", 3, 1, 'c\ Calígula, 48', '41089', TRUE, 4),
	(3, "2022-12-24 13:52:12.867", "2022-12-24 13:59:14.235", "2022-12-24 14:18:23.764", "2022-12-24 14:39:14.264", 2, 3, 'Plaza la Tona, 39', '41007', TRUE, 3),
	(4, "2022-11-05 21:56:24.235", "2022-11-05 21:58:34.243", "2022-11-05 22:21:34.263", "2022-11-05 22:44:12.789", 3, 4, 'Mercado de las Candelarias puesto nº26, C. Gaviota', '41006', TRUE, 5),
	(5, "2022-11-07 11:12:34.697", "2022-11-07 11:17:24.845", "2022-11-07 11:38:16.674", "2022-11-07 11:59:34.236", 6, 5, 'Carrer Set, 3', '08130', TRUE, 5),
	(6, "2022-11-16 14:15:16.245", "2022-11-16 14:17:18.976", "2022-11-16 14:29:23.956", "2022-11-16 14:44:12.345", 1, 2, 'c\ Fragata, 4', '41012', TRUE, 4),
	(7, "2022-11-20 20:34:43.764", "2022-11-20 20:40:52.896", "2022-11-20 21:10:54.367", "2022-12-20 21:59:35.754", 2, 5, 'Carrer Set, 3', '08130', TRUE, 2),
	(8, "2022-11-24 21:43:47.976", "2022-11-24 22:05:32.856", "2022-11-24 22:45:25.956", "2022-11-24 23:16:23.456", 3, 2, 'c\ Fragata, 4', '41012', TRUE, 1),
	(9, "2022-12-01 08:24:52.485", "2022-12-01 08:25:46.132", "2022-12-01 08:40:23.745", "2022-12-01 08:53:45.845", 6, 4, 'Mercado de las Candelarias puesto nº26, C. Gaviota', '41006', TRUE, 5),
	(10, "2022-12-02 21:41:12.345", "2022-12-02 21:42:41.743", "2022-12-02 21:53:42.457", "2022-12-02 22:05:32.856", 6, 3, 'Plaza la Tona, 39', '41007', TRUE, 5);

INSERT INTO products(productId, restaurantId, `name`, description, price, image, availability) VALUES
	(1, 1, 'Patatas Deluxe Grandes', 'Gajos de patata especiadas', 3.75, 'https://acortar.link/domYrV', 11674),
	(2, 1, 'Happy Meal', 'Menú especial para niños', 4.20, 'https://acortar.link/XUdtLR', 232),
	(3, 1, 'McFlurry Cornetto', 'Helado con sirope de Cornetto y deliciosos crujientes de barquillo con chocolate', 3.50, 'https://acortar.link/r9n9Mj', 14673),
	(4, 1, 'Ensalada César', 'Ensalada acompañada con trozos de pollo y salsa césar', 6.50, 'https://acortar.link/ideX5P', 953),
	(5, 1, 'BigMac', 'Hamburguesa con doble carne 100% vacuno español, lechuga fresca, cebolla, queso Cheddar y nuestra inimitable salsa secreta', 5.25, 'https://acortar.link/kE5TX8', 470),
	(6, 2, 'Crunchy Taco', NULL, 7.86, NULL, 40),
	(7, 2, 'Quesarito', 'Quesadilla caliente llena de deliciosos quesos fundidos que envuelve una
		mezcla de proteína, arroz, salsa Habanero y crema agria', 6.50, NULL, 50),
	(8, 2, 'Nachos Supreme', 'Tortilla chip, salsa Nacho, guacamole, crema agria y salsa Mexican', 3.50,
		'https://acortar.link/lAbTBW', 37),
	(9, 2, 'Arroz', 'Veggie', 3.00, NULL, 20),
	(10, 2, 'Cerveza', NULL, 1.80, NULL, 38),
	(11, 3, 'Croquetas de puchero', '5 unidades', 3.00, NULL, 59),
	(12, 3, 'Croquetas de jamón', '5 unidades', 3.00,  NULL, 87),
	(13, 3, 'Croquetas de cola de toro', '5 unidades', 3.20, NULL, 32),
	(14, 3, 'Croquetas de queso de cabra', '5 unidades', 3.20, NULL, 45),
	(15, 3, 'Combinado de croquetas', '3 unidades de cada tipo', 15.00, NULL, 100),
	(16, 4, 'Salmorejo', NULL, 10.00, NULL, 372),
	(17, 4, 'Gazpacho', NULL, 10.00, NULL, 300),
	(18, 4, 'Rulo de queso de cabra', NULL, 7.50, 'https://acortar.link/kJGX2C', 75),
	(19, 4, 'Solomillo al whiskey', NULL, 8.00, NULL, 22),
	(20, 4, 'Solomillo al roque', NULL, 8.00, NULL, 23),
	(21, 5, 'Pizza carbonara', 'Nata, Cebolla, Champiñones', 7.50, NULL, 50),
	(22, 5, 'Pizza 4 quesos', 'Roquefort, Cheddar, Mozzarella, Gouda', 7.80, NULL, 50),
	(23, 5, 'Pizza margarita', 'Orégano, Jamón York', 6.50, NULL, 50),
	(24, 5, 'Pizza barbacoa', 'Carne, Salsa Barbacoa', 7.50, NULL, 50),
	(25, 5, 'Sushi', 'Pescado', 20.00, NULL, 50),
	(26, 6, 'Nachos Perversos', 'Totopos caseros con carrillera, con extra de salsa de queso y de
		guacamole con crema agria', 9.00, NULL, 34),
	(27, 6, 'La Beerguería', 'Hamburguesa de 150gr con tierno pan brioche, desmigado de carne con BBQ
		sauce de cerveza “po ensima”, aguacate y queso havarti', 10.50, NULL, 13),
	(28, 6, 'El Campero', 'Nuestra versión del campero malagueño de pollo asado, mayonesa chipotle,
		queso havarti, lechuga, cebolla caramelizada y prosciutto', 10.50, NULL, 22),
	(29, 6, 'Espeto de Churros', 'Crujientes churros espetados rellenos de chocolate, listos para mojar
		en más chocolate y acompañados de arena Lotus de Málaga. ¡Qué empape!', 5.00, NULL, 15),
	(30, 6, 'La fresquita', 'Cerveza artesanal, sin filtrar y fresquita. Elaborada en Málaga y elegida
		por Illojuan para disfrutar', 2.00, NULL, 5);
	
INSERT INTO alerts(alertId, `dateTime`, productId, sent, postponed) VALUES 
	(1, "2022-08-17 07:34:12.256", 12, TRUE, FALSE),
	(2, "2022-06-22 14:28:39.734", 8, TRUE, FALSE),
	(3, "2022-05-01 22:54:43.848", 22, TRUE, FALSE),
	(4, "2022-03-14 17:29:38.579", 10, TRUE, FALSE),
	(5, "2021-11-04 01:47:32.112", 30, TRUE, FALSE);
	
INSERT INTO alertsstatus(alertStatusId, `read` , alertId , managerId) VALUES 
	(1, TRUE, 1, 2),
	(2, TRUE, 2, 2),
	(3, TRUE, 3, 3),
	(4, TRUE, 4, 1),
	(5, TRUE, 5, 4);
	
INSERT INTO productsOrders (productOrderId, orderId, productId, productUnits) VALUES
	(1, 1, 2, 3),
	(2, 1, 5, 3),
	(3, 2, 11, 1),
	(4, 2, 12, 1),
	(5, 2, 14, 1),
	(6, 3, 8, 2),
	(7, 3, 10, 3),
	(8, 4, 15, 1),
	(9, 5, 26, 3),
	(10, 5, 27, 2),
	(11, 5, 28, 2),
	(12, 5, 29, 4),
	(13, 5, 30, 8),
	(14, 6, 2, 2),
	(15, 6, 3, 3),
	(16, 6, 5, 1),
	(17, 7, 6, 1),
	(18, 7, 9, 1),
	(19, 8, 11, 1),
	(20, 8, 12, 1),
	(21, 8, 13, 1),
	(22, 8, 14, 1),
	(23, 9, 26, 2),
	(24, 9, 27, 1),
	(25, 9, 28, 1),
	(26, 9, 29, 2),
	(27, 9, 30, 4),
	(28, 10, 28, 1),
	(29, 10, 29, 1),
	(30, 10, 30, 2);