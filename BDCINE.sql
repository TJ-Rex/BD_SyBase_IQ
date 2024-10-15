CREATE PUBLIC DATABASE LINK cine_link
CONNECT TO ubdcine IDENTIFIED BY "1234567"
USING 'xe'; 




CREATE TABLE pelicula_cine(
    id_pelicula_cine INT PRIMARY KEY,
    titulo_pelicula_cine VARCHAR(100),
    genero_pelicula_cine VARCHAR(50),
    director_pelicula_cine VARCHAR(100),
    fecha_estreno DATE,
    clasificacion VARCHAR(10) -- (Ej.: G, PG, R)
)

INSERT INTO pelicula_cine (id_pelicula_cine, titulo_pelicula_cine, genero_pelicula_cine, director_pelicula_cine, fecha_estreno, clasificacion)
SELECT 1, 'Avatar', 'Ciencia Ficción', 'James Cameron', '18/12/2009', 'PG-13' FROM DUAL UNION ALL
SELECT 2, 'Titanic', 'Romance', 'James Cameron', '19/12/1997', 'PG-13' FROM DUAL UNION ALL
SELECT 3, 'The Dark Knight', 'Acción', 'Christopher Nolan', '18/07/2008', 'PG-13' FROM DUAL UNION ALL
SELECT 4, 'Inception', 'Ciencia Ficción', 'Christopher Nolan', '16/07/2010', 'PG-13' FROM DUAL UNION ALL
SELECT 5, 'The Shawshank Redemption', 'Drama', 'Frank Darabont', '14/10/1994', 'R' FROM DUAL;



CREATE TABLE sala_cine(
    id_sala_cine INT PRIMARY KEY,
    nombre_sala_cine VARCHAR(50), -- (Ej.: Sala 1, VIP, 3D)
    capacidad_sala_cine INT, -- (Número de asientos)
    tipo_sala_cine VARCHAR(20) -- (Ej.: 2D, 3D, IMAX)
)

INSERT INTO sala_cine (id_sala_cine, nombre_sala_cine, capacidad_sala_cine, tipo_sala_cine)
SELECT 1, 'Sala 1', 100, '2D' FROM DUAL UNION ALL
SELECT 2, 'VIP', 50, '2D' FROM DUAL UNION ALL
SELECT 3, 'Sala 3D', 80, '3D' FROM DUAL UNION ALL
SELECT 4, 'IMAX', 200, 'IMAX' FROM DUAL UNION ALL
SELECT 5, 'Sala 2', 120, '2D' FROM DUAL;




CREATE TABLE proyeccion_cine(
    id_proyeccion_cine INT PRIMARY KEY,
    id_pelicula_cine INT,
    id_sala_cine INT,
    fecha_proyeccion_cine DATE,
    hora_proyeccion_cine VARCHAR(10),
    precio_entrada_cine DECIMAL,
    foreign key (id_proyeccion_cine) references proyeccion_cine(id_proyeccion_cine),
    foreign key (id_sala_cine) references sala_cine(id_sala_cine)
)

INSERT INTO proyeccion_cine (id_proyeccion_cine, id_pelicula_cine, id_sala_cine, fecha_proyeccion_cine, hora_proyeccion_cine, precio_entrada_cine)
SELECT 1, 1, 1, '01/10/2024', '18:00', 10.00 FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', '20:00', 12.00 FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', '21:00', 15.00 FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', '19:00', 18.00 FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', '17:00', 10.00 FROM DUAL;



CREATE TABLE cliente_cine(
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    telefono_cliente VARCHAR(20),
    email_cliente VARCHAR(100),
    fecha_registro DATE
)

INSERT INTO cliente_cine (id_cliente, nombre_cliente, telefono_cliente, email_cliente, fecha_registro)
SELECT 1, 'Carlos', '0987654321', 'carlos@example.com', '01/10/2024' FROM DUAL UNION ALL
SELECT 2, 'María', '0912345678', 'maria@example.com', '02/10/2024' FROM DUAL UNION ALL
SELECT 3, 'Juan', '0981122334', 'juan@example.com', '03/10/2024' FROM DUAL UNION ALL
SELECT 4, 'Sofía', '0911223344', 'sofia@example.com', '04/10/2024' FROM DUAL UNION ALL
SELECT 5, 'Ana', '0976543210', 'ana@example.com', '05/10/2024' FROM DUAL;



