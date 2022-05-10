/**/
/*
1. Execute following queries, observe and explain what are running results.
select sysdate from dual ;
select to_char(sysdate, 'Dy DD-Mon-YYYY HH24:MI:SS') AS "Current Time" from dual ;
*/
select sysdate from dual ;
select to_char(sysdate, 'Dy DD-Mon-YYYY HH24:MI:SS') AS "Current Time" from dual ;
/*
Answer:
In the above expression, we are selecting the current data and time of the operating from a built-in Oracle table named "dual". 
The first select statement displays the format DD-MM-YY.
In the 2nd Select statement, we selecting the same sysdate from table dual, but reformatting it to the desired form, 'Dy DD-Mon-YYYY HH24:MI:SS'
, and renaimg it "Current Time". The to_Char portion is the part that converts the sysdate to the desired format. 
*/

/*
2. Write queries to give 3% raise to all employees whose earning below $21,000.00.
*/

SELECT EMPNO, FNAME, LNAME, SALARY,(SALARY *0.03) "Raise Amount",(SALARY + (SALARY *0.03)) "Salary + Raise" FROM EMP
WHERE SALARY < 21000

/*
3. As of today, Mr. Henry Smith has been hired as the new manager in IT department with the salary of $70,000. 
Create queries to insert and update values in your database.
*/

DESCRIBE EMP

UPDATE EMP
SET
EMPNO = 1740,
FNAME ='Henry',
LNAME = 'Smith',
ADDRESS = 'UNKNOWN',
SEX = 'M',
SALARY = 70000,
POSITION = 'Manager',
DEPTNO = 60,
EMAIL = 'UNKNOWN'
WHERE 
EMPNO = 1740;

--UPDATE EMP_PROG
--SET  EMPNO = 9999
--WHERE EMPNO = 1740;

--UPDATE DEPT
--SET MGR = 9999
--WHERE MGR = 1740; 

--UPDATE EMP
--SET EMPNO = 9999
--WHERE EMPNO = 1740;

--COMMIT WORK;
--EMPNO kept the same because it is a replacement.
--The EMPNO is attached to a primary key, so we would need to alter the table, remove primary keys and replace them after changing the table?

/*
4. Pat Fay has reduced her work load from full time to part time due to health reasons. 
She will receive reduced salary of $8000.00 until she fully recovered. 
Write a query to implement the change an explain what is the result of the query.
*/

DESCRIBE EMP

UPDATE EMP
SET 
SALARY = 08000
WHERE FNAME = 'Pat' AND LNAME = 'Fay'

/*
ANSWER:
ORA-02290: check constraint (ALIM.SYS_C00217955) violated
We are unable to update the EMP table with the new salary due to the constraint being 
that is has to be a total income has to be above 12000 and that also that currently the numbers allowed has to
be a total of 6 digits and one one zero is allowed to be in front of the desired number.
In order to update the SALARY we would have to allow the constraint to have less that 6 digits total in the field,
While also removing the CHECK constraint.
*/

/*
5. Ellen Abel is no longer working for the organization. Writes queries removing the employee record.
*/
DELETE FROM EMP
WHERE FNAME = 'Ellen' AND LNAME ='Abel'

/*
Ellen Abel was the previous IT Manager and was removed when we updated the table with Mr. Henry Smith in Problem # 3
*/

/*
6. The new policy require all users only can see employees’ employee number, first name, and last name. 
Create a view to implement the policy.
*/

CREATE VIEW EMP_View AS
SELECT EMPNO,FNAME,LNAME
FROM EMP

SELECT * FROM EMP_VIEW