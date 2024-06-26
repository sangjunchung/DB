/*함수 실습 코드*/
-- LENGTH --
SELECT EMP_NAME,LENGTH(EMP_NAME) AS "이름_길이" 
FROM employee;

SELECT EMP_ID,EMP_NAME,EMAIL,LENGTH(EMAIL) AS "이메일_길이"
FROM employee;

SELECT EMP_ID,EMP_NAME,PHONE
FROM employee
WHERE LENGTH(PHONE) = 11;

SELECT EMP_NAME,EMAIL,LENGTH(EMAIL) AS "이메일_길이"
FROM employee
WHERE LENGTH(EMAIL) >= 12;

SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE LENGTH(DEPT_CODE) = 2;

SELECT EMP_ID,EMP_NAME,PHONE
FROM employee
WHERE INSTR(PHONE, '010') > 0;

SELECT EMP_ID,EMP_NAME,PHONE
FROM employee
WHERE PHONE LIKE '010%';

-- SUBSTR 예제 --
SELECT EMP_NAME,SUBSTR(EMP_NAME,1,3) AS "이름_석자"
FROM employee;

-- 앞에서부터 값을 가지고 올 때는 + 를 작성해주지만
-- 뒤에서부터 값을 가지고 오길 원할 때는 - 를 작성
SELECT PHONE,SUBSTR(PHONE, LENGTH(PHONE)-3, 4) AS "마지막_네_자리"
FROM employee
WHERE PHONE IS NOT NULL; 

SELECT EMP_NAME,EMP_NO,SUBSTR(EMP_NO,1,INSTR(EMP_NO, '-')-1) AS "생년월일"
FROM employee;

SELECT PHONE,SUBSTR(PHONE,1,3) AS "앞 세자리"
FROM employee
WHERE PHONE IS NOT NULL;

SELECT EMP_NAME,EMAIL,SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) AS "도메인"
FROM employee;

-- 올림
SELECT CEIL(AVG(SALARY))
FROM employee;

-- 반올림
SELECT ROUND(AVG(SALARY))
FROM employee;

-- 내림
SELECT FLOOR(AVG(SALARY))
FROM employee;

SELECT COUNT(EMP_ID) AS "총 직원 수"
FROM employee;

SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

SELECT COUNT(BONUS)
FROM employee
WHERE BONUS IS NOT NULL;

-- AVG --
SELECT AVG(SALARY) AS "평균 급여"
FROM employee;

SELECT DEPT_CODE AS "부서",AVG(SALARY) AS "평균급여"
FROM employee group by DEPT_CODE;
/*
ORA-00937: not a single-group group function
사용하려면 추후 GROUP BY 를 사용해야함
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
76행, 8열에서 오류 발생
*/

SELECT AVG(SALARY) AS "D5 부서 평균 급여"
FROM employee
WHERE DEPT_CODE = 'D5';

-- REPLACE 활용 실습 --
SELECT EMP_ID,EMAIL,REPLACE(EMAIL,'.','-') AS "수정된 이메일"
FROM employee;

SELECT EMP_NAME,EMP_NO,REPLACE(EMP_NO,'-','') AS "수정된주민번호"
FROM employee;

SELECT EMP_NAME,REPLACE(EMP_NAME,'김','KIM') AS "수정된이름"
FROM employee;

SELECT EMP_ID,JOB_CODE,REPLACE(JOB_CODE,'J','JOB') AS "수정된 직무코드"
FROM employee;
