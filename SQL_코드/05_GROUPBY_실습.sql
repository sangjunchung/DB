/* HAVING 절 실습 */
SELECT DEPT_CODE,SUM(SALARY) AS "급여합계"
FROM employee
WHERE SUM(SALARY) >= 5000000
GROUP BY DEPT_CODE
ORDER BY 급여합계 DESC;
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"

-> WHERE 절에서는 집계함수(SUM, AVG, MAX, MIN,COUNT 등)를 사용할 수 없음
-> 집계함수(SUM, AVG, MAX, MIN,COUNT 등)는 HAVING 이나 WHERE GROUP을 다른 방식으로 사용해서 작성
*/

SELECT DEPT_CODE,MAX(SALARY) AS "최대급여"
FROM employee
GROUP BY dept_code;

SELECT DEPT_CODE, MIN(SALARY) AS "최소급여"
FROM employee
GROUP BY dept_code
ORDER BY 최소급여;

SELECT DEPT_CODE, SUM(BONUS) AS "총 보너스율"
FROM employee
GROUP BY dept_code
ORDER BY "총 보너스율" DESC;

SELECT JOB_CODE, COUNT(JOB_CODE) AS "사원 수"
FROM employee
GROUP BY JOB_CODE
ORDER BY "사원 수" DESC;

SELECT SAL_LEVEL, AVG(BONUS) AS "보너스평균"
FROM employee
GROUP BY sal_level
ORDER BY "보너스평균" DESC;
/*
ORA-00904: "SAL_LEVㅁL": invalid identifier
오타가 났을 때 오타를 빠르게 찾는 방법
문제가 되는 구문을 복사
찾기(ctrl + f) 후 구문 붙여넣기
*/

SELECT DEPT_CODE, MIN(HIRE_DATE) AS "최초입사일"
FROM employee
GROUP BY DEPT_CODE
ORDER BY "최초입사일";

SELECT DEPT_CODE, COUNT(SALARY) AS "사원 수"
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
ORDER BY "사원 수" DESC;

SELECT DEPT_CODE, COUNT(BONUS) AS "보너스 받는 사원 수"
FROM employee
WHERE BONUS >= 0.1
GROUP BY DEPT_CODE
ORDER BY "보너스 받는 사원 수" DESC;

SELECT JOB_CODE, COUNT(SALARY) AS "사원 수"
FROM employee
WHERE SALARY <= 4000000
GROUP BY JOB_CODE
ORDER BY "사원 수" DESC;

SELECT DEPT_CODE, AVG(SALARY) AS "500이상 평균 급여"
FROM employee
WHERE SALARY >= 5000000
GROUP BY DEPT_CODE
ORDER BY 2 DESC;

