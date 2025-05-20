-- Active: 1747462866418@@127.0.0.1@5432@ph

SELECT * from students;

SELECT blood_group, count(*), avg(age) as average_age from students
    GROUP BY blood_group;



SELECT blood_group, avg(age) as average_age from students
    GROUP BY blood_group
        HAVING avg(age) > 20;




-- Filter Groups Using HAVING to Show Only Countries with Average Age Above 22 
SELECT country, avg(age) as average_age from students
    GROUP BY country
        HAVING avg(age) > 22;


-- Count Students Born in Each Year
SELECT extract(year from dob) as barth_year, count(*)
    FROM students
        GROUP BY barth_year;