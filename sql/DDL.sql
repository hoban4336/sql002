
create table book(
no number(10),
title varchar2(120),
authpr varchar2(80),
pub_date date
);

insert into book values(1,'토지','박경리',sysdate);
insert into book values(3,'토지','박경리',to_date('2005-03-12','yyyy-mm-dd'));

select * from book;

--  alter table
alter table book add (pubs varchar2(120));
alter table book add(pubs varchar2(120));
alter table book modify (pubs varchar2(300));
alter table book rename column pubs to publishing;
alter table book drop column publishing;