-- 1
SELECT STUDENT_NAME AS "학생 이름", STUDENT_ADDRESS AS "주소지"
FROM TB_STUDENT
ORDER BY 1 ASC;

-- 2
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY 2 DESC;

-- 3
SELECT STUDENT_NAME AS "학생이름", STUDENT_NO AS "학번", STUDENT_ADDRESS AS "거주지 주소"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '강원%' OR STUDENT_ADDRESS LIKE '경기%')
AND STUDENT_NO NOT LIKE 'A%'
ORDER BY 1 ASC;

-- 4 / 005 법학과
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = '005'
ORDER BY 2 ASC;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR TP, TB_DEPARTMENT TD
WHERE TP.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND TP.DEPARTMENT_NO = '005'
ORDER BY 2 ASC;

-- 5
SELECT TO_CHAR(POINT, 'FM9.00'), STUDENT_NO
FROM TB_GRADE
WHERE TERM_NO = '200402'
AND CLASS_NO = 'C3118100'
ORDER BY 1 DESC, 2 ASC;

-- 6
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT TS
JOIN TB_DEPARTMENT TD ON (TS.DEPARTMENT_NO = TD.DEPARTMENT_NO)
ORDER BY 2 ASC;

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT TS, TB_DEPARTMENT TD
WHERE TS.DEPARTMENT_NO = TD.DEPARTMENT_NO
ORDER BY 2 ASC;

-- 7
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS TC
JOIN TB_DEPARTMENT TD ON (TC.DEPARTMENT_NO = TD.DEPARTMENT_NO);

SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS TC, TB_DEPARTMENT TD
WHERE TC.DEPARTMENT_NO = TD.DEPARTMENT_NO;

-- 8
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR TCP
JOIN TB_CLASS TC ON (TCP.CLASS_NO = TC.CLASS_NO)
JOIN TB_PROFESSOR TP ON (TCP.PROFESSOR_NO = TP.PROFESSOR_NO);

SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR TCP, TB_CLASS TC, TB_PROFESSOR TP
WHERE TCP.CLASS_NO = TC.CLASS_NO
AND tcp.professor_no = tp.professor_no;

-- 9
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR TCP
JOIN TB_CLASS TC ON (TCP.CLASS_NO = TC.CLASS_NO)
JOIN TB_PROFESSOR TP ON (TCP.PROFESSOR_NO = TP.PROFESSOR_NO)
JOIN TB_DEPARTMENT TD ON (TC.DEPARTMENT_NO = TD.DEPARTMENT_NO)
WHERE TD.CATEGORY = '인문사회'
ORDER BY 1 ASC;

SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR TCP, TB_CLASS TC, TB_PROFESSOR TP, TB_DEPARTMENT TD
WHERE TCP.CLASS_NO = TC.CLASS_NO
AND TCP.PROFESSOR_NO = TP.PROFESSOR_NO
AND TC.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND TD.CATEGORY = '인문사회'
ORDER BY 1 ASC;

-- 10 059 음악학과
SELECT STUDENT_NO AS "학번", STUDENT_NAME AS "학생 이름", ROUND(AVG(POINT), 1) AS "전체 평점"
FROM TB_STUDENT 
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY STUDENT_NO, student_name;

SELECT TS.STUDENT_NO AS "학번", STUDENT_NAME AS "학생 이름", ROUND(AVG(TG.POINT), 1) AS "전체 평점"
FROM TB_STUDENT TS, TB_GRADE TG, TB_DEPARTMENT TD 
WHERE ts.student_no = tg.student_no
AND ts.department_no = td.department_no
AND TD.DEPARTMENT_NAME = '음악학과'
GROUP BY TS.STUDENT_NO, student_name;

-- 11
SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME
FROM TB_STUDENT TS
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_PROFESSOR TP ON(ts.coach_professor_no = tp.professor_no)
WHERE STUDENT_NO = 'A313047';

SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME
FROM TB_STUDENT TS, TB_DEPARTMENT TD, TB_PROFESSOR TP
WHERE TS.DEPARTMENT_NO = td.department_no
AND ts.coach_professor_no = tp.professor_no
AND STUDENT_NO = 'A313047';

-- 12
SELECT STUDENT_NAME, 
    DECODE(SUBSTR(TERM_NO,6,1), '1','1학기','2','2학기','3','3학기') AS "수강학기"
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_CLASS USING (DEPARTMENT_NO)
WHERE CLASS_NAME = '인간관계론'
AND SUBSTR(TERM_NO,1,4) = '2007';

SELECT STUDENT_NAME, 
    DECODE(SUBSTR(TERM_NO,6,1), '1','1학기','2','2학기','3','3학기') AS "수강학기"
FROM TB_STUDENT TS, TB_GRADE TG, TB_CLASS TC
WHERE ts.student_no = tg.student_no
AND ts.department_no = tc.department_no
AND CLASS_NAME = '인간관계론'
AND SUBSTR(TERM_NO,1,4) = '2007';

