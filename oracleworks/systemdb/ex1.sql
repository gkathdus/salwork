-- 스키마
-- 테이블
CREATE TABLE ex1 (
    column1 CHAR(10), -- 고정값이 문자(1Byte)
    column2 VARCHAR2(10) -- 가변길이 문자(1Byte)
);

-- 데이터 추가
INSERT INTO ex1(column1, column2) VALUES ('abc', 'abc');
INSERT INTO ex1 VALUES ('당산', '당산');

-- 데이터 조회
SELECT column1, LENGTH(column1), column2, LENGTH(column2) FROM ex1;

-- 트렌잭션 : COMMIT, ROLLBACK
COMMIT;