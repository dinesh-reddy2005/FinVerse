
USE fintech_db;

-- 1. Overall transaction KPIs
SELECT COUNT(*) AS total_transactions,
       ROUND(SUM(amount), 2) AS total_transaction_value,
       ROUND(AVG(amount), 2) AS average_transaction_value,
       SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
       ROUND(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 2) AS fraud_rate_pct,
       ROUND(SUM(CASE WHEN is_fraud = 1 THEN amount ELSE 0 END), 2) AS fraud_amount
FROM transactions;

-- 2. Monthly transaction trend
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
       COUNT(*) AS transaction_count, ROUND(SUM(amount), 2) AS transaction_value
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY transaction_month;

-- 3. Fraud vs legitimate transactions
SELECT CASE WHEN is_fraud = 1 THEN 'Fraudulent' ELSE 'Legitimate' END AS transaction_status,
       COUNT(*) AS transaction_count,
       ROUND(100.0 * COUNT(*) / NULLIF((SELECT COUNT(*) FROM transactions), 0), 2) AS percentage
FROM transactions
GROUP BY is_fraud
ORDER BY is_fraud;

-- 4. Fraud rate by transaction type
SELECT transaction_type, COUNT(*) AS total_transactions,
       SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
       ROUND(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 2) AS fraud_rate_pct
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_rate_pct DESC;

-- 5. Fraudulent transactions by device type
SELECT device_type, COUNT(*) AS fraud_transactions, ROUND(SUM(amount), 2) AS fraud_amount
FROM transactions
WHERE is_fraud = 1
GROUP BY device_type
ORDER BY fraud_transactions DESC;

-- 6. Monthly fraud trend
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month, is_fraud,
       COUNT(*) AS transaction_count, ROUND(SUM(amount), 2) AS transaction_value
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m'), is_fraud
ORDER BY transaction_month, is_fraud;

-- 7. Fraud by merchant category
SELECT m.merchant_category, COUNT(*) AS fraud_transactions, ROUND(SUM(t.amount), 2) AS fraud_amount
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE t.is_fraud = 1
GROUP BY m.merchant_category
ORDER BY fraud_transactions DESC;

-- 8. Transaction value by customer state
SELECT c.state, COUNT(t.transaction_id) AS transaction_count, ROUND(SUM(t.amount), 2) AS transaction_value
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.state
ORDER BY transaction_value DESC;

-- 9. Top 5 branches by transaction value
SELECT b.branch_id, b.bank_branch, b.state, b.city,
       COUNT(t.transaction_id) AS transaction_count,
       ROUND(SUM(t.amount), 2) AS transaction_value,
       SUM(CASE WHEN t.is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM branches b
LEFT JOIN customers c ON c.branch_id = b.branch_id
LEFT JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY b.branch_id, b.bank_branch, b.state, b.city
ORDER BY transaction_value DESC
LIMIT 5;

-- 10. Transaction amount by merchant category
SELECT m.merchant_category, COUNT(t.transaction_id) AS transaction_count,
       ROUND(SUM(t.amount), 2) AS transaction_value
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_category
ORDER BY transaction_value DESC;

-- 11. Customer-level transaction summary
SELECT c.customer_id, c.customer_name,
       COUNT(t.transaction_id) AS transaction_count,
       ROUND(SUM(t.amount), 2) AS transaction_value,
       ROUND(AVG(t.amount), 2) AS average_transaction_amount,
       SUM(CASE WHEN t.is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM customers c
LEFT JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY transaction_value DESC
LIMIT 100;

-- 12. Joined transaction details across all four tables
SELECT t.transaction_id, t.transaction_date, t.amount, t.transaction_type, t.is_fraud,
       c.customer_id, c.customer_name, b.branch_id, b.bank_branch,
       b.state AS branch_state, m.merchant_id, m.merchant_category
FROM transactions t
INNER JOIN customers c ON t.customer_id = c.customer_id
INNER JOIN branches b ON c.branch_id = b.branch_id
INNER JOIN merchants m ON t.merchant_id = m.merchant_id
ORDER BY t.transaction_date DESC
LIMIT 100;

-- 13. Recent transactions
SELECT transaction_id, customer_id, merchant_id, transaction_date, amount,
       transaction_type, device_type, is_fraud
FROM transactions
ORDER BY transaction_date DESC
LIMIT 20;
