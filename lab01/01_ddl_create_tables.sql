USE testing;

CREATE TABLE empdetails (
	emp_id int,
	emp_name varchar(15),
	dept_id int)


CREATE TABLE empsales (
	emp_id int,
	client_id int,
	sales decimal(16, 2))