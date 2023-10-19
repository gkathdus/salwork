-- ��� ���̺� ����
CREATE TABLE employee(
    empid    NUMBER(3),
    empname  VARCHAR2(20) NOT NULL,
    age      NUMBER(3),
    deptid   NUMBER,
    PRIMARY KEY(empid),
    FOREIGN KEY(deptid) REFERENCES department(deptid) -- �ܷ�Ű
);

-- ��� �ڷ� �߰�
INSERT INTO employee(empid, empname, age, deptid)
VALUES (101, '�Լҿ�', 21, 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (102, '����â', 21, 30); -- �μ� �ڵ尡 ��� �ܷ�Ű �������� ����
INSERT INTO employee(empid, empname, deptid)
VALUES (103, '������', 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (104, '������', 31, 10);

-- ����� ��� ���� ���
SELECT * FROM employee;

-- ��� �̸��� ���� Į�� ���
SELECT empname, age FROM employee;

-- ��� �̸��� �Լҿ��� ������ ���
SELECT * FROM employee
WHERE empname = '�Լҿ�';

-- ���� 30�� �̻��� ��� �˻�
SELECT * FROM employee
WHERE age > 30;

-- ���̰� �Էµ��� ���� ��� �˻�
SELECT * FROM employee
WHERE age IS NULL;

-- ���ڿ� �˻�(��� �̸����� �Ҹ� �����ϰų� �Ǵ� ���̰� ������� ���� ��� �˻�)
SELECT * FROM employee
WHERE empname LIKE '%��%' OR age IS NULL;

-- �μ� ��ȣ�� 20�� ��� �˻�
SELECT * FROM employee
WHERE deptid = 20;


COMMIT;

DROP TABLE employee;