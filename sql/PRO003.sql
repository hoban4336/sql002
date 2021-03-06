-- 1. 
select e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_name, e.FIRST_NAME as "매니저의 이름"
from EMPLOYEES e, DEPARTMENTS d 
where e.EMPLOYEE_ID = d.MANAGER_ID;

-- 2. 
select r.REGION_NAME, c.COUNTRY_NAME
From REGIONS r
JOIN COUNTRIES c
ON r.REGION_ID = c.REGION_ID
ORDER BY r.REGION_NAME desc, c.COUNTRY_NAME desc;

-- 3.
select e.department_id, d.department_name,e.FIRST_NAME, l.CITY , c.COUNTRY_NAME,r.REGION_NAME
from EMPLOYEES e
LEFT OUTER JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
LEFT OUTER JOIN LOCATIONS l
ON l.LOCATION_ID = d.LOCATION_ID 
LEFT OUTER JOIN COUNTRIES c
ON c.COUNTRY_ID = l.COUNTRY_ID 
LEFT OUTER JOIN REGIONS r
ON r.REGION_ID  = c.REGION_ID ;

-- 4. 
select * from JOB_HISTORY j;


select a.EMPLOYEE_ID, a.FIRST_NAME ||''|| a.LAST_NAME
from(
	select e.FIRST_NAME, e.LAST_NAME, e.EMPLOYEE_ID,j.JOB_ID
	FROM EMPLOYEES e , JOB_HISTORY j
	where e.EMPLOYEE_ID =j.EMPLOYEE_ID ) a 
	,JOBS j 
where a.JOB_ID = j.JOB_ID 
and j.JOB_TITLE = 'Public Accountant';

	select e.EMPLOYEE_ID,j.JOB_ID
	FROM EMPLOYEES e , JOB_HISTORY j
	where e.EMPLOYEE_ID =j.EMPLOYEE_ID ;

-- 5.
select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME
From EMPLOYEES e , DEPARTMENTS d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID;



-- 6. 
select e.EMPLOYEE_ID,e.LAST_NAME,e.HIRE_DATE,b.HIRE_DATE as "MANAGER_HIRE_DATE"
from EMPLOYEES e
LEFT JOIN EMPLOYEES b ON e.MANAGER_ID = b.EMPLOYEE_ID
where e.HIRE_DATE <  b.HIRE_DATE;



