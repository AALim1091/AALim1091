/*
-Was unable to connect to java, so ran queries within developer
-Queries should run the same, jsut a different program being used.
*/

DESCRIBE EMPLOYEES
SELECT * FROM EMPLOYEES

DESCRIBE DEPARTMENTS
SELECT * FROM DEPARTMENTS

DESCRIBE LOCATIONS
SELECT * FROM LOCATIONS

DESCRIBE JOB_GRADES
SELECT * FROM JOB_GRADES

/*
1. Create a unique listing of all jobs that in department 80. Include the location of the department in the output.
*/
SELECT DISTINCT job_id, location_id FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.department_id = 80;


/*
2. Create a query to display the employee’s last name, department name, location ID 
and city of all employees who earn a commission.
*/
SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND
d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;

/*
3. Write a query that displays the last name, job, department number 
and department name for all employees who work in Toronto.
*/

SELECT e.last_name, e.job_id, e.department_id,
d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';


/*
4. Create a query to display the employee’s last name and employee number 
along with his/her manager’s last name and manager number. Label the columns Employee, Emp#, Manager and Mgr#, respectively.
*/
SELECT w.last_name "Employee", w.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
FROM employees w join employees m
ON (w.manager_id = m.employee_id);

/*
5. Display the names and hire dates for all employees who were hired before their managers, 
along with their manager’s names and hire dates. Label the columns Employee, Emp Hired, Manager, and Mgr Hired, respectively.
*/
SELECT w.first_name, w.last_name, w.hire_date, m.first_name, m.last_name, m.hire_date
FROM employees w, employees m
WHERE w.manager_id = m.employee_id
AND w.hire_date < m.hire_date;


/*
6. Submit your .java file of this lab by Tuesday, September 3, 2019.
*/