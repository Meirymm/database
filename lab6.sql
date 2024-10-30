CREATE database lab6;---1
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY ,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY ,
    department_name VARCHAR(50) UNIQUE ,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);---2
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN  departments d ON e.department_id = d.department_id;---3
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (40, 80);---4
SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
FROM employees e
JOIN  departments d ON e.department_id = d.department_id
JOIN  locations l ON d.location_id = l.location_id;---5

SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;---6

SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;---7





