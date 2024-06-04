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

SELECT
    *
FROM
    employee;

SELECT
    *
FROM
    department;

SELECT
    *
FROM
    job;

SELECT
    emp_name,
    hire_date
FROM
    employee;

/*
컬럼값 산술 연산
    컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
    
    SELECT 문 작성시 컬럼명에 산술 연산을 직접 작성하면
    조회결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/
-- EMPLOYEE TABLE 에서 모든 사원의 이름, 급여, 급여+100만 조회
SELECT
    emp_name,
    salary,
    salary + 1000000
FROM
    employee;
-- AS 의 경우 큰 따옴표("")를 사용해서 표기
SELECT
    emp_name,
    salary,
    salary + 1000000 AS "100만원인상추가"
FROM
    employee;

SELECT
    emp_id,
    emp_name,
    salary * 12 AS "연봉"
FROM
    employee;

SELECT
    emp_id,
    emp_name,
    salary * 6 AS "상반기 급여"
FROM
    employee;

SELECT
    dept_code,
    emp_name,
    email
FROM
    employee
WHERE
    dept_code = 'D9';

SELECT
    emp_name,
    email
FROM
    employee
WHERE
    dept_code = 'D1';

SELECT
    emp_name,
    phone,
    email
FROM
    employee
WHERE
    dept_code = 'D4';
-- WHERE 에서 조회한 조건에 부합하는 대상이 없는 경우 값이 나오지 않음 = 0;
-- IS NULL 을 사용하면 없는 사람을 조회할 수 있음
SELECT
    dept_code,
    emp_name,
    email,
    phone
FROM
    employee
WHERE
    dept_code IS NULL;

SELECT
    *
FROM
    employee
WHERE
    dept_code IS NULL;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus IS NULL;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    sal_level = 'S5';

SELECT
    *
FROM
    employee
WHERE
    emp_id = '210';

SELECT
    emp_name,
    email
FROM
    employee
WHERE
    email IS NOT NULL;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus >= '0.2';

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    salary BETWEEN 3000000 AND 4000000;

SELECT
    emp_name,
    salary
FROM
    employee
ORDER BY
    salary DESC;
-- 글자체계 오름차순 ㄱ부터 ㅎ까지 작성하기 A-Z
-- 글자체계 내림차순 ㅎ부터 ㄱ까지 작성하기 Z-A
SELECT
    emp_name
FROM
    employee
ORDER BY
    emp_name ASC;

SELECT
    emp_id,
    emp_name,
    dept_code
FROM
    employee
WHERE
    salary > 3000000;

SELECT
    emp_name,
    salary * 12 AS "연봉"
FROM
    employee
WHERE
    salary * 12 <= 50000000;

SELECT
    emp_name,
    dept_code,
    phone
FROM
    employee
WHERE
    dept_code != 'D9';

SELECT
    emp_name,
    dept_code,
    salary
FROM
    employee
WHERE
        dept_code = 'D6'
    AND salary > 3000000;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
        dept_code = 'D6'
    AND job_code = 'J3';

-- 날짜 범위 비교
-- EMPLOYEE TABLE 에서 입사일이 2000-01-01 부터 2000-12-31 사이인 사원의 이름, 입사일 조회
SELECT
    emp_name,
    hire_date
FROM
    employee
WHERE
    hire_date BETWEEN TO_DATE('2000-01-01', 'YYYY-MM-DD') AND TO_DATE('2000-12-31', 'YYYY-MM-DD');

SELECT
    emp_name,
    hire_date
FROM
    employee
WHERE
    hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');

SELECT
    emp_name,
    phone
FROM
    employee
WHERE
    phone LIKE '010%';

SELECT
    emp_name,
    email
FROM
    employee
WHERE
    email LIKE '_____@%';

SELECT
    emp_id,
    emp_name,
    email
FROM
    employee
WHERE
    email LIKE '____%';
-- ESCAPE 옵션 : LIKE 의미를 벗어나 단순 문자열로 인식
--  -> 적용 범위 : 특수 문자 뒤 한 글자
SELECT
    emp_id,
    emp_name,
    email
FROM
    employee
WHERE
    email LIKE '___#_%' ESCAPE '#';

/*
_ _ _ : 세글자를 의미

ESCAPE '#' 구분을 지을 것이다.
_ _ _ LIKE 사용하는 3글자만 찾으라는 의미로 구분 짓는 것
_% -> _로 된 글자 찾기

_ _ _ #_%
# 뒤의 _ 를 글자수가 아닌 특수문자 그 자체로 원했기 때문에 #을 넣어준 것
*/

SELECT
    emp_name AS "이름",
    salary   AS "급여"
FROM
    employee;

SELECT
    dept_code AS "부서코드",
    job_code  AS "직무코드"
FROM
    employee;

SELECT
    email AS "이메일",
    phone AS "전화번호"
FROM
    employee;

SELECT
    emp_id    AS "사원ID",
    hire_date AS "입사일"
FROM
    employee;

SELECT
    emp_name  AS "이름",
    dept_code AS "부서",
    salary    AS "급여"
FROM
    employee;

SELECT DISTINCT
    dept_code
FROM
    employee;

SELECT DISTINCT
    job_code
FROM
    employee;

SELECT DISTINCT
    sal_level
FROM
    employee;

SELECT DISTINCT
    manager_id
FROM
    employee;

SELECT DISTINCT
    emp_name
FROM
    employee;

-- OR
SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    dept_code = 'D5'
    OR salary > 2000000;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    dept_code = 'D6'
    OR job_code = 'J3';

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    sal_level = 'S5'
    OR bonus = 0.2;

SELECT
    emp_name,
    hire_date
FROM
    employee
WHERE
    ent_yn = 'N'
    OR hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD')
ORDER BY
    hire_date ASC;
    
SELECT * FROM MENU WHERE MENU_NAME LIKE '카%';
SELECT * FROM MENU WHERE MENU_PRICE = 3500;
SELECT * FROM MENU WHERE MENU_ID = 1;
SELECT * FROM MENU WHERE MENU_DESC LIKE '%카라멜%';
SELECT * FROM MENU ORDER BY MENU_PRICE ASC;