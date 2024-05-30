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



















