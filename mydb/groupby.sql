-- department ���̺� ����
CREATE TABLE department(
    deptno      VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office      VARCHAR2(20)
);

INSERT INTO department VALUES ('1000', '�λ���', '����');
INSERT INTO department VALUES ('1001', '������', '��õ');
INSERT INTO department VALUES ('1002', '������', '����');
INSERT INTO department(deptno, deptname) VALUES ('1003', '������');

COMMIT;

SELECT * FROM department;

-- employee ���̺� ����
CREATE TABLE employee(
    empno    NUMBER(3) PRIMARY KEY,
    empname  VARCHAR2(20) NOT NULL,
    sal      NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno   VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno) -- �ܷ�Ű
);

INSERT INTO employee VALUES (100, '�̰�', 2500000, SYSDATE, '1000');
INSERT INTO employee VALUES (101, '���', 2000000, SYSDATE, '1001');
INSERT INTO employee VALUES (102, '�ڴ�', 1500000, SYSDATE, '1002');
INSERT INTO employee VALUES (103, '���¾�', 3500000, SYSDATE, '1000');
INSERT INTO employee VALUES (104, '�ֿ���', 5000000, SYSDATE, '1001');
INSERT INTO employee VALUES (105, '�쿵��', 4000000, SYSDATE, '1002');

COMMIT;

SELECT * FROM employee;

DROP TABLE department;
DROP TABLE employee;

-- �μ��� �޿� �Ѿ��� ���Ͻÿ�
SELECT deptno, SUM(sal)
FROM employee
GROUP BY deptno;

-- 1001�� �μ� �̸��� �Ѻ������� �����ϱ�
UPDATE department
SET deptname = '�ѹ���'
WHERE deptno = '1002';

-- ���¾� ����� �޿��� 3000000������ �����ϱ�
UPDATE employee
SET sal = '3000000'
WHERE empname = '���¾�';

UPDATE employee
SET sal = '3000000'
WHERE empname = '�̰�';

-- �μ� �̸��� �μ��� �޿� �Ѿ��� ����Ͻÿ�
SELECT a.deptno,
       a.deptname,
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
group by a.deptno, a.deptname;

-- cube(Į��1, Į��2) : group by ������ ��� �Ұ�, �Ѱ踦 ��ü������ ����
SELECT a.deptno,
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
group by cube (a.deptno, a.deptname)
order by a.deptno;

-- rollup() : group by������ �Ұ�, �Ѱ踦 ����
SELECT a.deptno,
       a.deptname, 
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
group by rollup (a.deptno, a.deptname);


-- sum(), sum over() - ���� �հ�
-- Į���� ���� �ҹ��ڷ� ǥ���� �� �ֵ���ǥ�� ������
SELECT empno,
       empname, 
       sal,
       SUM(sal) OVER(order by empno) "sal_num"
FROM employee;

-- ��ũ rank(), over(order by Į����) �Լ�
SELECT empno,
       empname, 
       sal,
       RANK() OVER(order by sal) �޿�_rank,
       dense_rank() OVER(order by sal) �޿�_dense_rank
FROM employee;