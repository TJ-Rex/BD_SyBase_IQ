CREATE PUBLIC DATABASE LINK farmacia_link1
CONNECT TO ubdfarmacia IDENTIFIED BY "1234567"
USING 'xe'; 


CREATE TABLE medicamento_farmacia(
    id_medicamento_farmacia INT PRIMARY KEY,
    nombre_medicamento_farmacia VARCHAR(100),
    tipo_medicamento_farmacia VARCHAR(50), -- (Ej.: analgésico, antibiótico)
    precio_medicamento_farmacia DECIMAL,
    fecha_expiracion DATE,
    cantidad_disponible INT
)

INSERT INTO medicamento_farmacia (id_medicamento_farmacia, nombre_medicamento_farmacia, tipo_medicamento_farmacia, precio_medicamento_farmacia, fecha_expiracion, cantidad_disponible)
SELECT 1, 'Paracetamol', 'Analgesico', 2.50, '31/12/2024', 50 FROM DUAL UNION ALL
SELECT 2, 'Amoxicilina', 'Antibiotico', 10.00, '31/08/2025', 30 FROM DUAL UNION ALL
SELECT 3, 'Ibuprofeno', 'Antiinflamatorio', 3.00, '30/06/2024', 60 FROM DUAL UNION ALL
SELECT 4, 'Loratadina', 'Antihistaminico', 4.25, '30/11/2024', 40 FROM DUAL UNION ALL
SELECT 5, 'Metformina', 'Antidiabetico', 5.50, '30/09/2025', 80 FROM DUAL UNION ALL
SELECT 6, 'Omeprazol', 'Antiulceroso', 7.00, '31/07/2025', 70 FROM DUAL UNION ALL
SELECT 7, 'Salbutamol', 'Broncodilatador', 6.00, '31/10/2024', 20 FROM DUAL UNION ALL
SELECT 8, 'Simvastatina', 'Hipolipemiante', 8.50, '31/12/2024', 35 FROM DUAL;




CREATE TABLE proveedor_farmacia(
    id_proveedor_farmacia INT PRIMARY KEY,
    nombre_proveedor_farmacia VARCHAR(100),
    contacto_proveedor_farmacia VARCHAR(50),
    direccion_proveedor_farmacia VARCHAR(150)
)


INSERT INTO proveedor_farmacia (id_proveedor_farmacia, nombre_proveedor_farmacia, contacto_proveedor_farmacia, direccion_proveedor_farmacia)
SELECT 1, 'Laboratorios Pharma', '0998765432', 'Av. Principal 123, Ciudad A' FROM DUAL UNION ALL
SELECT 2, 'Medicamentos Plus', '0991234567', 'Calle Secundaria 456, Ciudad B' FROM DUAL UNION ALL
SELECT 3, 'Droguería Salud', '0987654321', 'Av. Central 789, Ciudad C' FROM DUAL UNION ALL
SELECT 4, 'Distribuidora Vita', '0991122334', 'Calle Los Álamos 321, Ciudad D' FROM DUAL UNION ALL
SELECT 5, 'Farmacéutica Global', '0992233445', 'Calle Los Pinos 654, Ciudad E' FROM DUAL UNION ALL
SELECT 6, 'Medicinas Ecuador', '0993344556', 'Av. de los Conquistadores 987, Ciudad F' FROM DUAL UNION ALL
SELECT 7, 'Farmalife', '0994455667', 'Calle Primera 246, Ciudad G' FROM DUAL UNION ALL
SELECT 8, 'Labmed', '0995566778', 'Av. de la Libertad 852, Ciudad H' FROM DUAL;



CREATE TABLE cliente_farmacia(
    id_cliente_farmacia INT PRIMARY KEY,
    nombre_cliente_farmacia VARCHAR(100),
    telefono_cliente_farmacia VARCHAR(20),
    direccion_cliente_farmacia VARCHAR(150)
)

