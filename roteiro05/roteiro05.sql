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