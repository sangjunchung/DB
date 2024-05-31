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

SELECT * FROM employee2
WHERE EMP_ID = 800;

INSERT INTO department2
VALUES ('D0', '개발운영부', 'L1');

ROLLBACK;

-- INSERT 에서 특정 부분을 선택해서 넣을 때는 컬럼명을 작성해서 넣어줌
-- INSERT INTO 테이블명(컬럼명1,컬럼명2,...) VALUES(컬럼명1의값,컬럼명2의값,...)

/*
    UPDATE
    테이블에 기록된 컬럼의 값을 수정하는 구문
    업데이트를 사용하는 예제 : 회원정보수정(핸드폰번호,주소,아이디,비밀번호 변경), 
                          사업자-상품수정(수량,이름,설명 등)
    
    [작성법]
    UPDATE 테이블명 SET 컬럼명 = 변경할값;
    [WHERE 컬럼명 비교연산자 비교값]; <- 필수 X
*/
SELECT * FROM department2
WHERE dept_id = 'D9';

UPDATE department2 SET dept_title = '전략기획실'
WHERE dept_id = 'D9';

SELECT * FROM department2
WHERE dept_id = 'D9';

-- 저장을 원한다면 COMMIT / 되돌리기를 원한다면 ROLLBACK
ROLLBACK;

-- 조건을 설정하지 않고 모든 행의 컬럼 값을 변경
-- UPDATE 테이블명 SET 컬럼명 = 변경할내용;

-- 여러 컬럼을 한번에 수정할 경우 콤마(,)로 컬럼을 구분해서 수정
-- D2 / 회계관리부 -> D0 / 회계관리팀
UPDATE DEPARTMENT2 SET DEPT_ID = 'D0', DEPT_TITLE = '회계관리팀'
WHERE DEPT_ID ='D2';

SELECT * FROM DEPARTMENT2;

ROLLBACK;

-- UPDATE 한 번에 여러 컬럼 업데이트
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE3 
SET EMAIL = 'ONE_SUN@or.kr', PHONE = '01012345678'
WHERE EMP_ID = 200;

SELECT EMP_ID,EMAIL,PHONE FROM EMPLOYEE3;

ROLLBACK;

/*
    DELETE 삭제하기
    테이블 안에 존재하는 값들을 삭제하는 구문
    
    [작성법]
    DELETE FROM 테이블명 WHERE 조건설정;
    만약 WHERE 조건을 설정하지 않으면 모든 행이 다 삭제됨
    
    DELETE FROM 테이블명; -> 테이블 안에 있는 모든 내용 삭제
    DELETE FROM 테이블명 WHERE 컬럼명 = 삭제할컬럼값;
        -> 테이블 안에서 특정한 컬럼 값에 해당하는 줄을 모두 삭제
        
    -- 완전 삭제 -> COMMIT
    -- 되돌리기(복구) -> ROLLBACK
    
    주의할점 : 
    DELETE 는 TABLE 안에 있는 내용을 삭제
    DROP 은 TABLE 자체를 삭제
*/
