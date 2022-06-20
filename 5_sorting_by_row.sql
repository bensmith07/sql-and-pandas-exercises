-- use the employees database.

use employees;

-- Find all current or previous employees with 
-- first names 'Irena', 'Vidya', or 'Maya'. 
-- order results by first name

SELECT * 
  FROM employees
  WHERE first_name IN ('Irena', 'Vidya', 'Maya')
  ORDER BY first_name;

-- Find all current or previous employees with first 
-- names 'Irena', 'Vidya', or 'Maya', order results by
-- first name then last name. 

SELECT * 
  FROM employees 
  WHERE first_name = 'Irena'
    OR  first_name = 'Vidya'
    OR  first_name = 'Maya'
  ORDER BY first_name, last_name;

-- Find all current or previous employees with first 
-- names 'Irena', 'Vidya', or 'Maya', using OR, and who 
-- is male. order results by last name then first name. 

SELECT * 
  FROM employees 
  WHERE (
         first_name = 'Irena'
         OR  first_name = 'Vidya'
         OR  first_name = 'Maya'
        )
    AND gender = 'M'
  ORDER BY last_name, first_name;


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
-- whose last name starts and ends with 'E'
-- sort results by employee number. 

SELECT *
  FROM employees
  WHERE last_name LIKE 'E%e'
  ORDER BY emp_no;

-- Find all current or previous employees employees 
-- whose last name starts and ends with 'E'
-- sort results by hire date 

SELECT *
  FROM employees
  WHERE last_name LIKE 'E%e'
  ORDER BY hire_date DESC;

-- Find all current or previous employees born on Christmas.

SELECT *
  FROM employees 
  WHERE birth_date LIKE '%-12-25';

-- Find all current or previous employees hired in the 
-- 90s and born on Christmas.

SELECT *
  FROM employees
  WHERE hire_date LIKE '199%'
    AND birth_date LIKE '%-12-25'
  ORDER BY hire_date DESC, birth_date ASC;

