-- task_4.sql
-- Script to print the full description of the table 'books' from a given database
-- Do NOT use DESCRIBE or EXPLAIN

SELECT 
    COLUMN_NAME AS 'Column',
    COLUMN_TYPE AS 'Type',
    IS_NULLABLE AS 'Nullable',
    COLUMN_KEY AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'books';

