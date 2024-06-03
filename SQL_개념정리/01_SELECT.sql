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

/*
컬럼명 BETWEEN (A) AND (B)
    컬럼의 값이 A 이상 B 이하면 TRUE
    
컬럼명 NOT BETWEEN (A) AND (B)
    컬럼의 값이 A 이상 B 이하면 FALSE
    컬럼의 값이 A 미만 B 초과시 TRUE
*/
SELECT EMP_NAME,SALARY FROM employee WHERE salary BETWEEN 3000000 AND 5000000;
SELECT EMP_NAME,SALARY FROM employee WHERE salary NOT BETWEEN 3000000 AND 5000000;

/*
WHERE OR 사용해서 값1, 값2, 값3, ... 과 같은 표시를  진행하기도 함
WHERE 컬럼명1 = 값1 OR 컬럼명2 = 값2 OR 컬럼명3 = 값3, ...

컬럼명 IN (값1, 값2, 값3, ...)
    컬럼의 값이 () 내 값과 일치하면 TRUE
    
컬럼명 NOT IN (값1, 값2, 값3, ...)
    컬럼의 값이 () 내 값과 일치하면 FALSE
    컬럼의 값이 () 내 값과 일치안흐면 TRUE
*/
----------------
/* OR 사용 */
SELECT EMP_NAME,DEPT_CODE,SALARY FROM employee WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D9';
----------------
/* IN 사용 */
SELECT EMP_NAME,DEPT_CODE,SALARY FROM employee WHERE DEPT_CODE IN ('D5','D6','D9');
SELECT EMP_NAME,DEPT_CODE,SALARY FROM employee WHERE DEPT_CODE NOT IN ('D5','D6','D9');

/*
LIKE
비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
WHERE 컬럼명 LIKE '패턴'

%(포함)
    %A : 문자열의 앞은 어떤 문자든 포함되고 마지막은 A
    EX) %륨 : 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷
    
    A% : 문자열에서 A로 시작하고 끝나는 것은 상관없음
    EX) 림% : 검색창에 림으로 시작하는 단어를 검색한 것과 비슷
    
    %A% : 문자열 시작과 끝문자는 관계없이 중간에 A가 들어가면 됨
    EX) %로% : 검색창에 로가 중간에 들어가는 단어를 검색한 것과 비슷
    
_글자수
    A_ : A 뒤에 아무거나 한 글자만 있는 문자열
    EX) AB, AI, AQ, A가
        가 _ : 가로 시작하는 2글자 단어(가나, 가구, 등)만 검색
        나 _ _ : 나로 시작하는 3글자 단어만 검색
        
    _A : A 앞에 아무거나 한 글자만 있는 문자열
    EX) BA, IA, QA, 가A
        _ 가 : 가로 끝나는 2글자 단어만 검색
        _ _ 나 : 나로 끝나는 3글자 단어만 검색
*/
SELECT EMP_ID,EMP_NAME FROM employee WHERE EMP_NAME LIKE '전%';
SELECT EMP_ID,EMP_NAME FROM employee WHERE EMP_NAME LIKE '%수';
SELECT EMP_ID,EMP_NAME FROM employee WHERE EMP_NAME LIKE '%하%';
SELECT EMP_ID,EMP_NAME FROM employee WHERE EMP_NAME LIKE '전%돈';

/*
_ _ _ : 세글자를 의미

ESCAPE '구분지을특수문자' 를 사용하면 LIKE 패턴중 글자 수 와 
특수문자로 쓸 _ 를 구분지을수 있음

ESCAPE '#' 구분을 지을 것이다.
_ _ _ LIKE 사용하는 3글자만 찾으라는 의미로 구분 짓는 것
_% -> _로 된 글자 찾기

_ _ _ #_%
# 뒤의 _ 를 글자수가 아닌 특수문자 그 자체로 원했기 때문에 #을 넣어준 것

LIKE '_ _#@%'ESCAPE 에서 @는 # 뒤에있어 문자 그래도 @ 의미

'___^_%'ESCAPE'^'
*/

/*
DUAL (DUMMY TABLE)
Dummy : 실제로 사용되지 않은 데이터
더미테이블 : 실제로 존재하지 않는 테이블
        -> 테이블 만들기는 번거롭고, 뭔가 테스트나 사용은 해봐야겠고..
        -> 단순히 데이터를 조회하거나 확인할 때 사용
*/
-- 존재하지 않는 테이블을 이용해서 현재시간 확인하기
SELECT SYSDATE,SYSTIMESTAMP FROM DUAL;

/*
WHERE 절 별칭 사용 불가 확인!
*/

-- 부서코드 D6 확인
SELECT
    emp_name,
    dept_code AS "부서코드"
FROM
    employee
WHERE
    부서코드 = 'D6';
/*
ORA-00904: "부서코드": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
6행, 65열에서 오류 발생

-> 부서코드 라는 컬럼이 존재하지 않음
-> 별칭은 우리가 눈에 보기 좋게 작성하는 이름일뿐
-> WHERE 절에서 찾는데 사용할 수 없음
*/

/*
그러나!!!
ORDER BY 절에서는 별칭 사용 가능!!
*/
SELECT
    emp_name,
    salary * 12 AS "연봉"
FROM
    employee
ORDER BY
    연봉 DESC;
--> ORDER BY 는 무언가를 컬럼에서 찾아오는 것이 아니라
--> 나타난 정보를 오름차순으로 정렬할지 내림차순으로 정렬할지
--> 정렬만 하기 때문에 별칭으로 사용할 수 있음

