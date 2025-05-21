-- Active: 1747462866418@@127.0.0.1@5432@ph2


CREATE TYPE USERTYPE AS ENUM ('M', 'F');

CREATE TABLE employees(
    emp_no SERIAL PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender USERTYPE,
    hire_date DATE
);

EXPLAIN ANALYZE
select * FROM employees WHERE last_name = 'Taylor';


CREATE INDEX idx_employees_last_name ON employees (last_name);

SHOW data_directory;