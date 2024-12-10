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
