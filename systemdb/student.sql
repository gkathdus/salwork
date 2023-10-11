--�л� ���̺� ����
CREATE TABLE student(
    snumber NUMBER PRIMARY KEY,
    sname   VARCHAR2(20),
    age     NUMBER(2),
    gender  VARCHAR2(6),
    adress  VARCHAR2(50),
    mname   VARCHAR2(30),
    FOREIGN KEY(mname) REFERENCES major(mname)
);

--�л��߰� , �θ�Ű�� ���� �а��� ���� �̻�߻� 

INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1001,'����ȣ',29,'����','������','�濵�а�');
INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1002,'����',25,'����','���Ǳ�','ö�а�');
INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1003,'������',32,'����','���ֵ�','����Ʈ�����а�');
INSERT INTO student(snumber, sname, age , gender,  mname)
VALUES (1004,'������',26,'����','����Ʈ�����а�');
--��ü�л���ȸ
SELECT * FROM student;

--�л��� �̸��� ���� ��ȸ
SELECT sname, age FROM student 
WHERE sname = '����ȣ';

-- �̸��� ���� �� �л��� �Ӹ�� ���� ���
SELECT * FROM student
WHERE sname LIKE '%��%' ;

--���̰� 20�� �̻��̰� ������ ������ ��� ���� ���
SELECT * FROM student
WHERE age >= 20 AND  gender = '����';

--�ּҰ� ���� �л��� ������ ���
SELECT * FROM student
WHERE adress is NULL;
--�ּ� ���� �л� ����
DELETE FROM student 
WHERE adress is NULL;

--�����ϱ� ( �������� , ��������)
--�л��� ���̰� ����������
 SELECT * FROM student
 ORDER BY age;
 
-- �а����� '�������ڰ��а�' �л� �߿��� ���̰� ���� ������ �����Ͽ� ���
SELECT * FROM student
WHERE mname = '�������ڰ��а�'
ORDER BY age DESC;

--�ּҰ� NULL �� �����Ϳ�  ������ ���뱸�� �Է��ϰ����
UPDATE student SET adress = '������ ���뱸'
WHERE adress is NULL;

ROLLBACK; -- COMMIT ���� �ؾ��� �ϰ� ���� �ȵ�

COMMIT;

DROP TABLE student;