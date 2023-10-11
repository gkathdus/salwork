--학생 테이블 생성
CREATE TABLE student(
    snumber NUMBER PRIMARY KEY,
    sname   VARCHAR2(20),
    age     NUMBER(2),
    gender  VARCHAR2(6),
    adress  VARCHAR2(50),
    mname   VARCHAR2(30),
    FOREIGN KEY(mname) REFERENCES major(mname)
);

--학생추가 , 부모키가 없는 학과는 삽입 이상발생 

INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1001,'최은호',29,'남자','강서구','경영학과');
INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1002,'김희린',25,'여자','관악구','철학과');
INSERT INTO student(snumber, sname, age , gender, adress, mname)
VALUES (1003,'김정수',32,'남자','제주도','소프트웨어학과');
INSERT INTO student(snumber, sname, age , gender,  mname)
VALUES (1004,'정유빈',26,'여자','소프트웨어학과');
--전체학생조회
SELECT * FROM student;

--학생의 이름과 나이 조회
SELECT sname, age FROM student 
WHERE sname = '최은호';

-- 이름에 은이 들어간 학생으 ㅣ모든 정보 출력
SELECT * FROM student
WHERE sname LIKE '%은%' ;

--나이가 20살 이상이고 성별이 남자인 모든 핛생 출력
SELECT * FROM student
WHERE age >= 20 AND  gender = '남자';

--주소가 없는 학생으 ㅣ정보 출력
SELECT * FROM student
WHERE adress is NULL;
--주소 없는 학생 삭제
DELETE FROM student 
WHERE adress is NULL;

--정렬하기 ( 오름차순 , 내림차순)
--학생의 나이가 많은순으로
 SELECT * FROM student
 ORDER BY age;
 
-- 학과명이 '전기전자공학과' 학생 중에서 나이가 많은 순으로 정렬하여 출력
SELECT * FROM student
WHERE mname = '전기전자공학과'
ORDER BY age DESC;

--주소가 NULL 인 데이터에  수원시 영통구로 입력하고시퍼
UPDATE student SET adress = '수원시 영통구'
WHERE adress is NULL;

ROLLBACK; -- COMMIT 전에 해야지 하고 나면 안됨

COMMIT;

DROP TABLE student;