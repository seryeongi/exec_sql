-- DML
-- SELECT문
/*
	GROUP
*/
-- SELECT - 한라인씩 적용됨
SELECT empno, empname, ROUND(salary/12,2), 
		DATE_FORMAT(hdate,'%Y') FROM emp
WHERE empno IN ('1001','1002','1003')
ORDER BY 3 DESC

-- 그룹핑 함수 동반 필요
SELECT deptno,
	SUM(salary) AS sum,
	ROUND(AVG(salary),1),
	COUNT(*),
	STDDEV(salary), 
	VAR_SAMP(salary), 
	MIN(salary),
	MAX(salary)
FROM emp
GROUP BY deptno
HAVING SUM(salary) >= 10000
ORDER BY sum DESC

-- 1
SELECT DATE_FORMAT(hdate,'%Y') AS year, ROUND(AVG(salary),1) AS avg_salary
FROM emp
GROUP BY hdate
HAVING avg_salary >= 3000
-- 2
SELECT deptno, DATE_FORMAT(hdate,'%Y') AS year, ROUND(AVG(salary),1) AS avg_salary
FROM emp
GROUP BY deptno, hdate

