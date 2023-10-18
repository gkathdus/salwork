-- 조인 연습
SELECT * FROM product;
SELECT * FROM product_review;

-- 리뷰가 있는 상품의 정보를 검색하시오
-- 리뷰 테이블에 product_name 칼럼을 출력
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

SELECT a.product_name,
       b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(미국협회) 조인 - STANDARD JOIN (표준 조인)
-- 내부 조인(INNER JOIN ~ ON)
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 외부 조인(LEFT, RIGHT 조인)
-- 리뷰의 유무와 상관없이 모든 상품의 정보를 검색
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code;

-- 리뷰가 없는 상품 정보 검색
SELECT a.product_name "상품 후기가 없는 상품"
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- 상품 리뷰 테이블에 product_name 칼럼 추가
-- 스칼라 서브쿼리 : 한 칼럼만 반환함, select 절에서 사용
SELECT  A.review_no,
        A.product_code,
        (SELECT B.product_name
        from product B
        WHERE A.product_code = b.product_code)
        product_name,
        A.content,
        A.member_id
from product_review A;
