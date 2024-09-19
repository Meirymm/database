CREATE DATABASE lab2; --1
CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    region_id INTEGER,
    population INTEGER
); --2
INSERT INTO countries (country_name, region_id, population)
VALUES('China',1,1000000000),
      ('France', 5, 45000000),
      ('Kazakstan',13,19000000);----3

INSERT INTO countries(country_id,country_name)
             VALUES(4,'Japan');--4

INSERT INTO countries(country_name, region_id, population)
VALUES ('South Korea',NULL,65320000);---5

INSERT INTO countries(country_name, region_id, population)
VALUES('Italy',12,456789),
      ('Germany',32,4689139),
      ('America',25,789654230);---6

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';---7

INSERT INTO countries (region_id, population)
VALUES (33, 200000); ---8

INSERT INTO countries DEFAULT VALUES;---9

CREATE TABLE countries_new (LIKE countries INCLUDING CONSTRAINTS); ---10

INSERT INTO countries_new SELECT * FROM countries;---11

UPDATE countries
SET region_id=1
WHERE region_id IS NULL; ---12

SELECT country_name, population * 1.10 AS "New Population"
FROM countries; ---13

DELETE FROM countries
WHERE population < 100000
RETURNING *; ---14

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *; ---15

DELETE FROM countries
RETURNING *; ---16












