-- mydb 생성
create database mydb;

use mydb;

create table test(
	no		int,
    msg varchar(100)
);

insert into test values (1, '좋은 하루 되세요');
insert into test values (2, 'good luck!!');

select * from test;
commit;