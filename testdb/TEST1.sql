CREATE USER c##tests IDENTIFIED BY sample1234;

GRANT CREATE SESSION TO c##tests; --로그인 권한

GRANT CREATE TABLE, RESOURCE TO c##tests; -- 테이블 생성 권한

GRANT CONNECT, DBA TO c##tests; --수정 권한

