-- job info ���̺� ����
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

-- ���� �޿�, �ְ� �޿��� ����� ���Ͻÿ�
SELECT ROUND(AVG(MIN_SALARY), -1) �����޿����,
       AVG(MAX_SALARY) �ְ�޿����
FROM job_info;

-- ���� �޿��� 5000�޷� �̻��� ���� ���̵� �˻��Ͻÿ�
/*
1. FROM(� ���̺��̳�)
2. WHERE
3. SELECT (Į�� �б�)
4. ORDER (����)
*/
SELECT JOB_ID, MIN_SALARY
FROM job_info
WHERE min_salary >= 5000;

-- ���� �޿��� 5000 �޷� �̻��� ������ �˻��� �� ����
CREATE VIEW V_JOB_INFO
AS SELECT *
    FROM job_info
    WHERE min_salary >= 5000;
    
SELECT * FROM V_JOB_INFO;

-- �ְ� �޿��� ���� �޿��� ���� 10000 �޷� �̻��� ���� ���̵��� ���� �˻��Ͻÿ�
SELECT COUNT(*)
FROM v_job_info
WHERE max_salary - min_salary >= 10000;

-- ���� ���̵��� �̸��� 'FI'�� �����ϴ� �ڷḦ �˻��Ͻÿ�
SELECT *
FROM v_job_info
WHERE job_id LIKE 'FI%';

-- max_salary�� �ְ��� ���� ���̵� �˻��Ͻÿ�
SELECT * FROM v_job_info;