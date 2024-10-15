CREATE PUBLIC DATABASE LINK tiendavideojuegos_link
CONNECT TO ubdtiendavideojuegos IDENTIFIED BY "1234567"
USING 'xe'; 



CREATE TABLE videojuego (
    id_videojuego INT PRIMARY KEY,
    nombre_videojuego VARCHAR(100),
    plataforma VARCHAR(50),
    genero VARCHAR(50),
    precio DECIMAL,
    stock INT
)

INSERT INTO videojuego (id_videojuego, nombre_videojuego, plataforma, genero, precio, stock)
SELECT 1, 'The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Aventura', 59.99, 10 FROM DUAL UNION ALL
SELECT 2, 'Super Mario Odyssey', 'Nintendo Switch', 'Plataformas', 49.99, 15 FROM DUAL UNION ALL
SELECT 3, 'God of War', 'PlayStation 4', 'Acción/Aventura', 39.99, 8 FROM DUAL UNION ALL
SELECT 4, 'The Last of Us Part II', 'PlayStation 4', 'Acción/Aventura', 59.99, 5 FROM DUAL UNION ALL
SELECT 5, 'Halo Infinite', 'Xbox Series X', 'Disparos', 69.99, 12 FROM DUAL;


CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    telefono_cliente VARCHAR(20)
)

INSERT INTO cliente (id_cliente, nombre_cliente, email_cliente, telefono_cliente)
SELECT 1, 'Carlos Pérez', 'carlos.perez@example.com', '0987654321' FROM DUAL UNION ALL
SELECT 2, 'María López', 'maria.lopez@example.com', '0912345678' FROM DUAL UNION ALL
SELECT 3, 'Juan Gómez', 'juan.gomez@example.com', '0981122334' FROM DUAL UNION ALL
SELECT 4, 'Sofía Martínez', 'sofia.martinez@example.com', '0911223344' FROM DUAL UNION ALL
SELECT 5, 'Ana Torres', 'ana.torres@example.com', '0976543210' FROM DUAL;


CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    puesto VARCHAR(50),
    fecha_contratacion DATE
)

INSERT INTO empleado (id_empleado, nombre_empleado, puesto, fecha_contratacion)
SELECT 1, 'Luis Fernández', 'Vendedor', '01/01/2020' FROM DUAL UNION ALL
SELECT 2, 'Ana García', 'Gerente', '01/02/2021' FROM DUAL UNION ALL
SELECT 3, 'Pedro Ramírez', 'Vendedor', '01/03/2021' FROM DUAL UNION ALL
SELECT 4, 'María Ruiz', 'Asistente', '01/04/2021' FROM DUAL UNION ALL
SELECT 5, 'Jorge López', 'Vendedor', '01/05/2021' FROM DUAL;



CREATE TABLE venta (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    fecha_venta DATE,
    total DECIMAL(10, 2),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_empleado) references empleado(id_empleado)
)

INSERT INTO venta (id_venta, id_cliente, id_empleado, fecha_venta, total)
SELECT 1, 1, 1, '01/10/2024', 59.99 FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 49.99 FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 39.99 FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 59.99 FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 69.99 FROM DUAL;



CREATE TABLE detalle_venta (
    id_detalle_venta INT PRIMARY KEY,
    id_venta INT,
    id_videojuego INT,
    cantidad INT,
    subtotal DECIMAL,
    foreign key (id_venta) references venta(id_venta),
    foreign key (id_videojuego) references videojuego(id_videojuego)
)

INSERT INTO detalle_venta (id_detalle_venta, id_venta, id_videojuego, cantidad, subtotal)
SELECT 1, 1, 1, 1, 59.99 FROM DUAL UNION ALL
SELECT 2, 2, 2, 1, 49.99 FROM DUAL UNION ALL
SELECT 3, 3, 3, 1, 39.99 FROM DUAL UNION ALL
SELECT 4, 4, 4, 1, 59.99 FROM DUAL UNION ALL
SELECT 5, 5, 5, 1, 69.99 FROM DUAL;



CREATE TABLE proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    contacto_proveedor VARCHAR(100)
)

INSERT INTO proveedor (id_proveedor, nombre_proveedor, contacto_proveedor)
SELECT 1, 'Distribuciones Videojuegos S.A.', 'contacto@distribuciones.com' FROM DUAL UNION ALL
SELECT 2, 'Proveedores de Entretenimiento Ltda.', 'info@entretenimiento.com' FROM DUAL UNION ALL
SELECT 3, 'Gaming Supplies Co.', 'sales@gamingsupplies.com' FROM DUAL UNION ALL
SELECT 4, 'Videojuegos Internacionales', 'ventas@videointernacionales.com' FROM DUAL UNION ALL
SELECT 5, 'Entretenimiento Global', 'contacto@globalentertainment.com' FROM DUAL;



CREATE TABLE compra_proveedor (
    id_compra_proveedor INT PRIMARY KEY,
    id_proveedor INT,
    id_videojuego INT,
    fecha_compra DATE,
    cantidad INT,
    foreign key (id_proveedor) references proveedor(id_proveedor),
    foreign key (id_videojuego) references videojuego(id_videojuego)
)


INSERT INTO compra_proveedor (id_compra_proveedor, id_proveedor, id_videojuego, fecha_compra, cantidad)
SELECT 1, 1, 1, '01/10/2024', 20 FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 15 FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 10 FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 5 FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 8 FROM DUAL;







