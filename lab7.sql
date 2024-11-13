CREATE DATABASE lab7;
\c lab7
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL ,
    last_name VARCHAR(255) NOT NULL ,
    salary INTEGER NOT NULL CHECK (salary >= 0),
    department_id INTEGER REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget INTEGER NOT NULL CHECK (budget >= 0)
);
CREATE INDEX idx_countries_name ON countries (name);
SELECT * FROM countries WHERE name = 'New York';
---1
CREATE INDEX idx_employees_name_surname ON employees (first_name, last_name);
SELECT * FROM employees WHERE employees.first_name = 'Meyrim' AND employees.last_name = 'Sultan';
---2
CREATE UNIQUE INDEX idx_employees_salary ON employees (salary);
SELECT * FROM employees WHERE salary < 150 AND salary > 70;
---3
CREATE INDEX idx_employees_name_substring ON employees ((substring(first_name FROM 1 FOR 4)));
SELECT * FROM employees WHERE substring (first_name from 1 for 4) = 'abcd';
---4
CREATE INDEX idx_employees_department_salary ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);
SELECT * FROM employees e
    JOIN departments d ON d.department_id = e.department_id WHERE
d. budget > 150 AND e.salary < 150;
---5