-- user 계정 : test, 비밀번호 pwtest
CREATE USER c##test IDENTIFIED BY pwtest;

-- 세션 권한 (로그인-인증) 부여
grant CREATE SESSION TO c##test;

-- db의 테이블 생성 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##test;

-- 데이터 조작 - DML(삽입, 조회, 수정, 삭제)
GRANT CONNECT, DBA TO c##test;
