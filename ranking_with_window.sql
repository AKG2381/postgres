/*
Question 4: Ranking with Window Functions
Suppose you have a table called employees with the following columns:

employee_id
department
salary

Task: Write a query that assigns a rank to each employee within their 
	department based on their salary, in descending order. The employee with 
	the highest salary in each department should have rank 1.

*/
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL
);


INSERT INTO employees (department, salary)
VALUES
    ('Sales', 60000),
    ('Sales', 75000),
    ('Sales', 50000),
    ('Engineering', 90000),
    ('Engineering', 110000),
    ('Engineering', 85000),
    ('Marketing', 65000),
    ('Marketing', 70000);
	
SELECT * FROM employees


-- Step 3: Query to Rank Employees by Salary within Each Department

SELECT
	employee_id,department,salary,
	RANK() OVER( PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM
	employees
ORDER BY
	department, salary_rank;


/*
Question 7: Finding the Top N Employees by Salary in Each Department
Given the employees table with the following columns:
	employee_id
	department
	salary
Task: Write a query to find the top 2 employees with the highest salaries 
in each department.
*/


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL
);
INSERT INTO employees (department, salary)
VALUES
    ('Sales', 60000),
    ('Sales', 75000),
    ('Sales', 50000),
    ('Engineering', 90000),
    ('Engineering', 110000),
    ('Engineering', 85000),
    ('Marketing', 65000),
    ('Marketing', 70000);


WITH ranked_employees AS (
    SELECT 
        employee_id,
        department,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM 
        employees
)
SELECT 
    employee_id,
    department,
    salary,
	rank
FROM 
    ranked_employees
WHERE 
    rank <= 2;




	






