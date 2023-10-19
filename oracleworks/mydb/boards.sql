--게시판 테이블 생성
CREATE TABLE boards(
    bno         NUMBER PRIMARY KEY,
    btitle      VARCHAR2(100)NOT NULL,
    bcontent    CLOB NOT NULL,  -- CLOB ( 
    bwriter     VARCHAR2(50)NOT NULL,
    bdate       DATE DEFAULT SYSDATE,
    bfilename   VARCHAR2(50),                                            
    bbfiledata  BLOB   
    );
    
--시퀀스 생성
CREATE SEQUENCE seq_bno NOCACHE;

--게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, 'smartphone', '아이폰15pro.', 'today');

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES (seq_bno.NEXTVAL, 'smartphone', '아이폰15pro.', 'today',
        SYSDATE, NULL, NULL);

COMMIT;

SELECT * FROM boards;


--글번호 5번의 제목을 '아이폰 15; 로 변경
UPDATE boards
SET btitle = '아이폰15',
    bcontent ='아이폰 15 제품입니다'
    WHere bno =5;
    
--1qjs rptlrmf 
DELETE FROM boards 
WHERE bno = '1';
    
    
    
SELECT * FROM boards