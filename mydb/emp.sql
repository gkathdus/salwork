-- emp 테이블
CREATE TABLE emp(
    empno       NUMBER(3) PRIMARY KEY,
    ename       VARCHAR2(20) NOT NULL,
    gender      VARCHAR2(6) NOT NULL,
    salary      NUMBER(10),
    hire_date   VARCHAR2(20) NOT NULL
);

-- 자료 생성
INSERT INTO emp VALUES (100, '이강', '남자', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '함소연', '여자', 2500000, '2020-05-15');
INSERT INTO emp VALUES (102, '서우창', '남자', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '김현서', '여자', NULL, '2023-10-01');


SELECT * FROM emp;

-- 실습 문제 풀이
-- 1. 사원을 입사일 순으로 정렬하시오 (오름차순)
SELECT * FROM emp
ORDER BY hire_date;

-- 2. 사원을 급여 순으로 정렬하시오 (오름차순)
SELECT * FROM emp
ORDER BY salary;

-- 3. 급여가 300만 원 이하인 사원을 급여가 많은 순으로 정렬하시오
SELECT * FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

-- 4. 급여가 없는 사원을 검색하시오
SELECT * FROM emp
WHERE salary IS NULL;

-- 5. 사원의 총 수를 구하시오
SELECT count(*) 사원수 FROM emp;

-- 6. 사원의 급여 합계와 평균을 구하시오
SELECT sum(salary) 급여합계,
       avg(salary) 평균급여
       from emp;
       
-- 7. 이름이 함소연인 사원의 성별을 남자로 변경하시오
UPDATE emp SET gender = '남자'
WHERE empno = 101;

-- 8. 이름이 김현서인 사원을 삭제하시오
DELETE FROM emp
WHERE empno = 103;

COMMIT;
DROP TABLE emp;

-- 반올림 : round(숫자, 자리수)
SELECT ename 사원이름,
       salary 급여,
       round(salary/30, 1) 결과1,
       round(salary/30, 0) 결과2,
       round(salary/30, -1) 결과3
FROM emp;
