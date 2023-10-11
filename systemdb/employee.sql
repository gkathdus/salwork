-- 사원 테이블 생성
CREATE TABLE employee(
    empid    NUMBER(3),
    empname  VARCHAR2(20) NOT NULL,
    age      NUMBER(3),
    deptid   NUMBER,
    PRIMARY KEY(empid),
    FOREIGN KEY(deptid) REFERENCES department(deptid) -- 외래키
);

-- 사원 자료 추가
INSERT INTO employee(empid, empname, age, deptid)
VALUES (101, '함소연', 21, 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (102, '서우창', 21, 30); -- 부서 코드가 없어서 외래키 제약조건 위배
INSERT INTO employee(empid, empname, deptid)
VALUES (103, '윤지혜', 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (104, '이혜원', 31, 10);

-- 사원의 모든 정보 출력
SELECT * FROM employee;

-- 사원 이름과 나이 칼럼 출력
SELECT empname, age FROM employee;

-- 사원 이름이 함소연인 데이터 출력
SELECT * FROM employee
WHERE empname = '함소연';

-- 나이 30세 이상인 사원 검색
SELECT * FROM employee
WHERE age > 30;

-- 나이가 입력되지 않은 사원 검색
SELECT * FROM employee
WHERE age IS NULL;

-- 문자열 검색(사원 이름에서 소를 포함하거나 또는 나이가 저장되지 않은 사원 검색)
SELECT * FROM employee
WHERE empname LIKE '%소%' OR age IS NULL;

-- 부서 번호가 20인 사원 검색
SELECT * FROM employee
WHERE deptid = 20;


COMMIT;

DROP TABLE employee;