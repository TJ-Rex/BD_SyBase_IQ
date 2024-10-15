CREATE PUBLIC DATABASE LINK laboratorio_link1
CONNECT TO ubdlaboratorio IDENTIFIED BY "1234567"
USING 'xe'; 




CREATE TABLE paciente_laboratorio(
    id_paciente_laboratorio INT PRIMARY KEY,
    nombres_laboratorio VARCHAR(50),
    apellidos_laboratorio VARCHAR(50),
    fecha_nacimiento_laboratorio DATE,
    sexo_laboratorio VARCHAR(10),
    direccion_laboratorio VARCHAR(100),
    telefono_laboratorio VARCHAR(15),
    correo_laboratorio VARCHAR(50)
)

INSERT INTO paciente_laboratorio (id_paciente_laboratorio, nombres_laboratorio, apellidos_laboratorio, fecha_nacimiento_laboratorio, sexo_laboratorio, direccion_laboratorio, telefono_laboratorio, correo_laboratorio)
SELECT 1, 'Luis', 'Alvarez', '15/06/1990', 'Masculino', 'Calle 123, Quito', '0987654321', 'luis.alvarez@mail.com' FROM DUAL UNION ALL
SELECT 2, 'Maria', 'Perez','28/03/1985', 'Femenino', 'Avenida 45, Guayaquil', '0991234567', 'maria.perez@mail.com' FROM DUAL UNION ALL
SELECT 3, 'Jorge', 'Torres', '10/12/1978', 'Masculino', 'Calle 10, Cuenca', '0983219876', 'jorge.torres@mail.com' FROM DUAL UNION ALL
SELECT 4, 'Ana', 'Rodriguez', '01/08/1992', 'Femenino', 'Avenida Siempre Viva, Loja', '0998765432', 'ana.rodriguez@mail.com' FROM DUAL UNION ALL
SELECT 5, 'Pedro', 'Sanchez', '17/09/1988', 'Masculino', 'Calle Bol�var, Manta', '0976543210', 'pedro.sanchez@mail.com' FROM DUAL UNION ALL
SELECT 6, 'Carla', 'Lopez', '22/05/1995', 'Femenino', 'Avenida Libertad, Portoviejo', '0999991234', 'carla.lopez@mail.com' FROM DUAL UNION ALL
SELECT 7, 'Sofia', 'Gomez', '30/01/2000', 'Femenino', 'Calle Central, Esmeraldas', '0986547890', 'sofia.gomez@mail.com' FROM DUAL UNION ALL
SELECT 8, 'Miguel', 'Cabrera', '05/11/1980', 'Masculino', 'Avenida Quito, Santo Domingo', '0978675432', 'miguel.cabrera@mail.com' FROM DUAL;




CREATE TABLE personal_laboratorio(
    id_personal_laboratorio INT PRIMARY KEY,
    nombres_personal_laboratorio VARCHAR(50),
    apellidos_personal_laboratorio VARCHAR(50),
    especialidad_laboratorio VARCHAR(50),
    telefono_personal_laboratorio VARCHAR(15),
    correo_personal_laboratorio VARCHAR(50)
)

INSERT INTO personal_laboratorio (id_personal_laboratorio, nombres_personal_laboratorio, apellidos_personal_laboratorio, especialidad_laboratorio, telefono_personal_laboratorio, correo_personal_laboratorio)
SELECT 1, 'Juan', 'Mendez', 'Bioqu�mico', '0987656789', 'juan.mendez@mail.com' FROM DUAL UNION ALL
SELECT 2, 'Carmen', 'Ortiz', 'Microbi�loga', '0990123456', 'carmen.ortiz@mail.com' FROM DUAL UNION ALL
SELECT 3, 'Fernando', 'Vargas', 'Hemat�logo', '0986541234', 'fernando.vargas@mail.com' FROM DUAL UNION ALL
SELECT 4, 'Paola', 'Narvaez', 'T�cnico de Laboratorio', '0998765432', 'paola.narvaez@mail.com' FROM DUAL UNION ALL
SELECT 5, 'Lucia', 'Ruiz', 'Bacteri�loga', '0976548901', 'lucia.ruiz@mail.com' FROM DUAL UNION ALL
SELECT 6, 'Pedro', 'Fernandez', 'Fleb�logo', '0999123456', 'pedro.fernandez@mail.com' FROM DUAL UNION ALL
SELECT 7, 'Luis', 'Zambrano', 'T�cnico de Radiolog�a', '0981234567', 'luis.zambrano@mail.com' FROM DUAL UNION ALL
SELECT 8, 'Diana', 'Salas', 'Pat�loga', '0978675432', 'diana.salas@mail.com' FROM DUAL;




CREATE TABLE cita_laboratorio(
    id_cita_laboratorio INT PRIMARY KEY,
    id_paciente_laboratorio INT,
    id_personal_laboratorio INT,
    fecha_cita_laboratorio DATE,
    motivo_cita_laboratorio VARCHAR(150),
    foreign key (id_paciente_laboratorio) references paciente_laboratorio(id_paciente_laboratorio),
    foreign key (id_personal_laboratorio) references personal_laboratorio(id_personal_laboratorio)
)

