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

-- INSERT UPDATE DELETE 를 위해 연습용 테이블 만들기
CREATE TABLE EMPLOYEE2 AS SELECT * FROM employee;
-- 테이블을 만들 때 다른 테이블과 동일하게 (컬럼,데이터값) 복사, 붙여넣기 진행할 때는
-- CREATE TABLE 테이블명 AS 복사하고 싶은 테이블 SELECT
SELECT * FROM employee2;

-- DEPARTMENT2 테이블을 기존 DEPARTMENT 테이블을 이용해 만들기
CREATE TABLE DEPARTMENT2 AS SELECT * FROM department;
SELECT * FROM department2;

/* 
    INSERT
    테이블에 새로운 행을 추가하는 구문
    1) INSERT INTO 테이블명(컬럼명, 컬럼명, ...) VALUES(데이터, 데이터, ...)
    테이블에 모든 컬럼에 대한 값을 INSERT 할 때 사용
    INSERT 하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략 가능
    단, 컬럼의 순서를 지켜서 VALUES 값에 값을 기입해야함
*/
INSERT INTO employee2 
VALUES(800, '동그라미','870814-2123456','khcafe@or.kr','01076996190','D1','J7','S3',4300000,0.2,200,SYSDATE,NULL,'N');

COMMIT;






