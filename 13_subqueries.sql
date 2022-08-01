
-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT emp_no
  FROM employees e
      JOIN dept_emp de USING(emp_no)
   WHERE e.hire_date = (
   							SELECT hire_date
   							  FROM employees
   							   WHERE emp_no = '101010'
   						   )
   	AND de.to_date > NOW()
;

-- Find all the titles ever held by all current employees with the first name Aamod.

SELECT DISTINCT t.title
  FROM titles t
   WHERE emp_no IN (
                    SELECT emp_no 
                    FROM employees	
                    WHERE first_name = 'Aamod'
                      AND emp_no IN (
                                     SELECT emp_no 
                                       FROM dept_emp
                                       WHERE to_date > NOW()												   )
   							         )
;

-- How many people in the employees table are no longer working for the company? 

SELECT COUNT(emp_no)
  FROM employees
  WHERE emp_no IN (
                   SELECT emp_no
                     FROM dept_emp
                     WHERE to_date != '9999-01-01'
                   )
;

-- Find all the current department managers that are female. List their names in a comment in your code.

SELECT CONCAT(last_name, ', ', first_name)
  FROM employees
  WHERE gender = 'F'
    AND emp_no IN (
                   SELECT emp_no
                     FROM dept_manager
                     WHERE to_date > NOW()
                   )
;

-- Find all the employees who currently have a higher salary than the company's overall, historical average salary.

SELECT emp_no
  FROM employees 
  WHERE emp_no IN (
                   SELECT emp_no 
                     FROM salaries
                     WHERE salary > (
                                     SELECT AVG(salary)
                                       FROM salaries
                                    )
                 )

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 

SELECT COUNT(salary) 
  FROM salaries 
  WHERE to_date > NOW()
AND salary > (   
                (SELECT MAX(salary) FROM salaries) 
              - (SELECT STDDEV(salary) FROM salaries)
             )
;
-- What percentage of all salaries is this?

SELECT (
           (
            SELECT COUNT(salary) 
            FROM salaries 
            WHERE to_date > NOW()
            AND salary > (   
                            (SELECT MAX(salary) FROM salaries) 
                          - (SELECT STDDEV(salary) FROM salaries)
                         )
           )
        / 
           (
            SELECT COUNT(salary) 
            FROM salaries
            WHERE to_date > NOW()
           )
       )
;