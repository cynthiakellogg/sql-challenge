--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM salaries
JOIN employees ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986. WILDCARD needed
SELECT 
	last_name,
	first_name,
	hire_date
FROM employees
WHERE hire_date LIKE '%86';

--manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	employees.last_name,
	employees.first_name,
	department_manager.emp_no,
	department_manager.dept_no,
	departments.dept_name
FROM employees
JOIN department_manager 
ON employees.emp_no = department_manager.emp_no 
JOIN departments
ON department_manager.dept_no = departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	departments.dept_name,
	employees.last_name,
	employees.first_name,
	dept_employee.emp_no
FROM employees
JOIN dept_employee
ON employees.emp_no = dept_employee.emp_no
JOIN departments
ON departments.dept_no = dept_employee.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	employees.first_name, 
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.last_name  LIKE 'B%' AND employees.first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_employee 
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employee.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_employee 
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employee.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;