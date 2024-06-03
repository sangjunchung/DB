/*
[SELECT 문 정리] 숫자는 컴퓨터가 읽는 순서
5. SELECT 컬럼명, 컬럼명 AS "별칭", 컬럼명, ...
1. FROM 테이블명
2. WHERE 컬럼명|함수식, 비교연산자, 비교값
3. GROUP BY 그룹을 묶을 컬럼명
4. HAVING 그룹함수식 비교연산자 비교값
6. ORDER BY 컬럼명|별칭|컬럼순번 정렬방식

SELECT WHERE 절까지만 존재할 경우
3. SELECT 
1. FROM
2. WHERE

SELECT ORDER BY 절까지만 존재할 경우 (WHERE X)
2. SELECT 
1. FROM
3. ORDER BY 

SELECT ORDER BY 절까지만 존재할 경우 (WHERE O)
3. SELECT 
1. FROM
2. WHERE
4. ORDER BY 
*/

/*
GROUP BY 절

같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶은것

여러 개의 값을 묶어서 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용

그룹함수는 단 한개의 결과 값만 산출하기 때문에 그룹이 여러 개일 경우 오류 발생
여러개의 결과 값을 산출하기 위해 그룹 함수가 적용된 그룹의 기준을 ORDER BY 절에 기술해서 나옴
*/

SELECT DEPT_CODE,SUM(SALARY)
FROM employee
GROUP BY dept_code;
/*
SELECT DEPT_CODE,SUM(SALARY)
DEPT_CODE 부서코드와 각 부서의 급여 합계를 선택

GROUP BY dept_code;
DEPT_CODE 기준으로 그룹을 생성
동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
각 그룹에 월급 합인 SUM(SALARY)를 적용해서
해당 부서의 모든 직원의 급여 합계를 계산한 것

NULL 5210000
D1	 7820000
D9	 17700000
D5	 15760000
D6	 10100000
D2	 6520000
D8	 6986240
*/

SELECT DEPT_CODE, COUNT(BONUS) AS "보너스 받은 사원 수"
FROM employee
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;
/*	
부서 보너스 받은 사원 수
NULL 1
D1	 2
D9	 1
D5	 2
D6	 1
D8	 2
*/

SELECT DEPT_CODE, COUNT(BONUS) AS "보너스 받은 사원 수"
FROM employee
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS "평균급여"
FROM employee
WHERE DEPT_CODE IN ('D5','D6')
GROUP BY DEPT_CODE;
/*
D5	2626666
D6	3366666
*/