-- 실행 계획 : 옵티마이저
SELECT * FROM board;

-- 작성자가 admin0000인 게시글 검색
SELECT * FROM board WHERE bwriter='admin0000';

-- 인덱스 생성
-- create index 인덱스 이름 on 테이블명(칼럼명)_
CREATE INDEX idx_bl ON board(bwriter);

-- 오라클 힌트 적용
SELECT */*+ index (board idx_bl)*/ FROM board WHERE bwriter='admin0000';

SELECT * FROM board
ORDER BY bno DESC;

-- 로우넘은 1을 포함해야하므로 rn릏 사용하여 페이지 처리함
SELECT *
FROM (select ROWNUM rn, bno, btitle, bcontent, bwriter, bdate
        FROM board)
WHERE rn >=21 AND rn <= 30;

-- rowid : 데이터를 구분할 수 있는 유일한 값
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATG4AAHAAAAP+AAB';

DROP INDEX idx_bl;