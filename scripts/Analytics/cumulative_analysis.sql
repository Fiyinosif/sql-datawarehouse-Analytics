/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals over time.
    - To analyze cumulative sales performance.
    - To compute moving averages for trend analysis.
    - To practice window functions using OVER().

Tables Used:
    - gold.fact_sales

Description:
    This script performs cumulative analysis by calculating total sales per
    period and generating a running total using window functions. It also
    computes moving averages to help identify trends over time. This type of
    analysis is commonly used in financial reports, dashboards, and business
    performance tracking.

===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 
SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t
