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




