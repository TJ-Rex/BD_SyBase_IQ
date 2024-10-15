CREATE PUBLIC DATABASE LINK parqueadero_link
CONNECT TO ubdparqueadero IDENTIFIED BY "1234567"
USING 'xe'; 

CREATE TABLE cliente(
    id_cliente int PRIMARY KEY,
    nombre_cliente varchar(50),
    apellido_cliente varchar(50),
    telefono_cleitne varchar(20),
    correo_cliente varchar(50)
)


INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, telefono_cleitne, correo_cliente)
SELECT 1, 'Juan', 'Perez', '0987654321', 'juan.perez@mail.com' FROM DUAL UNION ALL
SELECT 2, 'Maria', 'Gomez', '0991234567', 'maria.gomez@mail.com' FROM DUAL UNION ALL
SELECT 3, 'Carlos', 'Lopez', '0981239876', 'carlos.lopez@mail.com' FROM DUAL UNION ALL
SELECT 4, 'Ana', 'Martinez', '0998765432', 'ana.martinez@mail.com' FROM DUAL UNION ALL
SELECT 5, 'Luis', 'Rodriguez', '0976543210', 'luis.rodriguez@mail.com' FROM DUAL UNION ALL
SELECT 6, 'Sofia', 'Fernandez', '0999991234', 'sofia.fernandez@mail.com' FROM DUAL UNION ALL
SELECT 7, 'Diego', 'Ramirez', '0986547890', 'diego.ramirez@mail.com' FROM DUAL UNION ALL
SELECT 8, 'Valeria', 'Torres', '0978675432', 'valeria.torres@mail.com' FROM DUAL;




CREATE TABLE vehiculos(
    id_vehiculo INT PRIMARY KEY,
    id_cliente INT,
    placa VARCHAR(10),
    marca VARCHAR(30),
    modelo VARCHAR(30),
    color VARCHAR(20),
    foreign key (id_cliente) references cliente(id_cliente)
)

INSERT INTO vehiculos (id_vehiculo, id_cliente, placa, marca, modelo, color)
SELECT 1, 1, 'ABC1234', 'Toyota', 'Corolla', 'Rojo' FROM DUAL UNION ALL
SELECT 2, 2, 'DEF5678', 'Honda', 'Civic', 'Azul' FROM DUAL UNION ALL
SELECT 3, 3, 'GHI9012', 'Nissan', 'Sentra', 'Negro' FROM DUAL UNION ALL
SELECT 4, 4, 'JKL3456', 'Chevrolet', 'Spark', 'Blanco' FROM DUAL UNION ALL
SELECT 5, 5, 'MNO7890', 'Mazda', '3', 'Gris' FROM DUAL UNION ALL
SELECT 6, 6, 'PQR1234', 'Kia', 'Rio', 'Verde' FROM DUAL UNION ALL
SELECT 7, 7, 'STU5678', 'Ford', 'Fiesta', 'Amarillo' FROM DUAL UNION ALL
SELECT 8, 8, 'VWX9012', 'Hyundai', 'Accent', 'Plateado' FROM DUAL;




CREATE TABLE personal(
    id_personal INT PRIMARY KEY,
    nombre_personal VARCHAR(50),
    apellido_personal VARCHAR(50),
    cargo_personal VARCHAR(30), -- Ejemplo: guardia, cajero
    telefono_personal VARCHAR(20)
)

