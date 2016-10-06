-- 1. ��� ���� ���� ���� ������ ���ٴ� ������ ����ΰ���? 56

select count(e.EMPLOYEE_ID)
from EMPLOYEES e 
where e.salary < (select avg(salary) from EMPLOYEES e);


select avg(salary) from EMPLOYEES e1 group by e1.DEPARTMENT_ID;
-- 2. �� �μ����� �ְ��� �޿��� �޴� ����� ���, ��, ������ ��ȸ�ϼ���. ��ȸ����¿����� ������������ �����ϼ���.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY 
from EMPLOYEES e
where (e.DEPARTMENT_ID,salary) in (select e1.DEPARTMENT_ID, max(salary) from EMPLOYEES e1 group by e1.DEPARTMENT_ID)
ORDER BY e.SALARY desc;
 
 
--  3. �� ���� ���� ������ ������ ���϶�. ���� ������ ���� ���� ���� ���� ������� ���� ������ ��ȸ�Ͻÿ� 
select j.JOB_title, a.maxsalary
from (select e.JOB_ID,sum(salary) as maxsalary
from EMPLOYEES e 
GROUP BY e.JOB_ID) a, JOBS j
where a.JOb_ID = j.JOB_ID;

select a.JOB_TITLE, max(salary) from(
select *
from EMPLOYEES e LEFT OUTER JOIN JOBS j
ON e.JOB_ID = j.JOB_ID) a GROUP BY a.JOB_TITLE;

-- 4. �ڽ��� �μ� ��� �޿����� ������ ���� ����� ���, ���� ������ ��ȸ�ϼ���
-- select e.EMPLOYEE_ID,e.LAST_NAME,e.SALARY
-- from EMPLOYEES e
-- where (salary) >= ANY (
-- 	select avg(salary) 
-- 	from EMPLOYEES e 
-- 	group by e.DEPARTMENT_ID)
	
select e.EMPLOYEE_ID,e.LAST_NAME,e.FIRST_NAME,e.SALARY
from ( select e.DEPARTMENT_ID ,avg(salary) as avg
	from EMPLOYEES e 
	group by e.DEPARTMENT_ID)b, EMPLOYEES e
	where e.DEPARTMENT_ID = b.DEPARTMENT_ID
	and  e.SALARY > b.avg ;

select * from EMPLOYEES e 
where e.LAST_NAME ='King';