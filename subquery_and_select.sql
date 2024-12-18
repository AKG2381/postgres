

-- You have two tables, employees and departments.
-- employees table:
-- Columns: employee_id, name, department_id, salary.
-- departments table:
-- Columns: department_id, department_name.
-- Task:
-- Write a query to find the names of employees whose salary is higher 
-- than the average salary of their department.



CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL
);

INSERT INTO departments (department_name)
VALUES 
    ('Sales'),
    ('Engineering'),
    ('HR');

INSERT INTO employees (name, department_id, salary)
VALUES
    ('Alice', 1, 50000),
    ('Bob', 1, 60000),
    ('Charlie', 2, 70000),
    ('David', 2, 90000),
    ('Eve', 3, 40000),
    ('Frank', 3, 30000);


SELECT name
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);


/*

Question 9: Finding the Employees Who Earn More than the Department's Average 
Salary
Given the employees table with the following columns:

	employee_id
	department
	salary
Task: Write a query to find the employees who earn more than the average salary in
their department.
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

---
SELECT * FROM employees as e
WHERE e.salary >(
	SELECT AVG(salary) FROM employees as d
	WHERE e.department = d.department
);


