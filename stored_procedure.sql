/*
Question 1: Stored Procedure to Insert Employee Data
Task: Write a stored procedure to insert an employee's data into the employees table.
The stored procedure should accept the following parameters:
	employee_id
	department
	salary
The procedure should check if the employee_id already exists in the table. If it 
exists, it should return a message saying "Employee ID already exists", otherwise, 
it should insert the data into the table and return a success message.
*/

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL
);

CREATE OR REPLACE PROCEDURE InsertEmployeeData(
    IN p_employee_id INT,
    IN p_department VARCHAR(50),
    IN p_salary DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if employee_id already exists
    IF EXISTS (SELECT 1 FROM employees WHERE employee_id = p_employee_id) THEN
        RAISE NOTICE 'Employee ID % already exists', p_employee_id;
    ELSE
        -- Insert new employee data
        INSERT INTO employees (employee_id, department, salary)
        VALUES (p_employee_id, p_department, p_salary);
        
        RAISE NOTICE 'Employee inserted successfully';
    END IF;
END;
$$;
CALL InsertEmployeeData(9, 'HR', 75000);
CALL InsertEmployeeData(1, 'MARKETING', 75000);

