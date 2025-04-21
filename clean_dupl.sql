-- Getting the count of duplicates based on id_emp using a subquery

SELECT COUNT(duplicate) 
FROM (
    SELECT 
        id_emp, 
        COUNT(*) AS duplicate 
    FROM 
        employees
    GROUP BY 
        id_emp
    HAVING 
        COUNT(*) > 1
) AS sub;