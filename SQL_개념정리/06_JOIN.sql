/*
[JOIN]
 - 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
 - 수행 결과는 하나의 RESULT SET 으로 나옴
 
 - 관계형 데이터베이스에서 SQL을 이용해 테이블간 관계를 맺는 방법
 
 - 관계형 데이터베이스는 최소한의 데이터를 테이블에 담고 있어
   원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서
   데이터를 읽어와야 하는 경우가 많음
   이 때, 테이블간 관계를 맺기 위한 연결고리 역활이 필요한데
   두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가 됨
   
등가 조인 -> 내부조인(INNER JOIN), JOIN USING, ON, 자연조인(NATURAL JOIN)
포괄 조인 -> 왼쪽 외부 조인(LEFT OUTER JOIN), 오른쪽 외부 조인(RIGHT OUTER JOIN), 전체 외부 조인(FULL OUTER JOIN)
자체 조인 -> JOIN ON
교차 조인 -> CROSS JOIN
*/

-- 서로 다른 테이블 데이터를 조회할 경우 2가지로 나눠서 조회
-- 직원번호, 직원명, 부서코드, 부서명을 조회할 때
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE;
-- 직원번호, 직원명, 부서코드는 EMPLOYEE 테이블에서 조회 가능
/*
직원번호 직원명 부서코드
200	선동일	D9
201	송종기	D9
202	노옹철	D9
*/
-- 부서명은 DEPARTMENT 테이블에서 조회 가능
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT;
/*
부서코드 부서명
D9	총무부
*/

-- JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블 한번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);
/*
EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
직원ID, 이름, 부서코드, 부서ID, 부서명을 조회하는 쿼리

JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN은 단순히 테이블을 두 개 붙이는 것이 아닌 기준을 삼은 테이블의 한 컬럼을 지정해 
다른 테이블의 한 컬럼과 같은 행을 찾아 기준 테이블 옆에 한 행씩 붙여나가는 것

EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
200	    선동일	    D9	    D9	    총무부
201	    송종기	    D9	    D9	    총무부
202	    노옹철	    D9	    D9	    총무부
*/

-- 1. 내부 조인 INNER JOIN
--> 연결되는 컬럼의 값이 일치하는 행들만 조인됨
--> 일치하는 값이 없는 행은 조인에서 제외

-- 작성 방법 ANSI | ORACLE 로 나뉨

-- ANSI 표준 구문
--> 구문 기준을 정할 때 정의되는 기준
--> 가장 유명한 표준 ASCII 코드
-- (ANSI) JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블 한번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);


-- ORACLE 표준 구문
--> FROM 절에 , 로 구분해서 합칠 테이블 명을 기술
--> WHERE 절에 합치기에 사용할 컬럼명 명시

-- 1) 연결에 사용할 두 컬럼명이 다른 경우 --> JOIN ON 을 사용
-- 오라클에서는 JOIN ON을 사용하지 않고 WHERE 절에 = 만 사용하면 됨

-- (ORACLE) JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블 한번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

SELECT DEPT_TITLE,LOCATION_ID,LOCAL_CODE,LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

SELECT DEPT_TITLE,LOCAL_NAME
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

/*
연결에 사용할 두 컬럼이 다른 경우 -> JOIN ON
연결에 사용할 두 컬럼이 같은 경우 -> JOIN USING

-- 2) 연결에 사용할 두 컬럼명이 같은 경우 --> JOIN USING을 사용
FROM 테이블명
JOIN 테이블명 USING(같은컬럼명)
*/
SELECT EMP_ID,EMP_NAME,JOB_CODE,JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

SELECT EMP_ID,EMP_NAME,J.JOB_CODE,JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

/* 
NATURAL JOIN(자연조인) JOIN에 별칭을 설정해서 테이블 표현하기 
동일한 타입과 이름을 가진 컬럼이 있는 테이블 간의 조인을 간단히 표현한 방법
반드시 두 테이블 간에 동일한 컬럼명, 타입을 가진 컬럼이 필요
없을 경우 교차 조인이 됨

EMPLOYEE.JOB_CODE (CHAR(2))
     JOB.JOB_CODE (CHAR(2))
     -> 컬럼명, 자료형이 모두 일치 == 자연조인 대상
    
SELECT 컬럼명, 컬럼명, 컬럼명, ...
FROM 테이블명
NATURAL JOIN 테이블명
     
JOIN에 별칭을 설정해서 테이블 표현하기
JOIN과 FROM 에서 테이블을 설정할 때 쿼리를 좀 더 간결하고 읽기 쉽게 만드는 방법
테이블을 다수 여러개 참조할 때 유용

사용방법
1) SELECT 테이블명.컬럼명, 테이블명.컬럼명
   FROM 테이블명, 테이블명
   WHERE 테이블명.컬럼명 = 테이블명.컬럼명;
   
2) SELECT A.컬럼명, B.컬럼명
   FROM 테이블명 A, 테이블명 B
   WHERE A.컬럼명 = B.컬럼명;
*/



























