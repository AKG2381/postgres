

/*
Finding Employees with Above-Average Salary in Their Department
Given an employees table with the following columns:

employee_id
department
salary
Task: Write a query that finds all employees who have a salary above the average 
		salary for their department.
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


SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY 

-- Query to Find Employees with Above-Average Salary in Their Department
SELECT 
    e.employee_id,
    e.department,
    e.salary
FROM 
    employees e
JOIN 
    (SELECT department, AVG(salary) AS avg_salary
     FROM employees
     GROUP BY department) AS avg_dept
ON 
    e.department = avg_dept.department
WHERE 
    e.salary > avg_dept.avg_salary;