INSERT INTO personal (id_personal, nombre_personal, apellido_personal, cargo_personal, telefono_personal)
SELECT 1, 'Pedro', 'Guzman', 'Guardia', '0987656789' FROM DUAL UNION ALL
SELECT 2, 'Lucia', 'Garcia', 'Cajero', '0990123456' FROM DUAL UNION ALL
SELECT 3, 'Fernando', 'Castro', 'Administrador', '0986541234' FROM DUAL UNION ALL
SELECT 4, 'Paola', 'Ortiz', 'Guardia', '0998765432' FROM DUAL UNION ALL
SELECT 5, 'Andres', 'Diaz', 'Cajero', '0976548901' FROM DUAL UNION ALL
SELECT 6, 'Monica', 'Rios', 'Administrador', '0999123456' FROM DUAL UNION ALL
SELECT 7, 'Ricardo', 'Mendoza', 'Guardia', '0981234567' FROM DUAL UNION ALL
SELECT 8, 'Diana', 'Salazar', 'Cajero', '0978675432' FROM DUAL;



CREATE TABLE espacio_parqueo(
    id_espacio_parqueo INT PRIMARY KEY,
    numero_espacio_parqueo INT,
    tipo_vehiculo VARCHAR(20), -- Ejemplo: auto, moto, camion
    estado_espacio_parqueo VARCHAR(10) -- Ejemplo: ocupado, libre
)


INSERT INTO espacio_parqueo (id_espacio_parqueo, numero_espacio_parqueo, tipo_vehiculo, estado_espacio_parqueo)
SELECT 1, 101, 'Auto', 'Ocupado' FROM DUAL UNION ALL
SELECT 2, 102, 'Moto', 'Libre' FROM DUAL UNION ALL
SELECT 3, 103, 'Auto', 'Ocupado' FROM DUAL UNION ALL
SELECT 4, 104, 'Camion', 'Libre' FROM DUAL UNION ALL
SELECT 5, 105, 'Moto', 'Ocupado' FROM DUAL UNION ALL
SELECT 6, 106, 'Auto', 'Libre' FROM DUAL UNION ALL
SELECT 7, 107, 'Camion', 'Ocupado' FROM DUAL UNION ALL
SELECT 8, 108, 'Auto', 'Libre' FROM DUAL;




CREATE TABLE registro_parqueo(
    id_registro_parqueo INT PRIMARY KEY,
    id_vehiculo INT,
    id_espacio_parqueo INT,
    fecha_ingreso_registro_parqueo DATE,
    fecha_salida_registro_parqueo DATE,
    id_personal INT,
    foreign key (id_vehiculo) references vehiculos(id_vehiculo),
    foreign key (id_espacio_parqueo) references espacio_parqueo(id_espacio_parqueo),
    foreign key (id_personal) references personal(id_personal)
)


INSERT INTO registro_parqueo (id_registro_parqueo, id_vehiculo, id_espacio_parqueo, fecha_ingreso_registro_parqueo, fecha_salida_registro_parqueo, id_personal)
SELECT 1, 1, 1, '01/10/2024' , '01/10/2024', 1 FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', NULL, 2 FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', '03/10/2024', 3 FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', NULL, 4 FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', '05/10/2024', 5 FROM DUAL UNION ALL
SELECT 6, 6, 6, '06/10/2024', NULL, 6 FROM DUAL UNION ALL
SELECT 7, 7, 7, '07/10/2024', '07/10/2024', 7 FROM DUAL UNION ALL
SELECT 8, 8, 8, '08/10/2024', NULL, 8 FROM DUAL;





CREATE TABLE pagos(
    id_pago INT PRIMARY KEY,
    id_registro_parqueo INT,
    monto DECIMAL,
    fecha_pago DATE,
    metodo_pago VARCHAR(20), -- Ejemplo: efectivo, tarjeta
    foreign key (id_registro_parqueo) references registro_parqueo(id_registro_parqueo)
)


INSERT INTO pagos (id_pago, id_registro_parqueo, monto, fecha_pago, metodo_pago)
SELECT 1, 1, 15.50, '01/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, 10.00, '02/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, 20.00, '03/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 4, 4, 12.50, '04/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 5, 5, 18.75, '05/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 6, 6, 14.00, '06/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 7, 7, 19.50, '07/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 8, 8, 22.00, '08/10/2024', 'Tarjeta' FROM DUAL;










