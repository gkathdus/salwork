-- user ���� : test, ��й�ȣ pwtest
CREATE USER c##test IDENTIFIED BY pwtest;

-- ���� ���� (�α���-����) �ο�
grant CREATE SESSION TO c##test;

-- db�� ���̺� ���� ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##test;

-- ������ ���� - DML(����, ��ȸ, ����, ����)
GRANT CONNECT, DBA TO c##test;
