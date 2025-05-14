-- Create a new table with one product per row (1NF compliant)
CREATE TABLE ProductDetail_1NF AS
SELECT 
  OrderID,
  CustomerName,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1)) AS Product
FROM
  ProductDetail
JOIN
  (SELECT 1 as n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) numbers
  ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1;

--Table 2
-- Create Orders table with unique orders and customers
CREATE TABLE Orders AS
SELECT DISTINCT
  OrderID,
  CustomerName
FROM
  OrderDetails;

-- Create OrderDetails table with only OrderID, Product, Quantity
CREATE TABLE OrderDetails_2NF AS
SELECT
  OrderID,
  Product,
  Quantity
FROM
  OrderDetails;
