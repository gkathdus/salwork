-- ���ο� �����(user)����
CREATE USER c##mydb IDENTIFIED BY pwmydb;

-- ����(������ ����)�� ������ ���� �ο�
GRANT CREATE SESSION TO c##mydb;

-- ���̺�, ���� ������ ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##mydb;

-- DBA�� ����(����)�� ���� �ο�
GRANT CONNECT, DBA TO c##mydb;