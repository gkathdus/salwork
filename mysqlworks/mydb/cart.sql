-- 먼저 db를 선택함
use mydb;

create table 장바구니(
	아이템	varchar(20),
    가격		int
);

insert into 장바구니 values('두부', 2000);
insert into 장바구니 values('계란', 6000);

select * from 장바구니;

-- 가격별로 정렬하시오
select * from 장바구니 where 가격;