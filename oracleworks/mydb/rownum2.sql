SELECT * FROM drink2;

-- ���̺� ����
CREATE TABLE drink2 AS
SELECT * FROM drink;

-- ��ͺ���(insert into ~ select) : values ��� �� ��
INSERT INTO drink2
(SELECT * FROM drink2);

-- rownum (sudo column - ������ ������ Į��)
SELECT ROWNUM, drink_code, drink_name
FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- from �� �������� ��� - �ζ��κ�
SELECT *
FROM (SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
-- WHERE ROWNUM >= 11 AND ROWNUM <= 20;
WHERE rn >= 21 AND rn <= 30; -- ���� ����ϸ� �˻���

DROP TABLE drink2;