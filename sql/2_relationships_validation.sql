-- Run after importing CSV data. Check unmatched IDs before adding constraints.
USE fintech_db;

SELECT COUNT(*) AS customers_with_missing_branch
FROM customers c
LEFT JOIN branches b ON c.branch_id = b.branch_id
WHERE c.branch_id IS NOT NULL AND b.branch_id IS NULL;

SELECT COUNT(*) AS transactions_with_missing_customer
FROM transactions t
LEFT JOIN customers c ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) AS transactions_with_missing_merchant
FROM transactions t
LEFT JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE m.merchant_id IS NULL;

-- Add each constraint only once. If it already exists, skip that ALTER statement.
ALTER TABLE customers
    ADD CONSTRAINT fk_customers_branch
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE transactions
    ADD CONSTRAINT fk_transactions_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE transactions
    ADD CONSTRAINT fk_transactions_merchant
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT;

SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME,
       REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'fintech_db'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

SELECT b.branch_id, b.bank_branch, COUNT(c.customer_id) AS customer_count
FROM branches b
LEFT JOIN customers c ON b.branch_id = c.branch_id
GROUP BY b.branch_id, b.bank_branch
ORDER BY b.branch_id;

SELECT c.customer_id, c.customer_name, COUNT(t.transaction_id) AS transaction_count
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY transaction_count DESC
LIMIT 100;

SELECT m.merchant_id, m.merchant_category, COUNT(t.transaction_id) AS transaction_count
FROM merchants m
LEFT JOIN transactions t ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_id, m.merchant_category
ORDER BY transaction_count DESC;
