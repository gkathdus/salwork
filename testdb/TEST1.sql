CREATE USER c##tests IDENTIFIED BY sample1234;

GRANT CREATE SESSION TO c##tests; --�α��� ����

GRANT CREATE TABLE, RESOURCE TO c##tests; -- ���̺� ���� ����

GRANT CONNECT, DBA TO c##tests; --���� ����

