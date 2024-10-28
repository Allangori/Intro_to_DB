-- Use the alx_book_store database
USE alx_book_store;

-- Create authors table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_details table
CREATE TABLE IF NOT EXISTS order_details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
