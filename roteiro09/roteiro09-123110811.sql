-- 1
    -- A
CREATE VIEW vw_dptmgr 
AS SELECT d.dnumber, e.fname
FROM department d, employee e
WHERE d.mgrssn = e.ssn;
    -- B
CREATE VIEW vw_empl_houston
AS SELECT e.ssn, e.fname
FROM employee e
WHERE e.address LIKE '%Houston%';
    -- C
CREATE VIEW vw_deptstats
AS SELECT d.dnumber, d.dname, COUNT(w.essn)
FROM department d, project p, works_on w
WHERE p.dnum = d.dnumber AND p.pnumber = w.pno
GROUP BY d.dnumber;
    -- D
CREATE VIEW vw_projstats
AS SELECT w.pno, COUNT(w.essn)
FROM works_on w
GROUP BY w.pno;

-- 2
SELECT * FROM vw_dptmgr;
SELECT * FROM vw_empl_houston;
SELECT * FROM vw_deptstats;
SELECT * FROM vw_projstats;

-- 3
DROP VIEW vw_dptmgr;
DROP VIEW vw_empl_houston;
DROP VIEW vw_deptstats;
DROP VIEW vw_projstats;

-- 4

-- TODO AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
CREATE OR REPLACE FUNCTION check_age(input char(9))
RETURNS varchar AS 
$$

DECLARE
idade INT;

BEGIN
    SELECT EXTRACT('YEAR' FROM AGE(CURRENT_DATE, e.bdate)) INTO idade
    FROM employee e WHERE e.ssn = $1;

	IF (idade IS NULL) THEN RETURN 'UNKNOWN';
	ELSIF (idade > 50) THEN RETURN 'SENIOR';
	ELSIF (idade < 0) THEN RETURN 'INVALID';
    ELSE RETURN 'YOUNG';
	END IF;
   	 
END;
$$  LANGUAGE plpgsql;

-- 5
-- TODO PORQUE REQUER A 4
CREATE OR REPLACE FUNCTION check_mgr(param_name PARAM_TYPE)
RETURNS RETURN_TYPE AS
$$

DECLARE
var1_name VAR1_TYPE;
var2_name VAR2_TYPE;
var3_name VAR3_TYPE;

BEGIN
    
	IF (CONDITION) THEN
        	...
	ELSIF (CONDITION) THEN
        	...
	END IF;
   	 
END;
$$  LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION increment(i char(1)) RETURNS varchar AS $$
DECLARE
    idade INT;
BEGIN
    RETURN 'a';
END;
$$ LANGUAGE plpgsql;