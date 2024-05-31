/*
올림 : CEIL
반올림 : ROUND
버림 : FLOOR
오름차순 : ASC (ASCENDING)
내림차순 : DESC (DESCENDING)

자료형
NUMBER : 숫자형(정수, 실수)
         실수 자리 : 소수자리 몇 번째까지 가능한지
         NUMBER(2,2) : (0~99, 0.99); 0.0 ~ 99.99 까지 가능

CHAR(크기) : 고정길이 문자형 -> 현재 사용 거의 하지 않음

VARCHAR : 이전 버전, 사용 많이 하지 않음

VARCHAR2 : 최신버전, 제일 많이 사용
           가변길이 문자형
           
    CHAR  VS  VARCHAR2
    고정         가변
EX) CHAR(10 BYTE) VARCHAR2(10 BYTE)
    CHAR = 1; -> 1 하나를 넣는데 10을 모두 사용
    VARCHAR2 = 1; -> 1 하나를 넣으면 나머지 99를 돌려줌
    
VARCHAR2 같은 경우 공간 확보는 하되, 사용하지 않은 크기는 돌려줌

DATE : 날짜 타입

CLOB : 메일, 장문, 소설 등 VARCHAR2에서 감당하지 못할 크기의 글 내용을
       삽입할 때 사용
       
BLOB : 이미지, 동영상과 같은 파일 저장할 때 사용

영어, 숫자, 특수문자 == 1 BYTE
이외 문자(한글 포함) == 3 BYTE
*/

/*
PRIMARY KEY (기본키)
    테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
    NOT NULL + UNIQUE (한 행에서 COLUMN 에서 하나만 존재, 똑같은 모양의 데이터는 존재해선 안됨)
    
    한 테이블에서 한 개만 설정
    
    컬럼 레벨, 테이블 레벨 설정 가능함
*/

/*
테스트를 진행하거나 컬럼에 대한 설정을 변경한 후 특정한 내용을 확인하길 원한다면
테이블을 복제해서 사용할 수 있음(사본 만들기)

사본 만들기를 진행하는 방법
    모두 동일하게 사본 만들기
    CREATE TABLE 새로운테이블명 AS SELECT * FROM 복사할테이블이름;
    
    특정한 컬럼만 선택해서 사본 만들기
    CREATE TABLE 새로운테이블명 AS SELECT 원하는컬럼명 FROM 복사할테이블이름;
*/

CREATE TABLE EMPLOYEE2 AS SELECT * FROM employee;
-- 테이블을 만들 때 다른 테이블과 동일하게 (컬럼,데이터값) 복사, 붙여넣기 진행할 때는
-- CREATE TABLE 테이블명 AS 복사하고 싶은 테이블 SELECT

-- 복사한 테이블이 제대로 만들어졌는지 확인하기
SELECT * FROM 새로만들테이블명;

/*
DML : 데이터 조작 언어
테이블의 값을 삽입하거나 수정하거나 삭제하는 구문

INSERT : 삽입

UPDATE : 수정

DELETE : 삭제

한 후에 반드시 COMMIT 이나 ROLLBACK을 진행할 것

COMMIT ROLLBACK - 팀원이나 다른 사람과 상의 후 진행
개발 연습때는 단독으로 진행해도 좋음
*/
