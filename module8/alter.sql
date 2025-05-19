-- Active: 1747462866418@@127.0.0.1@5432@ph
SELECT * FROM person2;

-- add new column 
ALTER Table person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@mail.com' NOT NULL;




-- add new data 
INSERT INTO person2 VALUES(53,'saiful',42,'test@mail.com');

-- remove/delete/drop column 
ALTER Table person2
    DROP COLUMN email;

-- column name change 
ALTER Table person2
    RENAME COLUMN age to user_age;

-- table column name type change 
ALTER Table person2
    ALTER COLUMN user_name TYPE VARCHAR(50);

-- exerting column Constant add
ALTER Table person2
    ALTER COLUMN user_age SET NOT NULL;

-- exerting column Constant remove
ALTER Table person2
    ALTER COLUMN user_age drop NOT NULL;



---------------------------------------------------------

-- exerting column unique Constant add
ALTER TABLE person2
    ADD CONSTRAINT unique_person2_user_age UNIQUE(user_age);

-- exerting column unique Constant remove/drop
ALTER TABLE person2
    DROP CONSTRAINT unique_person2_user_age;


-- exerting column primary key Constant add
ALTER TABLE person2
    ADD CONSTRAINT pk_person2_id PRIMARY KEY(id);


-- Drop database data only 
TRUNCATE TABLE person2;

-- Drop database data 
DROP TABLE person4;