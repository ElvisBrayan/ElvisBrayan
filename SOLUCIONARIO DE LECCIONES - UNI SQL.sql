

-- NOMBRE: ELVIS BRAYAN LOPEZ MARCATINCO
-- UNVERSIDAD: UNIVERSIDAD NACIONAL DEL CALLAO
-- CARRERA: ESCUELA PROFESIONAL DE INGENIERIA DE SISTEMAS



-- SOLUCIONARIO LECCION 5

----------------------------
/*SELECCION DE COLUMNAS*/
----------------------------



/* 1. Desarrolle una sentencia SELECT para consultar el nombre, apellido y correo de los
empleados de la base de datos RH */

select  nombre, apellido, email from RH..empleado 
go
 

 /* 2. Desarrolle una sentencia SELECT para consultar el nombre, vacantes y precio de cada curso
de la base de datos EDUCA. */

select  cur_nombre, cur_vacantes, cur_precio from EDUCA..CURSO 
go

-----------------------------------------------
/*CAMPOS CALCULADOS Y OPERADORES ARITMETICOS*/
----------------------------.------------------


/* 3. Desarrollar una sentencia SELECT que permita obtener el importe que se obtendría en cada
curso, si se logra vender todas las vacantes por cada curso. Base de datos EDUCA. */


select cur_vacantes, cur_precio, cur_vacantes*cur_precio as Importe 
from educa..curso
go

/* 4. Desarrollar una consulta que permita mostrar las vacantes programadas, los matriculados y las
vacantes disponibles de cada curso de la base de datos EDUTEC. */

select Vacantes, Matriculados, (Vacantes-Matriculados) Vacantes_disponibles  
from EduTec..CursoProgramado
go

/* 5. El área de recursos humanos necesita una consulta que permita mostrar de cada empleado
su sueldo actual y cuanto sería su incremento si se proyecta un aumento del 20% a cada uno
respectivamente. */

select nombre, apellido, sueldo, sueldo*1.2 as Incremento_20  from RH..empleado
go


-----------------------------------------------
/*OPERADORES DE CONCATENACION*/
----------------------------.------------------

/* 6. Desarrollar una sentencia SELECT para consultar el nombre y apellido de los empleados en
una sola columna. Base de datos RH. */

select nombre + ' '+ apellido as Nombre_completo from RH..empleado

/* 7. Desarrollar una sentencia SELECT para consultar el nombre y apellido de los profesores en
una sola columna. Base de datos Edutec */

select  NomProfesor+ ' '+ ApeProfesor as Nombre_completo from EduTec..Profesor

/* 8. Desarrollar una consulta para consultar los datos de la tabla CURSOPROGRAMADO, pero se
solicita las siguientes columnas: */

/*COLUMNA DESCRIPCIÓN

CODIGO:		Columna IDCURSOPROG
CURSO:		Se debe concatenar las columnas IDCICLO y IDCURSO en el
			siguiente formato: IDCICLO/IDCURSO
VACANTES:
			Debe tener el siguiente formato: AA/BB
			Donde:
			AA : Cantidad de matriculados
			BB : Cantidad de vacantes programadas*/


select  concat(IdCiclo,'/', IdCurso) IDCURSOPROG from EduTec..CursoProgramado
go


-----------------------------------------------
/*FLTRO DE FILAS*/
----------------------------.------------------

/*9. Desarrollar una sentencia SELECT para consultar los empleados del departamento de
contabilidad (iddepartamento = 101). Base de datos RH. */

SELECT nombre FROM RH..empleado
WHERE iddepartamento = '101'
go

/* 10. Desarrollar una sentencia SELECT para consultar los empleados que se desempeñan como
gerentes. Base de datos RH. */

SELECT nombre FROM RH..empleado
WHERE iddepartamento = '100'
go

-----------------------------------------------
/*OPERADORES RELACIONALES*/
----------------------------.------------------

/* 11. Desarrollar una sentencia SELECT que permita averiguar los cursos que aún no tienen
alumnos matriculados. Base de datos EDUCA. */

SELECT cur_nombre, cur_id FROM EDUCA..CURSO
WHERE cur_matriculados = '0'
GO

-----------------------------------------------
/*OPERADORES LOGICOS*/
----------------------------.------------------

/* 12. Desarrollar una sentencia SELECT para consultar los empleados de contabilidad cuyo 
sueldo es mayor a 10,000.00. Base de datos RH. */

