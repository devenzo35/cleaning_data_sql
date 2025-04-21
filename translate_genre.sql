-- Select the genre column and translate its values using a CASE statement
-- 'hombre' is translated to 'man', 'mujer' is translated to 'woman', and other values are set to NULL
SELECT 
    genre, 
    CASE 
        WHEN genre = 'hombre' THEN 'man' -- Translate 'hombre' to 'man'
        WHEN genre = 'mujer' THEN 'woman' -- Translate 'mujer' to 'woman'
        ELSE NULL -- Set other values to NULL
    END AS translated_genre
FROM 
    employees
GROUP BY 
    genre; -- Group by genre to avoid duplicate rows in the result and prove the translation is correct

-- Update the genre column in the employees table to replace its values
-- 'hombre' is updated to 'man', 'mujer' is updated to 'woman', and other values are set to NULL
UPDATE 
    employees 
SET 
    genre = CASE 
        WHEN genre = 'hombre' THEN 'man' -- Update 'hombre' to 'man'
        WHEN genre = 'mujer' THEN 'woman' -- Update 'mujer' to 'woman'
        ELSE NULL -- Set other values to NULL
    END;