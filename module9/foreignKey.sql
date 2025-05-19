-- Active: 1747462866418@@127.0.0.1@5432@ph


CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE
)


INSERT INTO "user" (username)
VALUES
    ('bahadur'),
    ('habib'),
    ('labib'),
    ('karim'),
    ('mofiz');

SELECT * from "user";

CREATE TABLE post(
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE set DEFAULT DEFAULT 5
)

ALTER TABLE post
    alter COLUMN user_id set NOT NULL;

INSERT INTO post (title,user_id)
VALUES
    ('Enjoying a sunny day with habib! ☀️',2),
    ('Rakib just shared an amazing recipe! 🍳',1),
    ('Karim play cricket! 🏏',4),
    ('Labib listening a song! 🎧',3),
    ('Mofiz ride a riksha! ☀️',5);

SELECT * from post;

SELECT title FROM post
WHERE user_id = 4;

-- *** Deletion constraint on DELETE user ***
-- Restrict Deletion ON DELETE RESTRICT / ON DELETE NO ACTION (default)


-- cascading Deletion ON DELETE CASCADE
-- CREATE TABLE post(
--     post_id SERIAL PRIMARY KEY,
--     title TEXT NOT NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DElete CASCADE
-- )


-- Setting NULL ON DELETE SET NULL
-- CREATE TABLE post(
--     post_id SERIAL PRIMARY KEY,
--     title TEXT NOT NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DElete set null
-- )


-- Set Default value ON DELETE
-- CREATE TABLE post(
--     post_id SERIAL PRIMARY KEY,
--     title TEXT NOT NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DElete set DEFAULT DEFAULT 1
-- )



DELETE FROM "user"
WHERE id = 5;

drop Table "post";
drop Table "user";


SELECT * from post;
SELECT * from "user";


/*=======================================================
                      Inner JOIN (UNION)
=======================================================*/
-- combined 2 table data 
SELECT post.post_id from post
JOIN "user" on post.user_id = "user".id;


-- combined 2 table data with condition full fil data, short table name
SELECT * from post AS p
INNER JOIN "user" AS u on p.user_id = u.id;


SELECT * from post 

/*=======================================================
                    Left JOIN (Left Table All Data)
=======================================================*/
SELECT * from post
LEFT OUTER JOIN "user" on post.user_id = "user".id;


/*=======================================================
                    right JOIN (right Table All Data)
=======================================================*/
SELECT * from post
RIGHT OUTER JOIN "user" on post.user_id = "user".id;

/*=======================================================
            full outer JOIN (Show both table all data)
=======================================================*/
SELECT * from post
FULL OUTER JOIN "user" on post.user_id = "user".id;