-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- =============================
-- Table: AUTHORS
-- =============================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- =============================
-- Table: BOOKS
-- =============================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- =============================
-- Table: CUSTOMERS
-- =============================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- =============================
-- Table: ORDERS
-- =============================
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- =============================
-- Table: ORDER_DETAILS
-- =============================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

-- Optional: Insert some sample data
INSERT INTO AUTHORS (author_name) VALUES ('J.K. Rowling'), ('George Orwell'), ('Paulo Coelho');

INSERT INTO BOOKS (title, author_id, price, publication_date)
VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 19.99, '1997-06-26'),
('1984', 2, 15.50, '1949-06-08'),
('The Alchemist', 3, 12.00, '1988-04-15');

