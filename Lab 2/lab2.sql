-- 1
create database lab_2;

-- 2
create table employees(
    employee_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) DEFAULT 'John',
    last_name VARCHAR(50),
    department_id INT,
    salary INT
);

-- 3
INSERT INTO employees(first_name, last_name, department_id, salary)
VALUES('Sam', 'Omar', 1, 250000);

-- 4
INSERT INTO employees(employee_id, first_name, last_name)
VALUES(2 , 'Sam', 'Altman');

-- 5
INSERT INTO employees(first_name, last_name, department_id, salary)
VALUES('Ken', 'AltSam', NULL, 100000);

-- 6
INSERT INTO employees (first_name, last_name, department_id, salary)
VALUES
('Amina', 'Lee', 3, 480000),
('Dastan', 'Martinez', 2, 700000),
('Miras', 'Wilson', 4, 520000),
('Dilya', 'Taylor', 1, 750000),
('Kenzhe', 'Anderson', 3, 650000);

-- 7 Already in 2


-- 8
INSERT INTO employees(last_name, department_id, salary)
VALUES('Chen', 3, 120);

-- 9
INSERT INTO employees DEFAULT VALUES;

-- 10
CREATE TABLE employees_archive (LIKE employees INCLUDING ALL);

-- 11
INSERT INTO employees_archive SELECT * FROM employees;

-- 12
UPDATE employees
SET department_id = 1
WHERE department_id IS NULL;

-- 13
SELECT first_name, last_name, salary * 1.15 AS "Updated Salary"
FROM employees;

-- 14
DELETE FROM employees
WHERE salary < 500000;

-- 15
DELETE FROM employees_archive
WHERE employee_id IN (SELECT employee_id FROM employees);

-- 16
SELECT * FROM employees;
DELETE FROM employees;
