-- product_review 테이블 생성
-- clob(character large object)
CREATE TABLE product_review(
    review_no       NUMBER PRIMARY KEY,     -- 리뷰번호
    product_code    CHAR(6) NOT NULL,  -- 상품코드
    member_id       VARCHAR2(20) NOT NULL,  -- 회원아이디
    content         CLOB NOT NULL,          -- 리뷰내용
    regdate         DATE DEFAULT SYSDATE,    -- 작성일
    FOREIGN KEY(product_code) REFERENCES product(product_code) -- 외래키
);

-- 자동 순번(nocache = 초기화하면 1부터 시작)
CREATE SEQUENCE seq_rno NOCACHE;



INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.nextval, '100001', 'today10', '무소음인데 소음이 조금 있는 듯...');
INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.nextval, '100001', 'cloud100', '무선이라 정말 편함');
INSERT INTO product_review(review_no, product_code, member_id, content)
VALUES (seq_rno.nextval, '100002', 'sky123', '게임 개잘됨');

SELECT * FROM product_review;

-- 테이블 유지하고 데이터를 전체 삭제
TRUNCATE TABLE product_review;

COMMIT;

DROP SEQUENCE seq_rno;
DROP TABLE product_review;

-- 상품코드 '100001'이고, 회원아이디가 'cloud100'인
-- 상품의 정보를 출력하시오
SELECT * FROM product_review
WHERE product_code = '100001'
    AND member_id = 'cloud100';

-- 상품 아이템 - 3개, 리뷰가 달린 아이템 - 2개
-- 리뷰가 있는 상품을 검색하시오(동등 조인)
-- 조건 일치 : a 테이블의 기본키 = b 테이블의 외래키
SELECT *
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 표준 방식 - 내부 조인(INNER JOIN)
SELECT *
FROM product a JOIN product b
    ON a.product_code = b.product_code;
    
-- 리뷰의 유무에 관계없이 상품의 정보를 검색하시오
-- 동등 조인 방식(product의 상품은 모두 출력되고,
-- 리뷰는 있든 없든 관계없음, 리뷰가 없으면 null로 출력됨)
SELECT *
FROM product a, product_review b
WHERE a.product_code = b.product_code(+);

-- 표준 방식(외부조인 - OUTER JOIN)
SELECT b.product_code,
       b.product_name,
       b.price,
       a.member_id,
       a.content,
       a.regdate
       
FROM product_review a RIGHT JOIN product b 
    ON a.product_code = b.product_code;


SELECT *
FROM product a LEFT JOIN product b -- OUTER 생략 가능함
    ON a.product_code = b.product_code;
