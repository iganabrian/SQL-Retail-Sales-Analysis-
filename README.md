# SQL-Retail-Sales-Analysis-

## Project Overview

**Project Title**: Retail Sales Analysis  

I design project to clean, explore and analyze retail sales data. The project involves setting up a retail sales database, cleaning, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. 

## Objectives

1. Set up a retail sales database;
2. Data Cleaning;
3. Exploratory Data Analysis (EDA);
4. Business Analysis.

## Project Structure

### 1. Database Setup

- **Database Creation**: I started by creating a database named `Retail_Sales_Analysis_DB`.
- **Table Creation**: I then created a table named `Retailsales` to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount. *I had to change the date format in excel firts before importing the dataset*

```sql
--Create a table named RetailSales

CREATE TABLE RetailSales (
				transactions_id INT PRIMARY KEY,
				sale_date DATE,
				sale_time TIME,
				customer_id	INT,
				gender VARCHAR(15),
				age INT,
				category VARCHAR(25),
				quantiy INT,
				price_per_unit FLOAT,
				cogs FLOAT,	
				total_sale FLOAT
);
```

### 2. Data Importing Exploration and Cleaning
- **Import Dataset**: Imported the dataset into PostgreSQL;
- **Display only 10 transactions** from the imported dataset;
- **Record Count**: Determine the total number of records in the dataset;
- **Null Value Check**: I Checked for any null values in the dataset and deleted records with missing data.

```sql
--Import data 

--Display only 10 transactions from the imported dataset
SELECT * 
FROM RetailSales
LIMIT 10;

--Count the total number of recored imported from the dataset
SELECT 
COUNT(*)
FROM RetailSales;

-- Data cleaning
SELECT *
FROM RetailSales
WHERE
	transactions_id	IS NULL 
	OR 
	sale_date IS NULL
	OR 
	sale_time	IS NULL
	OR 	
	customer_id	IS NULL
	OR 	
	gender	IS NULL
	OR 	
	age	IS NULL
	OR 	
	category	IS NULL
	OR 	
	quantiy	IS NULL
	OR 	
	price_per_unit	IS NULL
	OR 	
	cogs	IS NULL
	OR 	
	total_sale IS NULL;

-- Delete Null values
DELETE FROM RetailSales
WHERE
	transactions_id	IS NULL 
	OR 
	sale_date IS NULL
	OR 
	sale_time	IS NULL
	OR 	
	customer_id	IS NULL
	OR 	
	gender	IS NULL
	OR 	
	age	IS NULL
	OR 	
	category	IS NULL
	OR 	
	quantiy	IS NULL
	OR 	
	price_per_unit	IS NULL
	OR 	
	cogs	IS NULL
	OR 	
	total_sale IS NULL;
```

### 3. Data Exploration, Analysis & Findings

**The following SQL queries were developed to answer specific business questions:**

-- Data Exploration

-- How many sales we have?
```sql
  SELECT COUNT(*) as Total_Sales 
	FROM RetailSales;
```
-- How many customers we have?
```sql
	SELECT COUNT(DISTINCT customer_id) as Total_Customers 
	FROM RetailSales;
```
-- How many categories we have?
```sql
  SELECT COUNT(DISTINCT category) as Total_Category 
	FROM RetailSales;
```
-- Display the 3 categories
```sql
 SELECT DISTINCT Category
	FROM RetailSales;
```
--What is the total sales
```sql
  SELECT SUM(total_sale) AS Total_Sales
	FROM RetailSales;
```
--What is Max, Min & Average of sales
```sql	
 SELECT 
		MAX(total_sale) AS Max_Sales,
		MIN(total_sale) AS Min_Sales,
		AVG(total_sale) AS Avg_Sales
	FROM RetailSales;
```
-- Wrote a query to retrive all columns for sales made on '05-11-2022'	
```sql
 SELECT *
	FROM RetailSales
	WHERE sale_date = '05-11-2022';
```
--What is Max, Min & Average of quantiy?
```sql
 SELECT 
		MAX(quantiy) AS Max_quantiy,
		MIN(quantiy) AS Min_quantiy,
		ROUND(AVG(quantiy),2) AS Avg_quantiy
	FROM RetailSales;
```
-- Wrote a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is equal or more than 4 in the month of Nov-2022:
```sql
 SELECT 	*
	FROM RetailSales
	WHERE category = 'Clothing'
		AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
		AND quantiy >= 4;
```
-- Wrote a SQL query to retrieve the total number of transactions where the category is 'Clothing' and the quantity sold is equal or more than 4 in the month of Nov-2022:
```sql
 SELECT 	
 	COUNT(*)
	FROM RetailSales
	WHERE category = 'Clothing'
	AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
	AND quantiy >= 4;
```
--Wrote a SQL query to calculate the total sales (total_sale) for each category and total orders:
```sql
SELECT 
	Category,
	SUM(total_sale) AS Net_Sales,
	COUNT(*) AS Total_orders
	FROM RetailSales
	GROUP BY Category;
```
--Wrote a SQL query to find the average age of customers who purchased items from the each category.:
 ```sql
 SELECT 
 	Category,
 	ROUND(AVG(age),2) AS Avg_age
	FROM RetailSales
	GROUP BY Category;
```
--Wrote a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
 ```sql
 SELECT 
 	Category,
 	ROUND(AVG(age),2) AS Avg_age
	FROM RetailSales
	WHERE category = 'Beauty'
	GROUP BY Category;
```
--Wrote a SQL query to find all transactions where the total_sale is greater than 1000
```sql
SELECT *
	FROM RetailSales
	WHERE total_sale > 1000;
```

--Wrote a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
```sql
SELECT  Category,
		gender,
		COUNT(transactions_id) AS Total_Transactions
		FROM RetailSales
		GROUP BY 
			Category,
			gender
		ORDER BY Category;
```
--Wrote a SQL query to calculate the average sale for each month. Find out best selling month in each year:
```sql
SELECT	
		EXTRACT(YEAR FROM sale_date) AS SaleYear,
		EXTRACT(MONTH FROM sale_date) AS SaleMonth,
		AVG(total_sale) AS Avg_sale
	FROM RetailSales
	GROUP BY 1, 2
	ORDER BY 3 DESC;
```
--END OF PROJECT

## Project Findings After Data Cleaning and Analysis

--**There is a total of `1,987` sales**

--**There are `155` Customers**

--**There are `3` categories**

--**The 3 `Categories are: Electronics, Clothing & Beauty`**

--**The Total Sales `908,230`**

--**The Max Sales `2000`, Min Sales `25` Avg Sales `457.09`**

- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
  
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.

## Conclusion

This project used SQL Skillset for data analysts, database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior by age and gender, and product performance.

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles.
