--1
SELECT COUNT(fname) FROM employee WHERE sex='F';

--2
SELECT AVG(salary) FROM employee WHERE sex='M' AND address LIKE '%TX';

--3
SELECT superssn ssn_supervisor, COUNT(ssn) qtd_supervisionados FROM employee GROUP BY superssn ORDER BY qtd_supervisionados;

--4
SELECT s.fname nome_supervisor, COUNT(e.ssn) qtd_supervisionados FROM employee s JOIN employee e ON s.ssn = e.superssn GROUP BY nome_supervisor ORDER BY qtd_supervisionados;

--5
SELECT s.fname nome_supervisor, COUNT(e.ssn) qtd_supervisionados FROM employee s JOIN employee e ON s.ssn = e.superssn GROUP BY nome_supervisor ORDER BY qtd_supervisionados;

--6
SELECT MIN(qtd_func) qtd FROM (SELECT COUNT(essn) qtd_func FROM works_on GROUP BY pno) AS foo;

--7
SELECT p.pnumber AS num_projeto, COUNT(w.essn) AS qtd_func FROM project p JOIN works_on w ON p.pnumber = w.pno GROUP BY p.pnumber HAVING COUNT(w.essn) = (SELECT MIN(func_count) FROM (SELECT COUNT(essn) AS func_count FROM works_on GROUP BY pno) AS foo);

--8
SELECT w.pno num_proj, AVG(e.salary) media_sal FROM works_on w JOIN employee e ON e.ssn = w.essn GROUP BY num_proj;

--9
SELECT w.pno proj_num, p.pname proj_nome, AVG(e.salary) media_sal FROM works_on w JOIN employee e ON e.ssn = w.essn JOIN project p ON w.pno = p.pnumber GROUP BY proj_num, proj_nome;

--10
SELECT fname, salary FROM employee WHERE salary > (SELECT MAX(salary) FROM employee JOIN works_on ON ssn=essn WHERE pno=92) AND NOT EXISTS (SELECT essn FROM works_on WHERE pno = 92 AND essn = ssn);

--11
SELECT e.ssn, COUNT(w.pno) qtd_proj FROM employee e LEFT JOIN works_on w ON e.ssn = w.essn GROUP BY ssn;

--12
SELECT w.pno num_proj, COUNT(e.ssn) qtd_func FROM works_on w RIGHT JOIN employee e ON e.ssn = w.essn GROUP BY num_proj HAVING COUNT(e.ssn) < 5;

--13
SELECT fname FROM employee e WHERE EXISTS (SELECT essn FROM dependent WHERE e.ssn = essn) AND EXISTS (SELECT plocation FROM project p WHERE plocation = 'Sugarland' AND EXISTS (SELECT pno FROM works_on WHERE pno=p.pnumber and essn=e.ssn));

--14
SELECT dname FROM department WHERE NOT EXISTS (SELECT dnum FROM project WHERE dnum = dnumber);

--15
SELECT  fname, lname FROM employee e JOIN works_on w ON w.essn = e.ssn WHERE e.ssn='123456789' AND EXISTS (SELECT essn FROM works_on wo WHERE w.pno=wo.pno and wo.essn='123456789') GROUP BY fname,lname;

--16 TODO