-- 은행 계좌 테이블 생성
CREATE TABLE account(
    ano         VARCHAR2(20) PRIMARY KEY,
    owner       VARCHAR2(20) NOT NULL,
    balance     NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '함소연', 10000);

-- 자료 변경(입, 출금)
UPDATE account
SET balance = 50000,
    owner = '박대박'
WHERE ano = '22-22-222';

DELETE FROM account
WHERE ano = '22-22-222';


ROLLBACK;
COMMIT;

SELECT * FROM account;