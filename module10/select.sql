-- Active: 1747462866418@@127.0.0.1@5432@ph

-- create new table
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE students(
    -- student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT check(age >= 18),
    grade VARCHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO students(first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Liam', 'Johnson', 18, 'A', 'Mathematics', 'liam.johnson@example.com', '2006-04-15', 'O+', 'USA'),
('Emma', 'Smith', 19, 'B+', 'Biology', 'emma.smith@example.com', '2005-10-23', 'A-', 'UK'),
('Noah', 'Brown', 19, 'A-', 'Chemistry', 'noah.brown@example.com', '2007-01-30', 'B+', 'Canada'),
('Olivia', 'Davis', 18, 'B', 'Physics', 'olivia.davis@example.com', '2006-06-18', 'O-', 'Australia'),
('William', 'Miller', 20, 'C+', 'History', 'william.miller@example.com', '2004-09-12', 'AB+', 'USA'),
('Ava', 'Wilson', 22, 'A', 'Computer Science', 'ava.wilson@example.com', '2007-03-07', 'A+', 'Germany'),
('James', 'Moore', 19, 'B-', 'English', 'james.moore@example.com', '2005-11-04', 'B-', 'Ireland'),
('Sophia', 'Taylor', 18, 'A+', 'Geography', 'sophia.taylor@example.com', '2006-02-14', 'AB-', 'New Zealand'),
('Benjamin', 'Anderson', 20, 'C', 'Economics', 'benjamin.anderson@example.com', '2004-08-25', 'O+', 'France'),
('Isabella', 'Thomas', 18, 'B+', 'Philosophy', 'isabella.thomas@example.com', '2006-05-10', 'A-', 'Netherlands'),
('Lucas', 'Jackson', 19, 'B', 'Political Science', 'lucas.jackson@example.com', '2005-07-19', 'O-', 'USA'),
('Mia', 'White', 25, 'A-', 'Literature', 'mia.white@example.com', '2007-12-21', 'B+', 'India'),
('Henry', 'Harris', 18, 'B+', 'Art', 'henry.harris@example.com', '2006-09-03', 'A+', 'Italy'),
('Charlotte', 'Martin', 20, 'C-', 'Design', 'charlotte.martin@example.com', '2004-03-30', 'O+', 'Sweden'),
('Alexander', 'Thompson', 18, 'A', 'Programming', 'alexander.thompson@example.com', '2006-12-11', 'B-', 'USA'),
('Amelia', 'Garcia', 26, 'B+', 'Music', 'amelia.garcia@example.com', '2005-06-16', 'AB+', 'Mexico'),
('Michael', 'Martinez', 19, 'A-', 'Robotics', 'michael.martinez@example.com', '2007-04-05', 'A-', 'Spain'),
('Harper', 'Robinson', 18, 'B', 'Drama', 'harper.robinson@example.com', '2006-11-29', 'O-', 'Brazil'),
('Ethan', 'Clark', 19, 'C+', 'Statistics', 'ethan.clark@example.com', '2005-01-13', 'AB-', 'South Africa'),
('Evelyn', 'Lewis', 20, 'B-', 'Astronomy', 'evelyn.lewis@example.com', '2004-10-08', 'B+', 'Japan');

-- show data as order 
SELECT * FROM students ORDER BY(first_name) ASC;
SELECT * FROM students ORDER BY(first_name) DESC;
SELECT * FROM students ORDER BY(age) ASC;
SELECT * FROM students ORDER BY(age) DESC;
SELECT * FROM students ORDER BY(dob) ASC;
SELECT * FROM students ORDER BY(dob) DESC;
SELECT * FROM students;



SELECT country FROM students ORDER BY(country) ASC;

-- see unique values of a column
SELECT DISTINCT country FROM students ORDER BY(country) ASC;


-- data filtering
SELECT * FROM students;

-- Select students from the USA
SELECT * FROM students
    WHERE country = 'USA';

-- Select students with 'A' grade in Physics
SELECT * FROM students
    WHERE grade = 'B' AND course = 'Physics';

-- Select students with a specific blood group ('A+')
SELECT * FROM students
    WHERE blood_group = 'A-';

-- Select students from the USA or from Australia
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia');

-- Select students from the USA or from Australia and the age is 20
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia')
    and age = 20;

-- Select students from the USA or from Australia and the age is grater then 18
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia')
    and age > 18;

-- Select students with a grade of 'A' or 'B' in Math or Physics:
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia')
    AND (course = 'Math' OR course = 'Physics') ;



-- show a column data as CAPITAL Letter 
SELECT upper(first_name) as "Upper First Name",* FROM  students;

-- show multy column data in a single column
SELECT concat(first_name,' ',last_name) as "Name" FROM  students;

-- show multy column data in a single column
SELECT length(first_name) as "Name Length",first_name FROM  students;

-- calculate average 
select avg(age) from students;


--Find maximum value of a column
select max(age) from students;


--Find minimum value of a column
select min(age) from students;


--Find SUM value of a column
select sum(age) from students;

--COUNT() Counts the number of rows in a set.
select COUNT(*) from students;


--find max length of a column
select MAX(length(first_name)) from students;

--find data which not equal given data
SELECT * FROM students
    WHERE NOT country = 'USA';

SELECT * FROM students
    WHERE email = NULL;


SELECT * FROM students;

TRUNCATE TABLE students;

SELECT * FROM students
WHERE email IS NULL;



select COALESCE(email,'Email not Provided') as "Email",* FROM students;


SELECT * FROM students
 WHERE country IN ('USA','Canada','UK');

SELECT * FROM students
 WHERE country NOT IN ('USA','Canada','UK');

SELECT * FROM students
    WHERE age BETWEEN 18 AND 29;


SELECT * FROM students
    WHERE dob BETWEEN '2000-09-05' AND '2005-09-05' ORDER BY(dob) ASC;


SELECT * FROM students
    WHERE first_name LIKE 'Am%';

SELECT * FROM students
    WHERE first_name LIKE '%am';

SELECT * FROM students
    WHERE first_name LIKE '____i%';



-- Use case of LIMIT
SELECT * FROM students LIMIT 5;


-- Use case of OFFSET
SELECT * FROM students LIMIT 5 OFFSET 5*0;
SELECT * FROM students LIMIT 5 OFFSET 5*1;
SELECT * FROM students LIMIT 5 OFFSET 5*2;


-- delete a user data from a table 
DELETE from students
    where grade = 'C+' AND country ='USA';


UPDATE students
    SET email = 'default@mail.com' 
    where email IS NULL;
