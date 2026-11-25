CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE sales (
    Sale_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Product_ID VARCHAR(10),
    Quantity INT,
    Sale_Date DATE
);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;

SELECT * FROM customers;

SELECT *
FROM customers
WHERE City = 'Hyderabad';


SELECT *
FROM products
WHERE Category = 'Electronics';

SELECT *
FROM products
WHERE Price > 10000;

SELECT
    s.Sale_ID,
    c.Customer_Name,
    p.Product_Name,
    s.Quantity,
    s.Sale_Date
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
JOIN products p
    ON s.Product_ID = p.Product_ID;


SELECT
    s.Sale_ID,
    c.Customer_Name,
    p.Product_Name,
    s.Quantity,
    p.Price,
    s.Quantity * p.Price AS Sale_Amount
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
JOIN products p
    ON s.Product_ID = p.Product_ID;

SELECT
    SUM(s.Quantity * p.Price) AS Total_Sales
FROM sales s
JOIN products p
    ON s.Product_ID = p.Product_ID;

SELECT
    c.Customer_Name,
    SUM(s.Quantity * p.Price) AS Total_Purchase
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY c.Customer_Name
ORDER BY Total_Purchase DESC;


SELECT
    c.City,
    SUM(s.Quantity * p.Price) AS City_Sales
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY c.City
ORDER BY City_Sales DESC;


SELECT
    p.Product_Name,
    SUM(s.Quantity) AS Total_Quantity,
    SUM(s.Quantity * p.Price) AS Total_Sales
FROM sales s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC;


BEGIN;

INSERT INTO sales
(Sale_ID, Customer_ID, Product_ID, Quantity, Sale_Date)
VALUES
('S009', 101, 'P03', 2, '2026-01-13');

COMMIT;

SELECT * FROM sales
WHERE Sale_ID = 'S009';


BEGIN;

UPDATE sales
SET Quantity = 100
WHERE Sale_ID = 'S009';

ROLLBACK;

SELECT *
FROM sales
WHERE Sale_ID = 'S009';


SELECT
    s.Sale_ID,
    c.Customer_Name,
    p.Product_Name,
    s.Quantity,
    p.Price,
    s.Quantity * p.Price AS Sale_Amount
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
JOIN products p
    ON s.Product_ID = p.Product_ID
ORDER BY Sale_Amount DESC
LIMIT 1;

SELECT
    p.Product_Name,
    SUM(s.Quantity) AS Total_Quantity
FROM sales s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Quantity DESC
LIMIT 1;


SELECT
    Sale_Date,
    SUM(s.Quantity * p.Price) AS Daily_Sales
FROM sales s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY Sale_Date
ORDER BY Sale_Date;

SELECT
    p.Product_Name,
    SUM(s.Quantity * p.Price) AS Total_Sales
FROM sales s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name;


