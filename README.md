# Pewlett-Hackard-Analysis
## Project Overview
Pewlett Hackard (PH) is a large company boasting several thousand employees and it's been around for a long time, as baby boomers begin to retire at a rapid rate PH is looking toward the future in two ways first its offering retirement package for those who meet certain criteria; second it's starting to think about which positions will need to be filled.

The purpose of this project is to gain insight into the possible impact the next "silver tsunami" will have on PH. To perform this analysis we need to help Bobby to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.


## Resources
- Software: ProsgreSQL, PGAdmin
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv

## Results
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
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  - There are 72,458 (30.18%) eligible employees for retirement.
    - 50% of retiring employees hold engineering positions, so PH's human resources (HR) department should pay special attention to recruiting engineers.
    - The titles Senior Engineer and Senior Staff make up the 70% of the employees at the age of retirement, I would recommend that the HR enroll eligible employees to fill senior titles before making new hires for these positions.
    - The managers of the areas of *Sales* and *Research* are eligible for retirement. 
  
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  - A total of 1,549 employees are eligible for the mentorship program.
  - Mentorship program per deparment:
    -  There are plenty of employees available to train the new hires in the following departments:       
        -  *Development (396)*
        -  *Production (322)*
        -  *Sales (244)*
    - There are less employees available to train the new hires in the following departments: 
        -  *Human Resources (97)*
        -  *Quality Managment (86)*
        -  *Finance (64)* 
  - Mentorship program per title:
    - There are plenty of Senior Engineer (569), Senior Staff (501), Engineer (169) and Staff (155) available to train the new hires.
    - There are less of Assistant Engineer (77) and Technique Leader (78) available to train the new hires.
    - There aren't any manager titles

Due to the fact that the number of retirement-ready employees excess the number of employees capable of mentoring new employees I would greatly advise investing in training programs for both current employees and new hires.
