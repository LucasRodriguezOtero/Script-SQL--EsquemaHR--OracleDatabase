--EJERCICIO 1
/* Elaborar una sentencia SQL que muestre los empleados que hayan sido contratados
en el año 2008. */
SELECT * 
FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE,'YYYY') = 2008;

--EJERCICIO 2
/* Elaborar una sentencia SQL que muestre los empleados que perciban un salario entre
7800 y 9300. */
SELECT * 
FROM EMPLOYEES 
WHERE (SALARY > 7800 AND SALARY < 9300);

--EJERCICIO 3
/* Elaborar una sentencia SQL que muestre los empleados que hayan sido contratados
en el año 2007 y que también perciban un salario menor o igual a 5000. */
SELECT * 
FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE,'YYYY') = 2007 AND SALARY <= 5000;

--EJERCICIO 4
/* Elaborar una sentencia SQL que muestre toda la información almacenada en la tabla
EMPLOYEES de aquellos empleados que pertenezcan al departamento de Marketing.
Incluir también los empleados que hayan sido contratados en el primer trimestre del
año 2005 y cuya función (job) sea “Shipping Clerk” (pertenezcan o no al
departamento de Marketing). Ordenar el resultado por monto de salario de mayor a
menor. */
SELECT * 
FROM EMPLOYEES 
WHERE TO_NUMBER(DEPARTMENT_ID)=20 OR (TO_CHAR(HIRE_DATE,'YYYY') = 2005 AND TO_CHAR(HIRE_DATE,'MM') <=4) AND JOB_ID = 'SH_CLERK' ORDER BY SALARY DESC ;

--EJERCICIO 5
/* Elaborar una sentencia SQL que muestre el nombre de todos los departamentos que
tengan manager asignado. Mostrar el nombre del departamento en mayúsculas. */
SELECT  UPPER (DEPARTMENT_NAME) 
FROM DEPARTMENTS 
WHERE MANAGER_ID IS NOT NULL;

--EJERCICIO 6
/* Elaborar una sentencia SQL que muestre DIRECCION, CODIGO POSTAL y CIUDAD de
todas las oficinas (LOCATIONS) ubicadas en Estados Unidos, Canadá y México.
Ordenar el resultado por nombre de ciudad. */
SELECT STREET_ADDRESS, POSTAL_CODE, CITY 
FROM LOCATIONS 
WHERE TO_CHAR(COUNTRY_ID) = 'US' OR TO_CHAR(COUNTRY_ID) = 'CA' OR TO_CHAR(COUNTRY_ID) = 'MX' 
ORDER BY CITY ASC;

--EJERCICIO 7
/* Elaborar una sentencia SQL que muestre el nombre de los países que pertenecen a
Asia. */
SELECT COUNTRY_NAME 
FROM COUNTRIES 
WHERE TO_NUMBER(REGION_ID)= '3';

--EJERCICIO 8
/*Elaborar una sentencia SQL que les permita darse de alta como nuevo/a empleado/a
de la compañía utilizando su nombre y apellido y un valor de EMPLOYEE_ID mayor a
800. La fecha de contratación (HIRE_DATE) debe ser 01/08/2022, la función (JOB)
debe ser “Programmer” y el departamento asignado debe ser “IT Support”.  */
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, EMPLOYEE_ID, HIRE_DATE, JOB_ID, DEPARTMENT_ID) 
VALUES('Lucas','Rodriguez Otero', 801 , '01/08/22', 'IT_PROG', 210);

--EJERCICIO 9
/* Elaborar una sentencia SQL que permita actualizar el manager del departamento “IT
Support” (tabla DEPARTMENTS). La nueva manager será Nancy Greenberg
(EMPLOYEE N° 108). */
UPDATE DEPARTMENTS 
SET MANAGER_ID= 108 
WHERE DEPARTMENT_ID= 210;

--EJERCICIO 10
/* Elaborar una sentencia SQL que permita actualizar el empleado creado en el punto 8
asignándole el manager del punto 9. */
UPDATE EMPLOYES 
SET MANAGER_ID= 108 
WHERE EMPLOYEE_ID=801;

/*ACLARACION: en los primeros 3 ejercios se trae la informacion de todos los campos, ya que,
 el enunciado no especifica concretamente el campo que solicita ( ej: First_name/Last_name) y solo expresa "empleado". Espero que sea lo solicitado. /*