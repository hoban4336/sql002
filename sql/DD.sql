-- data dictonary
select * from dictionary;
select * from user_objects;

select * from user_objects where object_type = 'TABLE';
--제약 조건 조회
select * from user_constraints;

--제약 조건 컬럼
select * from user_cons_columns;

-- 모든 사용자 확인 (root)
select * from dba_users;









