-- 부서와 사원 테이블 생성
CREATE TABLE department(
    deptid     NUMBER PRIMARY KEY, -- 기본키
    deptname VARCHAR2(20) NOT NULL, -- NULL 불허
    location VARCHAR2(20) NOT NULL
);

-- 부서 자료 추가 --
INSERT INTO department(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO department(deptid, deptname, location)
VALUES (20, '관리팀', '인천');

-- 자료 검색(특정 칼럼 검색)
SELECT deptid, deptname, location FROM department;

-- 모든 칼럼 검색(* 사용)
SELECT * FROM department;

-- 특정한 데이터 검색(행:로우) 검색 -> where 조건절 사용
-- 부서 이름이 전산팀인 로우(레코드) 검색
SELECT * FROM department
WHERE deptname = '전산팀';

-- 자료 수정(부서 이름 변경 관리팀 -> 경영팀)
UPDATE department SET deptname = '경영팀'
WHERE deptid = 20;

ROLLBACK; -- commit 이전에 실행하면 취소됨

COMMIT;


DROP TABLE department;