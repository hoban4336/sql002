select * from author;

select * from book;
-- 1) insert
insert into author values(1,'�ڰ渮');

insert into book values(1,'����',to_date('1985-01-01','yyyy-mm-dd'),1,'�뿩��');

insert into book (no,title,pub_date, state) values(1,'����',to_date('1985-01-01','yyyy-mm-dd'),'�뿩����');

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

-- insert into board vlaues (1,'�ȳ�',"���� �԰� �ٴϳ�", sysdate);

-- user
select user from dual;

-- rownum�� orderby �Ҷ� �����ؾ��Ѵ�. rownum �������� ,orderby�� �Ǳ⶧����!
select no,title,rowid,rownum from book;

select no,title,rowid,rownum from book b order by b.title desc;

-- ����: ���� �߿� ������ ���� 10~20 ���� ����. -> order by �� ���� ���δ�.
select e.employee_id, salary from employees 
where rownum < 20 and rownum > 10
order by salary desc ;

-- �ذ� : where ���� ������ �����ϸ� ���� ������ ����.
select e.employee_id, salary, rownum 
from (select e.employee_id, salary from employee e
	order by salary desc )
where rownum < 20 and rownum > 10 ;

-- ���� �ַ�� : where ���� ������ �����ϸ� ���� ������ ����(TOP-K)
select *
from(
	select e.employee_id, salary, rownum as rn --2. rownum as rn
	from (
 select e.employee_id, salary from employee e  --1. order by 
		order by salary desc 
		)
)where 10< rn and rn < 20 ; 				   --3. ���� ����(����)

-- transaction savepoint
commit;

select * from book;
-- DML1
insert into book values(3,'����3',sysdate,1,'�뿩��');

savepoint a;

delete from book where no =3;

savepoint b;
select * from book;

insert into book values(5,'����5', sysdate,1,'�뿩����');

rollback to b;

-- ---------------
select * from book;

insert into book values(2,'����2', sysdate,1,'�뿩����');

savepoint a;

commit;

savepoint b;

insert into book values(4,'����4', sysdate,1,'�뿩����');

rollback to b;

-- transaction read only

commit;
set transaction read only;

select * from book;

delete from book;

insert into book values(5,'����5', sysdate,1,'�뿩����');

commit;

set transaction read write;
select * from book;
insert into book values(10,'����10', sysdate,1,'�뿩����');

-- isolation type
-- commit ���� ġ�� ����� �̱�.
commit;
set transaction isolation level serializable;
update book set title = '����4' where no = 3;
















