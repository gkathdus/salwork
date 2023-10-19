
select * from department;
select * from employee;

-- 삽입 오류 : 부서 테이블에 아이디가 30이 없어서 에러
insert into employee values (105, '양신입', 25, null, 10);

-- 급여가 400만 원 이상이고 부서 번호가 20인 사원을 검색하시오
select * from employee
where sal >= 4000000 and deptid = 10;

-- 급여가 많은 순으로 정렬하시오
select * from employee order by sal desc;

-- 사원의 총 인원을 구하시오
select count(*) 사원수,
	   sum(sal) 급여총액,
       round (avg(sal), 0) 급여평균
from employee;

-- 부서별 급여 총액을 구하시오
select deptid,
	   sum(sal) 급여총액,
       round (avg(sal), -2) 급여평균
from employee
group by deptid;

-- 부서 이름을 포함한 사원의 모든 정보를 검색하시오(조인)
-- 동등조인
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a join employee b
	where a. deptid = b.deptid;

-- 내부 조인
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a join employee b
	on a. deptid = b.deptid;
    
-- using
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a join employee b
	using (deptid);



-- 사원의 급여 총액과 급여 평균을 구하시오

-- 부서별, 부서이름별 급여 소계, 총계 구하시오
select a.deptid,
       a.deptname,
	   sum(b.sal) 급여총액,
       round (avg(sal), -2) 급여평균
from department a join employee b
	on a. deptid = b.deptid
group by deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사람의 정보를 검색하시오
select * 
from employee
where sal = (select max(sal) from employee)
	or sal = (select min(sal) from employee);
    
-- 백두산 사원의 급여를 4300000만 원으로 변경하시오
update employee set sal = 4300000
where empid = '102';

-- 사원의 급여 순위를 구하시오
select empname,
	   sal,
       rank() over(order by sal desc) 급여순위1,
       dense_rank() over(order by sal desc) 급여순위2
from employee;
