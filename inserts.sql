USE deliverus;

INSERT INTO customers (email, username, `name`, surname, phoneNumber, avatar, address, zipCode, `password`) VALUES
	('celiaplazita08@gmail.com', 'celplamac', 'Celia', 'Plaza Machado', '683246017', 'https://acortar.link/Yk5vKM', 'c\ Calígula, 48', '41089', '09876'),
	('deividsan@gmail.com', 'davsanala', 'David', 'Sánchez Álamo', '657896219', 'https://acortar.link/Jnfzd9', 'c\ Fragata, 4', '41012', '12345'),
	('natpelpar@gmail.com', 'natpelpar4', 'Natalia', 'Peluso Parra', '658302865', 'https://acortar.link/X6Biex', 'Plaza la Tona, 39', '41007', '7342340'),
	('marantmuñsol@gmail.com', 'marantmuñsol', 'Marco Antonio', 'Muñiz Solís', '614081596', 'https://acortar.link/pNKA9L', 'Mercado de las Candelarias puesto nº26, C. Gaviota', '41006', '1237q34503'),
	('morkhahor@gmail.com', 'morkhahor', 'Morad', 'El Khattouti El Horami', '629019602', 'https://acortar.link/CMODAM', 'Carrer Set, 3', '08130', 'motorola777');

INSERT INTO products (restauranteId, `name`, description, price, image, availability) VALUES
	(1, 'Patatas Deluxe Grandes', 'Gajos de patata especiadas', 3.75, 'https://acortar.link/domYrV', 'Disponible'),
	(1, 'Happy Meal', 'Menú especial para niños', 4.20, 'https://acortar.link/XUdtLR', 'Disponible'),
	(1, 'McFlurry Cornetto', 'Helado con sirope de Cornetto y deliciosos crujientes de barquillo con chocolate', 3.50, 'https://acortar.link/r9n9Mj', 'Disponible'),
	(1, 'Ensalada César', 'Ensalada acompañada con trozos de pollo y salsa césar', 6.50, 'https://acortar.link/ideX5P', 'Disponible'),
	(1, 'BigMac', 'Hamburguesa con doble carne 100% vacuno español, lechuga fresca, cebolla, queso Cheddar y nuestra inimitable salsa secreta', 5.25, 'https://acortar.link/kE5TX8', 'Disponible');
	
