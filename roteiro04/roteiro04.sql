--1
SELECT * FROM department;

--2
SELECT * FROM dependent;

--3
SELECT * FROM dept_locations;

--4
SELECT * FROM employee;

--5
SELECT * FROM project;

--6
SELECT * FROM works_on;

--7
SELECT fname, lname FROM employee WHERE sex='M';

--8
SELECT fname FROM employee WHERE sex='M' AND superssn IS NULL;

--9
SELECT f.fname AS funcionario, s.fname AS supervisor FROM employee AS f, employee AS s WHERE f.superssn = s.ssn;

--10
SELECT f.fname FROM employee AS f, employee AS s WHERE f.superssn = s.ssn AND s.fname = 'Franklin';

--11
SELECT d.dname, l.dlocation FROM department d, dept_locations l WHERE d.dnumber = l.dnumber;

--12
SELECT dname FROM department WHERE dname LIKE 'S%';

--13
SELECT e.fname, e.lname, d.dependent_name FROM employee e, dependent d WHERE d.essn = e.ssn;

--14
SELECT fname || ' ' || minit || ' ' || lname full_name, salary from employee WHERE salary > 50000;

--15
SELECT p.pname, d.dname FROM project p, department d WHERE p.dnum = d.dnumber; 

--16
SELECT p.pname, e.fname FROM project p, employee e, department d WHERE p.dnum = d.dnumber AND e.ssn = d.mgrssn AND p.pnumber > 30;

--17
SELECT p.pname, e.fname FROM project p, employee e, works_on w WHERE e.ssn = w.essn AND w.pno = p.pnumber;

--18
SELECT e.fname, d.dependent_name, d.relationship FROM employee e, dependent d, works_on w WHERE e.ssn = d.essn AND w.essn = e.ssn AND w.pno = 91;