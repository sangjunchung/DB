/*
VIEW
 - 논리적 가상 테이블
 -> 테이블 모양을 하고 있지만, 실제로 값을 저장하고 있진 않음
 
 SELECT 문의 실행된 결과(RESULT SET)를 저장하는 객체
 
 VIEW 사용 목적
 복잡한 SELECT 문을 쉽게 재사용하기 위해
 테이블의 진짜 모습을 감출 수 있어 보안상 유리
 
 VIEW 사용시 주의사항
 가상 테이블(실체 없음)이기 때문에 ALTER 구문 사용 불가
 VIEW 를 이용한 DML(INSERT, UPDATE, DELETE)이 사용 가능한 경우도 있지만
 제약이 많이 따르기 때문에 조회(SELECT) 용도로 많이 사용
 
 VIEW 작성법
 
 CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW 뷰이름 [컬럼 별칭]
 AS 서브쿼리(SELECT 문)
 [WITH CHECK OPTION]
 [WITH READ ONLY];
 
 1) OR REPLACE
    기존 동일한 이름의 VIEW 가 존재하면 이름 변경, 없으면 새로 생성
 2) FORCE|NOFORCE
    FORCE : 서브 쿼리에 사용된 테이블이 존재하지 않아도 뷰를 생성
    NOFORCE : 기본값, 서브 쿼리에 사용된 테이블이 존재해야만 뷰가 생성
 
 3) 컬럼 별칭 옵션
    조회되는 VIEW 의 컬럼명 지정
 
 4) WITH CHECK OPTION
    옵션을 지정한 컬럼의 값을 수정 불가능하게함
    
 5) WITH READ ONLY
    뷰에 대해 SELECT 만 가능하도록 지정
*/

-- 모든 회사를 조회하는 뷰
CREATE VIEW ALL_COMPANIES AS SELECT * FROM COM;
/*
ORA-01031: insufficient privileges
-> KH_WORKBOOK 계정에서 뷰를 생성할 권한이 부족해서 발생하는 에러
    이 문제를 해결하려면 데이터베이스 관리자(DBA) 나 시스템 관리자한테 권한을 요청
    
GRANT CREATE VIEW TO KH_WORKBOOK;
VIEW 를 생성할 권한 부여

VIEW 는 주로 테이블을 복제하거나 조합해서 테스트용 SELECT 많이 사용
SELECT 문 저장하고 다시 보기
*/
-- 가격이 1500 이상인 과자를 조회하고 나중에 또 다시 볼 수 있는 뷰 생성
CREATE VIEW ONEFIVE_SNACKS AS SELECT * FROM SNACKS WHERE PRICE >= 1500;

-- 서울시 강남구에 위치한 회사를 조회하는 뷰
CREATE VIEW COMPANY_IN_GANGNAM AS SELECT * FROM COM WHERE COMPANY_ADDRESS LIKE '%강남구%';




























