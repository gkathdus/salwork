-- ROWNUM(�ο��ȣ, ���ȣ)
-- �� ���� �����ϰ� ���� �� ���, SUDO COLUMNE�̶� ��
CREATE TABLE ex_score(
    name    VARCHAR2(20),
    score   NUMBER(3)
);

INSERT INTO ex_score VALUES('���ϳ�', 94);
INSERT INTO ex_score VALUES('���ϳ�', 94);
INSERT INTO ex_score VALUES('���ϳ�', 100);
INSERT INTO ex_score VALUES('���ϳ�', 97);
INSERT INTO ex_score VALUES('���ϳ�', 90);
INSERT INTO ex_score VALUES('���ϳ�', 84);
INSERT INTO ex_score VALUES('���ϳ�', 54);
INSERT INTO ex_score VALUES('���ϳ�', 24);
INSERT INTO ex_score VALUES('���ϳ�', 74);
INSERT INTO ex_score VALUES('���ϳ�', 66);

-- 5����� ���� ���
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <= 5;

-- between
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM BETWEEN 1 AND 5;

-- 1���� 5����� ������ ���
-- rownum�� 1���� �����ؾ� ��
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM >=1 AND ROWNUM <=5;

-- ������ ���� ������ �˻��Ͻÿ�(������������ ����)
SELECT * FROM ex_score
ORDER BY score DESC;

-- ������ ���� ������ 5���� �˻��Ͻÿ�
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <=5
ORDER BY score DESC;

-- ������ ������������ ������ �� 5���� �˻�
SELECT name, score
FROM (SELECT * FROM ex_score ORDER BY score DESC)
WHERE ROWNUM <=5;


-- ���� ���� �˻��ϱ�
SELECT name,
       score,
       RANK() OVER(ORDER BY score DESC) ����1,
       DENSE_RANK() OVER(ORDER BY score DESC) ����2
FROM ex_score;


COMMIT;