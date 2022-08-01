-- use the employees database.

use employees;

-- Find all current or previous employees with 
-- first names 'Irena', 'Vidya', or 'Maya' using IN. 

SELECT * 
  FROM employees
  WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- Find all current or previous employees with first 
-- names 'Irena', 'Vidya', or 'Maya', as in Q2, but use 
-- OR instead of IN. 

SELECT * 
  FROM employees 
  WHERE first_name = 'Irena'
    OR  first_name = 'Vidya'
    OR  first_name = 'Maya';

-- Find all current or previous employees with first 
-- names 'Irena', 'Vidya', or 'Maya', using OR, and who 
-- is male. 

SELECT * 
  FROM employees 
  WHERE (
         first_name = 'Irena'
         OR  first_name = 'Vidya'
         OR  first_name = 'Maya'
        )
    AND gender = 'M';


-- Find all current or previous employees whose last 
-- name starts with 'E'. 

SELECT * 
  FROM employees
  WHERE last_name LIKE 'E%';

-- Find all current or previous employees whose last 
-- name starts or ends with 'E'.

SELECT * 
  FROM employees
  WHERE last_name LIKE 'E%'
     OR last_name LIKE '%e';

-- Find all current or previous employees employees 
-- whose last name starts and ends with 'E'. 

SELECT *
  FROM employees
  WHERE last_name LIKE 'E%e';

-- Find all current or previous employees hired in the 90s.

SELECT *
  FROM employees
  WHERE hire_date LIKE '199%';

-- Find all current or previous employees born on Christmas.

SELECT *
  FROM employees 
  WHERE birth_date LIKE '%-12-25';

-- Find all current or previous employees hired in the 
-- 90s and born on Christmas.

SELECT *
  FROM employees
  WHERE hire_date LIKE '199%'
    AND birth_date LIKE '%-12-25';

-- Find all current or previous employees with a 'q' in their last name. 

SELECT * 
  FROM employees
  WHERE last_name LIKE 'Q%'
     OR last_name LIKE '%q%';

-- Find all current or previous employees with a 'q' in their last 
-- name but not 'qu'. 

SELECT *
  FROM employees
  WHERE (
         last_name LIKE 'Q%'
         OR last_name LIKE '%q%'
        )
    AND last_name NOT LIKE 'Qu%'
    AND last_name NOT LIKE '%qu%';