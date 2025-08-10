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

-- Data Exploration

-- How many sales we have?
	SELECT COUNT(*) as Total_Sales 
	FROM RetailSales;

-- How many customers we have?
	SELECT COUNT(DISTINCT customer_id) as Total_Customers 
	FROM RetailSales;

-- How many categories we have?
	SELECT COUNT(DISTINCT category) as Total_Category 
	FROM RetailSales;

-- Display the 3 categories
	SELECT DISTINCT Category
	FROM RetailSales;

--What is the total sales
	SELECT SUM(total_sale) AS Total_Sales
	FROM RetailSales;

--What is Max, Min & Average of sales
	SELECT 
		MAX(total_sale) AS Max_Sales,
		MIN(total_sale) AS Min_Sales,
		AVG(total_sale) AS Avg_Sales
	FROM RetailSales;

-- Write a query to retrive all columns for sales made on '05-11-2022'	
	SELECT *
	FROM RetailSales
	WHERE sale_date = '05-11-2022';

--What is Max, Min & Average of quantiy?
	SELECT 
		MAX(quantiy) AS Max_quantiy,
		MIN(quantiy) AS Min_quantiy,
		ROUND(AVG(quantiy),2) AS Avg_quantiy
	FROM RetailSales;
	
-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
	SELECT 	*
	FROM RetailSales
	WHERE category = 'Clothing'
		AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
		AND quantiy >= 4;

-- Write a SQL query to retrieve the total number of transactions where the category is 'Clothing' and the quantity sold is equal or more than 4 in the month of Nov-2022:

 SELECT 	
 	COUNT(*)
	FROM RetailSales
	WHERE category = 'Clothing'
	AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
	AND quantiy >= 4;

--Write a SQL query to calculate the total sales (total_sale) for each category and total orders:
SELECT 
	Category,
	SUM(total_sale) AS Net_Sales,
	COUNT(*) AS Total_orders
	FROM RetailSales
	GROUP BY Category;

--Write a SQL query to find the average age of customers who purchased items from the each category.:
 SELECT 
 	Category,
 	ROUND(AVG(age),2) AS Avg_age
	FROM RetailSales
	GROUP BY Category;

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
 SELECT 
 	Category,
 	ROUND(AVG(age),2) AS Avg_age
	FROM RetailSales
	WHERE category = 'Beauty'
	GROUP BY Category;

--Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT *
	FROM RetailSales
	WHERE total_sale > 1000;


--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
SELECT  Category,
		gender,
		COUNT(transactions_id) AS Total_Transactions
		FROM RetailSales
		GROUP BY 
			Category,
			gender
		ORDER BY Category;

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT	
		EXTRACT(YEAR FROM sale_date) AS SaleYear,
		EXTRACT(MONTH FROM sale_date) AS SaleMonth,
		AVG(total_sale) AS Avg_sale
	FROM RetailSales
	GROUP BY 1, 2
	ORDER BY 3 DESC;

SELECT *
	FROM RetailSales;