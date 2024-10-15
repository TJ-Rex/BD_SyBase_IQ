CREATE PUBLIC DATABASE LINK clinica_link1
CONNECT TO ubdclinica IDENTIFIED BY "1234567"
USING 'xe'; 

SELECT * FROM medicamento_farmacia@farmacia_link1

CREATE TABLE paciente_clinica(
    id_paciente_clinica INT PRIMARY KEY,
    nombre_paciente_clinica VARCHAR(100),
    fecha_nacimiento_clinica DATE,
    direccion_paciente_clinica VARCHAR(150),
    telefono_paciente_clinica VARCHAR(20),
    genero_paciente_clinica VARCHAR(10)
)

INSERT INTO paciente_clinica (id_paciente_clinica, nombre_paciente_clinica, fecha_nacimiento_clinica, direccion_paciente_clinica, telefono_paciente_clinica, genero_paciente_clinica)
SELECT 1, 'María López', '15/05/1985', 'Av. Siempre Viva 123', '0987654321', 'Femenino' FROM DUAL UNION ALL
SELECT 2, 'Juan Pérez', '22/03/1990', 'Calle Falsa 456', '0976543210', 'Masculino' FROM DUAL UNION ALL
SELECT 3, 'Ana Gómez', '10/11/1982', 'Av. Los Héroes 789', '0965432109', 'Femenino' FROM DUAL UNION ALL
SELECT 4, 'Carlos Sánchez', '05/02/1978', 'Calle Real 321', '0954321098', 'Masculino' FROM DUAL UNION ALL
SELECT 5, 'Lucía Martínez', '30/12/1995', 'Av. Libertad 654', '0943210987', 'Femenino' FROM DUAL;




CREATE TABLE doctor_clinica(
    id_doctor_clinica INT PRIMARY KEY,
    nombre_doctor_clinica VARCHAR(100),
    especialidad_doctor_clinica VARCHAR(50), -- (Ej.: cardiología, pediatría)
    telefono_doctor_clinica VARCHAR(20),
    fecha_contratacion_clinica DATE,
    horario_atencion_clinica VARCHAR(50)
)

INSERT INTO doctor_clinica (id_doctor_clinica, nombre_doctor_clinica, especialidad_doctor_clinica, telefono_doctor_clinica, fecha_contratacion_clinica, horario_atencion_clinica)
SELECT 1, 'Dr. Fernando Torres', 'Cardiología', '0981234567', '01/01/2020', '8:00-12:00' FROM DUAL UNION ALL
SELECT 2, 'Dra. Paula Herrera', 'Pediatría', '0976543210', '15/02/2021', '10:00-14:00' FROM DUAL UNION ALL
SELECT 3, 'Dr. Javier Ruiz', 'Dermatología', '0965432109', '20/03/2019', '9:00-13:00' FROM DUAL UNION ALL
SELECT 4, 'Dra. Isabel Martínez', 'Ginecología', '0954321098', '25/04/2022', '11:00-15:00' FROM DUAL UNION ALL
SELECT 5, 'Dr. Andrés Morales', 'Traumatología', '0943210987', '10/05/2023', '14:00-18:00' FROM DUAL;



CREATE TABLE cita_clinica(
    id_cita_clinica INT PRIMARY KEY,
    id_paciente_clinica INT, 
    id_doctor_clinica INT,
    fecha_cita_clinica DATE,
    motivo_cita_clinica VARCHAR(200),
    foreign key (id_paciente_clinica) references paciente_clinica(id_paciente_clinica),
    foreign key (id_doctor_clinica) references doctor_clinica(id_doctor_clinica)
)

INSERT INTO cita_clinica (id_cita_clinica, id_paciente_clinica, id_doctor_clinica, fecha_cita_clinica, motivo_cita_clinica)
SELECT 1, 1, 1, '10/10/2024', 'Control de rutina' FROM DUAL UNION ALL
SELECT 2, 2, 2, '11/10/2024', 'Consulta por fiebre' FROM DUAL UNION ALL
SELECT 3, 3, 3, '12/10/2024', 'Dermatitis' FROM DUAL UNION ALL
SELECT 4, 4, 4, '13/10/2024', 'Revisión ginecológica' FROM DUAL UNION ALL
SELECT 5, 5, 5, '14/10/2024', 'Fractura de brazo' FROM DUAL;




CREATE TABLE trataiento_clinica(
    id_tratamiento_clinica INT PRIMARY KEY,
    id_paciente_clinica INT,
    id_doctor_clinica INT,
    descripcion_tratamiento VARCHAR(200),
    fecha_inicio_tratamiento DATE,
    fecha_fin_tratamiento DATE,
    foreign key (id_paciente_clinica) references paciente_clinica(id_paciente_clinica),
    foreign key (id_doctor_clinica) references doctor_clinica(id_doctor_clinica)
)

INSERT INTO trataiento_clinica (id_tratamiento_clinica, id_paciente_clinica, id_doctor_clinica, descripcion_tratamiento, fecha_inicio_tratamiento, fecha_fin_tratamiento)
SELECT 1, 1, 1, 'Monitoreo de presión arterial', '15/10/2024', '15/11/2024' FROM DUAL UNION ALL
SELECT 2, 2, 2, 'Tratamiento para fiebre alta', '16/10/2024', '16/11/2024' FROM DUAL UNION ALL
SELECT 3, 3, 3, 'Tratamiento de dermatitis', '17/10/2024', '17/11/2024' FROM DUAL UNION ALL
SELECT 4, 4, 4, 'Control prenatal', '18/10/2024', '18/11/2024' FROM DUAL UNION ALL
SELECT 5, 5, 5, 'Rehabilitación por fractura', '19/10/2024', '19/11/2024' FROM DUAL;



