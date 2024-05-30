-- 자동정렬 단축키 CNTR + F7
-- 작성한 시트 모두 실행 F5
-- MENU 테이블 생성
CREATE TABLE menu (
    menu_id    NUMBER(10, 0) PRIMARY KEY,
    menu_name  VARCHAR2(100 BYTE),
    menu_desc  VARCHAR2(255 BYTE),
    menu_price NUMBER(10, 2)
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    1,
    '아메리카노',
    '신선한 원두로 만든 아메리카노',
    3000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    2,
    '카페라떼',
    '부드러운 우유가 들어간 라떼',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    3,
    '카푸치노',
    '진한 커피와 거품이 어우러진 카푸치노',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    4,
    '카라멜 마키아토',
    '달콤한 카라멜 시럽이 들어간 마키아토',
    4000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    5,
    '에스프레소',
    '강한 맛과 향의 에스프레소',
    2500
);