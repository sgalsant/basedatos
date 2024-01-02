use northwind;

SELECT 
    first_name, last_name, job_title, city
FROM
    employees

INTO OUTFILE '/content/mysqlfiles/employees.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';