select CONCAT(nombre,' ',apellido), sueldo from RH..empleado
where iddepartamento = '101' and sueldo >10000
go

/* 13. Desarrollar una sentencia SELECT que permita averiguar los cursos que aún no tienen
profesor. Base de datos EDUCA. */

select cur_nombre from EDUCA..CURSO
where cur_profesor = '' or cur_profesor is null
go

-----------------------------------------------
/*OPERADORES LIKE, BETWEEN, IN*/
----------------------------.------------------

/* 14. Desarrollar una sentencia SELECT que permita consultar los empleados que su nombre
finaliza con la letra "O". Base de datos RH.*/

select nombre  from RH..empleado
where nombre like '%o'
go

/* 15. Desarrollar una sentencia SELECT que permita consultar los empleados que su 
apellido tiene en la segunda posición la letra "A" o "O". Base de datos RH*/

select apellido  from RH..empleado
where apellido like '_[a,o]%'
go

/*16. Desarrollar una sentencia SELECT que permita averiguar qué 
empleados tienen un sueldo mayor de 3,000.0 y menor de 10,000.0.
Base de datos RH.*/

select nombre, sueldo from RH..empleado
where sueldo between 3000 and 10000 -- TOMA LOS EXTREMOS
go

/*17. Desarrollar una sentencia SELECT que permita averiguar quiénes son 
los empleados de los departamentos de contabilidad (101) y ventas(103) . 
Base de datos RH.*/


select * from RH..departamento
go

select CONCAT(nombre,' ',apellido), iddepartamento from rh..empleado
where iddepartamento in (101,103)
go

-----------------------------------------------
/*ORDENAMIENTO DEL CONJUNTO DE RESULTADOS*/
----------------------------.------------------

/*18. Desarrollar una sentencia SELECT que permita mostrar una lista de los empleados ordenada
por fecha de ingreso. Base de datos RH.*/

select nombre, fecingreso from rh..empleado
order by fecingreso asc
go


-----------------------------------------------
/*MANIPULACION DE VALORES NULL*/
----------------------------.------------------
/*19. Desarrollar una sentencia SELECT para consultar el ingreso total de cada empleado. Base de
datos RH.*/

select nombre, sueldo, comision, sueldo + isnull(comision,0) as Ingreso_total  from RH..empleado
go

/*20. Desarrollar una sentencia SELECT para consultar los empleados cuyos ingresos totales es
menor a 8,000.00. Base de datos RH.*/

select nombre, apellido, sueldo, comision, sueldo + ISNULL(comision,0) Ingreso_total from rh..empleado
where (sueldo +  ISNULL(comision,0))  < 8000
go


-----------------------------------------------
/*Funciones de conversión de tipo. Funciones de fecha y hora*/
----------------------------.------------------

/*21. Desarrollar una sentencia SELECT para consultar los empleados que ingresaron a la empresa
un mes de enero. Base de datos RH.*/

select nombre, apellido, fecingreso from rh..empleado 
where MONTH(fecingreso) = 1 --ENERO
go

/*22. Desarrollar una sentencia SELECT para consultar las matrículas del último mes. Base de datos
EDUCA.*/

select cur_id, mat_fecha from EDUCA..MATRICULA
where DATEPART(MONTH,mat_fecha) = 12
go

-- SOLUCIONARIO LECCION 6

----------------------------
/*FUNCIONES DE AGREGACIÓN*/
----------------------------
/*
1. Desarrolle una sentencia SELECT para calcular el importe de la planilla del departamento de
ventas(103). Debe incluir el sueldo y la comisión. Base de datos RH.*/
select * from RH..empleado
select * from RH..departamento

select sum(sueldo + isnull(comision,0)) from RH..empleado
where iddepartamento = '103'
go

/*2. Desarrolle una sentencia SELECT para encontrar el mayor y menor sueldo en el departamento de
ventas(103). Base de datos RH.*/

select Max(sueldo) Sueldo_max, MIN(sueldo) Sueldo_min from RH..empleado
where iddepartamento = '103'
go


/*3. Desarrolle una sentencia SELECT para encontrar el salario promedio en la empresa. Base de
datos RH.*/

select avg(sueldo) from rh..empleado
go

