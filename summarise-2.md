# SQL Concepts Summary (বাংলা & English)

## 1. CROSS JOIN (ক্রস জয়েন)

### বাংলা ব্যাখ্যা:
ক্রস জয়েন হল একটি SQL জয়েন অপারেশন যা দুইটি টেবিলের প্রতিটি রোকে অন্য টেবিলের প্রতিটি রোর সাথে মিলিয়ে দেয়। এটি কার্টেসিয়ান প্রোডাক্ট তৈরি করে।

### English Explanation:
CROSS JOIN is a SQL join operation that combines each row from the first table with every row from the second table, creating a Cartesian product.

### উদাহরণ (Example):
```sql
-- Creating sample tables
CREATE TABLE employees(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(25),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Inserting data
INSERT INTO employees (emp_name, dept_id)
VALUES
    ('John Doe', 101),
    ('Jane Smith', 102);

INSERT INTO departments (dept_id, dept_name)
VALUES
    (101, 'Human Resources'),
    (102, 'Marketing');

-- CROSS JOIN example
SELECT * FROM employees
CROSS JOIN departments;
```

## 2. NATURAL JOIN (ন্যাচারাল জয়েন)

### বাংলা ব্যাখ্যা:
ন্যাচারাল জয়েন হল একটি SQL জয়েন অপারেশন যা দুইটি টেবিলের কমন কলাম (একই নামের কলাম)-এর উপর ভিত্তি করে অটোমেটিকভাবে জয়েন করে। এটি নিজে থেকেই দুইটি টেবিলের মিলে যাওয়া কলাম খুঁজে বের করে।

### English Explanation:
NATURAL JOIN is a SQL join operation that automatically joins tables based on columns with the same name. It automatically finds matching columns between the tables.

### উদাহরণ (Example):
```sql
SELECT * FROM employees
NATURAL JOIN departments;
```

## 3. Date Functions (তারিখ ফাংশন)

### বাংলা ব্যাখ্যা:
PostgreSQL-এ বিভিন্ন ধরনের তারিখ ফাংশন রয়েছে যা তারিখ এবং সময় নিয়ে কাজ করার জন্য ব্যবহৃত হয়। যেমন: CURRENT_DATE, NOW(), EXTRACT() ইত্যাদি।

### English Explanation:
PostgreSQL provides various date functions for working with dates and times, such as CURRENT_DATE, NOW(), EXTRACT(), etc.

### উদাহরণ (Example):
```sql
-- Current date and time
SELECT now();
SELECT CURRENT_DATE;

-- Format date
SELECT to_char(now(),'dd/yyyy/mm');

-- Age calculation
SELECT age(CURRENT_DATE,'1997-09-05');

-- Extract year, month, day
SELECT extract(year from '2024-01-25'::date);
SELECT extract(month from '2024-01-25'::date);
SELECT extract(day from '2024-01-25'::date);
```

## 4. Foreign Keys (ফরেন কী)

### বাংলা ব্যাখ্যা:
ফরেন কী হল একটি কলাম যা অন্য টেবিলের প্রাইমারি কীকে রেফারেন্স করে। এটি টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে এবং ডাটা ইন্টিগ্রিটি বজায় রাখে।

### English Explanation:
A foreign key is a column that references the primary key of another table. It creates relationships between tables and maintains data integrity.

### উদাহরণ (Example):
```sql
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE post(
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT
);
```

## 5. GROUP BY and HAVING (গ্রুপ বাই এবং হ্যাভিং)

### বাংলা ব্যাখ্যা:
GROUP BY হল একটি SQL ক্লজ যা ডাটাকে গ্রুপে ভাগ করে। HAVING ক্লজ GROUP BY এর সাথে ব্যবহার করে গ্রুপগুলোর উপর ফিল্টার করে।

### English Explanation:
GROUP BY is a SQL clause that groups data, while HAVING filters the groups created by GROUP BY.

### উদাহরণ (Example):
```sql
-- Group by with count and average
SELECT blood_group, count(*), avg(age) as average_age 
FROM students
GROUP BY blood_group;

-- Having clause example
SELECT blood_group, avg(age) as average_age 
FROM students
GROUP BY blood_group
HAVING avg(age) > 20;
```

## 6. Different Types of JOINs (বিভিন্ন ধরনের জয়েন)

### বাংলা ব্যাখ্যা:
SQL-এ বিভিন্ন ধরনের জয়েন রয়েছে:
- INNER JOIN: শুধুমাত্র মিলে যাওয়া রো দেখায়
- LEFT JOIN: বাম টেবিলের সব রো এবং ডান টেবিলের মিলে যাওয়া রো দেখায়
- RIGHT JOIN: ডান টেবিলের সব রো এবং বাম টেবিলের মিলে যাওয়া রো দেখায়
- FULL OUTER JOIN: দুই টেবিলের সব রো দেখায়

### English Explanation:
SQL has different types of joins:
- INNER JOIN: Shows only matching rows
- LEFT JOIN: Shows all rows from left table and matching rows from right
- RIGHT JOIN: Shows all rows from right table and matching rows from left
- FULL OUTER JOIN: Shows all rows from both tables

### উদাহরণ (Example):
```sql
-- INNER JOIN
SELECT * FROM post AS p
INNER JOIN "user" AS u ON p.user_id = u.id;

-- LEFT JOIN
SELECT * FROM post
LEFT OUTER JOIN "user" ON post.user_id = "user".id;

-- RIGHT JOIN
SELECT * FROM post
RIGHT OUTER JOIN "user" ON post.user_id = "user".id;

-- FULL OUTER JOIN
SELECT * FROM post
FULL OUTER JOIN "user" ON post.user_id = "user".id;
``` 