SELECT
    emp_name,
    dept_code,
    salary
FROM
    employee
ORDER BY
    dept_code ASC,
    salary DESC;

SELECT
    emp_name AS "이름",
    dept_code AS "부서코드",
    job_code AS "직급코드"
FROM
    employee
ORDER BY
    부서코드 ASC,
    직급코드 DESC,
    이름 ASC;
    
SELECT * FROM MENU WHERE MENU_NAME LIKE '카%';
SELECT * FROM MENU WHERE MENU_PRICE = 3500;
SELECT * FROM MENU WHERE MENU_ID = 1;
SELECT * FROM MENU WHERE MENU_DESC LIKE '%카라멜%';
SELECT * FROM MENU ORDER BY MENU_PRICE ASC;

SELECT COUNT(*) AS "J5 COUNT" FROM employee WHERE job_code = 'J5';

/*
|| 연결 연산자
    문자열 이어쓰기
    + 나 , 로 연결하지 않고 || 로 연결함
*/
SELECT EMP_ID||EMP_NAME FROM employee;
SELECT EMP_NAME||'의 월급은 '||SALARY||'원 입니다.' FROM employee;

SELECT EMP_NAME||'('||EMAIL||')' FROM employee;
SELECT EMP_NAME||' - '||PHONE FROM employee;
SELECT EMP_ID||' - '||DEPT_CODE FROM employee;
SELECT EMP_NAME||' : '||SALARY AS "이름 : 급여" FROM employee;
SELECT EMP_NAME||' - '||SALARY*12 AS "이름 - 연봉" FROM employee;

/*
ORDER BY 절
    SELECT 문의 조회 결과(RESULT SET)를 정렬할 때 사용하는 구문
    
    *** SELECT 구문에서 제일 마지막에 해석됨 ***
    
    [작성법]
    SELECT 컬럼명, 컬럼명 AS "별칭", 컬럼명, ...
    FROM 테이블명
    WHERE 조건식
    ORDER BY 컬럼명|별칭|컬럼순서(오름 내림 차순)
    
    컬럼순서의 기본값은 오름 차순
    ASC : 오름차순(ASCENDING)
    DESC : 내림차순(DESCENDING)
*/

SELECT EMP_NAME,SALARY FROM EMPLOYEE
ORDER BY SALARY ASC;

SELECT EMP_NAME,SALARY FROM EMPLOYEE
ORDER BY SALARY DESC;

SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM employee
WHERE DEPT_CODE IN ('D5','D6','D9')
ORDER BY DEPT_CODE;

SELECT EMP_ID,EMP_NAME,SALARY 
FROM employee
WHERE SALARY BETWEEN 3000000 AND 6000000
ORDER BY 2 DESC; -- 2 : EMP_NAME
-- 만약 EMP_ID 로 정렬을 원할시 1로 작성
-- 만약 SALARY 로 정렬을 원할시 3로 작성

SELECT EMP_NAME,SALARY*12 AS "연봉"
FROM employee
ORDER BY 2 DESC;

-- ORDER BY 로 정렬을 진행할 경우에는
-- SELECT 절에 작성된 컬럼을 그대로 따라 작성한 경우가 많음

/* OREDER BY 절에서 별칭 사용하기 
SELECT 절 해석 이후 ORDER  BY 절이 해석되기 때문에
SELECT 절에서 해석된 별칭을 ORDER BY 절에서 사용할 수 있음
*/
SELECT EMP_NAME,SALARY*12 AS "연봉"
FROM employee
ORDER BY 연봉 DESC;
-- 주의할 점 : ORDER BY 에서는 별칭 사용이 가능하지만
-- WHERE 절의 경우 조건이기 때문에 별칭 사용이 불가능함
-- ORDER BY는 결과를 가지고 결과 정리를 하는 표현 방법
-- WHERE 절은 결과를 나타내기 위해 찾는 조건문이기 때문에 결과 확정 전이므로 별칭 사용 불가능

/* 정렬중첩 
먼저 작성된 정렬 기준을 깨지 않고
다음 작성된 정렬 기준 적용
각각 다른 정렬이 된것
*/

SELECT EMP_NAME,DEPT_CODE,SALARY
FROM employee
ORDER BY DEPT_CODE, SALARY DESC;

SELECT EMP_NAME AS "이름",DEPT_CODE AS "부서코드",JOB_CODE AS "직급코드"
FROM employee
ORDER BY 부서코드,직급코드 DESC, 이름;

/*
부서코드 1번 정렬
제일 먼저 부서코드가 오름차순으로 정렬
D1, D2, D5, D6, D8, D9, (NULL)

그 다음에
동일한 부서코드 내에서 직급 코드가 내림차순으로 정렬
D1의 부서에서 직급코드가 내림차순이기 때문에 J7, J6 순으로 정렬

그 다음에 
동일한 부서코드 및 직급코드 내에서 이름이 오름차순으로 정렬
D1 - J6 에서 전지연, 차태연 순으로 정렬

컬럼 위치랑 관계 없이 정렬이 표기
*/
-- 위에서 작성한 ORDER BY 순으로 컬럼을 보긴 원한다면 아래와 같이 작성
SELECT DEPT_CODE AS "부서코드",JOB_CODE AS "직급코드",EMP_NAME AS "이름"
FROM employee
ORDER BY 부서코드, 직급코드 DESC, 이름;





