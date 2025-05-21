-- Active: 1747462866418@@127.0.0.1@5432@ph


/*
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions. 
*/

-- Table-Level Events:
    -- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
    -- Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW] 
-- EXECUTE FUNCTION function_name();

-- *** Test example ***
-- CREATE TRIGGER TR
-- BEFORE DELETE
-- on "user"
-- FOR EACH ROW
-- EXECUTE FUNCTION function_name();


CREATE TABLE my_user(
    user_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO my_user(user_name,email)
VALUES
    ('Mezba','mezba@gmail.com'),
    ('Mir','mir@gmail.com')


SELECT * FROM my_user;


CREATE TABLE deleted_users_audit(
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);
SELECT * FROM deleted_users_audit;


CREATE or REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO deleted_users_audit(deleted_user_name, deletedAt)
        VALUES (OLD.user_name, NOW());
        RAISE NOTICE 'User % deleted at %', OLD.user_name, NOW();
        RETURN OLD;
    END;
$$;

CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_user
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();



DELETE FROM my_user
WHERE user_name = 'Mezba';