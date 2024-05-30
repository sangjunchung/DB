/*
SELECT (조회)
지정된 TABLE에서 원하는 데이터를 선택해서 조회하는 SQL
작성된 구문에 맞는 행, 열 데이터가 조회됨
    -> 조회된 결과 : 행의 집합 == RESULT SET (결과 집합)
    
    - RESULT SET 은 0 행 이상이 포함될 수 있음
        -> 조건에 맞는 행이 없을 수 있다는 것
*/

/*
[SELECT 작성법 - 1 (기초)]

SELECT 컬럼명, 컬럼명, ...
FROM TABLE명;
-> 지정된 TABLE 모든 행에서 컬럼명이 일치하는 컬럼값 조회

테이블의 모든 행 모든 컬럼 조회하는 방법
 * (ASTERISK) : 모든, 포함하다 를 나타내는 기호
*/
SELECT EMP_ID,EMP_NAME,SALARY FROM employee;
SELECT * FROM employee;

/*
컬럼 값 산술 연산
    컬럼 값 : 행과 열이 교차되는 TABLE 한 칸에 작성된 값
    
    SELECT문에 산술 연산을 직접 작성하면
    조회결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/
SELECT EMP_NAME,SALARY,SALARY+1000000 FROM employee;
SELECT EMP_NAME,SALARY*12 AS "연봉" FROM employee;

/*
SYSDATE.SYSTIMESTAMP : 시스템이 나타내고 있는 현재 시간
    SYSDATE : 현재 시간 (년, 월, 일, 시, 분, 초) 조회
    SYSTIMESTAMP : 현재 시간 (년, 월, 일, 시, 분, 초, MS + 지역(LOCAL)) 조회
    
회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용
*/

/*
날짜 사용하기
DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용

TO_DATE('문자열', '패턴')

EX) 2024-05-01 자 이후 회원가입한 회원 조회
TO_DATE('2024-05-01', 'YYYY-MM-DD')
*/

/*
컬럼명 별칭 지정

별칭 지정 방법
    1) 컬럼명 AS "별칭" : 문자 O, 띄어쓰기 O, 특수문자 O
    2) 컬럼명 "별칭" : 문자 O, 띄어쓰기 O, 특수문자 O
    3) 컬럼면 별칭 : 문자 O, 띄어쓰기 X, 특수문자 X
    4) 컬럼명 AS 별칭 : 문자 O, 띄어쓰기 X, 특수문자 X
*/
SELECT EMP_NAME,EMAIL AS "이메일 @ 포함" FROM employee;
SELECT EMP_NAME,EMAIL "이메일 @ 포함" FROM employee;
SELECT EMP_NAME,EMAIL 이메일포함 FROM employee;
SELECT EMP_NAME,EMAIL AS 이메일포함 FROM employee;

/*
DISTINCT (별개의, 전혀다른)
-> 중복 제거

조회 결과 집합(RESULT SET)에서 지정된 컬럼의 값이 중복되는 경우 
중복되는 값을 한 번만 표시할 때 사용

사용방법
SELECT DISTINCT 중복제거할컬럼명 FROM TABLE명
*/
SELECT DEPT_CODE FROM employee;
SELECT DISTINCT DEPT_CODE FROM employee;
-- -> D3, D4, D7 부서는 사원이 없기 때문에 조회되지 않음

SELECT DISTINCT JOB_CODE FROM employee ORDER BY job_code ASC;

/*
WHERE 절
TABLE 에서 조건을 충족하는 행을 조회할 때 사용
WHERE 절에는 조건식 (TRUE/FALSE) 만 작성

비교연산자 : > , < , >= , <= , =(같다) , != , <>(같지않다)
논리연산자 : AND, OR, NOT

작성방법
SELECT 컬럼명, 컬럼명, ... FROM TABLE명 WHERE 조건식;
    -> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
SELECT EMP_NAME,SALARY,DEPT_CODE FROM employee WHERE SALARY > 3000000;
SELECT EMP_NAME FROM employee WHERE dept_code = 'D9';
SELECT EMP_NAME FROM employee WHERE dept_code != 'D9';

/*
NULL, NOT NULL

컬럼 값이 존재하지 않는 경우
IS NULL;
컬럼 값이 존재하는 경우
IS NOT NULL;
*/
SELECT * FROM employee WHERE dept_code IS NULL;
SELECT * FROM employee WHERE dept_code IS NOT NULL;

