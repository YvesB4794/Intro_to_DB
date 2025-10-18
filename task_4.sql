-- task_4.sql
-- Script to print the full description of the table 'Books' without using DESCRIBE or EXPLAIN

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
    TABLE_SCHEMA = DATABASE()   -- Uses the database passed via MySQL command line
    AND TABLE_NAME = 'Books'    -- Matches your Books table
ORDER BY 
    ORDINAL_POSITION;
