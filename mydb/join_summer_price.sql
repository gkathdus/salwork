-- 계절학기 수강료, 등록 테이블
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 자바 과목의 수강료 합계를 검색하시오
SELECT b.sid,
       b.subject,
       a.price
from summer_price a, summer_register b
WHERE a.subject = b.subject
and b.subject = 'Java';

-- 모든 과목의 수강료 합계
SELECT b.sid,
       b.subject,
       a.price
from summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 과목별 수강료 합계
INSERT INTO summer_register
VALUES (301, 'Python');

INSERT INTO summer_register
VALUES ('python', 40000);

-- 과목별 수강료 합계 및 전체 총계를 구하시오
-- 롤업, 큐브
SELECT NVL(b.subject, '총계'),
       sum(a.price)
from summer_price a, summer_register b
WHERE a.subject = b.subject
group BY ROLLUP (b.subject);

-- 학생의 모든 수강정보를 검색하시오
-- join ~ using
SELECT b.sid,
       subject,
       a.price
from summer_price a join summer_register b
USING(subject);


SELECT  subject,
        SUM(price)
FROM summer_price
group by subject;