INSERT INTO cita_laboratorio (id_cita_laboratorio, id_paciente_laboratorio, id_personal_laboratorio, fecha_cita_laboratorio, motivo_cita_laboratorio)
SELECT 1, 1, 1, '01/10/2024', 'Chequeo general' FROM DUAL UNION ALL
SELECT 2, 2, 2,'02/10/2024', 'Examen de sangre' FROM DUAL UNION ALL
SELECT 3, 3, 3, '03/10/2024', 'Revisi�n anual' FROM DUAL UNION ALL
SELECT 4, 4, 4, '04/10/2024', 'Examen de orina' FROM DUAL UNION ALL
SELECT 5, 5, 5, '05/10/2024', 'Pruebas de alergia' FROM DUAL UNION ALL
SELECT 6, 6, 6, '06/10/2024', 'Examen hep�tico' FROM DUAL UNION ALL
SELECT 7, 7, 7, '07/10/2024', 'Ecograf�a' FROM DUAL UNION ALL
SELECT 8, 8, 8, '08/10/2024', 'Examen prenatal' FROM DUAL;



CREATE TABLE examen_laboratorio(
    id_examen_laboratorio INT PRIMARY KEY,
    nombre_examen_laboratorio VARCHAR(50),
    descripcion_examen_laboratorio VARCHAR(150)
)

INSERT INTO examen_laboratorio (id_examen_laboratorio, nombre_examen_laboratorio, descripcion_examen_laboratorio)
SELECT 1, 'Hemograma', 'An�lisis completo de sangre' FROM DUAL UNION ALL
SELECT 2, 'Urian�lisis', 'Examen de orina' FROM DUAL UNION ALL
SELECT 3, 'Perfil Hep�tico', 'Pruebas para evaluar la funci�n hep�tica' FROM DUAL UNION ALL
SELECT 4, 'Prueba de glucosa', 'Medici�n del nivel de az�car en la sangre' FROM DUAL UNION ALL
SELECT 5, 'Ecograf�a abdominal', 'Visualizaci�n de los �rganos abdominales' FROM DUAL UNION ALL
SELECT 6, 'Test de embarazo', 'Detecci�n de embarazo en sangre' FROM DUAL UNION ALL
SELECT 7, 'Pruebas de coagulaci�n', 'Evaluaci�n de la coagulaci�n sangu�nea' FROM DUAL UNION ALL
SELECT 8, 'Pruebas de tiroides', 'An�lisis de la funci�n tiroidea' FROM DUAL;


CREATE TABLE resultado_examen_lab(
    id_resultado_examen_lab INT PRIMARY KEY,
    id_cita_laboratorio INT,
    id_examen_laboratorio INT,
    resultado VARCHAR(100),
    fecha_resultado_examen_lab DATE,
    foreign key (id_cita_laboratorio) references cita_laboratorio(id_cita_laboratorio),
    foreign key (id_examen_laboratorio) references examen_laboratorio(id_examen_laboratorio)
)

INSERT INTO resultado_examen_lab (id_resultado_examen_lab, id_cita_laboratorio, id_examen_laboratorio, resultado, fecha_resultado_examen_lab)
SELECT 1, 1, 1, 'Valores normales','02/10/2024' FROM DUAL UNION ALL
SELECT 2, 2, 2, 'Sin infecciones','03/10/2024' FROM DUAL UNION ALL
SELECT 3, 3, 3, 'Funci�n hep�tica normal', '04/10/2024' FROM DUAL UNION ALL
SELECT 4, 4, 4, 'Niveles de glucosa normales', '05/10/2024' FROM DUAL UNION ALL
SELECT 5, 5, 5, '�rganos en buen estado', '06/10/2024' FROM DUAL UNION ALL
SELECT 6, 6, 6, 'Positivo', '07/10/2024' FROM DUAL UNION ALL
SELECT 7, 7, 7, 'Tiempo de coagulaci�n normal','08/10/2024' FROM DUAL UNION ALL
SELECT 8, 8, 8, 'Tiroidea normal', '09/10/2024' FROM DUAL;




CREATE TABLE pago_laboratorio(
    id_pago_laboratorio INT PRIMARY KEY,
    id_cita_laboratorio INT,
    monto_laboratorio DECIMAL,
    fecha_pago_laboratorio DATE,
    metodo_pago_laboratorio VARCHAR(20),
    foreign key (id_cita_laboratorio) references cita_laboratorio(id_cita_laboratorio)
)

INSERT INTO pago_laboratorio (id_pago_laboratorio, id_cita_laboratorio, monto_laboratorio, fecha_pago_laboratorio, metodo_pago_laboratorio)
SELECT 1, 1, 20.50, '01/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 2, 2, 15.75, '02/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 3, 3, 30.00, '03/10/2024', 'Transferencia' FROM DUAL UNION ALL
SELECT 4, 4, 25.00, '04/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 5, 5, 50.00, '05/10/2024', 'Tarjeta' FROM DUAL UNION ALL
SELECT 6, 6, 60.25, '06/10/2024', 'Transferencia' FROM DUAL UNION ALL
SELECT 7, 7, 40.75, '07/10/2024', 'Efectivo' FROM DUAL UNION ALL
SELECT 8, 8, 70.00, '08/10/2024', 'Tarjeta' FROM DUAL;







