/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database.
    - To list all tables available in the database.
    - To inspect column metadata for a specific table.
    - To understand schemas, data types, and nullability before analysis.

Tables Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS

Description:
    This script retrieves all tables in the database and inspects the columns
    of the dim_customers table. This step is useful for understanding the
    database structure before performing data analysis.

===============================================================================
*/

-- Retrieve a list of all tables in the database
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Retrieve all columns for a specific table (dim_customers)
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
