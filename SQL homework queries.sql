-- Query 1: List the following details of each employee
SELECT
	e.emp_no
	,last_name
	,first_name
	,gender
	,salary	
FROM
	salaries s 
INNER JOIN employees e ON e.emp_no = s.emp_no；


-- Query 2: List employees who were hired in 1986
SELECT
	*
FROM
	employees
WHERE
	employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986'；
	

-- Query 3: List the manager of each department with the following information
SELECT
	dm.dept_no
	,dept_name
	,dm.emp_no
	,last_name
	,first_name
	,dm.from_date
	,dm.to_date
FROM
	dept_manager dm	
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no；


-- Query 4: List the department of each employee with the following information
SELECT
	dm.emp_no
	,last_name
	,first_name
	,dept_name
FROM
	dept_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no； 


-- Query 5: List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
	*
FROM
	employees e
WHERE
	e.first_name = 'Hercules' AND e.last_name ILIKE 'B%'；
	

-- Query 6: List all employees in the Sales department
SELECT
	de.emp_no
	,last_name
	,first_name
	,dept_name
FROM
	dept_emp de
INNER JOIN departments d ON d.dept_no = de.dept_no
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE
	de.dept_no = 'd007'；
	

-- Query 7: List all employees in the Sales and Development departments
SELECT
	de.emp_no
	,last_name
	,first_name
	,dept_name
FROM
	dept_emp de
INNER JOIN departments d ON d.dept_no = de.dept_no
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE
	de.dept_no = 'd007' OR de.dept_no = 'd005'；
	

-- Query 8: List the frequency count of employee last names
SELECT
	last_name
	,COUNT(last_name)
FROM
	employees
GROUP BY
	last_name 
ORDER BY COUNT(last_name) DESC；