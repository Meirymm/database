-- 1.Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INT
);
-- 2.Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
--3.Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);
INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');

---1
BEGIN TRANSACTION;
INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);
UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;
COMMIT;
SELECT * FROM Books;

---2
BEGIN;
DO $$
DECLARE
    book_stock INT;
BEGIN
    SELECT quantity INTO book_stock FROM Books WHERE book_id = 3;
    IF book_stock < 10 THEN
        RAISE NOTICE 'Недостаточно книг на складе.';
        ROLLBACK;
    ELSE
        INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, CURRENT_DATE, 10);
        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;
        COMMIT;
        RAISE NOTICE 'Транзакция успешно завершена.';
    END IF;
END $$;

SELECT * FROM Orders;
SELECT * FROM Books;

---3
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE Books
SET price = 57.00
WHERE book_id = 1;
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT price FROM Books WHERE book_id = 1;
COMMIT;
SELECT price FROM Books WHERE book_id = 1;

---4
BEGIN TRANSACTION;
UPDATE Customers
SET email = 'meyrim@gmail.com'
WHERE customer_id = 101;
COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;






