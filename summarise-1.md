# SQL সারাংশ (SQL Summary)

## টেবিল মডিফিকেশন (Table Modification)

### টেবিলে নতুন কলাম যোগ করা (Adding New Column)
```sql
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@mail.com' NOT NULL;
```
**ব্যাখ্যা**: এই কমান্ডটি `person2` টেবিলে একটি নতুন `email` কলাম যোগ করে। কলামটি 25 ক্যারেক্টার লম্বা হবে, ডিফল্ট ভ্যালু 'default@mail.com' থাকবে এবং NULL ভ্যালু গ্রহণ করবে না।

### কলাম ডিলিট করা (Deleting Column)
```sql
ALTER TABLE person2
    DROP COLUMN email;
```
**ব্যাখ্যা**: এই কমান্ডটি `person2` টেবিল থেকে `email` কলামটি মুছে ফেলে।

### কলামের নাম পরিবর্তন (Renaming Column)
```sql
ALTER TABLE person2
    RENAME COLUMN age TO user_age;
```
**ব্যাখ্যা**: এই কমান্ডটি `age` কলামের নাম পরিবর্তন করে `user_age` করে।

### কলামের টাইপ পরিবর্তন (Changing Column Type)
```sql
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);
```
**ব্যাখ্যা**: এই কমান্ডটি `user_name` কলামের ডাটা টাইপ পরিবর্তন করে VARCHAR(50) করে।

## ডাটা সিলেক্ট (Data Selection)

### বেসিক সিলেক্ট (Basic Select)
```sql
SELECT * FROM students;
```
**ব্যাখ্যা**: টেবিলের সব ডাটা দেখার জন্য।

### অর্ডার বাই (Order By)
```sql
SELECT * FROM students ORDER BY first_name ASC;
SELECT * FROM students ORDER BY age DESC;
```
**ব্যাখ্যা**: ডাটা সর্ট করার জন্য। ASC মানে ছোট থেকে বড়, DESC মানে বড় থেকে ছোট।

### ডিসটিংক্ট ভ্যালু (Distinct Values)
```sql
SELECT DISTINCT country FROM students;
```
**ব্যাখ্যা**: কলামের ইউনিক ভ্যালুগুলো দেখার জন্য।

### ফিল্টারিং (Filtering)
```sql
SELECT * FROM students WHERE country = 'USA';
SELECT * FROM students WHERE age > 18 AND grade = 'A';
```
**ব্যাখ্যা**: নির্দিষ্ট শর্ত অনুযায়ী ডাটা ফিল্টার করার জন্য।

### লাইক অপারেটর (Like Operator)
```sql
SELECT * FROM students WHERE first_name LIKE 'Am%';
SELECT * FROM students WHERE first_name LIKE '%am';
```
**ব্যাখ্যা**: প্যাটার্ন ম্যাচিং এর জন্য। % মানে যেকোনো ক্যারেক্টার।

### অ্যাগ্রিগেট ফাংশন (Aggregate Functions)
```sql
SELECT AVG(age) FROM students;
SELECT MAX(age) FROM students;
SELECT MIN(age) FROM students;
SELECT COUNT(*) FROM students;
```
**ব্যাখ্যা**: ডাটার উপর গণনা করার জন্য।

## English Version

## Table Modification

### Adding New Column
```sql
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@mail.com' NOT NULL;
```
**Explanation**: This command adds a new `email` column to the `person2` table. The column will be 25 characters long, have a default value of 'default@mail.com', and won't accept NULL values.

### Deleting Column
```sql
ALTER TABLE person2
    DROP COLUMN email;
```
**Explanation**: This command removes the `email` column from the `person2` table.

### Renaming Column
```sql
ALTER TABLE person2
    RENAME COLUMN age TO user_age;
```
**Explanation**: This command renames the `age` column to `user_age`.

### Changing Column Type
```sql
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);
```
**Explanation**: This command changes the data type of the `user_name` column to VARCHAR(50).

## Data Selection

### Basic Select
```sql
SELECT * FROM students;
```
**Explanation**: To view all data from a table.

### Order By
```sql
SELECT * FROM students ORDER BY first_name ASC;
SELECT * FROM students ORDER BY age DESC;
```
**Explanation**: To sort data. ASC means ascending (small to large), DESC means descending (large to small).

### Distinct Values
```sql
SELECT DISTINCT country FROM students;
```
**Explanation**: To view unique values in a column.

### Filtering
```sql
SELECT * FROM students WHERE country = 'USA';
SELECT * FROM students WHERE age > 18 AND grade = 'A';
```
**Explanation**: To filter data based on specific conditions.

### Like Operator
```sql
SELECT * FROM students WHERE first_name LIKE 'Am%';
SELECT * FROM students WHERE first_name LIKE '%am';
```
**Explanation**: For pattern matching. % represents any character.

### Aggregate Functions
```sql
SELECT AVG(age) FROM students;
SELECT MAX(age) FROM students;
SELECT MIN(age) FROM students;
SELECT COUNT(*) FROM students;
```
**Explanation**: For performing calculations on data.

## Practical Examples

### Example 1: Student Database
```sql
-- Create table
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT check(age >= 18),
    grade VARCHAR(2),
    course VARCHAR(50)
);

-- Insert data
INSERT INTO students(first_name, last_name, age, grade, course)
VALUES ('John', 'Doe', 20, 'A', 'Computer Science');

-- Query data
SELECT * FROM students WHERE grade = 'A' AND age > 18;
```

### Example 2: Employee Management
```sql
-- Add new column
ALTER TABLE employees
    ADD COLUMN salary DECIMAL(10,2);

-- Update data
UPDATE employees
    SET salary = 50000
    WHERE department = 'IT';

-- Complex query
SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 45000;
``` 