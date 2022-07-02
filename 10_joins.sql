USE employees;

-- Using the example in the Associative Table Joins section as a guide,
-- write a query that shows each department along with the name of the 
-- current manager for that department.

SELECT d.dept_name,
       e.last_name,
            e.first_name
  FROM departments d
      JOIN dept_manager dm USING(dept_no)
        JOIN employees e USING(emp_no)
       WHERE dm.to_date > NOW();

-- Find the name of all departments currently managed by women.

SELECT d.dept_name, e.last_name, e.first_name, e.gender
  FROM departments d
      JOIN dept_manager dm USING(dept_no)
         JOIN employees e USING(emp_no)
      WHERE e.gender = 'F'
        AND dm.to_date > NOW();

-- find the current title of employees currently working in the customer service department

SELECT e.emp_no, t.title
  FROM titles t
     JOIN employees e USING(emp_no)
       JOIN dept_emp de USING(emp_no)
        JOIN departments d USING(dept_no)
  WHERE d.dept_name = 'Customer Service'
     AND de.to_date > NOW();

-- find the current salary of all current managers

SELECT d.dept_name, e.emp_no, s.salary
  FROM departments d
     JOIN dept_manager dm USING(dept_no)
       JOIN employees e USING(emp_no)
        JOIN salaries s USING(emp_no)
      WHERE s.to_date > NOW()
        AND dm.to_date > NOW();

-- Find the number of current employees in each department.

SELECT d.dept_name, COUNT(de.emp_no)
  FROM departments d
      JOIN dept_emp de USING(dept_no)
      WHERE de.to_date > NOW()
      GROUP BY d.dept_name;
       
-- Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name
  FROM (
        SELECT d.dept_name, AVG(s.salary) as avg_salary
        FROM departments d
            JOIN dept_emp de USING(dept_no)
                JOIN employees e USING (emp_no)
                JOIN salaries s USING (emp_no)
            WHERE s.to_date > NOW()
            GROUP BY d.dept_name
            ORDER BY avg_salary DESC
            LIMIT 1
        ) t
;

-- Who is the highest paid employee in the marketing department

SELECT CONCAT(last_name, ', ', first_name) FROM (
SELECT e.last_name, e.first_name, s.salary
  FROM departments d
      JOIN dept_emp de USING(dept_no)
        JOIN employees e USING(emp_no)
          JOIN salaries s USING(emp_no)
     WHERE d.dept_name = 'Marketing'
       AND de.to_date > NOW()
  ORDER BY s.salary DESC
   LIMIT 1
   ) T
;

SELECT CONCAT(e.last_name, ', ', e.first_name)
  FROM departments d
      JOIN dept_emp de USING(dept_no)
        JOIN employees e USING(emp_no)
          JOIN salaries s USING(emp_no)
     WHERE d.dept_name = 'Marketing'
       AND de.to_date > NOW()
        AND s.salary = (
                        SELECT MAX(s.salary) as max_salary
                                FROM departments d
                                JOIN dept_emp de USING(dept_no)
                                JOIN employees e USING(emp_no)
                            JOIN salaries s USING(emp_no)
                            WHERE d.dept_name = 'Marketing'
                                AND de.to_date > NOW()
        			   ) 
;

-- Which current department manager has the highest salary?

SELECT CONCAT(e.last_name, ', ', e.first_name)
  FROM dept_manager dm
     JOIN employees e USING(emp_no)
       JOIN salaries s USING(emp_no)
     WHERE dm.to_date > NOW()
       AND s.salary = (
     							SELECT MAX(s.salary)
     							  FROM dept_manager dm
     								JOIN employees e USING(emp_no)
       								JOIN salaries s USING(emp_no)
     							WHERE dm.to_date > NOW() 
     							)
;
     							
-- Determine the average salary for each department. Use all salary information and round your results.
    
SELECT d.dept_name, ROUND(AVG(s.salary), 0) as avg_sal
  FROM departments d
      JOIN dept_emp de USING(dept_no)
         JOIN salaries s USING(emp_no)
     GROUP BY d.dept_name
     ORDER BY avg_sal DESC
;




