-- alx_book_store.sql
-- Create the database and use it
CREATE DATABASE IF NOT EXISTS `alx_book_store` DEFAULT CHARACTER SET = utf8mb4 DEFAULT COLLATE = utf8mb4_unicode_ci;
USE `alx_book_store`;

-- Allow clean re-run
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Order_Details`;
DROP TABLE IF EXISTS `Orders`;
DROP TABLE IF EXISTS `Books`;
DROP TABLE IF EXISTS `Authors`;
DROP TABLE IF EXISTS `Customers`;
SET FOREIGN_KEY_CHECKS = 1;

-- TABLE: Authors
CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` INT AUTO_INCREMENT PRIMARY KEY,
  `author_name` VARCHAR(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TABLE: Books
CREATE TABLE IF NOT EXISTS `Books` (
  `book_id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT NOT NULL,
  `price` DOUBLE,
  `publication_date` DATE,
  CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`)
    REFERENCES `Authors` (`author_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TABLE: Customers
CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215),
  `address` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TABLE: Orders
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_id` INT NOT NULL,
  `order_date` DATE,
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`)
    REFERENCES `Customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TABLE: Order_Details
CREATE TABLE IF NOT EXISTS `Order_Details` (
  `orderdetailid` INT AUTO_INCREMENT PRIMARY KEY,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE,
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_od_book` FOREIGN KEY (`book_id`)
    REFERENCES `Books` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- (Optional) Insert sample data in correct order to avoid FK errors
INSERT INTO `Authors` (`author_name`) VALUES
  ('J.K. Rowling'), ('George Orwell'), ('Paulo Coelho');

INSERT INTO `Books` (`title`, `author_id`, `price`, `publication_date`) VALUES
  ('Harry Potter and the Sorcerer''s Stone', 1, 19.99, '1997-06-26'),
  ('1984', 2, 15.50, '1949-06-08'),
  ('The Alchemist', 3, 12.00, '1988-04-15');

INSERT INTO `Customers` (`customer_name`, `email`, `address`) VALUES
  ('Alice Johnson', 'alice@example.com', '123 Maple St'),
  ('Bob Xavier', 'bob@example.com', '45 River Rd');

INSERT INTO `Orders` (`customer_id`, `order_date`) VALUES
  (1, '2025-10-18');

INSERT INTO `Order_Details` (`order_id`, `book_id`, `quantity`) VALUES
  (1, 1, 1);
