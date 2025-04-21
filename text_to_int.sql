-- Select salaries and format them as decimal values
SELECT 
    salary,
    CAST(trim(REPLACE(REPLACE(salary, '$', ''), ',', '')) AS decimal(15,2)) AS format_salary
FROM employees
WHERE trim(salary) ~ '^\$?[0-9,]+(\.[0-9]{2})?$'; -- Ensure salary matches the valid format

-- Delete rows where the salary does not match the valid format
DELETE FROM employees
WHERE trim(salary) !~ '^\$?[0-9,]+(\.[0-9]{2})?$';

-- Update the salary column to store the formatted decimal value
UPDATE employees 
SET salary = CAST(trim(REPLACE(REPLACE(salary, '$', ''), ',', '')) AS decimal(15,2))
WHERE trim(salary) ~ '^\$?[0-9,]+(\.[0-9]{2})?$'; -- Ensure only valid salaries are updated