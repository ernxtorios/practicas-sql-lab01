USE testing;

WITH emp_total AS (
	SELECT e.dept_id, s.emp_id, SUM(s.sales) AS total_sales
	FROM empdetails e
	JOIN empsales s ON e.emp_id = s.emp_id
	GROUP BY e.dept_id, s.emp_id),
rank_emp AS (
	SELECT et.dept_id, et.emp_id,
	RANK() OVER (PARTITION BY et.dept_id ORDER BY et.total_sales DESC) AS rnk
	FROM emp_total et),
best_emp AS (
	SELECT re.dept_id, re.emp_id
	FROM rank_emp re
	WHERE re.rnk = 1),
client_total AS (
	SELECT e.dept_id, s.client_id, SUM(s.sales) AS total_sales
	FROM empdetails e
	JOIN empsales s ON e.emp_id = s.emp_id
	GROUP BY e.dept_id, s.client_id),
rank_client AS (
	SELECT ct.dept_id, ct.client_id,
	RANK() OVER (PARTITION BY dept_id ORDER BY total_sales DESC) AS rnk
	FROM client_total ct),
best_client AS (
	SELECT rc.dept_id, rc.client_id
	FROM rank_client rc
	WHERE rnk = 1)

SELECT be.dept_id, be.emp_id AS best_emp_id, bc.client_id AS best_client_id
FROM best_emp be
JOIN best_client bc 
ON be.dept_id = bc.dept_id
ORDER BY be.dept_id;