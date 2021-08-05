-- DML
-- SELECT문
/*
	CRUD
	Read: SELECT
*/

SELECT * FROM emp;
SELECT empno, empname, salary FROM emp;
SELECT empno as no, empname as name, salary FROM emp;
SELECT deptno, manager, empno | empname FROM emp;
SELECT empname, salary, round(salary/12,2) as msalary FROM emp;

SELECT empname, hdate FROM emp;
SELECT empname, DATE_FORMAT(hdate,'%Y-%M-%D') FROM emp;

/*
	SELECT 조건
*/

SELECT * FROM emp WHERE salary >= 3500 AND salary <= 4000;
SELECT * FROM emp WHERE salary between 3500 and 4000;
SELECT * FROM emp WHERE empname = '이말숙';
SELECT * FROM emp WHERE deptno in ('10','20');
SELECT * FROM emp WHERE empname like '이%';
SELECT * FROM emp WHERE empname like '%자%';
SELECT * FROM emp WHERE empname like '__자%';

SELECT * FROM emp
WHERE hdate > '2000-01-01'
AND (empname LIKE '김%'
OR empname LIKE '홍%')
ORDER BY salary;

SELECT empname, DATE_FORMAT(hdate,'%Y') AS year, salary, ROUND(salary/12,0) AS msalary
FROM emp
WHERE DATE_FORMAT(hdate,'%Y') >= '2000'
AND ROUND(salary/12,0) > 200 -- Alias 여서 msalary 는 못씀
ORDER BY msalary;

SELECT empname,
DATE_FORMAT(hdate, '%Y/%M/%D') AS M1,
DATE_FORMAT(hdate, '%Y/%m/%d') AS M2
FROM emp

SELECT * FROM emp WHERE manager IS NULL
SELECT * FROM emp WHERE manager IS NOT NULL

-- 정렬 order by
SELECT * FROM emp ORDER BY salary DESC LIMIT 5;
SELECT * FROM emp ORDER BY 2,5;
SELECT * FROM emp ORDER BY deptno DESC, salary ASC;

-- 중복
SELECT DISTINCT(deptno) FROM emp;

-- 범위 설정
SELECT * FROM emp ORDER BY salary DESC LIMIT 3,3;

/*
workshop 내용 
*/
-- 1
SELECT * FROM emp
WHERE DATE_FORMAT(hdate, '%Y') >= '2000'
AND empname LIKE '김%'
ORDER BY salary;
-- 2
SELECT empno, deptno, empname, manager, salary, ROUND(salary/12,0) AS msalary FROM emp
WHERE ROUND(salary/12,0) > 150
AND (empname LIKE '이%'
OR empname LIKE '홍%')
ORDER BY msalary DESC;
-- 3
SELECT empno, empname, deptno, salary, ROUND(salary * 0.089,0) AS tax, ROUND(salary*(1-0.089),0) AS atsalary
FROM emp
ORDER BY DATE_FORMAT(hdate,'%Y') ASC, SALARY ASC;
-- 4
SELECT empno, empname, deptno, salary, ROUND(salary/12,0) AS msalary, DATE_FORMAT(hdate,'%M') AS hmonth
FROM emp
WHERE DATE_FORMAT(hdate,'%M') = 'January'
AND ROUND(salary/12,0) between 150 and 250

