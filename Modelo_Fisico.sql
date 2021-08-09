-- Creacion de Tablas

CREATE TABLE libro(
	isbn BIGINT PRIMARY KEY,
	titulo VARCHAR(30) NOT NULL,
	numero_paginas SMALLINT NOT NULL,
	codigo_autor SMALLINT NOT NULL,
	nombre_autor VARCHAR(15) NOT NULL,
	apellido_autor VARCHAR(15) NOT NULL,
	fecha_nacimiento_muerte VARCHAR(9) NOT NULL,
	tipo_autor VARCHAR(9) NOT NULL,
	dias_prestamo SMALLINT NOT NULL
);

CREATE TABLE socio(
	rut VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(15) NOT NULL,
	apellido VARCHAR(15) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	telefono VARCHAR(9) NOT NULL
);

CREATE TABLE prestamo(
	id_prestamo INT PRIMARY KEY,
	socio VARCHAR(20) NOT NULL,
	libro VARCHAR(30) NOT NULL,
	fecha_prestamo DATE NOT NULL,
	fecha_devolucion DATE NOT NULL,
	isbn_libro BIGINT NOT NULL,
	rut_socio VARCHAR(10) NOT NULL,
	FOREIGN KEY (isbn_libro) REFERENCES libro(isbn),
	FOREIGN KEY (rut_socio) REFERENCES socio(rut)
);

-- Insersión de datos

INSERT INTO libro(isbn,titulo,numero_paginas,codigo_autor,nombre_autor,apellido_autor,fecha_nacimiento_muerte,tipo_autor,dias_prestamo)
VALUES
(1111111111111,'CUENTOS DE TERROR',344,3,'JOSE','SALGADO','1968-2020','PRINCIPAL',7),
(2222222222222,'POESÍAS CONTEMPORANEAS',167,1,'ANDRÉS','ULLOA','1982-','PRINCIPAL',7),
(3333333333333,'HISTORIA DE ASIA',511,2,'SERGIO','MARDONES','1950-2012','PRINCIPAL',14),
(4444444444444,'MANUAL DE MECÁNICA',298,5,'MARTIN','PORTA','1976-','PRINCIPAL',14);

INSERT INTO socio (rut,nombre,apellido,direccion,telefono)
VALUES
('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111'),
('2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222'),
('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333'),
('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444'),
('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');

INSERT INTO prestamo (id_prestamo,socio,libro,fecha_prestamo,fecha_devolucion,isbn_libro,rut_socio)
VALUES
(1,'JUAN SOTO','CUENTOS DE TERROR','2020-01-20','2020-01-27',1111111111111,'1111111-1'),
(2,'SILVANA MUÑOZ','POESÍAS CONTEMPORANEAS','2020-01-20','2020-01-27',3333333333333,'5555555-5'),
(3,'SANDRA AGUILAR','HISTORIA DE ASIA','2020-01-22','2020-01-30',4444444444444,'3333333-3'),
(4,'ESTEBAN JEREZ','MANUAL DE MECÁNICA','2020-01-23','2020-01-30',4444444444444,'4444444-4'),
(5,'ANA PÉREZ','CUENTOS DE TERROR','2020-01-27','2020-02-04',1111111111111,'2222222-2'),
(6,'JUAN SOTO','MANUAL DE MECÁNICA','2020-01-31','2020-02-12',4444444444444,'1111111-1'),
(7,'SANDRA AGUILAR','POESÍAS CONTEMPORANEAS','2020-01-31','2020-02-12',2222222222222,'3333333-3');

-- CONSULTAS A LA BASE DE DATOS
-- a. Mostrar todos los libros que posean menos de 300 páginas.
SELECT * FROM libro WHERE numero_paginas < 300;


-- b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
SELECT nombre_autor, apellido_autor FROM libro WHERE fecha_nacimiento_muerte > '1970-01-01';

-- c. ¿Cuál es el libro más solicitado?

-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- debería pagar cada usuario que entregue el préstamo después de 7 días.

