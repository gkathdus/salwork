-- 서브 쿼리(Sub Query): 부속질의(중첩 쿼리)
-- SELECT문 내부에 또 SELECT문이 존재함

-- 도서중 가격이 가장 높은 가격을 검색하시오
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- 도서중에서 가장 비싼 도서의 이름을 검색하시오
SELECT bookname, price
FROM book
WHERE price = 
      (SELECT MAX(price) FROM book);
      
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;

-- 다중형 서브쿼리
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/

SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- 조인 방식 : customer, orders
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- from절에 있는 서브쿼리 - 인라인뷰라고도 함
-- 고객의 이름과 고객의 판매액 검색(customer, orders)
-- 단, 고객 번호가 2 이하임

-- 동등 조인 
select cs.name ,sum(od.saleprice)
from customer cs, orders od
where cs.custid = od.custid
    and cs.custid<=2
group by cs.name
having sum(od.saleprice)>=30000;

/*
    실행 순서
    1. from절 테이블명
    2. where, group by
    3. select 절
    4. order 절
*/


-- 외부 조인