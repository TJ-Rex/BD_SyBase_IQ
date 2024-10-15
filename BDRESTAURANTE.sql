CREATE PUBLIC DATABASE LINK restaurante_link
CONNECT TO ubdrestaurante IDENTIFIED BY "1234567"
USING 'xe'; 


CREATE TABLE cliente_restaurante(
    id_cliente_restaurante INT PRIMARY KEY,
    nombre_cliente_restaurante VARCHAR(50),
    apellido_cliente_restaurante VARCHAR(50),
    telefono_cliente_restaurante VARCHAR(20),
    correo_cliente_restaurante VARCHAR(50)
)

INSERT INTO cliente_restaurante (id_cliente_restaurante, nombre_cliente_restaurante, apellido_cliente_restaurante, telefono_cliente_restaurante, correo_cliente_restaurante)
SELECT 1, 'Pedro', 'Martinez', '0987654321', 'pedro.martinez@mail.com' FROM DUAL UNION ALL
SELECT 2, 'Laura', 'Gonzalez', '0991234567', 'laura.gonzalez@mail.com' FROM DUAL UNION ALL
SELECT 3, 'Carlos', 'Lopez', '0983219876', 'carlos.lopez@mail.com' FROM DUAL UNION ALL
SELECT 4, 'Ana', 'Perez', '0998765432', 'ana.perez@mail.com' FROM DUAL UNION ALL
SELECT 5, 'Mario', 'Diaz', '0976543210', 'mario.diaz@mail.com' FROM DUAL UNION ALL
SELECT 6, 'Sofia', 'Romero', '0999991234', 'sofia.romero@mail.com' FROM DUAL UNION ALL
SELECT 7, 'Diego', 'Ramirez', '0986547890', 'diego.ramirez@mail.com' FROM DUAL UNION ALL
SELECT 8, 'Valeria', 'Torres', '0978675432', 'valeria.torres@mail.com' FROM DUAL;




CREATE TABLE menu_restaurante(
    id_menu_restaurante INT PRIMARY KEY,
    nombre_menu_restaurante VARCHAR(50),
    descripcion_menu_restaurante VARCHAR(100),
    precio_menu_restaurante DECIMAL(10, 2)
)

INSERT INTO menu_restaurante (id_menu_restaurante, nombre_menu_restaurante, descripcion_menu_restaurante, precio_menu_restaurante)
SELECT 1, 'Hamburguesa', 'Hamburguesa de carne con queso', 4.50 FROM DUAL UNION ALL
SELECT 2, 'Pizza Margarita', 'Pizza de queso y tomate', 5.75 FROM DUAL UNION ALL
SELECT 3, 'Ensalada César', 'Ensalada con pollo y aderezo César', 3.50 FROM DUAL UNION ALL
SELECT 4, 'Sopa de Pollo', 'Sopa casera de pollo', 2.25 FROM DUAL UNION ALL
SELECT 5, 'Tacos', 'Tacos con carne de res y guacamole', 3.75 FROM DUAL UNION ALL
SELECT 6, 'Pasta Alfredo', 'Pasta con salsa Alfredo y pollo', 6.00 FROM DUAL UNION ALL
SELECT 7, 'Sandwich Club', 'Sandwich con jamón, queso y huevo', 3.25 FROM DUAL UNION ALL
SELECT 8, 'Helado de Chocolate', 'Helado cremoso de chocolate', 2.00 FROM DUAL;



CREATE TABLE pedido_restaurante(
    id_pedido_restaurante INT PRIMARY KEY, 
    id_cliente_restaurante INT,
    id_menu_restaurante INT,
    fecha_pedido_restaurante DATE,
    estado_pedido_restaurante VARCHAR(20), -- Ejemplo: en preparación, listo, entregado
    foreign key (id_cliente_restaurante) references cliente_restaurante(id_cliente_restaurante),
    foreign key (id_menu_restaurante) references menu_restaurante(id_menu_restaurante)
)


INSERT INTO pedido_restaurante (id_pedido_restaurante, id_cliente_restaurante, id_menu_restaurante, fecha_pedido_restaurante, estado_pedido_restaurante)
SELECT 1, 1, 1, TO_DATE('01/10/2024', 'DD/MM/YYYY'), 'En preparación' FROM DUAL UNION ALL
SELECT 2, 2, 3, TO_DATE('02/10/2024', 'DD/MM/YYYY'), 'Listo' FROM DUAL UNION ALL
SELECT 3, 3, 5, TO_DATE('03/10/2024', 'DD/MM/YYYY'), 'Entregado' FROM DUAL UNION ALL
SELECT 4, 4, 7, TO_DATE('04/10/2024', 'DD/MM/YYYY'), 'En preparación' FROM DUAL UNION ALL
SELECT 5, 5, 2, TO_DATE('05/10/2024', 'DD/MM/YYYY'), 'Listo' FROM DUAL UNION ALL
SELECT 6, 6, 4, TO_DATE('06/10/2024', 'DD/MM/YYYY'), 'Entregado' FROM DUAL UNION ALL
SELECT 7, 7, 6, TO_DATE('07/10/2024', 'DD/MM/YYYY'), 'En preparación' FROM DUAL UNION ALL
SELECT 8, 8, 8, TO_DATE('08/10/2024', 'DD/MM/YYYY'), 'Listo' FROM DUAL;





CREATE TABLE personal_restaurante(
    id_personal_restaurante INT PRIMARY KEY,
    nombre_personal_restaurante VARCHAR(50),
    apellido_personal_restaurante VARCHAR(50),
    cargo_personal_restaurante VARCHAR(30), -- Ejemplo: mesero, barista, cajero
    telefono_restaurante VARCHAR(20)
)


INSERT INTO personal_restaurante (id_personal_restaurante, nombre_personal_restaurante, apellido_personal_restaurante, cargo_personal_restaurante, telefono_restaurante)
SELECT 1, 'Pedro', 'Guzman', 'Mesero', '0987656789' FROM DUAL UNION ALL
SELECT 2, 'Lucia', 'Garcia', 'Cajero', '0990123456' FROM DUAL UNION ALL
SELECT 3, 'Fernando', 'Castro', 'Cocinero', '0986541234' FROM DUAL UNION ALL
SELECT 4, 'Paola', 'Ortiz', 'Mesero', '0998765432' FROM DUAL UNION ALL
SELECT 5, 'Andres', 'Diaz', 'Cajero', '0976548901' FROM DUAL UNION ALL
SELECT 6, 'Monica', 'Rios', 'Cocinero', '0999123456' FROM DUAL UNION ALL
SELECT 7, 'Ricardo', 'Mendoza', 'Mesero', '0981234567' FROM DUAL UNION ALL
SELECT 8, 'Diana', 'Salazar', 'Cajero', '0978675432' FROM DUAL;




CREATE TABLE factura_restaurante(
    id_factura_restaurante INT PRIMARY KEY,
    id_pedido_restaurante INT,
    monto_total_restaurante DECIMAL,
    fecha_factura_restaurante DATE,
    metodo_pago_restaurante VARCHAR(20) -- Ejemplo: efectivo, tarjeta
)


INSERT INTO factura_restaurante (id_factura_restaurante, id_pedido_restaurante, monto_total_restaurante, fecha_factura_restaurante, metodo_pago_restaurante)
SELECT 1, 1, 4.50, '01/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, 5.00, '02/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, 3.50, '03/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 4, 4, 6.25, '04/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 5, 5, 4.50, '05/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 6, 6, 2.50, '06/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 7, 7, 5.75, '07/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 8, 8, 4.00, '08/10/2024', 'Tarjeta' FROM DUAL;