-- 13
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
WHERE CATEGORY = '예체능'
AND PROFESSOR_NO IS NULL;

SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS TC, TB_DEPARTMENT TD, TB_CLASS_PROFESSOR TCP
WHERE TC.DEPARTMENT_NO = td.department_no
AND tc.class_no = tcp.class_no(+)
AND CATEGORY = '예체능'
AND PROFESSOR_NO IS NULL;

-- 14
SELECT TS.STUDENT_NO,TS.STUDENT_NAME,NVL(TP.PROFESSOR_NAME, '지도교수 미지정')
FROM TB_STUDENT TS
LEFT JOIN TB_PROFESSOR TP ON (TS.COACH_PROFESSOR_NO = TP.PROFESSOR_NO)
JOIN TB_DEPARTMENT TD ON (TS.DEPARTMENT_NO = td.department_no)
WHERE TD.DEPARTMENT_NAME = '서반아어학과';

SELECT TS.STUDENT_NO,TS.STUDENT_NAME,NVL(TP.PROFESSOR_NAME, '지도교수 미지정')
FROM TB_STUDENT TS, TB_PROFESSOR TP, TB_DEPARTMENT TD
WHERE TS.COACH_PROFESSOR_NO = TP.PROFESSOR_NO(+)
AND TS.DEPARTMENT_NO = td.department_no
AND TD.DEPARTMENT_NAME = '서반아어학과';

-- 15
SELECT TS.STUDENT_NO, TS.STUDENT_NAME, TS.DEPARTMENT_NO, TD.DEPARTMENT_NAME, ROUND(AVG(TG.POINT),1)
FROM TB_STUDENT TS
JOIN TB_DEPARTMENT TD ON (TS.DEPARTMENT_NO = TD.DEPARTMENT_NO)
JOIN TB_GRADE TG ON (TS.STUDENT_NO = TG.STUDENT_NO) 
WHERE TS.ABSENCE_YN = 'N'
group by TS.STUDENT_NO, TS.STUDENT_NAME, TS.DEPARTMENT_NO, TD.DEPARTMENT_NAME
HAVING ROUND(AVG(TG.POINT), 1) > 4.0;

SELECT TS.STUDENT_NO, TS.STUDENT_NAME, TS.DEPARTMENT_NO, TD.DEPARTMENT_NAME, ROUND(AVG(TG.POINT),1)
FROM TB_STUDENT TS,  TB_DEPARTMENT TD, TB_GRADE TG
WHERE TS.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND TS.STUDENT_NO = TG.STUDENT_NO
AND TS.ABSENCE_YN = 'N'
group by TS.STUDENT_NO, TS.STUDENT_NAME, TS.DEPARTMENT_NO, TD.DEPARTMENT_NAME
HAVING ROUND(AVG(TG.POINT), 1) > 4.0;

-- 16
SELECT CLASS_NAME, TRUNC(AVG(POINT),2)
FROM TB_CLASS TC
JOIN TB_GRADE TG ON(tc.class_no = tg.class_no)
JOIN TB_DEPARTMENT TD ON (TC.DEPARTMENT_NO = TD.DEPARTMENT_NO)
WHERE td.department_name = '환경조경학과'
GROUP BY TC.CLASS_NAME;

SELECT CLASS_NAME, TRUNC(AVG(POINT),2)
FROM TB_CLASS TC, TB_GRADE TG, TB_DEPARTMENT TD
WHERE tc.class_no = tg.class_no
AND TC.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND td.department_name = '환경조경학과'
GROUP BY TC.CLASS_NAME;

-- 17
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE department_no = '038'
AND student_name != '최경희';

-- 18
SELECT STUDENT_NAME,TS.STUDENT_NO, MAX(AVG(TG.POINT))
FROM TB_STUDENT TS, TB_DEPARTMENT TD, TB_GRADE TG
WHERE TS.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND TS.STUDENT_NO = tg.student_no
AND TD.DEPARTMENT_NAME = '국어국문학과'
GROUP BY STUDENT_NAME,TS.STUDENT_NO;

-- 19
SELECT TD.DEPARTMENT_NAME AS "계열 학과명", ROUND(AVG(TG.POINT), 1) AS "전공평점"
FROM TB_CLASS TC
JOIN TB_DEPARTMENT TD ON (TC.DEPARTMENT_NO = TD.DEPARTMENT_NO)
JOIN TB_GRADE TG ON (TC.CLASS_NO = TG.CLASS_NO)
WHERE TD.CATEGORY = '자연과학'
GROUP BY TD.DEPARTMENT_NAME;

SELECT TD.DEPARTMENT_NAME AS "계열 학과명", ROUND(AVG(TG.POINT), 1) AS "전공평점"
FROM TB_CLASS TC, TB_DEPARTMENT TD, TB_GRADE TG
WHERE TC.DEPARTMENT_NO = TD.DEPARTMENT_NO
AND TC.CLASS_NO = TG.CLASS_NO
AND TD.CATEGORY = '자연과학'
GROUP BY TD.DEPARTMENT_NAME;




