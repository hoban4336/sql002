
select salary from EMPLOYEES e where first_name = 'David';
select first_name, salary from EMPLOYEES e where salary > 17000;

-- subquery(1) SingleRow Subquery
-- 1) 'Lex' 의 결과값은   하나 뿐일때 실행 ok , 'David' 의 결과값은 여러개일때 에러발생
select first_name, salary from EMPLOYEES e where salary > (select salary from EMPLOYEES e where first_name ='Lex');
select first_name, salary from EMPLOYEES e where salary < (select salary from EMPLOYEES e where first_name ='Lex');
select first_name, salary from EMPLOYEES e where salary = (select salary from EMPLOYEES e where first_name ='Lex');


-- 연습문제 : 전체 평균보다 더 많이 받는 사람들 
select avg(salary) from EMPLOYEES e;
select first_name, salary from EMPLOYEES e where salary >= (select avg(salary) from EMPLOYEES e )order by e.SALARY desc;

-- subquery(2) MultiRow Subquery

SELECT  * from EMPLOYEES e;

-- job_id 가 'IT_PROG' 가 받는 연봉보다 많이 받는 직원을 출력
select salary from EMPLOYEES where job_id ='IT_PROG';
select first_name, salary from EMPLOYEES e where salary in (select salary from EMPLOYEES where job_id ='IT_PROG');
select first_name, salary from EMPLOYEES e where salary > ALL (select salary from EMPLOYEES where job_id ='IT_PROG');
select first_name, salary from EMPLOYEES e where salary = any (select salary from EMPLOYEES where job_id ='IT_PROG');

--  not in  // < ALL //  !=any, > any , < any
select first_name, salary from EMPLOYEES e where salary != any (select salary from EMPLOYEES where job_id ='IT_PROG');

-- job_id 가 'IT_PROG' 가 받는 연봉보다 많이 받는 직원을 출력
-- select a.first_name, a.salary
-- from(select first_name, salary from EMPLOYEES e INNER JOIN DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID) a
-- where salary > ;

-- 각 부서별로 최고 급여를 받는 사원을 출력하시오.

select e.FIRST_NAME, e.SALARY, e.DEPARTMENT_ID from EMPLOYEES e 
where (department_id, salary) in ( select department_id ,max(salary) from EMPLOYEES e group by department_id);

-- 불가(위에거 비교용)
select e.FIRST_NAME, e.SALARY, e.DEPARTMENT_ID from EMPLOYEES e 
where  salary in ( select department_id ,max(salary) from EMPLOYEES e group by department_id);

-- correlated subquery
select * from EMPLOYEES a 
where salary = (select max(salary) from EMPLOYEES e where e.DEPARTMENT_ID = a.DEPARTMENT_ID GROUP BY e.DEPARTMENT_ID);

-- dept_name test (outer join)
select e.FIRST_NAME, e.SALARY, e.DEPARTMENT_ID ,D.DEPARTMENT_NAME
from EMPLOYEES e ,
	(select department_id ,max(salary)as maxsalary from EMPLOYEES e group by department_id) b, 
	DEPARTMENTS d
where e.department_id = b.department_id and e.salary = b.maxsalary
and d.DEPARTMENT_ID = e.DEPARTMENT_ID;


select e.FIRST_NAME, e.SALARY, e.DEPARTMENT_ID ,D.DEPARTMENT_NAME
from (select department_id ,max(salary)as maxsalary from EMPLOYEES e group by department_id) b,
EMPLOYEES e 
 	LEFT OUTER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.department_id = b.department_id and e.salary = b.maxsalary ;








