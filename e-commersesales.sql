-- Create a new SQL database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Create tables for orders and customers
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(50)
);
-- Insert sample data into the orders table
INSERT INTO orders VALUES
(1, 101, '2023-01-01', 1, 2, 50.00),
(2, 102, '2023-01-02', 2, 1, 30.00),
(3, 103, '2023-01-03', 3, 3, 75.00),
(4, 104, '2023-01-04', 1, 1, 25.00),
(5, 105, '2023-01-05', 2, 2, 60.00);

-- Insert sample data into the customers table
INSERT INTO customers VALUES
(101, 'John', 'Doe', 'john@example.com', 'New York', 'NY', 'USA'),
(102, 'Jane', 'Smith', 'jane@example.com', 'Los Angeles', 'CA', 'USA'),
(103, 'David', 'Brown', 'david@example.com', 'Chicago', 'IL', 'USA'),
(104, 'Emily', 'Johnson', 'emily@example.com', 'Houston', 'TX', 'USA'),
(105, 'Michael', 'Williams', 'michael@example.com', 'Miami', 'FL', 'USA');
-- Calculate total revenue
SELECT SUM(total_price) AS total_revenue FROM orders;

-- Calculate average order quantity
SELECT AVG(quantity) AS avg_order_quantity FROM orders;

-- Identify top-selling products
SELECT 
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM orders
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Analyze sales trends over time
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_price) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;