/*4. Desarrollar una sentencia SELECT que permita obtener el importe de lo recaudado hasta el
momento por los cursos vendidos. Base de datos EDUCA. (NO ESPECIFICA PERO DEBE SER DEL CICLO ACTUAL)*/

select sum(pag_cuota*pag_importe) as Importe_mes_5 from EDUCA..PAGO
where DATEPART(MONTH,pag_fecha) = 5 --MES 5 
go

select sum(pag_cuota*pag_importe) as Importe_2020 from EDUCA..PAGO
where DATEPART(YEAR,pag_fecha) = 2022 --AÑO 2022
go


/*5. Desarrollar una sentencia SELECT que permita consultar el importe de lo que se tiene
comprometido (cobrado y no cobrado) por los cursos vendidos hasta el momento. Base de datos
EDUCA.
*/

select sum(pag_cuota*pag_importe) Cobrado from EDUCA..PAGO
go


----------------------------
/*GROUP BY y HAVING.*/
----------------------------

/*6. Desarrolle una sentencia SELECT para encontrar el salario promedio por departamento. Base de
datos RH.*/

select avg (sueldo) sueldo_promedio
from RH..empleado
go

/*7. Desarrolle una sentencia SELECT para encontrar la cantidad de trabajadores por departamento.
Base de datos RH.*/
select * from rh..empleado

select iddepartamento, idcargo,
count(1)from rh..empleado
group by iddepartamento, idcargo
go


/*8. Desarrolle una sentencia SELECT para encontrar los departamentos que tienen más de 5
trabajadores. Base de datos RH.*/

select iddepartamento, idcargo,
count(1)from rh..empleado
group by iddepartamento, idcargo
having count(1) > 5;
go

/*9. Desarrolle una sentencia SELECT para encontrar el importe recaudado por curso. Base de datos
EDUCA.*/

select * from EDUCA..CURSO
go

select sum(cur_matriculados * cur_precio) from EDUCA..CURSO
go


/*10. Desarrollar una sentencia SELECT para encontrar los profesores que tienen mas de 2 cursos
programados en el ciclo actual. Base de datos EDUTEC.*/

select * from EduTec..CursoProgramado
go

select IdCiclo, IdProfesor,
count(1) from EduTec..CursoProgramado
group by IdCiclo, IdProfesor
having COUNT(1) > 2 and IdCiclo = '2022-12'
go


/*11. Desarrollar una sentencia SELECT para encontrar la cantidad de veces que se ha programado
cada curso en cada ciclo en el presente año. Solo se debe mostrar los cursos que se han
programado mas de 2 veces. Base de datos EDUTEC.*/

select IdCiclo,Idcurso,
count(1) from EduTec..CursoProgramado
group by IdCiclo,IdCurso
having COUNT(1) > 2 
order by IdCiclo asc
go

--SOLUCIONARIO LECCION 7 - CONSULTAS MULTITABLAS

----------------------------
/*INNER JOIN.*/
----------------------------

/*1. Desarrolle una sentencia SELECT para obtener un listado que incluya el nombre
del CURSO con sus respectivos nombres de ALUMNOS. Base de datos EDUCA.*/

select *from EDUCA..CURSO
go
								--BUSCAMOS EL PARAMETRO EN COMUN DE AMBAS TABLAS
								-- ALU_ID, CUR_ID, ENLAZAMOS 3 TABLAS
select *from EDUCA..MATRICULA
GO

SELECT * FROM EDUCA..ALUMNO
GO

select C.cur_nombre, C.cur_id, A.alu_nombre,A.alu_id
from EDUCA..CURSO C
full join EDUCA..MATRICULA M on C.cur_id = M.cur_id
full join EDUCA..ALUMNO A on M.alu_id = A.alu_id
go

/*2. Desarrolle una sentencia SELECT que muestre el nombre del alumno y la suma
de todos sus pagos. Base de datos EDUCA.*/
SELECT * FROM EDUCA..ALUMNO
SELECT * FROM EDUCA..PAGO
GO

SELECT A.alu_nombre, A.alu_id ,SUM(pag_importe) Pago_alumno
FROM EDUCA..ALUMNO A
join EDUCA..PAGO P 
on P.alu_id = A.alu_id 
group by A.alu_nombre, A.alu_id
go


/*3. Desarrolle una sentencia SELECT que muestre el nombre del curso y la suma de
todos sus pagos. Base de datos EDUCA.*/

