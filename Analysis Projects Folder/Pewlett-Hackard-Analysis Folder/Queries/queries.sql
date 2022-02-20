SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager; 
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Determine Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
		
-- Count the Queries
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- left join
SELECT first_name, last_name, title
FROM employees AS e
LEFT JOIN titles AS t ON e.emp_no = t.emp_no

-- Recreate the retirement_info Table with the emp_no Column
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info

-- Use Different Types of Joins
-- INNER JOIN (simply join): will return matching data from two tables
SELECT d.dept_no, d.dept_name, m.emp_no
FROM departments AS d
INNER JOIN dept_manager AS m ON d.dept_no = m.dept_no

-- LEFT JOIN (left outer join): will take all of the data from Table 1 and only the matching data from Table 2
SELECT d.dept_no, d.dept_name, m.emp_no
FROM departments AS d
LEFT JOIN dept_manager AS m ON d.dept_no = m.dept_no

-- RIGHT JOIN (right outer join) is the inverse of a left join. A right join takes all of the data from Table 2 and only the matching data from Table 1.
SELECT d.dept_no, d.dept_name, m.emp_no
FROM departments AS d
RIGHT JOIN dept_manager AS m ON d.dept_no = m.dept_no

-- Full Outer Join: is a comprehensive join that combines all data from both tables.
SELECT d.dept_no, d.dept_name, m.emp_no
FROM departments AS d
FULL OUTER JOIN dept_manager AS m ON d.dept_no = m.dept_no

-- Use Inner Join for Departments and dept-manager Tables
SELECT d.dept_name, 
	m.emp_no,
	m.from_date,
	m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m ON d.dept_no = m.dept_no

-- Use Left Join to Capture retirement-info Table
-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp ON retirement_info.emp_no = dept_emp.emp_no;

-- Use Aliases for Code Readability. 
-- An alias in SQL allows developers to give nicknames to tables. 
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de ON ri.emp_no = de.emp_no;

SELECT d.dept_name, 
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm ON d.dept_no = dm.dept_no

-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Use Count, Group By, and Order By
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_emp_bydept
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Create Additional Lists
-- List 1: Employee Information
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, 
	first_name, 
	last_name,
	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM emp_info;
DROP TABLE emp_info;
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

-- List 2: Management
-- tables: Departments, Managers, and Employees.

-- List of managers per department

SELECT dm.dept_no, 
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments AS d ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp AS ce ON (dm.emp_no = ce.emp_no);

-- List 3: Department Retirees
-- We'll use inner joins on the current_emp, departments, and dept_emp to include the lis
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
 INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no);

-- 1. What's going on with the salaries?
-- 2. Why are there only five active managers for nine departments?
-- 3. Why are some employees appearing twice?

--
SELECT * FROM departments;
SELECT * FROM current_emp;

-- List: Sales team
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO dept_sales
FROM current_emp as ce
INNER JOIN dept_emp AS de ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- List: Sales team
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO dept_salesDev
FROM current_emp as ce
INNER JOIN dept_emp AS de ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');
--WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';