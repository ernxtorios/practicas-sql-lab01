# Prácticas SQL - Laboratorio 01

## Escenario
Una empresa organiza un evento de felicitación para animar a sus empleados y clientes y mantenerlos motivados.
* La empresa tiene muchos departamentos.
* Para cada departamento, quieren felicitar:
  - El mejor empleado: el que ha realizado las mayores ventas en ese departamento
  - El mejor cliente: el que ha aportado mayores ventas a ese departamento

Se proporcionan las siguientes tablas:

 • empdetails 
   |  emp_id  | emp_name  | dept_id |
   |----------|-----------|---------|
   |  101     | Alice     | 1       |
   |  102     | Bob       | 1       |
   |  103     | Carol     | 2       |
   |  104     | David     | 2       |

 • empsales
   |  emp_id  | client_id | sales   |
   |----------|-----------|---------|
   |  101     | 201       | 5000    |
   |  101     | 202       | 3000    |
   |  102     | 201       | 7000    |
   |  103     | 202       | 6000    |
   |  104     | 203       | 8000    |


Pregunta:
Escribe una consulta SQL para encontrar el client_id y el emp_id del mejor cliente y el mejor empleado para cada departamento

| dept_id | best_emp_id | best_client_id  |
|---------|-------------|-----------------|
| 1       | 101         | 201             |
| 2       | 104         | 203             |

## Solución
Archivos de la solución usando una base de datos en __SQL Server__:
* 01_ddl_create_tables.sql

  Crear las tablas empdetails y empsales

* 02_dml_inserts.sql

  Insertar los registros del ejemplo

* 03_dql_queries.sql

  Solución
