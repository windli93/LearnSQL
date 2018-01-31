-- 1. 建表
create table test_oracle(
   id  varchar2(10) not null,
   name varchar2(10),
   password number(10),
   primary key (id)
 );
-- 建视图
 create or replace view test_view as select * from test_oracle;
-- 复制表
create table test_table as select * from test_oracle;
truncate table test_table;
insert into test_table select * from test_oracle;
-- 单一索引，组合索引，唯一索引，主键索引
 create index test_oracle_index on test_oracle(id) tablespace geeks;
 create index test_oracle_index on test_oracle(id,name,password) tablespace geeks;
 create unique index test_oracle_index on test_oracle(id) tablespace geeks;
-- 插入数据
insert into test_oracle(id,name,password) values('2018-01-30','ragrok',166);
insert into test_oracle(id,name,password) values('2018-01-31','ragrok1',166);
insert into test_oracle(id,name,password) values('2018-01-32','ragrok2',166);
insert into test_oracle(id,name,password) values('2018-01-33','ragrok3',166);
-- 修改
update test_oracle set id = '2018-01-29' where id = '2018-01-30';
update test_oracle set id = '2018-01-29' where id = '2018-01-30';
update test_oracle set id = '2018-01-29' where id = '2018-01-30';
-- 删除数据
delete from test_oracle where id = '2018-01-29';
-- 查询用户下的表
show user;
select table_name from user_tables;
-- 修改字段名
alter table test_oracle rename column name to StuName;
-- 修改表名
alter table test_oracle rename to test_oracle1;
rename test_oracle1 to test_oracle;
-- 删除字段名
alter table test_oracle drop(desc1);
alter table test_oracle drop column desc1;
-- 增加字段
alter table test_oracle add(desc1 varchar2(50));
-- 修改数据类型
alter table test_oracle modify(id varchar2(64));
-- sql调优
set autotrace on;
explain plan for select * from test_oracle;
select * from (dbms_xplan.display);
