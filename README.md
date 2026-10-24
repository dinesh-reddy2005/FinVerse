# FinVerse — FinTech Data Analytics & Fraud Detection

**FinVerse** is a FinTech data analytics project developed using **Microsoft Power BI, MySQL, SQL, and Python** to analyze financial transactions, investigate fraud patterns, evaluate branch performance, and explore customer-level financial activity.

The project combines data cleaning, relational database management, SQL analysis, and interactive dashboards to turn financial transaction data into meaningful business insights.

---

## 📌 Project Overview

FinVerse contains three Power BI dashboards designed for different analytical purposes:

1. **Admin Overview** — overall financial performance and transaction monitoring.
2. **Fraud & Risk Analytics** — fraudulent transaction patterns and risk indicators.
3. **My Financial Dashboard** — customer-focused transaction activity and spending analysis.

## 🎯 Project Objectives

- Analyze transaction volumes, values, and trends.
- Monitor potentially fraudulent financial transactions.
- Compare fraud rates across transaction types and devices.
- Evaluate bank branch and merchant-category performance.
- Explore customer-level transaction activity.
- Build meaningful KPIs and interactive Power BI reports.
- Maintain data consistency through MySQL primary keys and foreign-key relationships.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data quality checks and data cleaning |
| Pandas | Data manipulation and preprocessing |
| Jupyter Notebook | Data cleaning workflow |
| MySQL | Relational database management |
| SQL | Data validation, joins, and analysis |
| Microsoft Power BI | Interactive dashboards and visualization |
| GitHub | Version control and project documentation |

---

## 📊 Power BI Dashboard Gallery

### 1. Admin Overview

**Purpose:** Monitor overall transaction activity, financial performance, branch performance, and merchant-category distribution.

**Key performance indicators:**
- Total Transactions: **200K**
- Total Transaction Value: **9.91bn**
- Average Transaction Value: **49.54K**
- Fraud Transactions: **10K**
- Fraud Rate: **5.04%**

**Visualizations included:**
- Monthly Transaction Trend
- Transaction Value by State
- Branch Performance
- Transaction Amount by Merchant Category

**Business value:** Provides an overview of transaction activity and highlights differences in branch performance, transaction values, and merchant-category contributions.

#### Dashboard Preview

<img width="1338" height="747" alt="image" src="https://github.com/user-attachments/assets/a827184a-627c-4afd-9538-894d4ba0a68c" />


---

### 2. Fraud & Risk Analytics

**Purpose:** Investigate fraudulent transactions and identify patterns across transaction types, devices, dates, and merchant categories.

**Key performance indicators:**
- Fraud Transactions: approximately **10K**
- Fraud Rate: **5.04%**
- Fraud Amount: **497.12M**

**Visualizations included:**
- Fraud vs Legitimate Transactions
- Fraud Rate by Transaction Type
- Fraudulent Transactions by Device Type
- Monthly Fraud Transaction Trend
- Fraud by Merchant Category

**Business value:** Helps identify transaction categories and devices that warrant further investigation and supports monitoring of fraud-related activity.

#### Dashboard Preview

<img width="1343" height="747" alt="image" src="https://github.com/user-attachments/assets/d8c24796-d701-41ea-a0cd-e68e503d8916" />


---

### 3. My Financial Dashboard

**Purpose:** Present customer-focused financial activity, transaction behavior, and merchant-category spending.

**Key performance indicators shown in the report:**
- My Transaction Value: **5.93bn**
- My Transactions: **120K**
- Average Transaction Amount: **49.56K**

**Visualizations included:**
- My Monthly Activity
- My Transactions by Transaction Type
- My Transaction Value by Merchant Category
- My Recent Transactions

**Interactive filters include:**
- Transaction Date
- Transaction Type
- Merchant Category

**Business value:** Provides a focused view of transaction activity, transaction-type distribution, merchant-category values, and recent transactions for the selected customer context.

#### Dashboard Preview

<img width="1333" height="742" alt="image" src="https://github.com/user-attachments/assets/c2fc1c62-2464-4ba3-bf63-22e46309a10e" />

---

## 🗄️ Database Design

The project uses a MySQL database named `fintech_db` with four related tables.

| Table | Description |
|---|---|
| `customers` | Customer details, account information, location, and branch reference |
| `transactions` | Transaction IDs, dates, amounts, transaction types, device information, and fraud indicators |
| `merchants` | Merchant identifiers and merchant categories |
| `branches` | Branch identifiers, branch names, states, and cities |

### Database Relationships

- `branches.branch_id` → `customers.branch_id`
- `customers.customer_id` → `transactions.customer_id`
- `merchants.merchant_id` → `transactions.merchant_id`

These relationships enable joined analysis of customers, transactions, branches, and merchants.

---

## 🧹 Data Cleaning and Validation

Python, Pandas, Jupyter Notebook, and SQL are used in the data preparation and validation workflow.

The project includes:
- Duplicate record checks.
- Record-count and table-structure verification.
- Missing or unmatched identifier checks.
- Foreign-key relationship validation.
- Data preparation for downstream analysis and reporting.

## 🔍 SQL Analysis

The SQL scripts cover:
1. Database and table creation.
2. Relationship validation and foreign-key constraints.
3. Transaction and fraud analysis.
4. Customer-level transaction summaries.
5. Branch performance analysis.
6. Merchant-category analysis.
7. Joined transaction details across the four tables.

## 💡 Key Analytical Insights

The dashboards support exploration of:

- Overall transaction activity and financial value.
- Fraud transaction counts, rates, and amounts.
- Fraud distribution across transaction types and devices.
- Monthly transaction and fraud trends.
- Transaction values across states.
- Top-performing branches by transaction value.
- Merchant-category transaction distribution.
- Customer transaction activity and recent transactions.

The displayed KPI values represent the report as shown in the supplied dashboard PDF. Results may change when interactive filters are applied.

---

## 🚀 How to Explore the Project

1. Browse the CSV datasets in `datasets/`.
2. Review the data cleaning notebook in `notebooks/`.
3. Explore the MySQL scripts in `sql/`.
4. View the PDF report in `powerbi/`.
5. Open the `.pbix` file using Microsoft Power BI Desktop for interactive exploration.

## 🔐 Data Privacy

Only datasets authorized for public sharing should be included in this repository. Sensitive customer information, credentials, and private financial details must not be exposed.

## 👨‍💻 Author

**Dinesh Kumar Reddy Dundeti**

**Project:** FinVerse — FinTech Data Analytics & Fraud Detection
