CREATE PUBLIC DATABASE LINK tiendadvd_link
CONNECT TO ubdtiendadvd IDENTIFIED BY "1234567"
USING 'xe'; 


CREATE TABLE dvd(
    id_dvd INT PRIMARY KEY,
    titulo_dvd VARCHAR(100),
    genero_dvd VARCHAR(50), -- (Ej.: acción, comedia, drama)
    director_dvd VARCHAR(100),
    ano_lanzamiento_dvd DATE,
    precio_dvd DECIMAL,
    stock_dvd INT -- (Cantidad disponible en la tienda)
)

INSERT INTO dvd (id_dvd, titulo_dvd, genero_dvd, director_dvd, ano_lanzamiento_dvd, precio_dvd, stock_dvd)
SELECT 1, 'Inception', 'Ciencia Ficción', 'Christopher Nolan', '16/07/2010', 19.99, 5 FROM DUAL UNION ALL
SELECT 2, 'The Godfather', 'Drama', 'Francis Ford Coppola', '24/03/1972', 14.99, 3 FROM DUAL UNION ALL
SELECT 3, 'The Dark Knight', 'Acción', 'Christopher Nolan', '18/07/2008', 17.99, 8 FROM DUAL UNION ALL
SELECT 4, 'Pulp Fiction', 'Drama', 'Quentin Tarantino', '14/10/1994', 16.99, 4 FROM DUAL UNION ALL
SELECT 5, 'Titanic', 'Romance', 'James Cameron', '19/12/1997', 18.99, 6 FROM DUAL;


CREATE TABLE cliente_dvd(
    id_cliente_dvd INT PRIMARY KEY,
    nombre_cliente_dvd VARCHAR(50),
    apellido_cliente_dvd VARCHAR(50),
    telefono_cliente_dvd VARCHAR(20),
    correo_cliente_dvd VARCHAR(50)
)

INSERT INTO cliente_dvd (id_cliente_dvd, nombre_cliente_dvd, apellido_cliente_dvd, telefono_cliente_dvd, correo_cliente_dvd)
SELECT 1, 'Juan', 'Pérez', '0987654321', 'juan.perez@example.com' FROM DUAL UNION ALL
SELECT 2, 'María', 'Gómez', '0912345678', 'maria.gomez@example.com' FROM DUAL UNION ALL
SELECT 3, 'Carlos', 'López', '0981122334', 'carlos.lopez@example.com' FROM DUAL UNION ALL
SELECT 4, 'Ana', 'Martínez', '0911223344', 'ana.martinez@example.com' FROM DUAL UNION ALL
SELECT 5, 'Laura', 'Sánchez', '0976543210', 'laura.sanchez@example.com' FROM DUAL;



CREATE TABLE alquiler_dvd(
    id_alquiler INT PRIMARY KEY,
    id_cliente_dvd INT,
    id_dvd INT,
    fecha_alquiler_dvd DATE,
    fecha_devolucion_dvd DATE,
    costo_alquiler_dvd DECIMAL,
    estado_devolucion_dvd VARCHAR(20), -- (Ej.: devuelto, no devuelto)
    foreign key (id_cliente_dvd) references cliente_dvd(id_cliente_dvd),
    foreign key (id_dvd) references dvd(id_dvd)
)

INSERT INTO alquiler_dvd (id_alquiler, id_cliente_dvd, id_dvd, fecha_alquiler_dvd, fecha_devolucion_dvd, costo_alquiler_dvd, estado_devolucion_dvd)
SELECT 1, 1, 1, '01/10/2024', '08/10/2024', 5.00, 'devuelto' FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', NULL, 4.00, 'no devuelto' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', '10/10/2024', 6.00, 'devuelto' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', NULL, 5.50, 'no devuelto' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', '12/10/2024', 4.50, 'devuelto' FROM DUAL;




CREATE TABLE venta_dvd(
    id_venta_dvd INT PRIMARY KEY,
    id_cliente_dvd INT,
    id_dvd INT,
    fecha_venta_dvd DATE,
    precio_total_dvd DECIMAL,
    metodo_pago_dvd VARCHAR(20), -- (Ej.: efectivo, tarjeta)
    foreign key (id_cliente_dvd) references cliente_dvd(id_cliente_dvd),
    foreign key (id_dvd) references dvd(id_dvd)
)

INSERT INTO venta_dvd (id_venta_dvd, id_cliente_dvd, id_dvd, fecha_venta_dvd, precio_total_dvd, metodo_pago_dvd)
SELECT 1, 1, 1, '01/10/2024', 19.99, 'tarjeta' FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 14.99, 'efectivo' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 17.99, 'tarjeta' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 16.99, 'efectivo' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 18.99, 'tarjeta' FROM DUAL;




CREATE TABLE empleado_dvd(
    id_empleado_dvd INT PRIMARY KEY,
    nombre_empleado_dvd VARCHAR(100),
    cargo_dvd VARCHAR(50), -- (Ej.: cajero, administrador)
    fecha_contratacion_dvd DATE,
    sueldo_dvd DECIMAL,
    horario_turno_dvd VARCHAR(50) -- (Ej.: mañana, tarde)
)

INSERT INTO empleado_dvd (id_empleado_dvd, nombre_empleado_dvd, cargo_dvd, fecha_contratacion_dvd, sueldo_dvd, horario_turno_dvd)
SELECT 1, 'Luis', 'Cajero', '01/01/2020', 1000.00, 'mañana' FROM DUAL UNION ALL
SELECT 2, 'Sofía', 'Administrador', '01/02/2021', 1500.00, 'tarde' FROM DUAL UNION ALL
SELECT 3, 'Pedro', 'Cajero', '01/03/2021', 1000.00, 'noche' FROM DUAL UNION ALL
SELECT 4, 'María', 'Asistente', '01/04/2021', 1200.00, 'mañana' FROM DUAL UNION ALL
SELECT 5, 'Jorge', 'Cajero', '01/05/2021', 1000.00, 'tarde' FROM DUAL;


CREATE TABLE proveedor_dvd(
    id_proveedor_dvd INT PRIMARY KEY,
    nombre_proveedor_dvd VARCHAR(100),
    telefono_proveedor_dvd VARCHAR(20),
    email_proveedor_dvd VARCHAR(100),
    direccion_proveedor_dvd VARCHAR(150)
)

INSERT INTO proveedor_dvd (id_proveedor_dvd, nombre_proveedor_dvd, telefono_proveedor_dvd, email_proveedor_dvd, direccion_proveedor_dvd)
SELECT 1, 'Distribuciones ABC', '0987765432', 'abc@example.com', 'Av. Principal 123' FROM DUAL UNION ALL
SELECT 2, 'Películas XYZ', '0991122334', 'xyz@example.com', 'Calle Secundaria 456' FROM DUAL UNION ALL
SELECT 3, 'Cine & Más', '0976543210', 'cine@example.com', 'Calle Tercera 789' FROM DUAL UNION ALL
SELECT 4, 'Video Home', '0965432109', 'video@example.com', 'Av. Cuarta 101' FROM DUAL UNION ALL
SELECT 5, 'Alquiler Rápido', '0954321098', 'alquiler@example.com', 'Calle Quinta 202' FROM DUAL;




