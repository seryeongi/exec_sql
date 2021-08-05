SELECT * FROM emp
SELECT * FROM dept
SELECT * FROM title
-- 1
SELECT e.empno, e.empname, t.titlename, d.deptname, d.deptloc 
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
				INNER JOIN title t ON e.titleno = t.titleno
WHERE YEAR(e.hdate) > 2000
-- 2
SELECT d.deptname, AVG(e.salary) AS avgsal
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY deptname
HAVING avgsal >= 3000
-- 3
SELECT d.deptloc, AVG(e.salary)
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptloc = '경기'
-- 4
SELECT e.empname, e.hdate, TIMESTAMPDIFF(month, e.hdate, NOW()) AS 근무월수
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
WHERE e.deptno = (SELECT deptno FROM emp WHERE empname = '홍영자')
-- 5
SELECT e.empname, d.deptname, t.titlename,TIMESTAMPDIFF(year, e.hdate, NOW()) AS 입사년수, RANK() OVER(ORDER BY TIMESTAMPDIFF(year, e.hdate, NOW()) DESC) AS rank 
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
			  INNER JOIN title t ON e.titleno = t.titleno
ORDER BY rank
