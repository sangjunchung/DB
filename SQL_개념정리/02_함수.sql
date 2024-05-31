/*
함수
컬럼값이나 지정된 값을 읽어 연산한 결과를 반환하는 것

단일 행 함수 : N 개의 행의 컬럼 값을 전달하여 N개의 결과가 반환

그룹 함수 : N 개의 행의 컬럼 값을 전달하여 1개의 결과가 반환
            (그룹의 수가 늘어나면 그룹의 수만큼 결과를 반환)
            
함수는 SELECT절, WHERE절, ORDER BY절, GROUPT BY절, HAVING절에서 사용 가능

SELECT절 : 찾는 기준이 아닌, 눈으로 표기되는 총 합이나 계산 결과 등에 대한 것을 눈으로 봤을 때
           정리해놓은 컬럼
           -> 정리해서 보여주자
           
WHERE절 : 찾는 조건이 되는 행을 작성해줌
          길이, 크기, 결과가 조건에 부합하는 결과만 볼 수 있도록 설정
          -> 내가 원하는 조건만 보여줘
*/

/*
단일행 함수
    문자열 관련 함수
    LENGTH (문자열|컬럼명) : 문자열의 길이 반환
*/
SELECT 'HELLO WORLD', LENGTH('HELLO WORLD') FROM DUAL;

SELECT EMP_NAME,EMAIL,LENGTH(EMAIL) AS "이메일 길이" 
FROM employee 
WHERE LENGTH(EMAIL) <= 12 
ORDER BY "이메일 길이";

/*
    INSTR(문자열|컬럼명,'찾을 문자열',찾는 것을 시작할 위치,순번)
    찾을 시작 위치부터 지정된 순번째 찾은 문자열의 시작 위치를 반환
    
    LIKE와 INSTR의 차이점
    LIKE - @가 들어갔는지 검색
    INSTR - @가 몇 번째에 있습니까?
    
    문자열에서 맨 앞에 있는 'B'의 위치를 조회
*/
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B')
FROM DUAL;
-- 처음 B가 나타나는 위치를 찾아줌

SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B',5)
FROM DUAL;
-- 5번째 위치부터 B를 찾기시작해서, 그다음 B의 위치인 9번째에 있는 B를 찾음

SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B',5,2)
FROM DUAL;
-- 5번째 위치부터 B를 찾기시작해서, 그다음 2번째 B의 위치인 10이 나옴

/*
    SUBSTR(문자열|컬럼명, 시작위치,길이)
    문자열을 시작 위치부터 지정된 길이만큼 잘라내서 반환
    길이를 작성하지 않은 경우 시작 위치부터 끝까지 잘라내서 반환
    
    시작 위치, 자를 길이 지정
*/
SELECT SUBSTR('ABCDE', 2,3)
FROM DUAL;
-- 문자열의 2번째 위치부터(포함) 3 길이의 문자열을 잘라냄

SELECT SUBSTR('ABCDE', 4)
FROM DUAL;
-- 문자열의 4번째 위치부터 문자열 끝까지 잘라냄

SELECT EMP_NAME,SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "이메일 아이디"
FROM employee
ORDER BY "이메일 아이디";

-- 앞에서부터 값을 가지고 올 때는 + 를 작성해주지만
-- 뒤에서부터 값을 가지고 오길 원할 때는 - 를 작성
SELECT PHONE,SUBSTR(PHONE, LENGTH(PHONE)-3, 4) AS "마지막_네_자리"
FROM employee
WHERE PHONE IS NOT NULL; 

/*
    그룹 관련 함수
    COUNT : 행의 총 개수를 셀 때 사용하는 함수
    
    COUNT 사용 방법
    COUNT(*) : 조회된 모든 행의 개수 반환 
            -> 이름, 주소와 같은 항목이 몇개 있는가?
            
    COUNT(컬럼명) : 지정된 컬럼 값이 NULL이 아닌 행의 개수 반환(NULL은 제외하고 개수를 작성)
            -> 00개 조회되었습니다. 검색한 내열 총 몇개인가?
            
    COUNT(DISTINCT 컬럼명) : 지정된 컬럼에서 중복 값을 제외한 행의 개수 반환
*/
SELECT COUNT(*)
FROM employee;

SELECT COUNT(*)
FROM employee
WHERE PHONE IS NOT NULL;

SELECT COUNT(PHONE)
FROM employee;

/*
    AVG 평균
*/
SELECT AVG(SALARY)
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

/*
    TRIM
    공백 관련 함수
    
    TRIM([[옵션]문자열|컬럼명 FROM] 문자열|컬럼명)
    주어진 문자열의 앞쪽|뒤쪽|양쪽에 존재하는 지정된 문자열 제거
    
    옵션 앞쪽(LEADING)
        뒤쪽(TRAILING)
        양쪽(BOTH - 기본값)
*/
SELECT '      점       심      ',TRIM(LEADING '  ' FROM'      점       심      ')
FROM DUAL;
/*
TRIM 의 경우 문자열 1개만 가능
LEADING '  ' 작은 따옴표 안에 공백 2개 들어감

ORA-30001: trim set should have only one character
30001. 00000 -  "trim set should have only one character"
*Cause:    Trim set contains more or less than 1 character. This is not
           allowed in TRIM function.
*/
-- 앞쪽 공백 제거
SELECT '      점       심      ',TRIM(LEADING ' ' FROM'      점       심      ') AS "앞쪽"
FROM DUAL;

-- 뒤쪽 공백 제거
SELECT '      점       심      ',TRIM(TRAILING ' ' FROM'      점       심      ') AS "뒤쪽"
FROM DUAL;
-- 육안상 뒤쪽 공백 제거한 것이 보이지 않을 수 있으나 뒤쪽 공백이 제거된 상태에서 출력

SELECT '      점       심      ',TRIM(BOTH ' ' FROM'      점       심      ') AS "양쪽"
FROM DUAL;

-- 앞, 뒤, 양쪽 공백 제거 한번에 사용하기
SELECT '      점       심      ',
TRIM(LEADING ' ' FROM'      점       심      ') AS "앞쪽",
TRIM(TRAILING ' ' FROM'      점       심      ') AS "뒤쪽",
TRIM(BOTH ' ' FROM'      점       심      ') AS "양쪽"
FROM DUAL;

/*
    REPLACE : 특정 문자열을 대체할 때 사용
    
    사용방법
    (문자열|컬럼명, 찾을 문자열, 바꿀 문자열)
*/
SELECT *
FROM national;

SELECT NATIONAL_CODE,NATIONAL_NAME,REPLACE(NATIONAL_NAME,'한국','대한민국')
FROM NATIONAL;








