# Online Bookstore SQL Analysis

## Overview
PostgreSQL analysis of an online bookstore. The project builds tables for Books, Customers, and Orders using CSV files, then runs 25+ queries to extract insights on sales, customers, and inventory.

## Tech and Skills
- PostgreSQL (pgAdmin 4)
- SQL Joins, GROUP BY, HAVING, DISTINCT
- Aggregations, ORDER BY, LIMIT
- LEFT JOIN and COALESCE for stock calculations

## Schema
**Books** – Book_ID, Title, Author, Genre, Published_Year, Price, Stock  
**Customers** – Customer_ID, Name, Email, Phone, City, Country  
**Orders** – Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

## How to Run
1. Create the database in psql or pgAdmin:
   ```sql
   CREATE DATABASE OnlineBookstore;
   \c OnlineBookstore;
   ```
2. Create tables using the file `01_setup.sql`.
3. Import the three CSV files (Books, Customers, Orders) into their tables using pgAdmin Import or the COPY command.
   ```sql
   COPY Books(Title, Author, Genre, Published_Year, Price, Stock)
   FROM 'path/books.csv' CSV HEADER;
   ```
4. Run the analysis queries:
   - `02_basics.sql` for basic filters and summaries
   - `03_advanced.sql` for joins and grouped KPIs

## Key Questions Answered
- What is the total revenue generated from all orders?
- Which book is ordered most frequently?
- Who are the repeat customers (2+ orders)?
- What are the top 3 most expensive Fantasy books?
- Which books are running low on stock?
- Which cities have customers who spent more than $30?

## Example Insights
- **Total Revenue:** Calculated using SUM(total_amount)
- **Top Book:** Identified with grouped order counts
- **Remaining Stock:** Derived using LEFT JOIN + COALESCE

## File Structure
```
online-bookstore-sql-analysis/
│
├── 01_setup.sql
├── 02_basics.sql
├── 03_advanced.sql
├── data/
│   ├── books.csv
│   ├── customers.csv
│   └── orders.csv
└── README.md
```

## Tags
PostgreSQL | SQL | Data Analysis | Data Analytics | Joins | Business Insights

## Contact
📫 Connect with me on LinkedIn: [linkedin.com/in/yourusername](https://www.linkedin.com/in/umer-khursheed-ba730921b)
