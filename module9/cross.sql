-- Active: 1747462866418@@127.0.0.1@5432@ph
CREATE TABLE employees(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(25),
    dept_id INT
)

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
)

INSERT INTO employees (emp_name, dept_id)
VALUES
    ('John Doe', 101),
    ('Jane Smith', 102)

INSERT INTO departments (dept_id, dept_name)
VALUES
    (101, 'Human Resources'),
    (102, 'Marketing')

SELECT * FROM employees;
DROP TABLE employees ;


SELECT * FROM departments;
DROP TABLE departments ;


-- CROSS JOIN
SELECT * FROM employees
CROSS JOIN departments;

-- NATURAL JOIN (NATURAL JOIN works only if both tables have a column with the same name)
-- NATURAL JOIN হল একটি SQL JOIN অপারেশন, যা দুইটি টেবিলের কমন কলাম (একই নামের কলাম)-এর উপর ভিত্তি করে অটোমেটিকভাবে JOIN করে।
-- 🧠 সহজভাবে বোঝানো:
-- NATURAL JOIN নিজে থেকেই দুইটি টেবিলের মিলে যাওয়া কলাম খুঁজে বের করে।



SELECT * FROM employees
NATURAL JOIN departments;