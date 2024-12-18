/*Example Scenario: Subqueries with Employees and Departments
We'll create two tables:

employees: Stores employee details, including department and salary.
departments: Stores department information, including a department ID and name.
Step 1: Create Tables
sql
*/
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Engineering');

INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'Alice', 1, 70000),
    (2, 'Bob', 2, 80000),
    (3, 'Charlie', 1, 65000),
    (4, 'David', 3, 90000),
    (5, 'Eve', 3, 95000),
    (6, 'Frank', 2, 78000);


-- 1.Find employees with salaries above the average salary

SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


-- 2. List departments with employees earning above $80,000

SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE salary > 80000
);


-- 3.Find the highest-paid employee in each department

SELECT employee_name, salary, department_id
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);