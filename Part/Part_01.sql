-- Oracle 表空间和用户权限管理
-- 以管理员的身份登录oracle
conn scott/tiger as sysdba;
conn sys/change_on_install as sysdba;
conn system/manager as sysdba;
-- 以普通用户登录
conn scott/tiger;
-- 以sys用户登录，省略用户名和密码超级管理员
conn / as sysdba;
-- 创建表空间
-- CREATE TABLESPACE tablespaceName
--  DATAFILE 'filename'
--  [SIZE integer [K | M]]
--  [AUTOEXTEND [OFF | ON]];
-- 例如
create tablespace geeks
DATAFILE 'E:/Oracle/geeks.dbf'
SIZE 10m
AUTOEXTEND ON;
-- DORP 表空间
drop tablespace geeks;
-- 创建IDENTIFIED BY Lhj19931010
-- CREATE USER username
-- IDENTIFIED BY password
-- [DEFAULT TABLESPACE tablespaceName]
-- [TEMPORARY TABLESPACE tablespaceName]
create user ragrok IDENTIFIED BY ragrokpwd
default tablespace geeks
temporary tablespace temp;
-- 直接创建表空间，tablespace默认为user temporary默认为temp
create user ragrok1 IDENTIFIED BY ragrokpwd1
-- 修改用户密码
alter user ragrok identified by ragrokpassword;
-- 删除用户
drop user ragrok;
-- oracle权限分为系统权限和对象权限
-- 授权
-- GRANT 权限|角色 TO USER;
grant connect to ragrok;
grant resource to ragrok;
grant dba to ragrok;
grant select on scott.emp to ragrok;
grant insert on scott.emp to ragrok;
grant delete on scott.emp to ragrok;
grant update on scott.emp to ragrok;
grant select,update,insert,delete on scott.emp to ragrok;
-- 撤销权限
-- REVOKE 权限|角色 FROM USER;
revoke connect from ragrok;
revoke resource from ragrok;
revoke dba from ragrok;
revoke select on scott.emp from ragrok;
revoke insert on scott.emp from ragrok;
revoke delete on scott.emp from ragrok;
revoke update on scott.emp from ragrok;
revoke select,update,insert,delete on scott.emp from ragrok;
