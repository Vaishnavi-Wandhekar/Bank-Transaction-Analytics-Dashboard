# 💳 Bank Transaction Analytics Dashboard

## 📊 Project Overview

This project analyzes **bank transaction data** to understand transaction patterns, credit and debit activity, branch performance, banking methods, and potential high-risk transactions.

The project follows an end-to-end **Data Analytics workflow** using **Excel, MySQL, and Power BI** to clean, analyze, visualize, and generate insights from transaction data.

---

## 🎯 Project Objectives

* Analyze credit and debit transactions
* Compare total credit and debit amounts
* Analyze transaction trends over time
* Identify high-performing branches
* Analyze transaction volume by bank
* Understand transaction methods
* Identify potentially high-risk transactions
* Analyze account activity
* Build an interactive Power BI dashboard
* Generate meaningful business insights

---

## 🛠️ Tools & Technologies

| Tool         | Purpose                                        |
| ------------ | ---------------------------------------------- |
| **Excel**    | Data exploration and initial data cleaning     |
| **MySQL**    | Data cleaning, transformation and SQL analysis |
| **Power BI** | Data modeling, DAX and interactive dashboard   |
| **SQL**      | KPI calculation and business analysis          |

---

## 🔄 Project Workflow

```text
Raw Transaction Data
        ↓
Data Exploration
        ↓
Data Cleaning in Excel
        ↓
Data Import into MySQL
        ↓
SQL Data Analysis
        ↓
Data Transformation
        ↓
Power BI Data Modeling
        ↓
DAX Calculations
        ↓
Dashboard Development
        ↓
Business Insights
```

---

## 🧹 Data Cleaning & Preparation

The transaction dataset was explored and prepared before analysis.

Key activities included:

* Checking data types
* Handling missing values
* Checking duplicate records
* Converting transaction dates into proper date format
* Checking transaction amounts
* Creating calculated fields
* Categorizing transactions
* Creating a risk flag based on transaction amount
* Preparing data for SQL and Power BI analysis

---

## 🗄️ SQL Analysis

MySQL was used to analyze the transaction data and calculate important business metrics.

### Analysis Performed

* Total credit amount
* Total debit amount
* Net transaction amount
* Credit-to-debit ratio
* Transaction count
* Branch-wise transaction amount
* Bank-wise transaction volume
* Transaction method distribution
* Daily transaction analysis
* Weekly transaction analysis
* Monthly transaction analysis
* Risk transaction analysis
* Suspicious transaction frequency

### Example SQL Query

```sql
SELECT 
    `Transaction Type`,
    SUM(Amount) AS Total_Amount,
    COUNT(*) AS Transaction_Count
FROM `debit and credit`
GROUP BY `Transaction Type`;
```

---

## 📌 Key KPIs

The Power BI dashboard includes important KPIs such as:

### 💰 Total Credit Amount

Total amount received through credit transactions.

### 💸 Total Debit Amount

Total amount spent or withdrawn through debit transactions.

### ⚖️ Net Transaction Amount

Difference between total credit and total debit amount.

```text
Net Transaction Amount =
Total Credit Amount - Total Debit Amount
```

### 📊 Credit-to-Debit Ratio

```text
Credit-to-Debit Ratio =
Total Credit Amount / Total Debit Amount
```

### 🏦 Account Activity Ratio

A metric used to understand transaction activity based on the available transaction data.

### 🚩 Risk Flag

Transactions were categorized based on transaction amount.

```text
Amount > 4000 → High Risk
Amount ≤ 4000 → Normal
```

> The risk flag is a project-defined analytical rule and does not represent an actual banking fraud-detection model.

---

## 📈 Power BI Dashboard

The Power BI dashboard provides an interactive view of bank transaction activity.

### Dashboard Visualizations

* KPI Cards
* Credit vs Debit Analysis
* Daily Transaction Trend
* Weekly Transaction Trend
* Monthly Transaction Trend
* Branch-wise Transaction Amount
* Bank-wise Transaction Volume
* Transaction Method Distribution
* Risk Flag Analysis
* Suspicious Transaction Frequency

### Interactive Features

* Slicers
* Filters
* Cross-filtering
* Drill-down
* KPI cards
* Interactive charts

---

## 💡 Key Insights

The analysis helps identify:

* Difference between credit and debit activity
* Transaction patterns over time
* Branches generating higher transaction amounts
* Banks with higher transaction volumes
* Most frequently used transaction methods
* Number of high-risk transactions based on the defined rule
* Changes in transaction activity across different time periods

---

## 📂 Project Structure

```text
Bank-Transaction-Analytics/
│
├── Data/
│   └── bank_transaction_data.csv
│
├── Excel/
│   └── Bank_Transaction_Cleaning.xlsx
│
├── SQL/
│   └── Bank_Transaction_Analysis.sql
│
├── PowerBI/
│   └── Bank_Transaction_Analytics.pbix
│
├── Screenshots/
│   └── Bank_Transaction_Dashboard.png
│
└── README.md
```

---

## 📸 Dashboard Preview

Add your Power BI dashboard screenshot here:

```markdown
![Bank Transaction Analytics Dashboard](Screenshots/Bank_Transaction_Dashboard.png)
```

---

## 🧠 Skills Demonstrated

* Excel
* SQL
* MySQL
* Power BI
* DAX
* Data Cleaning
* Data Transformation
* Data Modeling
* KPI Development
* Data Visualization
* Dashboard Development
* Business Analysis
* Insight Generation

---

## 📌 Project Outcome

This project demonstrates an end-to-end **Data Analyst workflow**, from raw transaction data to data cleaning, SQL analysis, KPI development, Power BI visualization, and business insights.

It demonstrates practical skills in analyzing financial transaction data and presenting the results through an interactive dashboard.

---

## 👩‍💻 Author

**Vaishnavi Wandhekar**

**Data Analyst | SQL | Excel | Power BI | Tableau | Python**
