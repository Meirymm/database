CREATE DATABASE lab8;
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    commission DECIMAL(3, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(5, 2),
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
);
CREATE ROLE junior_dev WITH LOGIN;--3
CREATE VIEW view_salesmen_newYork AS SELECT * FROM salesman WHERE city = 'New York';--4
CREATE VIEW view_order_details AS
SELECT
    o.ord_no,
    o.purch_amt,
    o.ord_date,
    c.cust_name AS customer_name,
    s.name AS salesman_name
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
              JOIN salesman s ON o.salesman_id = s.salesman_id;
GRANT ALL PRIVILEGES ON view_order_details TO junior_dev;
--5
CREATE VIEW view_highest_grade AS SELECT * FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);
GRANT SELECT ON view_highest_grade TO junior_dev;
--6
CREATE VIEW view_salesmen_city AS
SELECT
    city,
    COUNT(*)
FROM salesman
GROUP BY city;
--7
CREATE VIEW view_salesmen_with_multiple_customers AS
SELECT
    s.salesman_id,
    s.name,
    s.city,
    COUNT(c.customer_id)
FROM salesman s
JOIN customers c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name, s.city
HAVING COUNT(c.customer_id) > 1;
--8
CREATE ROLE intern;
GRANT junior_dev TO intern;
--9