CREATE TABLE venta_entrada_cine(
    id_venta_entrada_cine INT PRIMARY KEY,
    id_cliente INT,
    id_proyeccion_cine INT,
    fecha_venta_entrada_cine DATE,
    cantidad_entradas_cine INT,
    monto_total_cine DECIMAL,
    metodo_pago_cine VARCHAR(20), -- (Ej.: efectivo, tarjeta)
    foreign key (id_cliente) references cliente_cine(id_cliente),
    foreign key (id_proyeccion_cine) references proyeccion_cine(id_proyeccion_cine)
)

INSERT INTO venta_entrada_cine (id_venta_entrada_cine, id_cliente, id_proyeccion_cine, fecha_venta_entrada_cine, cantidad_entradas_cine, monto_total_cine, metodo_pago_cine)
SELECT 1, 1, 1, '01/10/2024', 2, 20.00, 'tarjeta' FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 1, 12.00, 'efectivo' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 3, 45.00, 'tarjeta' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 1, 18.00, 'efectivo' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 2, 20.00, 'tarjeta' FROM DUAL;



CREATE TABLE empelado_cine(
    id_empleado_cine INT PRIMARY KEY,
    nombre_empleado_cine VARCHAR(100),
    cargo_empleado_cine VARCHAR(50), -- (Ej.: taquillero, gerente)
    fecha_contratacion_cine DATE,
    sueldo_empleado_cine DECIMAL,
    turno_empleado_cine VARCHAR(20) -- (Ej.: mañana, tarde, noche)
)

INSERT INTO empelado_cine (id_empleado_cine, nombre_empleado_cine, cargo_empleado_cine, fecha_contratacion_cine, sueldo_empleado_cine, turno_empleado_cine)
SELECT 1, 'Luis', 'Taquillero', '01/01/2020', 1000.00, 'mañana' FROM DUAL UNION ALL
SELECT 2, 'Ana', 'Gerente', '01/02/2021', 1500.00, 'tarde' FROM DUAL UNION ALL
SELECT 3, 'Pedro', 'Taquillero', '01/03/2021', 1000.00, 'noche' FROM DUAL UNION ALL
SELECT 4, 'María', 'Asistente', '01/04/2021', 1200.00, 'mañana' FROM DUAL UNION ALL
SELECT 5, 'Jorge', 'Taquillero', '01/05/2021', 1000.00, 'tarde' FROM DUAL;



CREATE TABLE snack_bebida_cine(
    id_snack_bebida_cine INT PRIMARY KEY,
    nombre_snack_bebida_cine VARCHAR(50), -- (Ej.: palomitas, refresco)
    precio_cine DECIMAL,
    tipo_cine VARCHAR(20) -- (Ej.: snack, bebida)
)

INSERT INTO snack_bebida_cine (id_snack_bebida_cine, nombre_snack_bebida_cine, precio_cine, tipo_cine)
SELECT 1, 'Palomitas', 5.00, 'snack' FROM DUAL UNION ALL
SELECT 2, 'Refresco', 3.00, 'bebida' FROM DUAL UNION ALL
SELECT 3, 'Nachos', 4.50, 'snack' FROM DUAL UNION ALL
SELECT 4, 'Agua', 2.00, 'bebida' FROM DUAL UNION ALL
SELECT 5, 'Chocolate', 2.50, 'snack' FROM DUAL;



CREATE TABLE venta_snack_bebida_cine(
    id_venta_snack_bebida_cine INT PRIMARY KEY,
    id_cliente INT,
    id_snack_bebida_cine INT,
    fecha_venta_cine DATE,
    cantidad_snack_bebida_cine INT,
    monto_totalsnack_bebida_cine DECIMAL,
    metodo_pagosnack_bebida_cine VARCHAR(20), -- (Ej.: efectivo, tarjeta)
    foreign key (id_cliente) references cliente_cine(id_cliente),
    foreign key (id_snack_bebida_cine) references snack_bebida_cine(id_snack_bebida_cine)
)

INSERT INTO venta_snack_bebida_cine (id_venta_snack_bebida_cine, id_cliente, id_snack_bebida_cine, fecha_venta_cine, cantidad_snack_bebida_cine, monto_totalsnack_bebida_cine, metodo_pagosnack_bebida_cine)
SELECT 1, 1, 1, '01/10/2024', 2, 10.00, 'tarjeta' FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 1, 3.00, 'efectivo' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 3, 13.50, 'tarjeta' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 1, 2.00, 'efectivo' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 2, 5.00, 'tarjeta' FROM DUAL;



