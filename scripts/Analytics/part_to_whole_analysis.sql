/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To measure the contribution of each category to total sales.
    - To calculate percentage of total revenue.
    - To understand which categories drive the business.
    - To practice window functions for overall totals.

Tables Used:
    - gold.fact_sales
    - gold.dim_products

Description:
    This script performs part-to-whole analysis by calculating total sales
    for each product category and comparing it to the overall sales. It also
    computes the percentage contribution of each category to the total
    revenue. This type of analysis is commonly used in dashboards and
    business reports to identify the most important revenue sources.

===============================================================================
*/

-- Which categories contribute the most to overall sales?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
