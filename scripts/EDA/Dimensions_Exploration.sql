/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the content of dimension tables.
    - To identify unique values stored in key attributes.
    - To understand available categories for analysis.

Tables Used:
    - gold.dim_customers
    - gold.dim_products

Description:
    This script explores dimension tables by retrieving distinct values
    such as customer countries and product categories. This helps in
    understanding how data is organized and what attributes can be used
    for filtering, grouping, and reporting.

===============================================================================
*/


-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
