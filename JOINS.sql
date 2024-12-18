-- JOINS


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL
);

INSERT INTO employees (employee_id, department, salary)
VALUES
    (1, 'HR', 55000),
    (2, 'Finance', 80000),
    (3, 'Engineering', 120000),
    (4, 'Sales', 45000),
    (5, 'Marketing', 70000);


DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_date DATE,
    sale_amount DECIMAL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO sales (sale_id, employee_id, sale_date, sale_amount)
VALUES
    (1, 1, '2024-01-10', 5000),
    (2, 2, '2024-02-12', 7000),
    (3, 3, '2024-03-14', 10000),
    (4, 4, '2024-04-17', 4000),
    (5, 5, '2024-05-20', 8000);


/*

1. INNER JOIN
Task: Get all employees and their corresponding sales data.


Explanation:

INNER JOIN returns rows where there is a match between the employees and 
sales tables based on employee_id. If no match is found, that row will be 
excluded.
*/
SELECT e.employee_id,e.department,e.salary,
	   s.sale_id,s.sale_date,s.sale_amount
FROM employees as e
INNER JOIN sales s ON e.employee_id = s.employee_id;


/*
2. LEFT JOIN
Task: Get all employees and their sales data, including employees who 
don't have sales records.


Explanation:

LEFT JOIN includes all employees, even those who don't have sales records. 
If there is no match, NULL values will appear for the columns from the sales 
table.
*/
SELECT 
    e.employee_id, e.department, e.salary, 
    s.sale_id, s.sale_date, s.sale_amount
FROM employees e
LEFT JOIN sales s ON e.employee_id = s.employee_id;



/*
3. RIGHT JOIN
Task: Get all sales records and corresponding employee details.


Explanation:

RIGHT JOIN returns all sales records, including those without corresponding 
employee details. If no match is found, NULL values will be returned for 
employee details.

*/

SELECT 
    e.employee_id, e.department, e.salary, 
    s.sale_id, s.sale_date, s.sale_amount
FROM employees e
RIGHT JOIN sales s ON e.employee_id = s.employee_id;

/*
4. FULL OUTER JOIN
Task: Get all employees and all sales records, including those without a 
match in the other table.

Explanation:

FULL OUTER JOIN returns all rows from both the employees and sales tables. 
If there is no match, NULL values are returned for the missing table.
*/

SELECT 
    e.employee_id, e.department, e.salary, 
    s.sale_id, s.sale_date, s.sale_amount
FROM employees e
FULL OUTER JOIN sales s ON e.employee_id = s.employee_id;


/*
5. SELF JOIN
Task: Find employees who work in the same department and list them together.

Explanation:

This is a SELF JOIN, where the employees table is joined with itself to find 
pairs of employees working in the same department. The WHERE clause ensures 
that each pair is listed only once by filtering for 
e1.employee_id < e2.employee_id.
*/

DROP TABLE IF EXISTS new_employees;

CREATE TABLE new_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO new_employees (employee_id, employee_name, department)
VALUES
    (1, 'Alice', 'HR'),
    (2, 'Bob', 'Finance'),
    (3, 'Charlie', 'HR'),
    (4, 'David', 'Engineering'),
    (5, 'Eve', 'Engineering'),
    (6, 'Frank', 'Finance'),
    (7, 'Grace', 'HR');
SELECT * FROM new_employees;

SELECT 
    e1.employee_id AS employee1_id, 
    e1.employee_name AS employee1_name,
    e1.department AS department, 
    e2.employee_id AS employee2_id, 
    e2.employee_name AS employee2_name
FROM new_employees e1
JOIN new_employees e2 ON e1.department = e2.department
WHERE e1.employee_id < e2.employee_id;




