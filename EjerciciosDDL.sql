--EJERCICIO 1
/*Elaborar una sentencia SQL que permita crear la tabla CURSOS. La configuración de los
campos debe ser:
CAMPO TIPO DE DATO
CURSO_ID NUMBER
CURSO_NOMBRE TEXTO – HASTA 80 CARACTERES
CURSO_DOCENTE NUMBER */
CREATE TABLE CURSOS(
CURSO_ID NUMBER,
CURSO_NOMBRE VARCHAR2(80),
CURSO_DOCENTE NUMBER
);

--EJERCICIO 2
/*Elaborar una sentencia SQL que permita modificar la tabla CURSOS agregándole una
primary key sobre el campo CURSO_ID. */
ALTER TABLE CURSOS
ADD CONSTRAINT PK_CURSO
PRIMARY KEY (CURSO_ID);

--EJERCICIO 3
/* Elaborar una sentencia SQL que permita modificar la tabla CURSOS agregándole una
foreign key sobre el campo CURSO_DOCENTE que referencie hacia el campo
EMPLOYEE_ID de la tabla EMPLOYEES.*/
ALTER TABLE CURSOS
ADD CONSTRAINT COUNTR_CURSO_DOCENTE_FK
FOREIGN KEY (CURSO_DOCENTE)
REFERENCES EMPLOYEES(EMPLOYEE_ID) ENABLE;

--EJERCICIO 4
/*Elaborar una sentencia SQL que permita crear la tabla CURSOS_CONFIRMADOS. La
configuración de los campos debe ser:
CAMPO TIPO DE DATO
CURSO_ID NUMBER
FECHA DATE
LOCATION_ID NUMBER
HORA_INICIO TEXTO – HASTA 10 CARACTERES
HORA_FIN TEXTO – HASTA 10 CARACTERES
Incluir en la sentencia de creación la generación de la clave primaria formada por los
campos CURSO_ID y FECHA.
Incluir también la creación de las siguientes claves foráneas:
- Campo LOCATION_ID → referencia al campo LOCATION_ID de la tabla LOCATIONS.
- Campo CURSO_ID → referencia al campo CURSO_ID de la tabla CURSOS.*/
CREATE TABLE CURSOS_CONFIRMADOS
(
CURSO_ID NUMBER,
FECHA DATE,
LOCATION_ID NUMBER,
HORA_INICIO VARCHAR2(10),
HORA_FIN VARCHAR2(10),
CONSTRAINT PK_CURSOS_ID_FECHA PRIMARY KEY(CURSO_ID, FECHA),
CONSTRAINT FK_LOCATION_ID FOREIGN KEY
(LOCATION_ID)
REFERENCES LOCATIONS
(LOCATION_ID),
CONSTRAINT FK_CURSO_ID FOREIGN KEY
(CURSO_ID)
REFERENCES CURSOS
(CURSO_ID)
);

--EJERCICIO 5
/*Elaborar una sentencia SQL que permita crear la tabla PARTICIPANTES. La configuración
de los campos debe ser:
CAMPO TIPO DE DATO
CURSO_ID NUMBER
FECHA DATE
EMPLOYEE_ID NUMBER
ASISTIO TEXTO – 1 CARACTER */
CREATE TABLE PARTICIPANTES(
CURSO_ID NUMBER,
FECHA DATE,
EMPLOYEE_ID NUMBER,
ASISTIO CHAR(1)
);

--EJERCICIO 6
/* Elaborar una sentencia SQL que permita modificar la tabla PARTICIPANTES agregándole
una primary key compuesta por los campos (CURSO_ID, FECHA, EMPLOYEE_ID) y una
foreign key en el campo EMPLOYEE_ID que referencia a la PK de la tabla EMPLOYEES.*/
ALTER TABLE PARTICIPANTES
ADD CONSTRAINT PK_PARTICIPANTES 
PRIMARY KEY(CURSO_ID, FECHA, EMPLOYEE_ID)
ADD CONSTRAINT FK_PARTICIPANTES_EMPLOYEES
FOREIGN KEY (EMPLOYEE_ID)
REFERENCES EMPLOYEES (EMPLOYEE_ID);

--EJERCICIO 7
/*Elaborar una sentencia SQL que permita modificar la tabla PARTICIPANTES agregándole
una foreign key sobre los campos CURSO_ID y FECHA que referencie hacia la primary key
de la tabla CURSOS_CONFIRMADOS. */
ALTER TABLE PARTICIPANTES
ADD CONSTRAINT FK_PARTICIPANTES_CURSOS_CONFIRMADOS
FOREIGN KEY (CURSO_ID,FECHA)
REFERENCES CURSOS_CONFIRMADOS (CURSO_ID,FECHA);

--EJERCICIO 8
/* Elaborar una sentencia SQL que permita crear una nueva constraint sobre la tabla
PARTICIPANTES que solo permita ingresar los valores “S” y “N” en el campo ASISTIO.*/
ALTER TABLE PARTICIPANTES
ADD CONSTRAINT CH_ASISTIO CHECK (ASISTIO='S'OR ASISTIO ='N');

--EJERCICIO 9
/*Elaborar las sentencias SQL necesarias para crear las vistas VW_CURSOS,
VW_PARTICIPANTES y VW_CURSOS_CONFIRMADOS que muestren todos los campos y
todos los registros de las tablas CURSOS, PARTICIPANTES y CURSOS_CONFIRMADOS
respectivamente. */
CREATE VIEW VW_CURSOS AS
SELECT *
FROM CURSOS;

CREATE VIEW VW_PARTICIPANTES AS
SELECT *
FROM PARTICIPANTES;

CREATE VIEW VW_CURSOS_CONFIRMADOS AS
SELECT *
FROM CURSOS_CONFIRMADOS;




