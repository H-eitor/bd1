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

--6 TODO
SELECT MIN(qtd_func) qtd FROM (SELECT COUNT(essn) qtd_func FROM works_on GROUP BY pno);

--7 TODO

--8
SELECT w.pno num_proj, AVG(e.salary) media_sal FROM works_on w JOIN employee e ON e.ssn = w.essn GROUP BY num_proj;

--9
SELECT w.pno proj_num, p.pname proj_nome, AVG(e.salary) media_sal FROM works_on w JOIN employee e ON e.ssn = w.essn JOIN project p ON w.pno = p.pnumber GROUP BY proj_num, proj_nome;

--10 TODO

--11
SELECT e.ssn, COUNT(w.pno) qtd_proj FROM employee e LEFT JOIN works_on w ON e.ssn = w.essn GROUP BY ssn;

--12
SELECT w.pno num_proj, COUNT(e.ssn) qtd_func FROM works_on w RIGHT JOIN employee e ON e.ssn = w.essn GROUP BY num_proj HAVING COUNT(e.ssn) < 5;

--13 TODO
SELECT fname FROM()

--14 TODO
SELECT dname FROM department WHERE dnumber NOT IN (SELECT dnum FROM project);

--15 TODO
SELECT  fname, lname FROM employee e JOIN works_on w ON e.ssn = 