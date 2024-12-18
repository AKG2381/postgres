/*
Question 2: Using CASE Statement in SQL
Task: Write a query that selects each employee's employee_id, department, and a new 
column called salary_status. The salary_status column should display:

'High' if the salary is greater than or equal to $80,000
'Medium' if the salary is between $50,000 and $80,000
'Low' if the salary is less than $50,000
Use the CASE expression for this.
*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL
);

INSERT INTO employees (employee_id, department, salary)
VALUES
    (1, 'HR', 55000),
    (2, 'Finance', 80000),
    (3, 'Engineering', 120000),
    (4, 'Sales', 45000),
    (5, 'Marketing', 70000),
    (6, 'Engineering', 95000),
    (7, 'Finance', 60000),
    (8, 'HR', 48000);

SELECT * FROM employees;

select *,
	case	
		when salary>= 80000 then 'High'
		when salary between 50000 and 80000 then 'Medium'
		else 'Low'
	end as salary_status
from employees;

SELECT 
    employee_id,
    department,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 79999 THEN 'Medium'
        ELSE 'Low'
    END AS salary_status
FROM employees;


select * from employees
where salary =(select max(salary) from employees as e1
where 4 = (select count(distinct salary) from employees as e2
        	where e2.salary > e1.salary
		 ));