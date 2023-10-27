SELECT * FROM drink2;

-- 테이블 복사
CREATE TABLE drink2 AS
SELECT * FROM drink;

-- 재귀복사(insert into ~ select) : values 사용 안 함
INSERT INTO drink2
(SELECT * FROM drink2);

-- rownum (sudo column - 제공된 관리자 칼럼)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- from 절 서브쿼리 사용 - 인라인뷰
SELECT *
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
-- WHERE ROWNUM >= 11 AND ROWNUM <= 20;
WHERE rn >= 21 AND rn <= 30; -- 변수 사용하면 검색됨

DROP TABLE drink2;