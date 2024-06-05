/* DECODE 실습 */
-- 1) 주어진 학생의 성별 기준으로 성별 출력
SELECT STUDENT_NAME, STUDENT_SSN, DECODE(SUBSTR(STUDENT_SSN,8,1), '1','남자','2','여자') AS "성별"
FROM tb_student;

-- 2)
SELECT EMP_NAME,DEPT_CODE, DECODE(SUBSTR(DEPT_CODE,2,1), '1','인사관리부','2','회계관리부','3','마케팅부','4','국내영업부','기타') AS "부서명"
FROM EMPLOYEE
ORDER BY 2;

-- 3)
SELECT EMP_NAME,JOB_CODE, DECODE(SUBSTR(JOB_CODE,2,1), '1','대표','2','부사장','3','부장','4','차장','5','과장','6','대리','7','사원','알 수 없음') AS "직급명"
FROM EMPLOYEE
ORDER BY 2;

/* CASE WHEN THEN END 실습 */
-- 1) 급여에 따라 등급 설정
-- 600만 이상 S1 / 500만 이상 S2 / 400만 이상 S3 / 나머지 S4
SELECT EMP_NAME, SALARY, 
    CASE
        WHEN SALARY >= 6000000 THEN 'S1'
        WHEN SALARY >= 5000000 THEN 'S2'
        WHEN SALARY >= 4000000 THEN 'S3'
        ELSE 'S4'
    END AS "등급"
FROM EMPLOYEE;

-- 2) 사원의 근무 일 수에 따라 근속 기간 분류하는 CASE
SELECT EMP_NAME,HIRE_DATE,
    CASE
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) >= 20 THEN '20년 이상'
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) >= 10 THEN '10년 이상'
        ELSE '10년 미만'
    END AS "근속년수"
FROM EMPLOYEE;









