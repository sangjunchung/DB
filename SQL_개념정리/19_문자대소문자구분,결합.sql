/*
LOWER / UPPER / INITCAP

컬럼의 문자 혹은 문자열을 소문자 대문자 첫글자만 대문자로 변환해서 반환
*/

-- 사용법 LOWER : 모두 소문자로 변환해서 적용
SELECT LOWER('wELCOME tO mY wORLD') FROM DUAL;
-- 결과 : welcome to my world

-- 사용법 UPPER : 모두 대문자로 변환해서 적용
SELECT UPPER('wELCOME tO mY wORLD') FROM DUAL;
-- 결과 : WELCOME TO MY WORLD

-- 사용법 INITCAP : 첫 글자만 대문자로 변환해서 적용
SELECT INITCAP('wELCOME tO mY wORLD') FROM DUAL;
-- 결과 : Welcome To My World

-- 문자 처리 함수 CONCAT
/*
CONCAT : 컬럼의 문자 혹은 문자열을 두 개 전달 받아 하나로 합친후 반환

[작성법]
CONCAT(STRING, STRING)
*/

-- 가상테이블 사용해서 확인
SELECT CONCAT('가나다라','ABCD') FROM DUAL;

SELECT '가나다라'||'ABCD' FROM DUAL;

/* CONCAT 함수와 || 연사자 차이 
CONCAT : 두 개의 문자열을 결합, 두 개 초과는 불가
        -> 성 + 이름 붙일 때
        
        [작성법]
        CONCAT(STRING1, STRING2)

|| : 두 개 이상의 문자열 결합할 때 사용
        
        [작성법]
        STRING1 || STRING2 || STRING3 ... 여러개 결합 가능
*/



















