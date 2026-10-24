# Finverse – FinTech Data Analytics & Fraud Detection

## 📌 Project Overview

**Finverse** is a FinTech data analytics project developed to analyze financial transactions, monitor fraudulent activities, evaluate branch performance, and provide customer-level financial insights using **Microsoft Power BI, SQL, and Python**.

The project transforms financial transaction data into interactive dashboards that help users understand transaction patterns, identify potential fraud risks, compare merchant categories, and monitor financial activity.

## 🎯 Project Objectives

- Analyze financial transactions and transaction values.
- Monitor fraudulent and legitimate transactions.
- Evaluate fraud rates across transaction types and devices.
- Compare transaction values across states, branches, and merchant categories.
- Analyze customer transaction activity and spending patterns.
- Present key performance indicators (KPIs) through interactive dashboards.

## 🛠️ Technologies Used

- **Microsoft Power BI** – Dashboard development, data visualization, KPIs, and interactive filters.
- **MySQL** – Data storage, table creation, relationships, and SQL-based analysis.
- **Python** – Data cleaning, preprocessing, and exploratory data analysis.
- **Pandas and NumPy** – Data manipulation and preparation.
- **CSV datasets** – Financial transaction and supporting data.

## 📊 Dashboard Modules

### 1. Admin Overview

Provides a high-level view of financial transaction performance.

**Key Performance Indicators:**
- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Fraud Transactions
- Fraud Rate

**Visualizations:**
- Monthly Transaction Trend
- Transaction Value by State
- Branch Performance
- Transaction Amount by Merchant Category

**Purpose:** Helps administrators monitor overall transaction activity and compare performance across geographical regions, branches, and merchant categories.

### 2. Fraud & Risk Analytics

Focuses on fraudulent transactions and potential financial risks.

**Key Performance Indicators:**
- Fraud Transactions
- Fraud Rate
- Fraud Amount

**Visualizations:**
- Fraud vs. Legitimate Transactions
- Fraud Rate by Transaction Type
- Fraudulent Transactions by Device Type
- Monthly Fraud Transaction Trend
- Fraud by Merchant Category

**Purpose:** Helps identify patterns in suspicious transactions and understand how fraud activity varies by transaction type, device, and merchant category.

### 3. My Financial Dashboard

Provides a customer-focused view of financial transactions.

**Key Performance Indicators:**
- My Transaction Value
- My Transactions
- Average Transaction Amount

**Visualizations:**
- My Monthly Activity
- My Transactions by Transaction Type
- My Transaction Value by Merchant Category
- My Recent Transactions

**Purpose:** Enables customers to review their transaction activity, understand spending patterns, compare transaction categories, and inspect recent transactions.

## 📈 Key Insights Displayed

The dashboard presents the following analytical insights:

- Overall transaction volume and monetary value.
- Monthly changes in transaction activity.
- Fraud percentage and fraudulent transaction value.
- Fraud distribution across transaction types and devices.
- State-wise transaction value comparisons.
- Branch performance comparisons.
- Merchant category contribution to transaction value.
- Customer transaction history and spending patterns.

*Note: Actual findings should be interpreted using the selected dashboard filters and validated against the underlying dataset.*


## 🔗 Data Model

The project uses four logical data entities:

- **Customers** – Customer details and associated branch information.
- **Transactions** – Transaction dates, amounts, types, account balances, device information, and fraud indicators.
- **Merchants** – Merchant category information.
- **Branches** – Branch names and geographical details.

Primary keys and foreign keys can be used to connect the tables and support consistent analysis across customers, transactions, merchants, and branches.

## 🚀 How to View the Dashboard

1. Download `Finverse_Dashboard.pbix` from this repository.
2. Install Microsoft Power BI Desktop.
3. Open the `.pbix` file in Power BI Desktop.
4. Explore the dashboard pages, charts, KPIs, slicers, and filters.

A PDF version is also provided for users who want to view the dashboard visuals without Power BI Desktop.

## 🔐 Data Privacy

This repository should contain only synthetic, anonymized, or otherwise authorized data. Credentials, API keys, database passwords, and personally identifiable financial information must not be published.

## 🔮 Future Enhancements

- Improve fraud risk monitoring with additional analytical indicators.
- Add advanced fraud detection using machine learning.
- Expand customer spending analysis.
- Improve dashboard navigation and performance.
- Automate data refresh and reporting workflows.


