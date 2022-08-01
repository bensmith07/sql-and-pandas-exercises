-- Write a query that returns all employees, 
-- their department number, their start date, 
-- their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company 
-- and 0 if not.

SELECT e.emp_no
       , e.hire_date
       , s.to_date AS end_date
       , CASE s.to_date
           WHEN '9999-01-01' THEN 1
           ELSE 0
           END AS is_current_employee
  FROM employees e
    JOIN salaries s USING(emp_no)
;

/*/ Write a query that returns all employee names 
(previous and current), and a new column 'alpha_group' 
that returns 'A-H', 'I-Q', or 'R-Z' depending on the 
first letter of their last name. /*/

SELECT emp_no
       , last_name
       , first_name
       , CASE 
           WHEN last_name < 'I' THEN 'A-H'
           WHEN last_name < 'R' THEN 'I-Q'
           ELSE 'R-Z'
           END AS alpha_group
  FROM employees
  ;

-- How many employees (current or previous) were 
-- born in each decade?

WITH t AS (
            SELECT emp_no
                   , birth_date
                   , CASE 
                       WHEN birth_date LIKE '195%' THEN '50s'
                       WHEN birth_date LIKE '196%' THEN '60s'
                       ELSE 'other'
                       END AS birth_decade
              FROM employees
          )
  SELECT birth_decade
         , COUNT(*)
    FROM t
    GROUP BY birth_decade
    
  ;

    