CREATE DATABASE dblab1; --1
CREATE TABLE users (
    id SERIAL PRIMARY KEY, --6
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
); --2
ALTER TABLE users
ADD COLUMN isadmin INTEGER DEFAULT 0; --3
ALTER TABLE users
ALTER COLUMN isadmin DROP DEFAULT;
ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN USING (isadmin = 1); --4
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE; --5

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    user_id INTEGER
); --7

DROP TABLE tasks; --8

DROP DATABASE dblab1; --9