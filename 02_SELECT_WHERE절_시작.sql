/*
SELECT WHERE 절
WHERE 의 경우 조건을 걸어 선택한 조건에 해당하는 행만 볼 수 있도록 설정
WHERE 원하는컬럼 = 원하는컬럼에서해당하는조건;

만약 아무것도 없는 NULL 값을 조회하길 원한다면
WHERE 원하는컬럼 IS NULL;

만약 NULL 이 아닌 값만 조회하길 원한다면
WHERE 원하는컬럼 IS NOT NULL;

~이상이거나 ~이하일 때는? >= <= > < 사용(미만, 초과 포함)
WHERE 원하는컬럼 >= 원하는값;

00 과 01 사이를 조회하길 원한다면 BETWEEN 00 AND 01;
WHERE 원하는컬럼 BETWEEN 00 AND 01;

-- WHERE 절 사용 X
ORDER BY
오름차순 ASC
내림차순 DESC
*/

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM job;

SELECT EMP_NAME, HIRE_DATE FROM employee;

/*
컬럼값 산술 연산
    컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
    
    SELECT 문 작성시 컬럼명에 산술 연산을 직접 작성하면
    조회결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/
-- EMPLOYEE TABLE 에서 모든 사원의 이름, 급여, 급여+100만 조회
SELECT EMP_NAME, SALARY, SALARY+1000000 FROM employee;
-- AS 의 경우 큰 따옴표("")를 사용해서 표기
SELECT EMP_NAME, SALARY, SALARY+1000000 AS "100만원인상추가" FROM employee;
SELECT EMP_ID, EMP_NAME, SALARY*12 AS "연봉" FROM employee;
SELECT EMP_ID, EMP_NAME, SALARY*6 AS "상반기 급여" FROM employee;

SELECT DEPT_CODE,EMP_NAME,EMAIL FROM employee WHERE DEPT_CODE = 'D9';
SELECT EMP_NAME,EMAIL FROM employee WHERE DEPT_CODE = 'D1';
SELECT EMP_NAME,PHONE,EMAIL FROM employee WHERE dept_code = 'D4';
-- WHERE 에서 조회한 조건에 부합하는 대상이 없는 경우 값이 나오지 않음 = 0;
-- IS NULL 을 사용하면 없는 사람을 조회할 수 있음
SELECT DEPT_CODE,EMP_NAME,EMAIL,PHONE FROM employee WHERE dept_code IS NULL;

SELECT * FROM employee WHERE dept_code IS NULL;

SELECT EMP_NAME,BONUS FROM employee WHERE bonus IS NULL;

SELECT EMP_NAME,SALARY FROM employee WHERE SAL_LEVEL = 'S5';

SELECT * FROM employee WHERE EMP_ID = '210';

SELECT EMP_NAME,EMAIL FROM employee WHERE email IS NOT NULL;

SELECT EMP_NAME,BONUS FROM employee WHERE BONUS >= '0.2';

SELECT EMP_NAME,SALARY FROM employee WHERE salary BETWEEN 3000000 AND 4000000;

SELECT EMP_NAME,SALARY FROM employee ORDER BY salary DESC;
-- 글자체계 오름차순 ㄱ부터 ㅎ까지 작성하기 A-Z
-- 글자체계 내림차순 ㅎ부터 ㄱ까지 작성하기 Z-A
SELECT EMP_NAME FROM employee ORDER BY EMP_NAME ASC;

SELECT EMP_ID,EMP_NAME,DEPT_CODE FROM employee WHERE salary > 3000000;
SELECT EMP_NAME,SALARY*12 AS "연봉" FROM employee WHERE salary*12 <= 50000000;

SELECT EMP_NAME,DEPT_CODE,PHONE FROM employee WHERE dept_code != 'D9';

SELECT EMP_NAME,DEPT_CODE,SALARY FROM employee WHERE dept_code = 'D6' AND SALARY > 3000000;

SELECT EMP_NAME,SALARY FROM employee WHERE dept_code = 'D6' AND job_code = 'J3';

-- 날짜 범위 비교
-- EMPLOYEE TABLE 에서 입사일이 2000-01-01 부터 2000-12-31 사이인 사원의 이름, 입사일 조회
SELECT EMP_NAME,HIRE_DATE FROM employee WHERE HIRE_DATE BETWEEN TO_DATE('2000-01-01', 'YYYY-MM-DD') AND TO_DATE('2000-12-31', 'YYYY-MM-DD');
SELECT EMP_NAME,HIRE_DATE FROM employee WHERE hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');