SELECT  cur_nombre, C.cur_id ,SUM(pag_importe) Pago_curso
FROM EDUCA..CURSO C
join EDUCA..PAGO P 
on P.cur_id = C.cur_id 
group by cur_nombre, C.cur_id
go


/*4. Desarrolle una sentencia SELECT que muestre el nombre del departamento y el
importe de su planilla. Base de datos RH.*/
select departamento.nombre, departamento.iddepartamento, sum(sueldo + isnull(comision,0)) Importe_x_departamento
from RH..departamento
join RH..empleado
on departamento.iddepartamento = empleado.iddepartamento
group by departamento.nombre,departamento.iddepartamento
go

/*5. Desarrolle una sentencia SELECT para encontrar la cantidad de trabajadores en
cada ciudad. Base de datos RH.*/

select  D.idubicacion,D.nombre, count(idubicacion) as Cantidad
from RH..empleado E
join rh..departamento D
on E.iddepartamento = D.iddepartamento
group by D.idubicacion, D.nombre
go

/*6. Desarrollar una sentencia SELECT para encontrar la cantidad de alumnos
matriculados por curso en el ciclo actual. El resultado debe mostrar tres
columnas: código del curso, nombre del curso y cantidad de alumnos
matriculados. Base de datos EDUTEC.*/

select C.NomCurso, C.IdCurso,count(M.IdAlumno) Cantidad_de_alumnos
from EduTec..Matricula M
join EduTec..CursoProgramado CP
JOIN EduTec..Curso C
on CP.IdCurso = C.IdCurso
on CP.IdCursoProg = M.IdCursoProg
group by C.NomCurso, C.IdCurso
--where  datepart(year,FecMatricula) = 2022
go

select * from EduTec..Matricula
go


select IdAlumno,count(IdAlumno) from EduTec..Matricula
group by IdAlumno
having datepart(year,FecMatricula) = 2022
go

select * from EduTec..Matricula
go

--DUDA DUDA DUDA


/*7. Desarrollar una sentencia SELECT para encontrar el pago que se le debe hacer
a cada profesor en el ciclo actual(2022). Base de datos EDUTEC.*/

SELECT * FROM EduTec..CursoProgramado
SELECT * FROM EduTec..Profesor
SELECT * FROM EduTec..Tarifa
SELECT * FROM EduTec..Curso



SELECT /*concat (NomProfesor,' ', ApeProfesor) Nombre_Profesor,*/ P.IdProfesor,IdCiclo/*,IdCurso*/,SUM(PreCursoProg) total
FROM EduTec..CursoProgramado CP
inner join EduTec..Profesor P
on CP.IdProfesor = P.IdProfesor
group by grouping sets ( /*NomProfesor, ApeProfesor,*/ (IdCiclo,P.IdProfesor) ,IdCiclo,())

having Sum(PreCursoProg) > 1 and  IdCiclo like '2022%'
--order by IdProfesor,IdCiclo asc
--where IdCiclo like '2022%'
go

--PARA PROBAR
SELECT concat (NomProfesor,' ', ApeProfesor) Nombre_Profesor, P.IdProfesor,IdCiclo/*,IdCurso*/,SUM(PreCursoProg) total
FROM EduTec..CursoProgramado CP
inner join EduTec..Profesor P
on CP.IdProfesor = P.IdProfesor
group by grouping sets (  (P.IdProfesor,IdCiclo) ,P.IdProfesor,()) ,NomProfesor, ApeProfesor

having Sum(PreCursoProg) > 1 and  IdCiclo like '2022%'
order by IdProfesor,IdCiclo asc
--where IdCiclo like '2022%'
go

/*8. Desarrollar una sentencia SELECT para encontrar los ingresos por curso en el
periodo actual. Base de datos EDUTEC.*/


----------------------------
/*OUTER JOIN.*/
----------------------------

/*9. Desarrolle una sentencia SELECT para obtener un listado de todos los
departamentos y la cantidad de trabajadores en cada uno de ellos. Base de datos
RH.*/
----------------------------
/*CROSS JOIN.*/
----------------------------
/*10.Desarrolle una sentencia SELECT para obtener todas las posibles
combinaciones entre las tablas departamento y cargo. Base de datos RH.*/

----------------------------
/*AUTO JOIN.*/
----------------------------
/*11.Desarrolle una sentencia SELECT para obtener un listado de los empleados con
el respectivo nombre de su superior inmediato. Base de datos RH.*/