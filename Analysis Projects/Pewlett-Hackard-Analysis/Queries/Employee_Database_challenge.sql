-- determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.
-- Deliverable 1: The Number of Retiring Employees by Title
SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS emp
LEFT JOIN titles ti ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY emp.emp_no;

SELECT * FROM retirement_titles; 

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;  

-- Create a Retiring Titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;  


-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp.emp_no) emp.emp_no , 
	emp.first_name, 
	emp.last_name,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS emp
LEFT JOIN dept_emp AS de ON (emp.emp_no = de.emp_no)
LEFT JOIN titles AS ti ON (emp.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' 
	AND (emp.birth_date BETWEEN '1965-01-01'AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty


