CREATE DATABASE prueba;

CREATE TABLE client_table(
    id SERIAL,
    client_name VARCHAR(100) NOT NULL,
    rut VARCHAR(10) NOT NULL,
    client_address VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_table(
    id SERIAL,
    date_invoice DATE NOT NULL,
    id_client_invoice INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_client_invoice) REFERENCES client_table(id)
);

CREATE TABLE categories_table(
    id SERIAL,
    name_category VARCHAR(100) NOT NULL,
    description_category VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE product_table(
    id SERIAL,
    product_name VARCHAR(100) NOT NULL,
    description_product VARCHAR(255) NOT NULL,
    unit_value FLOAT,
    id_category INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_category) REFERENCES categories_table(id)
);


CREATE TABLE invoice_product_table(
    id INT,
    id_invoice INT,
    id_product INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_invoice) REFERENCES invoice_table(id),
    FOREIGN KEY (id_product) REFERENCES product_table(id)
);

--PARTE 1
--Insertar 5 clientes, client_table
INSERT INTO client_table (client_name, rut, client_address)
VALUES ('Josefina', '12000000-1', 'Santa Rosa 44, San  Miguel');
INSERT INTO client_table (client_name, rut, client_address)
VALUES ('Evelyn', '12000000-2', 'Vicuña Mackenna 50, depto 4, San Joaquin');
INSERT INTO client_table (client_name, rut, client_address)
VALUES ('Marcos', '12000000-3', 'Carmen 500, depto 151, Santiago');
INSERT INTO client_table (client_name, rut, client_address)
VALUES ('Claudio', '12000000-4', 'Las Rosas 345, La Reina');
INSERT INTO client_table (client_name, rut, client_address)
VALUES ('Mario', '12000000-5', 'Colombia 14, depto 212, La florida');

--Insertar 3 categorías, categories_table
INSERT INTO categories_table (name_category, description_category) 
VALUES ('Cocina', 'productos de utensilios diversos para la cocina');
INSERT INTO categories_table (name_category, description_category) 
VALUES ('Deporte', 'desde ropa hasta accesorios y utensilios para cada área');
INSERT INTO categories_table (name_category, description_category) 
VALUES ('Jardín', 'accesorios decorativos, utensilios y herramientas para exterior');

--Insertar 8 productos, product_table
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('pocillos de cerámica', 'ideal para postres y usar en horno', 1500, 1);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('canilleras de niños', 'protectores de futbol para canillas hasta 12 años', 3000, 2); 
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('arco de futbol', 'arco infantil de futbol de 1x1,5', 5000, 2);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('herramientas jardín', 'kit de 3 utensilios para jardinear', 4000, 3);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('kit cucharones de silicona', '5 tipos de cucharones de silicona', 2000, 1);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('luces exterior', 'luces solares pequeñas de 10 metros para decorar el jardin', 2000, 3);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('mat para yoga', 'mat acolchado ideal para yoga y pilates', 6000, 2);
INSERT INTO product_table (product_name, description_product, unit_value, id_category)
VALUES ('sartén con teflon', 'sartén con teflón antiadherente ', 5500, 1);

--PARTE 2
--Insertar 10 facturas en total:
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('03-03-2021', 1);    
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('05-03-2021', 1); 
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('07-03-2021', 2); 
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('09-03-2021', 2);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('08-03-2021', 2);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('04-03-2021', 3);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('09-03-2021', 4);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('02-03-2021', 4);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('05-03-2021', 4);
INSERT INTO invoice_table (date_invoice, id_client_invoice) VALUES ('07-03-2021', 4);


--2 para el cliente 1, con 2 y 3 productos
--3 para el cliente 2, con 3, 2 y 3 productos
--1 para el cliente 3, con 1 producto
--4 para el cliente 4, con 2, 3, 4 y 1 producto
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (1, 1, 1);    
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (2, 1, 7);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (3, 2, 2);    
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (4, 2, 5);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (5, 2, 8);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (6, 3, 3);    
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (7, 3, 4);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (8, 3, 6);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (9, 4, 7);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (10, 4, 1);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (11, 5, 2);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (12, 5, 6);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (13, 5, 8);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (14, 6, 5);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (15, 7, 7);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (16, 7, 1);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (17, 8, 2);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (18, 8, 4);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (19, 8, 5);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (20, 9, 8);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (21, 9, 1);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (22, 9, 6);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (23, 9, 3);
INSERT INTO invoice_product_table (id, id_invoice, id_product) VALUES (24, 10, 2);

--PARTE 3

--¿Qué cliente realizó la compra más cara?
SELECT client_name FROM client_table 
INNER JOIN invoice_table ON client_table.id = invoice_table.id_client_invoice
INNER JOIN invoice_product_table ON invoice_table.id = invoice_product_table.id
INNER JOIN product_table ON invoice_product_table.id_product = product_table.id
GROUP BY client_name
ORDER BY SUM(unit_value) DESC LIMIT 1;

------------------------------------
--¿Que cliente pagó sobre 100 de monto?
SELECT invoice_table.id_client_invoice AS cliente,
invoice_table.id AS factura,
x.subtotal AS subtotal
FROM
    (SELECT invoice_product_table.id_invoice AS Factura,
    SUM(product_table.unit_value) AS subtotal
    FROM invoice_table
    INNER JOIN invoice_product_table
    ON invoice_table.id=invoice_product_table.id
    INNER JOIN product_table
    ON invoice_product_table.id_product=product_table.id
    GROUP BY Factura
    ) AS x
INNER JOIN invoice_table ON x.factura=invoice_table.id
WHERE x.subtotal>100;

--------------OTRA FORMA
SELECT client_name FROM client_table
INNER JOIN invoice_table ON client_table.id = id_client_invoice
INNER JOIN invoice_product_table ON invoice_table.id = invoice_product_table.id
INNER JOIN product_table ON invoice_product_table.id_product = product_table.id
GROUP BY client_name
HAVING SUM(unit_value) > 100;

--¿Cuantos clientes han comprado el producto 6?
SELECT invoice_table.id_client_invoice AS cliente,
invoice_product_table.id_product AS producto
FROM invoice_table
INNER JOIN invoice_product_table ON invoice_table.id=invoice_product_table.id
INNER JOIN product_table ON invoice_product_table.id_product = product_table.id
WHERE invoice_product_table.id_product=6;
        
SELECT COUNT(client_name) FROM client_table
INNER JOIN invoice_table ON client_table.id = id_client_invoice
INNER JOIN invoice_product_table ON invoice_table.id = invoice_product_table.id_product
INNER JOIN product_table ON invoice_product_table.id_product = product_table.id
WHERE product_table.id = 6;


