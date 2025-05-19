-- Active: 1747462866418@@127.0.0.1@5432@ph
-- show timezone
SHOW timezone;


-- show TIMESTAMP
CREATE TABLE timeZ(ts TIMESTAMP WITHOUT TIME ZONE,tsz TIMESTAMP WITH TIME ZONE);


-- show TIMESTAMP WITH TIME ZONE &  TIMESTAMP WITHOUT TIME ZONE
INSERT INTO timeZ VALUES('2024-01-12 10:45:00','2024-01-12 10:45:00');

SELECT * from timeZ;


SELECT now();
-- 2025-05-18 21:29:09.376619+06

SELECT CURRENT_DATE;
-- 2025-05-18

SELECT now()::date;
-- 2025-05-18

SELECT now()::time;
-- 21:29:34.880612

SELECT to_char(now(),'dd/yyyy/mm');
-- 18/2025/05


SELECT to_char(now(),'yyyy/dd/mm');
-- 2025/18/05

SELECT to_char(now(),'Month');
-- May      

SELECT to_char(now(),'DDD');


-- current date minus 1 year or any date or year 
SELECT CURRENT_DATE - INTERVAL '1 year';
-- 2024-05-18 00:00:00


-- age calculation 
SELECT age(CURRENT_DATE,'1997-09-05');
-- {"years":27,"months":8,"days":13}


SELECT *,age(CURRENT_DATE,dob) from students;


select extract(year from '2024-01-25'::date);
-- 2024
select extract(month from '2024-01-25'::date);
-- 1
select extract(day from '2024-01-25'::date);
-- 25

SELECT 'N'::BOOLEAN;