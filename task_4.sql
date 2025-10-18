-- task_4.sql
-- Task 4: Print the full description of the table 'Books' without using DESCRIBE or EXPLAIN
-- Filters explicitly on the alx_book_store database

SELECT 
    COLUMN_NAME AS 'Column',
    COLUMN_TYPE AS 'Type',
    IS_NULLABLE AS 'Null',
    COLUMN_KEY AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store'
    AND TABLE_NAME = 'Books'
ORDER BY 
    ORDINAL_POSITION;
