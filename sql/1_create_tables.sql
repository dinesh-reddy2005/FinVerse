CREATE DATABASE fintech_db;

USE fintech_db;

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    bank_branch VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
    
);

SELECT * FROM branches;


CREATE TABLE merchants (
    merchant_id CHAR(36) PRIMARY KEY,
    merchant_category VARCHAR(50) NOT NULL
);


CREATE TABLE customers (
    customer_id CHAR(36) PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    state VARCHAR(100),
    city VARCHAR(100),
    account_type VARCHAR(50),
    contact VARCHAR(20),
    email VARCHAR(150),
    branch_id INT
);

 SELECT * FROM customers;
 
 CREATE TABLE transactions (
    transaction_id CHAR(36) PRIMARY KEY,
    customer_id CHAR(36) NOT NULL,
    merchant_id CHAR(36) NOT NULL,
    transaction_date DATETIME NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    account_balance DECIMAL(15,2) NOT NULL,
    device VARCHAR(50),
    location VARCHAR(100),
    device_type VARCHAR(20),
    currency CHAR(3),
    description VARCHAR(255),
    is_fraud TINYINT NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

SHOW TABLES;
DESCRIBE branches;
DESCRIBE merchants;
DESCRIBE customers;
DESCRIBE transactions;