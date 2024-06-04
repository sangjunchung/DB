/* 춘 대학교 탐방기 
-- 1. 춘 기술 대학교 학과 이름 계열 조회
-- 컬럼명 학과명, 계열로 표시
*/
SELECT DEPARTMENT_NAME AS "학과 명", CATEGORY AS "계열"
FROM TB_DEPARTMENT;

-- 2. 학고의 학과 정원을 조회
SELECT DEPARTMENT_NAME ||'의 정원은'||CAPACITY||'명 입니다.'
FROM TB_DEPARTMENT;

-- 3. 국문학과에 다니는 여학생 중에 현재 휴학 중인 여학생 조회
-- 국문학과 코드는 DEPARTMENT_NO 001
SELECT * FROM TB_STUDENT;

SELECT * 
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN,8,1) = 2
AND ABSENCE_YN = 'Y'
AND DEPARTMENT_NO = '001';

-- 4. 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시
-- A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

-- 5. 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열 조회
SELECT DEPARTMENT_NAME,CATEGORY, CAPACITY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속학과를 가지고 있음
-- 춘 기술 대학교 총작의 이름을 알아낼 수 있는 SQL 문장 작성
SELECT *
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7. 선수과목이 존재하는 과목들
SELECT CLASS_NO, CLASS_NAME
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 8. DISTINCT 활용해서 춘 대학에는 어떤 카테고리들이 있는지 조회
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;

-- 9. 영문학과(학과코드 002) 학생들의 학번과 이름, 입학년도를
-- 입학년도가 빠른순으로 표시
SELECT * FROM TB_STUDENT;

SELECT STUDENT_NO AS "학번", STUDENT_NAME AS "이름", TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY "입학년도";

-- 10. 춘 대학교 교수 중에 이름이 3글자가 아닌 교수가 2명있음
-- 그 교수의 이름과 주민번호 조회
SELECT PROFESSOR_NAME AS "이름", professor_ssn AS "주민번호"
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

-- 14. 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게되었음
-- 2000년도 이전 학번을 받는 학생들의 학번과 이름 조회
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

-- 15. 학번이 A517178인 한아름 학생의 학점 총 평점 구하기
-- AS 평점 점수 반올림 정수 표기
SELECT STUDENT_NAME, 
      (SELECT ROUND(AVG(POINT),1)
       FROM TB_GRADE G 
       WHERE G.STUDENT_NO = S.STUDENT_NO 
       AND STUDENT_NO = 'A517178') AS "총 평점"
FROM TB_STUDENT S
WHERE STUDENT_NO = 'A517178';
--> 소수점 제거, 소수점 몇자리까지 표기
--> 소수점 1자리까지 표기 ROUND(AVG(POINT),1)

-- 17. 지도 교수를 배정받지 못한 학생의 수 조회
SELECT COUNT(*) AS "학생의 수"
FROM TB_STUDENT
WHERE coach_professor_no IS NULL;

-- 18. 학번이 A112113 인 김고운 학생의 년도 별 평점
-- 화면 AS 년도 AS 년도 별 평점
-- 점수는 반올림해서 소수점 한자리까지만 표기
SELECT SUBSTR(TERM_NO,1,4) AS "년도", ROUND(AVG(POINT),1) AS "평점"
FROM TB_GRADE
WHERE student_no = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

-- 20. 춘 대학교에 다니는 동명이인 학생들의 이름, 동명인 수 조회
SELECT STUDENT_NAME, COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;








