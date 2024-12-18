-- Question 2: JOINs with Aggregation
-- You have the following two tables:

-- orders table:
-- Columns: order_id, product_id, quantity, price.
-- products table:
-- Columns: product_id, product_name.
-- Task:
-- Write a query to find the total sales for each product (calculated as quantity * price 
-- for each order) and order the results by the highest total sales.

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price DECIMAL
);


INSERT INTO products (product_name)
VALUES 
    ('Laptop'),
    ('Phone'),
    ('Tablet');


INSERT INTO orders (product_id, quantity, price)
VALUES
    (1, 2, 1200),   -- 2 Laptops at $1200 each
    (1, 1, 1300),   -- 1 Laptop at $1300 each
    (2, 3, 400),    -- 3 Phones at $400 each
    (2, 1, 450),    -- 1 Phone at $450 each
    (3, 5, 200);    -- 5 Tablets at $200 each

SELECT * FROM products;
SELECT * FROM orders;

select p.product_name,sum(a.cost_per_item) as total_sales
from products p
join (select *,o.price*o.quantity as cost_per_item
	from orders as o) as a
on p.product_id=a.product_id
Group by
	p.product_name
Order By
	total_sales DESC;

-- Query to Find Total Sales for Each Product

SELECT
	p.product_name,
	SUM(o.quantity * o.price) as total_sales
FROM
	orders o
Join
	products p ON o.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY
	total_sales DESC;



-- ans 2
WITH new_table as (
  SELECT o.*,o.quantity*o.price as total_cost
  FROM orders as o
)
SELECT 
	p.product_name,
	SUM(n.total_cost) as total_sales
FROM 
	new_table AS n
JOIN
	products AS p ON n.product_id = p.product_id
GROUP BY
	p.product_name 
ORDER BY
	total_sales DESC;