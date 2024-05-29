CREATE TABLE Region (
    region_id VARCHAR2(20) PRIMARY KEY,
    region_name VARCHAR2(255)
);

CREATE TABLE Store (
    store_id VARCHAR2(20) PRIMARY KEY,
    store_zip VARCHAR2(10),
    region_id VARCHAR2(20),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

CREATE TABLE Customer (
    customer_id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(255),
    zip_code VARCHAR2(10)
);

CREATE TABLE Vendor (
    vendor_id VARCHAR2(20) PRIMARY KEY,
    vendor_name VARCHAR2(255)
);

CREATE TABLE Category (
    category_id VARCHAR2(20) PRIMARY KEY,
    category_name VARCHAR2(255)
);


CREATE TABLE Product (
    product_id VARCHAR2(20) PRIMARY KEY,
    product_name VARCHAR2(255),
    price DECIMAL(10,2),
    vendor_id VARCHAR2(20),
    category_id VARCHAR2(20),
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Sales_Transaction (
    transaction_id VARCHAR2(20) PRIMARY KEY,
    t_date DATE,
    store_id VARCHAR2(20),
    customer_id VARCHAR2(20),
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Sales_Transaction_Product (
    transaction_id VARCHAR2(20),
    product_id VARCHAR2(20),
    quantity INT,
    FOREIGN KEY (transaction_id) REFERENCES Sales_Transaction(transaction_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    PRIMARY KEY (transaction_id, product_id)
);





INSERT INTO Region (region_id, region_name) VALUES ('C', 'Chicagoland');
INSERT INTO Region (region_id, region_name) VALUES ('T', 'Tristate');
SELECT * FROM REGION;
Commit;



INSERT INTO Store (store_id, store_zip, region_id) VALUES ('S1', '60600', 'C');
INSERT INTO Store (store_id, store_zip, region_id) VALUES ('S2', '60605', 'C');
INSERT INTO Store (store_id, store_zip, region_id) VALUES ('S3', '35400', 'T');
SELECT * FROM STORE;
Commit;











INSERT INTO Customer (customer_id, name, zip_code) VALUES ('1-2-333', 'Tina', '60137');
INSERT INTO Customer (customer_id, name, zip_code) VALUES ('2-3-444', 'Tony', '60611');
INSERT INTO Customer (customer_id, name, zip_code) VALUES ('3-4-555', 'Pam', '35401');
SELECT * FROM Customer;
Commit;



INSERT INTO Vendor (vendor_id, vendor_name) VALUES ('PG', 'Pacific Gear');
INSERT INTO Vendor (vendor_id, vendor_name) VALUES ('MK', 'Mountain King');
SELECT * FROM VENDOR;
Commit;









-- Insert data into CATEGORY table
INSERT INTO Category (category_id, category_name) VALUES ('CP', 'Camping');
INSERT INTO Category (category_id, category_name) VALUES ('FW', 'Footwear');
SELECT * FROM CATEGORY;
Commit;


INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('1X1', 'Zzz Bag', 100, 'PG', 'CP');
INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('2X2', 'Easy Boot', 70, 'MK', 'FW');
INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('3X3', 'Cosy Sock', 15, 'MK', 'FW');
INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('4X4', 'Dura Boot', 90, 'PG', 'FW');
INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('5X5', 'Tiny Tent', 150, 'MK', 'CP');
INSERT INTO Product (product_id, product_name, price, vendor_id, category_id) VALUES ('6X6', 'Biggy Tent', 250, 'MK', 'CP');
SELECT * FROM Product;
Commit;
-- Insert data into SALESTRANSACTION table
INSERT INTO Sales_Transaction (transaction_id, t_date, store_id, customer_id) VALUES ('T111', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'S1', '1-2-333');
INSERT INTO Sales_Transaction (transaction_id, t_date, store_id, customer_id) VALUES ('T222', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'S2', '2-3-444');
INSERT INTO Sales_Transaction (transaction_id, t_date, store_id, customer_id) VALUES ('T333', TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'S3', '1-2-333');
INSERT INTO Sales_Transaction (transaction_id, t_date, store_id, customer_id) VALUES ('T444', TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'S3', '3-4-555');
INSERT INTO Sales_Transaction (transaction_id, t_date, store_id, customer_id) VALUES ('T555', TO_DATE('2020-01-02', 'YYYY-MM-DD'), 'S3', '2-3-444');
SELECT * FROM Sales_Transaction;
Commit;

-- Insert data into SALES_TRANSACTION_PRODUCT table
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T111', '1X1', 1);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T222', '2X2', 1);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T333', '3X3', 5);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T333', '1X1', 1);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T444', '4X4', 1);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T444', '2X2', 2);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T555', '4X4', 4);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T555', '5X5', 2);
INSERT INTO Sales_Transaction_Product (transaction_id, product_id, quantity) VALUES ('T555', '6X6', 1);
SELECT * FROM Sales_Transaction_Product;
Commit;



















