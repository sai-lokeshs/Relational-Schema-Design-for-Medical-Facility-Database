---- 1st q
SELECT Product_id,Price, (Price * 1.1) AS IncreasedPrice
FROM PRODUCT;


----2nd q
SELECT Product_id, Product_name, Vendor_id, Price
FROM Product
WHERE Price > 100;


----3rd q
SELECT Product_id, Product_name, Vendor_id, Price
FROM Product
WHERE price <= 110 AND category_id= 'FW';


















----4th q
SELECT DISTINCT vendor_id
FROM PRODUCT;



















-----5th q
SELECT product_id, product_name, category_id, price
FROM product
WHERE category_id = 'FW'
ORDER BY price;



















---6th q
SELECT product_id, product_name, category_id, price
FROM product
WHERE category_id = 'FW'
ORDER BY price DESC;




















----7th q
SELECT product_id, product_name, category_id, price
FROM product
ORDER BY category_id, price;






















----8th q
SELECT product_id, product_name, category_id, price
FROM product
WHERE product_name LIKE '%Boot%';




















----9th q
SELECT AVG(price) AS avg_price
FROM product;



















----10th q
SELECT COUNT(*) AS tot_pro
FROM product;



















----11th q
SELECT COUNT(DISTINCT vendor_id) AS tot_vend
FROM product;



















----12th q
SELECT 
COUNT(*) AS total_products,
AVG(price) AS avg_price,
MIN(price) AS low_price,
MAX(price) AS high_price
FROM product
WHERE category_id = 'CP';





















---13th q
SELECT vendor_id,COUNT(*) AS tot_products,AVG(price) AS avg_price
FROM product
GROUP BY vendor_id;





















---14th question
SELECT vendor_id,COUNT(*) AS tot_pro,AVG(Price) AS average_price
FROM product
GROUP BY vendor_id;




















----15th Q
SELECT vendor_id,COUNT(*) AS prdouct_price_g100
FROM product
WHERE price >= 100
GROUP BY vendor_id;






















----16th q
SELECT vendor_id,category_id,COUNT(*) AS sum_product,
AVG(price) AS average_price
FROM product
GROUP BY vendor_id, category_id;























---17th q
SELECT p.product_id,SUM(s.quantity) AS items_sold_sum
FROM product p
JOIN sales_transaction_product s ON p.product_id = s.product_id
GROUP BY p.product_id;





















---18th q
SELECT vendor_id,category_id,COUNT(*) AS sum_products,
AVG(price) AS avg_price
FROM product
GROUP BY category_id,vendor_id;
HAVING sum_products > 1;




















----20th
SELECT product_id,product_name,price
FROM product
WHERE price < (SELECT AVG(price) FROM product);



















---21st q
SELECT  product_id,product_name,price
FROM product
WHERE product_id IN ('1X1', '2X2', '3X3');




















---22 q
SELECT p.product_id,p.product_name,p.price
FROM product p
JOIN (
    SELECT product_id, SUM(quantity) AS total_sold
    FROM sales_transaction_product
    GROUP BY product_id
    HAVING SUM(quantity) > 3
) s ON p.product_id = s.product_id;





















----23rd q
SELECT p.product_id,p.product_name,v.vendor_name, p.price
FROM product p
JOIN vendor v ON p.vendor_id = v.vendor_id;

























----24th q
SELECT Sales_Transaction.Transaction_ID, Sales_Transaction.T_Date, Product.Product_Name,SALES_TRANSACTION_PRODUCT.Quantity AS QuantitySold,
CAST(Product.Price AS DECIMAL(10, 2)) * SALES_TRANSACTION_PRODUCT.Quantity AS AmountCharged
FROM Sales_Transaction
JOIN SALES_TRANSACTION_PRODUCT ON Sales_Transaction.Transaction_ID = SALES_TRANSACTION_PRODUCT.Transaction_ID
JOIN SALES_TRANSACTION_PRODUCT ON SALES_TRANSACTION_PRODUCT.Product_ID = SALES_TRANSACTION_PRODUCT.Product_ID
JOIN Product ON SALES_TRANSACTION_PRODUCT.Product_ID = Product.Product_ID
ORDER BY  Sales_Transaction.Transaction_ID;


---25

CREATE OR REPLACE PROCEDURE SUM_PRODUCT(
    p_Product_ID PRODUCT.Product_ID%VARCHAR(20)
    p_Product_Name PRODUCT.Product_Name%TYPE,
    p_Price PRODUCT.Price%TYPE,
    p_VendorID PRODUCT.Vendor_ID%TYPE,
    p_CategoryID PRODUCT.Category_ID%TYPE
) IS
BEGIN
    INSERT INTO PRODUCT (Product_ID, Product_Name, Price, Vendor_ID, Category_ID)
    VALUES (p_Product_ID, p_Product_Name, p_Price, p_VendorID, p_CategoryID);
    COMMIT;
END SUM_PRODUCT;





----26

CREATE OR REPLACE PROCEDURE Increase_Price (p_Product_ID IN  Product.Product_ID%TYPE,p_PercentIncrease IN  NUMBER)
AS
BEGIN
    UPDATE Product
    SET Price = Price * (1 + p_PercentIncrease / 100)
    WHERE Product_ID = p_Product_ID;
    COMMIT;
END Increase_Price;
/










---27
CREATE OR REPLACE VIEW products_more_sold3 AS
SELECT
    Product.Product_name,
    Product.Product_id,
    Product.Price
FROM
    Product
JOIN
    SALES_TRANSACTION_PRODUCT ON Product.Product_ID = SALES_TRANSACTION_PRODUCT.Product_ID
JOIN
    SALES_TRANSACTION_PRODUCT ON SALES_TRANSACTION_PRODUCT.Transaction_ID = SALES_TRANSACTION_PRODUCT.Transaction_ID
GROUP BY
    Product.Product_ID,
    Product.Product_Name,
    Product.Price
HAVING
    SUM(SALES_TRANSACTION_PRODUCT.Quantity) > 3;
SELECT * FROM products_more_sold3;



---28
CREATE OR REPLACE VIEW products_in_multiple_trnsc AS
SELECT
    Product.Product_Name,
    Product.Price
FROM
    Product
JOIN
    SALES_TRANSACTION_PRODUCT ON Product.Product_ID = SALES_TRANSACTION_PRODUCT.Product_ID
GROUP BY
    Product.Product_ID,
    Product.Product_Name,
    Product.Price
HAVING
    COUNT(DISTINCT SALES_TRANSACTION_PRODUCT.Transaction_ID) > 1;
SELECT * FROM products_in_multiple_trnsc;

---29 
SELECT Product.product_id, Product.product_name, Product.price
FROM Product
JOIN Sales_transaction_product ON Product.product_id = Sales_transaction_product.product_id
GROUP BY Product.product_id, Product.product_name, Product.price
HAVING SUM(Sales_transaction_product.quantity) > 3 OR COUNT(DISTINCT Sales_transaction_product.transaction_id) > 1;
