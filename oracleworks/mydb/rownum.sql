-- ROWNUM(로우번호, 행번호)
-- 행 수를 제한하고 싶을 때 사용, SUDO COLUMNE이라 함
CREATE TABLE ex_score(
    name    VARCHAR2(20),
    score   NUMBER(3)
);

INSERT INTO ex_score VALUES('김하나', 94);
INSERT INTO ex_score VALUES('고하나', 94);
INSERT INTO ex_score VALUES('이하나', 100);
INSERT INTO ex_score VALUES('박하나', 97);
INSERT INTO ex_score VALUES('정하나', 90);
INSERT INTO ex_score VALUES('최하나', 84);
INSERT INTO ex_score VALUES('윤하나', 54);
INSERT INTO ex_score VALUES('임하나', 24);
INSERT INTO ex_score VALUES('장하나', 74);
INSERT INTO ex_score VALUES('함하나', 66);

-- 5행까지 정보 출력
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <= 5;

-- between
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM BETWEEN 1 AND 5;

-- 1부터 5행까지 데이터 출력
-- rownum은 1부터 시작해야 함
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM >=1 AND ROWNUM <=5;

-- 점수를 높은 순으로 검색하시오(내림차순으로 정렬)
SELECT * FROM ex_score
ORDER BY score DESC;

-- 점수가 높은 순으로 5명을 검색하시오
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <=5
ORDER BY score DESC;

-- 성적을 내림차순으로 정렬한 후 5개를 검색
SELECT name, score
FROM (SELECT * FROM ex_score ORDER BY score DESC)
WHERE ROWNUM <=5;


-- 성적 순위 검색하기
SELECT name,
       score,
       RANK() OVER(ORDER BY score DESC) 순위1,
       DENSE_RANK() OVER(ORDER BY score DESC) 순위2
FROM ex_score;


COMMIT;