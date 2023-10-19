-- ���� ����(Sub Query): �μ�����(��ø ����)
-- SELECT�� ���ο� �� SELECT���� ������

-- ������ ������ ���� ���� ������ �˻��Ͻÿ�
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- �����߿��� ���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = 
      (SELECT MAX(price) FROM book);
      
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT custid FROM orders;

-- ������ ��������
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

/*SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);*/

SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- ���� ��� : customer, orders
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- from���� �ִ� �������� - �ζ��κ��� ��
-- ���� �̸��� ���� �Ǹž� �˻�(customer, orders)
-- ��, �� ��ȣ�� 2 ������

-- ���� ���� 
select cs.name ,sum(od.saleprice)
from customer cs, orders od
where cs.custid = od.custid
    and cs.custid<=2
group by cs.name
having sum(od.saleprice)>=30000;

/*
    ���� ����
    1. from�� ���̺��
    2. where, group by
    3. select ��
    4. order ��
*/


-- �ܺ� ����