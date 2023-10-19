--학교 데이터베이스 구축 
--학과 테이블 생성
CREATE TABLE major(
    mname     VARCHAR2(20) PRIMARY KEY,
    mphone    VARCHAR2(20) NOT NULL, --필수 입력
    location  VARCHAR2(20) NOT NULL
);

--학과 추가
INSERT INTO major ( mname , mphone ,location)
VALUES('소프트웨어학과' , '02-2623-8887' ,'B동 ');
INSERT INTO major ( mname , mphone ,location)
VALUES('경영학과' , '02-2623-8877' ,'B동 3층');
INSERT INTO major ( mname , mphone ,location)
VALUES('철학과' , '02-2623-8777' ,'B동 9층');

--오류 나서 크기 늘리고 싶으면..돌아와줘.. 자료 크기 변경 20 -> 30
ALTER TABLE major MODIFY mname VARCHAR2(30);
 
--전체 데이터 조회 
SELECT * FROM major;

-- 특정 데이터 조회 ( 별칭 사용 -> AS 사용 ) 
SELECT mname  AS 학과명 ,mphone  AS 전화번호 FROM major;


COMMIT;

DROP TABLE major;