INSERT INTO cliente_farmacia (id_cliente_farmacia, nombre_cliente_farmacia, telefono_cliente_farmacia, direccion_cliente_farmacia)
SELECT 1, 'Carlos Perez', '0999876543', 'Av. Las Palmas 234, Ciudad X' FROM DUAL UNION ALL
SELECT 2, 'Maria Torres', '0998765432', 'Calle Los Robles 456, Ciudad Y' FROM DUAL UNION ALL
SELECT 3, 'Juan Garcia', '0997654321', 'Av. Los Laureles 678, Ciudad Z' FROM DUAL UNION ALL
SELECT 4, 'Ana Lopez', '0996543210', 'Calle Los Cedros 789, Ciudad W' FROM DUAL UNION ALL
SELECT 5, 'Luis Martinez', '0995432109', 'Av. Las Acacias 123, Ciudad V' FROM DUAL UNION ALL
SELECT 6, 'Rosa Gomez', '0994321098', 'Calle Los Olivos 456, Ciudad U' FROM DUAL UNION ALL
SELECT 7, 'Pedro Rodriguez', '0993210987', 'Av. Las Margaritas 789, Ciudad T' FROM DUAL UNION ALL
SELECT 8, 'Carmen Diaz', '0992109876', 'Calle Los Eucaliptos 101, Ciudad S' FROM DUAL;




CREATE TABLE venta_farmacia(
    id_venta_farmacia INT PRIMARY KEY,
    id_cliente_farmacia INT,
    fecha_venta_farmacia DATE,
    total_venta_farmacia DECIMAL,
    metodo_pago_farmacia VARCHAR(20), -- (Ej.: efectivo, tarjeta)
    foreign key (id_cliente_farmacia) references cliente_farmacia(id_cliente_farmacia)
)

INSERT INTO venta_farmacia (id_venta_farmacia, id_cliente_farmacia, fecha_venta_farmacia, total_venta_farmacia, metodo_pago_farmacia)
SELECT 1, 1, '01/10/2024', 25.50, 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, '02/10/2024', 15.75, 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, '03/10/2024', 30.00, 'Transferencia' FROM DUAL UNION ALL
SELECT 4, 4, '04/10/2024', 50.25, 'Efectivo' FROM DUAL UNION ALL
SELECT 5, 5, '05/10/2024', 10.50, 'Tarjeta' FROM DUAL UNION ALL
SELECT 6, 6, '06/10/2024', 20.00, 'Transferencia' FROM DUAL UNION ALL
SELECT 7, 7, '07/10/2024', 35.75, 'Efectivo' FROM DUAL UNION ALL
SELECT 8, 8, '08/10/2024', 60.00, 'Tarjeta' FROM DUAL;




CREATE TABLE detalle_venta_farmacia(
    id_detalle_venta_farmacia INT PRIMARY KEY,
    id_venta_farmacia INT,
    id_medicamento_farmacia INT,
    cantidad_medicamento_farmacia INT,
    precio_unitario_farmacia DECIMAL,
    subtotal_farmacia DECIMAL,
    foreign key (id_venta_farmacia) references venta_farmacia(id_venta_farmacia),
    foreign key (id_medicamento_farmacia) references medicamento_farmacia(id_medicamento_farmacia)
)

INSERT INTO detalle_venta_farmacia (id_detalle_venta_farmacia, id_venta_farmacia, id_medicamento_farmacia, cantidad_medicamento_farmacia, precio_unitario_farmacia, subtotal_farmacia)
SELECT 1, 1, 1, 2, 2.50, 5.00 FROM DUAL UNION ALL
SELECT 2, 2, 2, 1, 10.00, 10.00 FROM DUAL UNION ALL
SELECT 3, 3, 3, 3, 3.00, 9.00 FROM DUAL UNION ALL
SELECT 4, 4, 4, 2, 4.25, 8.50 FROM DUAL UNION ALL
SELECT 5, 5, 5, 1, 5.50, 5.50 FROM DUAL UNION ALL
SELECT 6, 6, 6, 2, 7.00, 14.00 FROM DUAL UNION ALL
SELECT 7, 7, 7, 1, 6.00, 6.00 FROM DUAL UNION ALL
SELECT 8, 8, 8, 4, 8.50, 34.00 FROM DUAL;



CREATE TABLE personal_farmacia(
    id_personal_farmacia INT PRIMARY KEY,
    nombre_personal_farmacia VARCHAR(100),
    cargo_personal_farmacia VARCHAR(50), -- (Ej.: farmacéutico, auxiliar)
    sueldo_farmacia DECIMAL,
    fecha_contratacion_farmacia DATE
)

