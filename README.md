# Pewlett-Hackard-Analysis
## Project Overview
Help Bobby to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program

## Resources
- Software: ProsgreSQL, PGAdmin
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv

## Analysis / Results
### Deliverable 1: The Number of Retiring Employees by Title
- List of employees eligible for retirement for employees who are born between January 1, 1952 and December 31, 1955.
  - Use the DISTINCT ON statement to retrieve the most recent title of each employee

| query | unique_titles (csv file) |
| --- | --- |
| <img src="/Resources/img1.png"> | <img src="/Resources/img2.png"> |

- List of the number of employees by their most recent job title who are about to retire

| query | retiring_titles (table) | retiring_titles (csv file)
| --- | --- | --- |
| <img src="/Resources/img3.png"> | <img src="/Resources/img4.png"> | <img src="/Resources/img5.png"> |


### Deliverable 2: The Employees Eligible for the Mentorship Program
- The Employees Eligible for the Mentorship Program

| query | mentorship_eligibilty (table) | mentorship_eligibilty (csv file)
| --- | --- | --- |
| <img src="/Resources/img6.png"> | <img src="/Resources/img7.png"> | <img src="/Resources/img8.png"> |

## Summary
### Deliverable 3: A written report on the employee database analysis 
1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  - There are 72,458 eligible employees for retirement.
  
2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  - A total of 1,549 workers are eligible for the mentorship program.
