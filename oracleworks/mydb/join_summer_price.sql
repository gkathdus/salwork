-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �ڹ� ������ ������ �հ踦 �˻��Ͻÿ�
SELECT b.sid,
       b.subject,
       a.price
from summer_price a, summer_register b
WHERE a.subject = b.subject
and b.subject = 'Java';

-- ��� ������ ������ �հ�
SELECT b.sid,
       b.subject,
       a.price
from summer_price a, summer_register b
WHERE a.subject = b.subject;

-- ���� ������ �հ�
INSERT INTO summer_register
VALUES (301, 'Python');

INSERT INTO summer_register
VALUES ('python', 40000);

-- ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- �Ѿ�, ť��
SELECT NVL(b.subject, '�Ѱ�'),
       sum(a.price)
from summer_price a, summer_register b
WHERE a.subject = b.subject
group BY ROLLUP (b.subject);

-- �л��� ��� ���������� �˻��Ͻÿ�
-- join ~ using
SELECT b.sid,
       subject,
       a.price
from summer_price a join summer_register b
USING(subject);


SELECT  subject,
        SUM(price)
FROM summer_price
group by subject;