INSERT INTO personal_farmacia (id_personal_farmacia, nombre_personal_farmacia, cargo_personal_farmacia, sueldo_farmacia, fecha_contratacion_farmacia)
SELECT 1, 'Sofia Andrade', 'Farmacéutico', 1200.00, '01/01/2023' FROM DUAL UNION ALL
SELECT 2, 'Daniel Silva', 'Auxiliar', 900.00, '01/02/2023' FROM DUAL UNION ALL
SELECT 3, 'Carla Medina', 'Farmacéutico', 1250.00, '01/03/2023' FROM DUAL UNION ALL
SELECT 4, 'José Benitez', 'Auxiliar', 950.00, '01/04/2023' FROM DUAL UNION ALL
SELECT 5, 'Lucía Vargas', 'Farmacéutico', 1300.00, '01/05/2023' FROM DUAL UNION ALL
SELECT 6, 'Andrés Rojas', 'Auxiliar', 1000.00, '01/06/2023' FROM DUAL UNION ALL
SELECT 7, 'Fernanda Castro', 'Farmacéutico', 1350.00, '01/07/2023' FROM DUAL UNION ALL
SELECT 8, 'David Herrera', 'Auxiliar', 1100.00, '01/08/2023' FROM DUAL;



CREATE TABLE pedido_proveedor_farmacia(
    id_pedido_proveedor_farmacia INT PRIMARY KEY,
    id_proveedor_farmacia INT,
    fecha_pedido_farmacia DATE,
    total_pedido_farmacia DECIMAL,
    foreign key (id_proveedor_farmacia) references proveedor_farmacia(id_proveedor_farmacia)
)

INSERT INTO pedido_proveedor_farmacia (id_pedido_proveedor_farmacia, id_proveedor_farmacia, fecha_pedido_farmacia, total_pedido_farmacia)
SELECT 1, 1, '01/10/2024', 500.00 FROM DUAL UNION ALL
SELECT 2, 2, '02/10/2024', 300.00 FROM DUAL UNION ALL
SELECT 3, 3, '03/10/2024', 450.00 FROM DUAL UNION ALL
SELECT 4, 4, '04/10/2024', 350.00 FROM DUAL UNION ALL
SELECT 5, 5, '05/10/2024', 200.00 FROM DUAL UNION ALL
SELECT 6, 6, '06/10/2024', 400.00 FROM DUAL UNION ALL
SELECT 7, 7, '07/10/2024', 550.00 FROM DUAL UNION ALL
SELECT 8, 8, '08/10/2024', 600.00 FROM DUAL;




CREATE TABLE detalle_pedido_farmacia(
    id_detalle_pedido_farmacia INT PRIMARY KEY,
    id_pedido_proveedor_farmacia INT,
    id_medicamento_farmacia INT,
    cantidad_medicamento_farmacia INT,
    precio_unitario_farmacia DECIMAL,
    subtotal_farmacia DECIMAL,
    foreign key (id_pedido_proveedor_farmacia) references pedido_proveedor_farmacia(id_pedido_proveedor_farmacia)
)


INSERT INTO detalle_pedido_farmacia (id_detalle_pedido_farmacia, id_pedido_proveedor_farmacia, id_medicamento_farmacia, cantidad_medicamento_farmacia, precio_unitario_farmacia, subtotal_farmacia)
SELECT 1, 1, 1, 50, 2.50, 125.00 FROM DUAL UNION ALL
SELECT 2, 2, 2, 30, 10.00, 300.00 FROM DUAL UNION ALL
SELECT 3, 3, 3, 40, 3.00, 120.00 FROM DUAL UNION ALL
SELECT 4, 4, 4, 20, 4.25, 85.00 FROM DUAL UNION ALL
SELECT 5, 5, 5, 25, 5.50, 137.50 FROM DUAL UNION ALL
SELECT 6, 6, 6, 35, 7.00, 245.00 FROM DUAL UNION ALL
SELECT 7, 7, 7, 15, 6.00, 90.00 FROM DUAL UNION ALL
SELECT 8, 8, 8, 45, 8.50, 382.50 FROM DUAL;











