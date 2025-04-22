-- Select the start_date and format the start_date into 'yyyy-mm-dd' format
-- based on the presence of '/' or '-' in the start_date column.
select 
    start_date, 
    case
        when start_date like '%/%' then to_char(to_date(start_date, 'mm-dd-yyyy'), 'yyyy-mm-dd') -- Handle dates with '/'
        when start_date like '%-%' then to_char(to_date(start_date, 'mm-dd-yyyy'), 'yyyy-mm-dd') -- Handle dates with '-'
        else null -- Set to null if the format doesn't match
    end as formatted_start_date
from 
    employees;

-- Update the start_date column with the formatted start_date values
update employees 
set 
    start_date = case
        when start_date like '%/%' then to_char(to_date(start_date, 'mm-dd-yyyy'), 'yyyy-mm-dd') -- Handle dates with '/'
        when start_date like '%-%' then to_char(to_date(start_date, 'mm-dd-yyyy'), 'yyyy-mm-dd') -- Handle dates with '-'
        else null -- Set to null if the format doesn't match
    end;

-- Alter the start_date column to change its data type to DATE
-- Convert the existing values using the USING clause.
alter table employees 
alter column start_date type date 
USING start_date::date;