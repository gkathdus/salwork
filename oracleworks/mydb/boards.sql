--�Խ��� ���̺� ����
CREATE TABLE boards(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100)NOT NULL,
    bcontent    CLOB NOT NULL,  -- CLOB ( 
    bwriter     VARCHAR2(50)NOT NULL,
    bdate       DATE DEFAULT SYSDATE,
    bfilename   VARCHAR2(50),                                            
    bbfiledata  BLOB   
    );
    
--������ ����
CREATE SEQUENCE seq_bno NOCACHE;

--�Խñ� �߰�
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '������15pro.', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '������15pro.', 'today',
        SYSDATE, NULL, NULL);

COMMIT;

SELECT * FROM boards;


--�۹�ȣ 5���� ������ '������ 15; �� ����
UPDATE boards
SET btitle = '������15',
    bcontent ='������ 15 ��ǰ�Դϴ�'
    WHere bno =5;
    
--1qjs rptlrmf 
DELETE FROM boards 
WHERE bno = '1';
    
    
    
SELECT * FROM boards