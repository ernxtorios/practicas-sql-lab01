USE testing;

WITH emp_total AS (
	-- Total de ventas por departamento y por empleado
	SELECT e.dept_id, s.emp_id, SUM(s.sales) AS total_sales
	FROM empdetails e
	JOIN empsales s ON e.emp_id = s.emp_id
	GROUP BY e.dept_id, s.emp_id),
emp_rank AS (
	-- Ranking de ventas por departamento y por empleado
	SELECT et.dept_id, et.emp_id,
	RANK() OVER (PARTITION BY et.dept_id ORDER BY et.total_sales DESC) AS rnk
	FROM emp_total et),
best_emp AS (
	-- Primeros puestos de ventas por departamento y por empleado
	SELECT re.dept_id, re.emp_id
	FROM emp_rank re
	WHERE re.rnk = 1),
client_total AS (
	-- Total de ventas por departamento y por cliente
	SELECT e.dept_id, s.client_id, SUM(s.sales) AS total_sales
	FROM empdetails e
	JOIN empsales s ON e.emp_id = s.emp_id
	GROUP BY e.dept_id, s.client_id),
client_rank AS (
	-- Ranking de ventas por departamento y por cliente
	SELECT ct.dept_id, ct.client_id,
	RANK() OVER (PARTITION BY dept_id ORDER BY total_sales DESC) AS rnk
	FROM client_total ct),
best_client AS (
	-- Primeros puestos de ventas por departamento y por cliente
	SELECT rc.dept_id, rc.client_id
	FROM client_rank rc
	WHERE rnk = 1)

-- El mejor cliente y el mejor empleado por departamento
SELECT be.dept_id, be.emp_id AS best_emp_id, bc.client_id AS best_client_id
FROM best_emp be
JOIN best_client bc 
ON be.dept_id = bc.dept_id
ORDER BY be.dept_id;