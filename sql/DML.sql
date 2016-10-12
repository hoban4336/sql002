select * from author;

select * from book;
-- 1) insert
insert into author values(1,'박경리');

insert into book values(1,'토지',to_date('1985-01-01','yyyy-mm-dd'),1,'대여중');

insert into book (no,title,pub_date, state) values(1,'토지',to_date('1985-01-01','yyyy-mm-dd'),'대여가능');

select * from employees where department_id = 50;

-- 2)update
update employees set salary = salary * 1.1,commission_pct = 0;

rollback;

update EMPLOYEES set first_name = 'kickscar',SALARY = salary*1.1, COMMISSION_PCT =0;
select * from EMPLOYEES e;

select * from dictionary;

-- pseudo column

select sysdate from author;

-- sysdate

-- insert into board vlaues (1,'안녕',"밥은 먹고 다니냐", sysdate);

-- user
select user from dual;

-- rownum은 orderby 할때 주의해야한다. rownum 생성이후 ,orderby가 되기때문에!
select no,title,rowid,rownum from book;

select no,title,rowid,rownum from book b order by b.title desc;

-- 문제: 직원 중에 월급이 상위 10~20 까지 고른다. -> order by 에 의해 섞인다.
select e.employee_id, salary from employees 
where rownum < 20 and rownum > 10
order by salary desc ;

-- 해결 : where 절로 범위를 지정하면 값이 나오지 않음.
select e.employee_id, salary, rownum 
from (select e.employee_id, salary from employee e
	order by salary desc )
where rownum < 20 and rownum > 10 ;

-- 최종 솔루션 : where 절로 범위를 지정하면 값이 나오지 않음(TOP-K)
select *
from(
	select e.employee_id, salary, rownum as rn --2. rownum as rn
	from (
 select e.employee_id, salary from employee e  --1. order by 
		order by salary desc 
		)
)where 10< rn and rn < 20 ; 				   --3. 범위 지정(조건)

-- transaction savepoint
commit;

select * from book;
-- DML1
insert into book values(3,'토지3',sysdate,1,'대여중');

savepoint a;

delete from book where no =3;

savepoint b;
select * from book;

insert into book values(5,'토지5', sysdate,1,'대여가능');

rollback to b;

-- ---------------
select * from book;

insert into book values(2,'토지2', sysdate,1,'대여가능');

savepoint a;

commit;

savepoint b;

insert into book values(4,'토지4', sysdate,1,'대여가능');

rollback to b;

-- transaction read only

commit;
set transaction read only;

select * from book;

delete from book;

insert into book values(5,'토지5', sysdate,1,'대여가능');

commit;

set transaction read write;
select * from book;
insert into book values(10,'토지10', sysdate,1,'대여가능');

-- isolation type
-- commit 빨리 치는 사랑이 이김.
commit;
set transaction isolation level serializable;
update book set title = '토지4' where no = 3;
















