--EJERCICIO 1
/* Elaborar una sentencia SQL que permita obtener la suma total de salarios de los
empleados dependientes de la manager Nancy Greenberg.*/
SELECT SUM(SALARY) AS SUMA_SALARIOS_EMPLEADOS_NANCY
FROM EMPLOYEES WHERE MANAGER_ID='108';

--EJERCICIO 2
/* Elaborar una sentencia SQL que permita obtener la cantidad de empleados del
departamento de Ventas (Sales).*/
SELECT COUNT(*) AS CANTIDAD_EMPLEADOS_VENTAS
FROM EMPLOYEES WHERE DEPARTMENT_ID='80';

--EJERCICIO 3
/*Elaborar una sentencia SQL que permita obtener el menor sueldo abonado entre los
Programadores (Programmer). */
SELECT MIN(SALARY) AS MENOR_SALARIO
FROM EMPLOYEES WHERE JOB_ID='IT_PROG';

--EJERCICIO 4
/*Elaborar una sentencia SQL que permita obtener el último año en el cual se contrató
algún empleado que cumpla la función Shipping Clerk. */
SELECT MAX(TO_CHAR(HIRE_DATE,'YYYY')) AS AÑO_ULT_CONTR_SH_CLERK
FROM EMPLOYEES WHERE JOB_ID='SH_CLERK';

--EJERCICIO 5
/* Elaborar una sentencia SQL que permita obtener el nombre de cada región y la
cantidad de países que la componen. Ordenar la consulta alfabéticamente por región.*/
SELECT REGION_NAME AS REGION, COUNT(COUNTRY_ID) CANTIDAD_PAISES
FROM COUNTRIES C
INNER JOIN REGIONS R ON C.REGION_ID=R.REGION_ID
GROUP BY REGION_NAME
ORDER BY 1;

--EJERCICIO 6
/*Elaborar una sentencia SQL que permita obtener nombre, apellido, fecha de
ingreso y salario de los empleados más antiguos y más nuevos de la compañía. */
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') = (SELECT MAX(TO_CHAR(HIRE_DATE,'YYYY'))
FROM EMPLOYEES
) OR TO_CHAR(HIRE_DATE,'YYYY') = (SELECT MIN(TO_CHAR(HIRE_DATE,'YYYY'))
FROM EMPLOYEES
);

--EJERCICIO 7
/* Elaborar una sentencia SQL que permita obtener de cada departamento el total de
empleados y el total de salarios. Mostrar el nombre del departamento en la consulta.
Ordenar por cantidad de empleados en forma descendente.*/
SELECT DEPARTMENT_NAME AS DEPARTAMENTO, 
COUNT(EMPLOYEE_ID) CANTIDAD_EMPLEADOS,
SUM(SALARY) SUMA_SALARIO
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
ORDER BY 2 DESC;

--EJERCICIO 8
/*Elaborar una sentencia SQL que permita obtener los siguientes datos de aquellos
empleados que perciben un salario menor al promedio de salarios abonado en el
departamento IT:
• Nombre y Apellido
• Fecha de Contratación (en formato ISO por ejemplo 2005-09-30)
• Función/Cargo
• Salario
Ordenar el resultado por función (alfabéticamente) y luego por fecha de ingreso
ascendente. */
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS NOMBRE_APELLIDO,
TO_CHAR(HIRE_DATE,'YYYY-MM-DD') AS FECHA_INGRESO,
(SELECT JOB_TITLE FROM JOBS J WHERE E.JOB_ID=J.JOB_ID) AS FUNCION,
SALARY 
FROM EMPLOYEES E
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID='60')
ORDER BY 3,2;