CREATE TABLE receta_clinica(
    id_receta_clinica INT PRIMARY KEY,
    id_paciente_clinica INT,
    id_doctor_clinica INT,
    fecha_receta_clinica DATE,
    medicamentos_clinica VARCHAR(300), --(Lista de medicamentos prescritos)
    foreign key (id_paciente_clinica) references paciente_clinica(id_paciente_clinica),
    foreign key (id_doctor_clinica) references doctor_clinica(id_doctor_clinica)
)

INSERT INTO receta_clinica (id_receta_clinica, id_paciente_clinica, id_doctor_clinica, fecha_receta_clinica, medicamentos_clinica)
SELECT 1, 1, 1, '20/10/2024', 'Aspirina, Betabloqueantes' FROM DUAL UNION ALL
SELECT 2, 2, 2, '21/10/2024', 'Paracetamol, Ibuprofeno' FROM DUAL UNION ALL
SELECT 3, 3, 3, '22/10/2024', 'Corticoides, Crema hidratante' FROM DUAL UNION ALL
SELECT 4, 4, 4, '23/10/2024', 'Acido fólico, Multivitamínicos' FROM DUAL UNION ALL
SELECT 5, 5, 5, '24/10/2024', 'Analgésicos, Antiinflamatorios' FROM DUAL;



CREATE TABLE personal_clinica(
    id_personal_clinica INT PRIMARY KEY,
    nombre_personal_clinica VARCHAR(100),
    cargo_personal_clinica VARCHAR(50), -- (Ej.: enfermero, administrativo)
    fecha_contratacion_clinica DATE,
    sueldo_clinica DECIMAL,
    turno_clinica VARCHAR(50) -- (Ej.: mañana, tarde, noche)
)

INSERT INTO personal_clinica (id_personal_clinica, nombre_personal_clinica, cargo_personal_clinica, fecha_contratacion_clinica, sueldo_clinica, turno_clinica)
SELECT 1, 'Elena Gómez', 'Enfermera', '01/01/2021', 1200.00, 'Mañana' FROM DUAL UNION ALL
SELECT 2, 'Diego Rivas', 'Auxiliar', '15/02/2022', 900.00, 'Tarde' FROM DUAL UNION ALL
SELECT 3, 'Lucía Pérez', 'Administrativa', '10/03/2023', 1100.00, 'Noche' FROM DUAL UNION ALL
SELECT 4, 'Carlos Hernández', 'Enfermero', '20/04/2023', 1300.00, 'Mañana' FROM DUAL UNION ALL
SELECT 5, 'María Torres', 'Auxiliar', '25/05/2023', 950.00, 'Tarde' FROM DUAL;





CREATE TABLE factura_clinica(
    id_factura_clinica INT PRIMARY KEY,
    id_paciente_clinica INT,
    id_cita_clinica INT,
    fecha_factura_clinica DATE,
    total_factura_clinica DECIMAL,
    metodo_pago_clinica VARCHAR(20), -- (Ej.: efectivo, tarjeta)
    foreign key (id_paciente_clinica) references paciente_clinica(id_paciente_clinica),
    foreign key (id_cita_clinica) references cita_clinica(id_cita_clinica)
)

INSERT INTO factura_clinica (id_factura_clinica, id_paciente_clinica, id_cita_clinica, fecha_factura_clinica, total_factura_clinica, metodo_pago_clinica)
SELECT 1, 1, 1, '01/10/2024', 100.00, 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, 2, '02/10/2024', 150.00, 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 120.00, 'Efectivo' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 200.00, 'Tarjeta' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 180.00, 'Efectivo' FROM DUAL;


CREATE TABLE examen_clinica(
    id_examen_clinica INT PRIMARY KEY,
    id_paciente_clinica INT,
    id_doctor_clinica INT,
    tipo_examen VARCHAR(50), -- (Ej.: radiografía, análisis de sangre)
    fecha_examen_clinica DATE,
    resultados_examen_clinica VARCHAR(300),
    foreign key (id_paciente_clinica) references paciente_clinica(id_paciente_clinica),
    foreign key (id_doctor_clinica) references doctor_clinica(id_doctor_clinica)
)


INSERT INTO examen_clinica (id_examen_clinica, id_paciente_clinica, id_doctor_clinica, tipo_examen, fecha_examen_clinica, resultados_examen_clinica)
SELECT 1, 1, 1, 'Radiografía', '25/10/2024', 'Todo en orden' FROM DUAL UNION ALL
SELECT 2, 2, 2, 'Análisis de sangre', '26/10/2024', 'Leve anemia' FROM DUAL UNION ALL
SELECT 3, 3, 3, 'Ultrasonido', '27/10/2024', 'Resultados normales' FROM DUAL UNION ALL
SELECT 4, 4, 4, 'Electrocardiograma', '28/10/2024', 'Sin anomalías' FROM DUAL UNION ALL
SELECT 5, 5, 5, 'Prueba de esfuerzo', '29/10/2024', 'Capacidad óptima' FROM DUAL;















