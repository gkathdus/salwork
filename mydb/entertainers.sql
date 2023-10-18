-- 연예인 테이블
CREATE TABLE entertainers(
    name        VARCHAR2(30),
    birthday    VARCHAR2(20),
    job         VARCHAR2(30)
);

INSERT INTO entertainers
VALUES ('양동근', '19790601', '배우, 가수');
INSERT INTO entertainers
VALUES ('김태형', '19951230', '배우, 아이돌가수');
INSERT INTO entertainers
VALUES ('전정국', '19970901', '가수');

COMMIT;
                                                                                                                                                                                    `   `                                                                                                                                                                                                                                                           `` 
-- 제 1정규화 대상
-- 속성갑이 원자값이어야 한다.
-- 직업이 가수인 연예인은? 검색에 어려움이 있음
SELECT * FROM entertainers
WHERE job = '%가수%';

-- 연예인 테이블, 직업 테이블로 분해
create table entertainer(
    name         VARCHAR2(20),
    birthday     VARCHAR2(20)
);

insert into entertainer values('양동근', '19790601');
insert into entertainer values('김태형', '19951230');
insert into entertainer values('전정국', '19970901');

COMMIT;

create table job(
    ename       varchar2(20),
    jobname     varchar2(30)
);

insert into job values('양동근', '배우');
insert into job values('양동근', '가수');
insert into job values('김태형', '배우');
insert into job values('김태형', '아이돌가수');
insert into job values('전정국', '가수');

commit;

select * from entertainer;
select * from job;

-- 연예인의 이름과 생년월일, 직업 정보를 검색하시오
-- 동등조인
select a.name,
       a.birthday,
       b.jobname
from entertainer a, job b
where a.name = b.ename;

-- 내부조인(inner join)
select a.name,
       a.birthday,
       b.jobname
from entertainer a join job b
on a.name = b.ename;

drop table entertainers;
drop table job;