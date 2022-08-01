-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? 

SELECT DISTINCT title
  FROM titles;

-- Write a query to to find a list of all unique last 
-- names of all employees that start and end with 'E'
-- using GROUP BY.

SELECT last_name
  FROM employees
  WHERE last_name LIKE 'E%e'
  GROUP BY last_name;

-- Write a query to to find all unique combinations of 
-- first and last names of all employees whose last 
-- names start and end with 'E'.

SELECT first_name, last_name
  FROM employees
  WHERE last_name LIKE 'E%E'
  GROUP BY first_name, last_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT last_name
  FROM employees 
  WHERE LOWER(last_name) LIKE '%q%'
    AND LOWER(last_name) NOT LIKE '%qu%';

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, COUNT(*)  FROM employees 
  WHERE LOWER(last_name) LIKE '%q%'
    AND LOWER(last_name) NOT LIKE '%qu%'
    GROUP BY last_name;
    
-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT gender, COUNT(*)
  FROM employees
  WHERE last_name IN ('Irena', 'Vidya', 'Maya')
  GROUP BY gender;

-- Bonus: More practice with aggregate functions:

--     Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.

SELECT emp_no, AVG(salary)
  FROM salaries
  GROUP BY emp_no;

--     Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.

SELECT dept_no, COUNT(*)
  FROM dept_emp
  WHERE to_date > NOW()
  GROUP BY dept_no;

--     Determine how many different salaries each employee has had. This includes both historic and current.

SELECT emp_no, COUNT(salary)
  FROM salaries
  GROUP BY emp_no;

--     Find the maximum salary for each employee.

SELECT emp_no, MAX(salary)
  FROM salaries
  GROUP BY emp_no;

--     Find the minimum salary for each employee.

SELECT emp_no, MIN(salary)
  FROM salaries
  GROUP BY emp_no;

--     Find the standard deviation of salaries for each employee.

SELECT emp_no, STDDEV(salary)
  FROM salaries
  GROUP BY emp_no;

--     Now find the max salary for each employee where that max salary is greater than $150,000.

SELECT emp_no, MAX(salary)
  FROM salaries
  GROUP BY emp_no
  HAVING MAX(salary) > 150000;

--     Find the average salary for each employee where that average salary is between $80k and $90k.

SELECT emp_no, AVG(salary)
  FROM salaries
  GROUP BY emp_no
  HAVING AVG(salary) BETWEEN 80000 and 90000;