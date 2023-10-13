-- emp ���̺�
CREATE TABLE emp(
    empno       NUMBER(3) PRIMARY KEY,
    ename       VARCHAR2(20) NOT NULL,
    gender      VARCHAR2(6) NOT NULL,
    salary      NUMBER(10),
    hire_date   VARCHAR2(20) NOT NULL
);

-- �ڷ� ����
INSERT INTO emp VALUES (100, '�̰�', '����', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '�Լҿ�', '����', 2500000, '2020-05-15');
INSERT INTO emp VALUES (102, '����â', '����', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '������', '����', NULL, '2023-10-01');


SELECT * FROM emp;

-- �ǽ� ���� Ǯ��
-- 1. ����� �Ի��� ������ �����Ͻÿ� (��������)
SELECT * FROM emp
ORDER BY hire_date;

-- 2. ����� �޿� ������ �����Ͻÿ� (��������)
SELECT * FROM emp
ORDER BY salary;

-- 3. �޿��� 300�� �� ������ ����� �޿��� ���� ������ �����Ͻÿ�
SELECT * FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

-- 4. �޿��� ���� ����� �˻��Ͻÿ�
SELECT * FROM emp
WHERE salary IS NULL;

-- 5. ����� �� ���� ���Ͻÿ�
SELECT count(*) ����� FROM emp;

-- 6. ����� �޿� �հ�� ����� ���Ͻÿ�
SELECT sum(salary) �޿��հ�,
       avg(salary) ��ձ޿�
       from emp;
       
-- 7. �̸��� �Լҿ��� ����� ������ ���ڷ� �����Ͻÿ�
UPDATE emp SET gender = '����'
WHERE empno = 101;

-- 8. �̸��� �������� ����� �����Ͻÿ�
DELETE FROM emp
WHERE empno = 103;

COMMIT;
DROP TABLE emp;

-- �ݿø� : round(����, �ڸ���)
SELECT ename ����̸�,
       salary �޿�,
       round(salary/30, 1) ���1,
       round(salary/30, 0) ���2,
       round(salary/30, -1) ���3
FROM emp;
