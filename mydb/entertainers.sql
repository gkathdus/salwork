-- ������ ���̺�
CREATE TABLE entertainers(
    name        VARCHAR2(30),
    birthday    VARCHAR2(20),
    job         VARCHAR2(30)
);

INSERT INTO entertainers
VALUES ('�絿��', '19790601', '���, ����');
INSERT INTO entertainers
VALUES ('������', '19951230', '���, ���̵�����');
INSERT INTO entertainers
VALUES ('������', '19970901', '����');

COMMIT;
                                                                                                                                                                                    `   `                                                                                                                                                                                                                                                           `` 
-- �� 1����ȭ ���
-- �Ӽ����� ���ڰ��̾�� �Ѵ�.
-- ������ ������ ��������? �˻��� ������� ����
SELECT * FROM entertainers
WHERE job = '%����%';

-- ������ ���̺�, ���� ���̺�� ����
create table entertainer(
    name         VARCHAR2(20),
    birthday     VARCHAR2(20)
);

insert into entertainer values('�絿��', '19790601');
insert into entertainer values('������', '19951230');
insert into entertainer values('������', '19970901');

COMMIT;

create table job(
    ename       varchar2(20),
    jobname     varchar2(30)
);

insert into job values('�絿��', '���');
insert into job values('�絿��', '����');
insert into job values('������', '���');
insert into job values('������', '���̵�����');
insert into job values('������', '����');

commit;

select * from entertainer;
select * from job;

-- �������� �̸��� �������, ���� ������ �˻��Ͻÿ�
-- ��������
select a.name,
       a.birthday,
       b.jobname
from entertainer a, job b
where a.name = b.ename;

-- ��������(inner join)
select a.name,
       a.birthday,
       b.jobname
from entertainer a join job b
on a.name = b.ename;

drop table entertainers;
drop table job;