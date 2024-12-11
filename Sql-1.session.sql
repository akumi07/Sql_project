-- Drop the table if it exists
DROP TABLE IF EXISTS retail_sales;

-- Create the table retail_sales
CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,    
    sale_date DATE,     
    sale_time TIME,    
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),    
    quantity INT,
    price_per_unit FLOAT,    
    cogs FLOAT,
    total_sale FLOAT
);

-- Select the first 10 rows from retail_sales (will return nothing initially as table is empty)
SELECT * FROM retail_sales
LIMIT 10;

-- Query to check if there are any NULL values in any row of the table
SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) as unique_customers FROM retail_sales

SELECT COUNT(DISTINCT category) as unique_customers FROM retail_sales

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

Select * from retail_sales
where sale_date='2022-11-05'

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity >= 4;


select category , Sum(total_sale)as net_sale
from retail_sales
GROUP BY category


select AVG(age) as age
from retail_sales
where category = 'Beauty';


select *
from retail_sales
where total_sale>=1000

select category,
        gender,
        COUNT(*) as no_of_transsaction
from retail_sales
GROUP BY category,gender;

SELECT 
       *
FROM 
(    
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS `rank`
    FROM retail_sales
    GROUP BY year, month
) AS t1
WHERE `rank` = 1;

SELECT customer_id,
       SUM(total_sale) AS st
FROM retail_sales
GROUP BY customer_id
ORDER BY st DESC
LIMIT 5;





