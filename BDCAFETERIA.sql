CREATE PUBLIC DATABASE LINK cafeteria_link
CONNECT TO ubdcafeteria IDENTIFIED BY "1234567"
USING 'xe'; 


CREATE TABLE cliente_cafeteria(
    id_cliente_cafeteria INT PRIMARY KEY,
    nombre_cliente_cafeteria VARCHAR(50),
    apellido_cliente_cafeteria VARCHAR(50),
    telefono_cliente_cafeteria VARCHAR(20),
    correo_cliente_cafeteria VARCHAR(50)
)

INSERT INTO cliente_cafeteria (id_cliente_cafeteria, nombre_cliente_cafeteria, apellido_cliente_cafeteria, telefono_cliente_cafeteria, correo_cliente_cafeteria)
SELECT 1, 'Juan', 'Perez', '0987654321', 'juan.perez@mail.com' FROM DUAL UNION ALL
SELECT 2, 'Maria', 'Gomez', '0991234567', 'maria.gomez@mail.com' FROM DUAL UNION ALL
SELECT 3, 'Carlos', 'Lopez', '0981239876', 'carlos.lopez@mail.com' FROM DUAL UNION ALL
SELECT 4, 'Ana', 'Martinez', '0998765432', 'ana.martinez@mail.com' FROM DUAL UNION ALL
SELECT 5, 'Luis', 'Rodriguez', '0976543210', 'luis.rodriguez@mail.com' FROM DUAL UNION ALL
SELECT 6, 'Sofia', 'Fernandez', '0999991234', 'sofia.fernandez@mail.com' FROM DUAL UNION ALL
SELECT 7, 'Diego', 'Ramirez', '0986547890', 'diego.ramirez@mail.com' FROM DUAL UNION ALL
SELECT 8, 'Valeria', 'Torres', '0978675432', 'valeria.torres@mail.com' FROM DUAL;



CREATE TABLE menu_cafeteria(
    id_menu_cafeteria INT PRIMARY KEY,
    nombre_menu_cafeteria VARCHAR(50),
    descripcion_menu_cafeteria VARCHAR(100),
    precio_menu_cafeteria DECIMAL(10, 2)
)

INSERT INTO menu_cafeteria(id_menu_cafeteria, nombre_menu_cafeteria, descripcion_menu_cafeteria, precio_menu_cafeteria)
SELECT 1, 'Café Americano', 'Café negro tradicional', 1.50 FROM DUAL UNION ALL
SELECT 2, 'Café con Leche', 'Café con leche caliente', 2.00 FROM DUAL UNION ALL
SELECT 3, 'Capuchino', 'Café espumoso con leche', 2.50 FROM DUAL UNION ALL
SELECT 4, 'Latte', 'Café con mucha leche', 2.75 FROM DUAL UNION ALL
SELECT 5, 'Sandwich', 'Pan con jamón y queso', 3.00 FROM DUAL UNION ALL
SELECT 6, 'Muffin', 'Muffin de arándano', 1.75 FROM DUAL UNION ALL
SELECT 7, 'Torta de Chocolate', 'Torta de chocolate suave', 2.50 FROM DUAL UNION ALL
SELECT 8, 'Croissant', 'Croissant de mantequilla', 2.25 FROM DUAL;




CREATE TABLE pedido_cafeteria(
    id_pedido_cafeteria INT PRIMARY KEY, 
    id_cliente_cafeteria INT,
    id_menu_cafeteria INT,
    fecha_pedido_cafeteria DATE,
    estado_pedido_cafeteria VARCHAR(20), -- Ejemplo: en preparación, listo, entregado
    foreign key (id_cliente_cafeteria) references cliente_cafeteria(id_cliente_cafeteria),
    foreign key (id_menu_cafeteria) references menu_cafeteria(id_menu_cafeteria)
)

INSERT INTO pedido_cafeteria(id_pedido_cafeteria, id_cliente_cafeteria, id_menu_cafeteria, fecha_pedido_cafeteria, estado_pedido_cafeteria)
SELECT 1, 1, 1, '01/10/2024', 'En preparación' FROM DUAL UNION ALL
SELECT 2, 2, 3, '02/10/2024', 'Listo' FROM DUAL UNION ALL
SELECT 3, 3, 5, '03/10/2024', 'Entregado' FROM DUAL UNION ALL
SELECT 4, 4, 7, '04/10/2024', 'En preparación' FROM DUAL UNION ALL
SELECT 5, 5, 2, '05/10/2024', 'Listo' FROM DUAL UNION ALL
SELECT 6, 6, 4, '06/10/2024', 'Entregado' FROM DUAL UNION ALL
SELECT 7, 7, 6, '07/10/2024', 'En preparación' FROM DUAL UNION ALL
SELECT 8, 8, 8, '08/10/2024', 'Listo' FROM DUAL;




CREATE TABLE personal_cafeteria(
    id_personal_cafeteria INT PRIMARY KEY,
    nombre_personal_cafeteria VARCHAR(50),
    apellido_personal_cafeteria VARCHAR(50),
    cargo_personal_cafeteria VARCHAR(30), -- Ejemplo: mesero, barista, cajero
    telefono_cafeteria VARCHAR(20)
)

INSERT INTO personal_cafeteria(id_personal_cafeteria, nombre_personal_cafeteria, apellido_personal_cafeteria, cargo_personal_cafeteria, telefono_cafeteria)
SELECT 1, 'Pedro', 'Guzman', 'Mesero', '0987656789' FROM DUAL UNION ALL
SELECT 2, 'Lucia', 'Garcia', 'Cajero', '0990123456' FROM DUAL UNION ALL
SELECT 3, 'Fernando', 'Castro', 'Barista', '0986541234' FROM DUAL UNION ALL
SELECT 4, 'Paola', 'Ortiz', 'Mesero', '0998765432' FROM DUAL UNION ALL
SELECT 5, 'Andres', 'Diaz', 'Cajero', '0976548901' FROM DUAL UNION ALL
SELECT 6, 'Monica', 'Rios', 'Barista', '0999123456' FROM DUAL UNION ALL
SELECT 7, 'Ricardo', 'Mendoza', 'Mesero', '0981234567' FROM DUAL UNION ALL
SELECT 8, 'Diana', 'Salazar', 'Cajero', '0978675432' FROM DUAL;


CREATE TABLE factura_cafeteria(
    id_factura_cafeteria INT PRIMARY KEY,
    id_pedido_cafeteria INT,
    monto_total DECIMAL,
    fecha_factura_cafeteria DATE,
    metodo_pago_cafeteria VARCHAR(20) -- Ejemplo: efectivo, tarjeta
)


INSERT INTO factura_cafeteria(id_factura_cafeteria, id_pedido_cafeteria, monto_total, fecha_factura_cafeteria, metodo_pago_cafeteria)
SELECT 1, 1, 3.50, '01/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, 5.00, '02/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, 3.50, '03/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 4, 4, 6.25, '04/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 5, 5, 4.50, '05/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 6, 6, 2.50, '06/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 7, 7, 5.75, '07/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 8, 8, 4.00, '08/10/2024', 'Tarjeta' FROM DUAL;







