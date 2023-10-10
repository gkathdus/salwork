-- �μ��� ��� ���̺� ����
CREATE TABLE department(
    deptid     NUMBER PRIMARY KEY, -- �⺻Ű
    deptname VARCHAR2(20) NOT NULL, -- NULL ����
    location VARCHAR2(20) NOT NULL
);

-- �μ� �ڷ� �߰� --
INSERT INTO department(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO department(deptid, deptname, location)
VALUES (20, '������', '��õ');

-- �ڷ� �˻�(Ư�� Į�� �˻�)
SELECT deptid, deptname, location FROM department;

-- ��� Į�� �˻�(* ���)
SELECT * FROM department;

-- Ư���� ������ �˻�(��:�ο�) �˻� -> where ������ ���
-- �μ� �̸��� �������� �ο�(���ڵ�) �˻�
SELECT * FROM department
WHERE deptname = '������';

-- �ڷ� ����(�μ� �̸� ���� ������ -> �濵��)
UPDATE department SET deptname = '�濵��'
WHERE deptid = 20;

ROLLBACK; -- commit ������ �����ϸ� ��ҵ�

COMMIT;


DROP TABLE department;