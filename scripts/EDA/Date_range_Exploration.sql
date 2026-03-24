/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
    - To analyze the time coverage of the dataset.
    - To identify the earliest and latest order dates.
    - To calculate the total time span of sales data.
    - To determine the age range of customers.

Tables Used:
    - gold.fact_sales
    - gold.dim_customers

Description:
    This script checks the temporal boundaries of the data by finding the
    first and last order dates and calculating the total duration of the
    dataset in months. It also analyzes customer birthdates to determine
    the age range of customers in the database.

===============================================================================
*/

-- Determine the first and last order date and the total duration in months
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

-- Find the youngest and oldest customer based on birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
