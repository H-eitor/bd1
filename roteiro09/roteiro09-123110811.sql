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
CREATE OR REPLACE FUNCTION check_age(input char(9))
RETURNS varchar AS 
$$
DECLARE
bday DATE;
BEGIN
    SELECT e.bdate INTO bday
    FROM employee e WHERE e.ssn = input;

	IF (bday IS NULL) THEN RETURN 'UNKNOWN';
	ELSIF (DATE_PART('YEAR', AGE(bday)) > 50) THEN RETURN 'SENIOR';
	ELSIF (DATE_PART('YEAR', AGE(bday)) < 0) THEN RETURN 'INVALID';
    ELSE RETURN 'YOUNG';
	END IF;
END;
$$  LANGUAGE plpgsql;

-- 5
CREATE OR REPLACE FUNCTION trigfunc_check_mgr ()
RETURNS trigger AS
$$
DECLARE
dep INT;
BEGIN
    SELECT dno INTO dep
    FROM employee WHERE ssn = NEW.mgrssn;

	IF (dep IS NULL OR dep <> NEW.dnumber) THEN
        RAISE EXCEPTION 'manager must be a department''s employee';
	ELSIF (NOT EXISTS (SELECT e.superssn FROM employee e WHERE e.superssn = NEW.mgrssn)) THEN
        RAISE EXCEPTION 'manager must have supevisees';
	ELSIF (check_age(NEW.mgrssn) <> 'SENIOR') THEN
        RAISE EXCEPTION 'manager must be a SENIOR employee';
    ELSE RETURN NEW;
	END IF;
END;
$$  LANGUAGE plpgsql;

CREATE TRIGGER check_mgr BEFORE INSERT OR UPDATE ON department
    FOR EACH ROW EXECUTE FUNCTION trigfunc_check_mgr();
