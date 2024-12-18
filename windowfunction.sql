/*
Question 3: Window Functions
You have a sales table with the following columns:
 sale_id
 sale_date
 employee_id
 amount
 
Task:
Write a query to calculate the cumulative sales amount for each employee,
ordered by the sale_date.

*/

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE,
    employee_id INT,
    amount DECIMAL
);

INSERT INTO sales (sale_date, employee_id, amount)
VALUES
    ('2024-01-01', 1, 100),
    ('2024-01-03', 1, 200),
    ('2024-01-05', 1, 300),
    ('2024-01-02', 2, 150),
    ('2024-01-04', 2, 250),
    ('2024-01-06', 2, 350);

SELECT * FROM sales;


-- test example for cumulative sum
SELECT
	sale_id,
	sale_date,
	employee_id,
	amount,
	SUM(amount) OVER (ORDER BY sale_date) AS cumulative_sales
FROM
	sales
ORDER BY 
    sale_date;
	
-- Step 3: Query to Calculate Cumulative Sales for Each Employee
SELECT
	sale_id,
	sale_date,
	employee_id,
	amount,
	SUM(amount) OVER(PARTITION BY employee_id ORDER BY sale_date) as cumulative_sales
FROM
	sales
ORDER BY
	employee_id,sale_date;

	