-- 테이블 생성, 자료 삽입
CREATE TABLE drink(
    drink_code  VARCHAR2(3) PRIMARY KEY,
    drink_name  VARCHAR2(30) NOT NULL
);

INSERT INTO drink VALUES ('A01', '아메리카노');
INSERT INTO drink VALUES ('B01', '카페라떼');
INSERT INTO drink VALUES ('C01', '자몽허니블랙티');

COMMIT;

CREATE TABLE cafe_order(
    cafe_order_no   VARCHAR2(10) PRIMARY KEY,
    drink_code      VARCHAR2(3) NOT NULL,
    cafe_order_cnt  NUMBER NOT NULL,
    FOREIGN KEY (drink_code) REFERENCES drink(drink_code)
);

INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100103', 'A01', 2);

SELECT * FROM drink;
SELECT * FROM cafe_order;

-- 동등 조인
SELECT b.cafe_order_no,
       b.drink_code,
       a.drink_name,
       b.cafe_order_cnt
FROM drink a, cafe_order b
WHERE a.drink_code = b.drink_code;

-- 내부 조인
SELECT b.cafe_order_no,
       b.drink_code,
       a.drink_name,
       b.cafe_order_cnt
FROM drink a JOIN cafe_order b
ON a.drink_code = b.drink_code;

-- 외부 조인
SELECT b.cafe_order_no,
       b.drink_code,
       a.drink_name,
       b.cafe_order_cnt
FROM drink a LEFT JOIN cafe_order b
ON a.drink_code = b.drink_code;

DROP TABLE drink;
DROP TABLE cafe_order;