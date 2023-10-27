-- ���� ��ȹ : ��Ƽ������
SELECT * FROM board;

-- �ۼ��ڰ� admin0000�� �Խñ� �˻�
SELECT * FROM board WHERE bwriter='admin0000';

-- �ε��� ����
-- create index �ε��� �̸� on ���̺��(Į����)_
CREATE INDEX idx_bl ON board(bwriter);

-- ����Ŭ ��Ʈ ����
SELECT */*+ index (board idx_bl)*/ FROM board WHERE bwriter='admin0000';

SELECT * FROM board
ORDER BY bno DESC;

-- �ο���� 1�� �����ؾ��ϹǷ� rn�k ����Ͽ� ������ ó����
SELECT *
FROM (select ROWNUM rn, bno, btitle, bcontent, bwriter, bdate
        FROM board)
WHERE rn >=21 AND rn <= 30;

-- rowid : �����͸� ������ �� �ִ� ������ ��
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATG4AAHAAAAP+AAB';

DROP INDEX idx_bl;