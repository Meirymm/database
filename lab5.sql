CREATE DATABASE lab5;--1
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London',null, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);
CREATE TABLE salesmen (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesmen(salesman_id)
);

INSERT INTO salesmen (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen',null, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001);
---2
SELECT SUM(purch_amt) AS total_purchase_amount FROM orders;--3
SELECT AVG(purch_amt) AS average_purchase_amount FROM orders;---4
SELECT COUNT(*) AS customer_count FROM customers;--5
SELECT MIN(purch_amt) AS minimum_purchase_amount FROM orders;---6
SELECT * FROM customers
WHERE cust_name LIKE '%b';---7

SELECT orders.* FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.city = 'New York';---8

SELECT customers.* FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.purch_amt > 10; ---9

SELECT SUM(grade) AS total_grade FROM customers;---10

SELECT * FROM customers
WHERE cust_name IS NOT NULL;---11
SELECT MAX(grade) AS maximum_grade FROM customers;---12










