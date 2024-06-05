/*
선택함수
    여러가지 경우에 따라 알맞은 결과를 선택하는 함수
    IF, SWITCH 와 비슷
    
    DECODE(컬럼명| 계산식, 조건1, 결과1, 조건2, 결과2, ... [아무것도 만족 X])
        컬럼명| 계산식의 값이 일치하는 조건이 있으면 해당 오른쪽에 작성된 결과 반환
*/

-- 예제 1)
-- EMPLOYEE 테이블에서 모든 사원의 이름, 주민번호, 성별 조회
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1), '1','남자','2','여자') AS "성별"
FROM EMPLOYEE;

/*
CASE
    WHEN 조건1 THEN 결과1,
    WHEN 조건2 THEN 결과2,
    WHEN 조건3 THEN 결과3
    ELSE 결과
END

-- DECODE 계산식|컬럼 값이 딱 떨어지는 경우 사용 가능
-- CASE 계산식|컬럼 값이 범위여도 사용 가능
*/

-- 예제 1)
-- EMPLOYEE 테이블에서 사번, 이름, 급여, 구분을 조회
-- 구분 받는 급여에서 초급 중급 고급 조회
-- 급여가 500만 이상 고급 500만 미만 300만 이상 중급 300만 미만 초급
SELECT EMP_ID, EMP_NAME, SALARY, 
       CASE
            WHEN SALARY >= 5000000 THEN '고급'
            WHEN SALARY >= 3000000 THEN '중급'
            ELSE '초급'
       END AS "구분"
FROM EMPLOYEE;












