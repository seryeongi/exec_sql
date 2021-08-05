SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM title;

SELECT e.deptno, d.deptname, e.empname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;

SELECT t.titlename, e.empname
FROM emp e INNER JOIN title t
ON e.titleno = t.titleno;

# 6
SELECT e.deptno, AVG(e.salary) AS avg_sal
FROM emp e INNER JOIN title t ON e.titleno = t.titleno
WHERE t.titlename = '사원' OR t.titlename = '대리'
GROUP BY e.deptno
HAVING avg_sal >= 2500;

# 사원 정보를 출력하시오. 이름, 부서명, 지역명, 직위
SELECT e.empname, d.deptname, d.deptloc, t.titlename
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno;

# 부서별, 직위별 연봉의 평균을 구하시오
SELECT deptno, titleno, AVG(salary)
FROM emp
GROUP BY deptno, titleno;

SELECT d.deptname, t.titlename, AVG(salary) FROM emp e
   INNER JOIN dept d ON e.deptno = d.deptno
   INNER JOIN title t on e.titleno = t.titleno
GROUP BY d.deptname, t.titlename

# 7
SELECT YEAR(hdate) AS hyear, AVG(salary) FROM emp
WHERE YEAR(hdate) BETWEEN 2000 AND 2002
GROUP BY hyear

# 8
SELECT RANK() OVER(ORDER BY SUM(e.salary) DESC) AS rank,
   d.deptname, SUM(e.salary / 12) AS ssal FROM emp e
   INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptname
ORDER BY rank
LIMIT 3;

# 9
SELECT deptno FROM dept WHERE deptloc = '서울';

SELECT * FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE deptloc = '서울')

SELECT * FROM emp
WHERE deptno IN (SELECT deptno FROM dept
WHERE deptloc = '서울' OR deptloc = '부산')

SELECT * FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
WHERE deptloc IN ('서울','부산')

-- 10
SELECT e.empname, d.deptname, t.titlename
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno 
			  INNER JOIN title t ON e.titleno = t.titleno
WHERE e.deptno = (SELECT deptno FROM emp WHERE empname = '이영자')

/* 12. 대전 지역 직원들의 연봉 평균 보다 많이 받는 직원 조회
단, 부서명, 타이틀명, 이름, 연봉 조회
*/
SELECT AVG(e.salary) FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptloc = '대전'

SELECT e.empname, d.deptname, t.titlename, e.salary
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno 
			  INNER JOIN title t ON e.titleno = t.titleno
WHERE e.salary > (SELECT AVG(e.salary) FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptloc = '대전')

# 13. 직원들의 정보를 조회 하시오
# 직원명, 매니저명
SELECT e1.empno, e1.empname, IFNULL(e2.empname,'NAN') AS mgrname FROM emp e1 
		LEFT JOIN emp e2 ON e1.manager = e2.empno
		

INSERT INTO dept VALUES ('50', '연구부', '충북');

SELECT e.empname, d.deptname, d.deptloc
FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno

INSERT INTO emp VALUES ('1011', '10', NULL, '이사원', NULL, 1300, '2021-01-01');

SELECT e.empname, d.deptname, d.deptloc
FROM emp e FULL OUTER JOIN dept d ON e.deptno = d.deptno

SELECT empname, hdate,
TIMESTAMPDIFF(month, hdate, '2020-01-01'), TIMESTAMPDIFF(year,hdate,NOW())
FROM emp
