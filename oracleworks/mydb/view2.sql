-- job info 테이블 생성
CREATE TABLE JOB_INFO(
    JOB_ID          VARCHAR(10),
    MIN_SALARY      NUMBER,
    MAX_SALARY      NUMBER
);

INSERT INTO job_info VALUES ('AD_PRSS', 20000, 40000);
INSERT INTO job_info VALUES ('AD_VP', 15000, 30000);
INSERT INTO job_info VALUES ('AD_ASST', 3000, 4300);
INSERT INTO job_info VALUES ('FI_MGR', 8000, 14000);
INSERT INTO job_info VALUES ('FI_ACCOUNT', 4000, 9000);
INSERT INTO job_info VALUES ('AC_MGR', 8000, 16000);
INSERT INTO job_info VALUES ('AD_ACCOUNT', 4000, 9000);

COMMIT;

DROP VIEW V_JOB_INFO;

SELECT * FROM job_info;

-- 최저 급여, 최고 급여의 평균을 구하시오
SELECT ROUND(AVG(MIN_SALARY), -1) 최저급여평균,
       AVG(MAX_SALARY) 최고급여평균
FROM job_info;

-- 최저 급여가 5000달러 이상인 직업 아이디를 검색하시오
/*
1. FROM(어떤 테이블이냐)
2. WHERE
3. SELECT (칼럼 읽기)
4. ORDER (정렬)
*/
SELECT JOB_ID, MIN_SALARY
FROM job_info
WHERE min_salary >= 5000;

-- 최저 급여가 5000 달러 이상인 정보를 검색한 뷰 생성
CREATE VIEW V_JOB_INFO
AS SELECT *
    FROM job_info
    WHERE min_salary >= 5000;
    
SELECT * FROM V_JOB_INFO;

-- 최고 급여와 최저 급여의 차가 10000 달러 이상인 직업 아이디의 수를 검색하시오
SELECT COUNT(*)
FROM v_job_info
WHERE max_salary - min_salary >= 10000;

-- 직업 아이디의 이름이 'FI'로 시작하는 자료를 검색하시오
SELECT *
FROM v_job_info
WHERE job_id LIKE 'FI%';

-- max_salary가 최고인 직업 아이디를 검색하시오
SELECT * FROM v_job_info;