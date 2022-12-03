-- vista que contiene los restaurantes cuyo codigo postal es 41010
CREATE OR REPLACE VIEW ViewZipCode AS
	SELECT * FROM Restaurants WHERE zipCode = '41010';
-- SELECT COUNT(*) FROM ViewZipCode;

-- vista a partir de la anterior que me muestra los restaurante cuyo codigo postal es 41010 y tienen gastos de envio menores de 3.00 €	
CREATE OR REPLACE VIEW ViewZipCodeShippingCosts AS 
	SELECT * FROM ViewZipCode WHERE shippingCosts<3;
-- SELECT * FROM ViewZipCodeShippingCosts;