-- 1. 평균 연봉 보다 적은 월급을 ㅂ다는 직원은 몇명인가요? 56

select count(e.EMPLOYEE_ID)
from EMPLOYEES e 
where e.salary < (select avg(salary) from EMPLOYEES e);


select avg(salary) from EMPLOYEES e1 group by e1.DEPARTMENT_ID;
-- 2. 각 부서별로 최고의 급여를 받는 사원의 사번, 성, 연봉을 조회하세요. 조회결과는연봉의 내림차순으로 정렬하세요.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY 
from EMPLOYEES e
where (e.DEPARTMENT_ID,salary) in (select e1.DEPARTMENT_ID, max(salary) from EMPLOYEES e1 group by e1.DEPARTMENT_ID)
ORDER BY e.SALARY desc;
 
 
--  3. 각 업무 별로 연봉의 총합을 구하라. 연봉 총합이 가장 높은 업무 부터 업무명과 연봉 총합을 조회하시오 
select j.JOB_title, a.maxsalary
from (select e.JOB_ID,sum(salary) as maxsalary
from EMPLOYEES e 
GROUP BY e.JOB_ID) a, JOBS j
where a.JOb_ID = j.JOB_ID;

select a.JOB_TITLE, max(salary) from(
select *
from EMPLOYEES e LEFT OUTER JOIN JOBS j
ON e.JOB_ID = j.JOB_ID) a GROUP BY a.JOB_TITLE;

-- 4. 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번, 성과 연봉을 조회하세요
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