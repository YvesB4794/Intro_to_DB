-- alx_book_store.sql
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- allow clean re-run
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Order_Details`;
DROP TABLE IF EXISTS `Orders`;
DROP TABLE IF EXISTS `Books`;
DROP TABLE IF EXISTS `Authors`;
DROP TABLE IF EXISTS `Customers`;
SET FOREIGN_KEY_CHECKS = 1;

-- AUTHORS table
CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` INT AUTO_INCREMENT PRIMARY KEY,
  `author_name` VARCHAR(215)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BOOKS table
CREATE TABLE IF NOT EXISTS `Books` (
  `book_id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(130),
  `author_id` INT,
  `price` DOUBLE,
  `publication_date` DATE,
  CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`)
    REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CUSTOMERS table
CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_name` VARCHAR(215),
  `email` VARCHAR(215),
  `address` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ORDERS table
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_id` INT,
  `order_date` DATE,
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`)
    REFERENCES `Customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS `Order_Details` (
  `orderdetailid` INT AUTO_INCREMENT PRIMARY KEY,
  `order_id` INT,
  `book_id` INT,
  `quantity` DOUBLE,
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`),
  CONSTRAINT `fk_od_book` FOREIGN KEY (`book_id`)
    REFERENCES `Books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
