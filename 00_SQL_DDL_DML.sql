/*
DDL 
SQL을 관리하고 구조를 정의하기 위한 명령어의 집합

CREATE ALTER DROP

CREATE : USER ID를 만들거나, TABLE을 만들 때 대표적으로 많이 사용
ALTER : USER에 대한 정보나, TABLE명을 수정할 때 사용
DROP : USER에 대한 정보를 삭제하거나, TABLE명을 삭제할 때 사용

DML
데이터 베이스의 데이터를 조작하기 위한 SQL 명령어의 집합

INSERT UPDATE DELETE SELECT 등이 존재

INSERT : TABLE에 새로운 행을 삽입(ROW 삽입)
기본 문법 : INSERT INTO TABLE명 (컬럼1, 컬럼2, 등등) VALUES (값1, 값2, 등등);

UPDATE : TABLE의 기존 데이터를 수정
기본 문법 : UPDATE TABLE명 SET 컬럼1 = 변경할값1, 컬럼2 = 변경할값2, ... WHERE 조건;

DELETE : TABLE에서 데이터를 삭제
기본 문법 : DELETE TABLE명 WHERE 조건;
테이블에서 삭제하고자 하는 조건을 선택해서 삭제

SELECT : TABLE에서 데이터 조회
기본 문법 : SELECT *(모두 선택) FROM TABLE명;
          TABLE에 적혀있는 모든 내용을 보겠다 라는 의미
          SELECT 컬럼명1, 컬럼명2, ... FROM TABLE명;
          테이블에서 원하는 컬럼을 선택해서 보겠다 라는 의미
          SELECT 컬럼명1 AS 별칭1, 컬럼명2 AS 별칭2, FROM TABLE명;
          테이블에서 원하는 컬럼에 별칭을 붙여 출력하겠다 라는 의미

*/