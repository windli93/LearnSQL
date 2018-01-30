### DDL

Data Definition Language (DDL) statements are used to define the database structure or schema. Some examples:
 - CREATE - to create objects in the database
 - ALTER - alters the structure of the database
 - DROP - delete objects from the database
 - TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed
 - COMMENT - add comments to the data dictionary
 - RENAME - rename an object
#### DML

Data Manipulation Language (DML) statements are used for managing data within schema objects. Some examples:
 - SELECT - retrieve data from the a database
 - INSERT - insert data into a table
 - UPDATE - updates existing data within a table
 - DELETE - deletes all records from a table, the space for the records remain
 - MERGE - UPSERT operation (insert or update)
 - CALL - call a PL/SQL or Java subprogram
 - EXPLAIN PLAN - explain access path to data
 - LOCK TABLE - control concurrency
#### DCL

Data Control Language (DCL) statements. Some examples:
 - GRANT - gives user's access privileges to database
 - REVOKE - withdraw access privileges given with the GRANT command

#### TCL
Transaction Control (TCL) statements are used to manage the changes made by DML statements. It allows statements to be grouped together into logical transactions.
 - COMMIT - save work done
 - SAVEPOINT - identify a point in a transaction to which you can later roll back
 - ROLLBACK - restore database to original since the last COMMIT
 - SET TRANSACTION - Change transaction options like isolation level and what rollback segment to use


上面的比较官方，下面自己的理解和大多数人通俗易懂的形式。

对于SQL语言，有两个组成部分：



DML（data manipulation language）：它们是SELECT、UPDATE、INSERT、DELETE，就象它的名字一样，这4条命令是用来对数据库里的数据进行操作的语言。



DDL（data definition language）：DDL比DML要多，主要的命令有CREATE、ALTER、DROP等，DDL主要是用在定义或改变database的结构，数据类型，表之间的链接和约束等初始化工作上，他们大多在建立表时使用。



SQL语言共分为四大类：

数据查询语言DQL，

数据操纵语言DML，

数据定义语言DDL，

数据控制语言DCL。



1 数据查询语言DQL

数据查询语言DQL基本结构是由SELECT子句，FROM子句，WHERE

子句组成的查询块：

SELECT <字段名表>

FROM <表或视图名>

WHERE <查询条件>

2 数据操纵语言

数据操纵语言DML主要有三种形式：

1) 插入：INSERT

2) 更新：UPDATE

3) 删除：DELETE



3 数据定义语言DDL

数据定义语言DDL用来创建数据库中的各种对象-----表、视图、

索引、同义词、聚簇等如：

CREATE TABLE/VIEW/INDEX/SYN/CLUSTER



4 数据控制语言DCL

数据控制语言DCL用来授予或回收访问数据库的某种特权，并控制

数据库操纵事务发生的时间及效果，对数据库实行监视等。如：

1) GRANT：授权。

2) ROLLBACK [WORK] TO [SAVEPOINT]：回退到某一点。

回滚---ROLLBACK

回滚命令使数据库状态回到上次最后提交的状态。其格式为：

SQL>ROLLBACK;

3) COMMIT [WORK]：提交。

在数据库的插入、删除和修改操作时，只有当事务在提交到数据

库时才算完成。在事务提交前，只有操作数据库的这个人才能有权看

到所做的事情，别人只有在最后提交完成后才可以看到。

提交数据有三种类型：显式提交、隐式提交及自动提交。下面分

别说明这三种类型。

      (1) 显式提交

      用COMMIT命令直接完成的提交为显式提交。其格式为：

      SQL>COMMIT；

      (2) 隐式提交

      用SQL命令间接完成的提交为隐式提交。这些命令是：

      ALTER，AUDIT，COMMENT，CONNECT，CREATE，DISCONNECT，DROP，

      EXIT，GRANT，NOAUDIT，QUIT，REVOKE，RENAME。

      (3) 自动提交

      若把AUTOCOMMIT设置为ON，则在插入、修改、删除语句执行后，

      系统将自动进行提交，这就是自动提交。其格式为：

      SQL>SET AUTOCOMMIT ON；




### DDL,DML,DCL 之间的区别

What are the difference between DDL, DML and DCL commands?

DDL,DML和DCL命令之间的区别？（DDL是数据定义语言，如：）

DDL is Data Definition Language statements. Some examples:

CREATE - to create objects in the database（在数据库中创建对象）

ALTER - alters the structure of the database（修改数据库的结构）

DROP - delete objects from the database（从数据库中删除对象）

TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed（从一个表中移除所有记录，包括为记录分配的所有空间也一并移除）

COMMENT - add comments to the data dictionary（为数据字典添加备注）

GRANT - gives user's access privileges to database（为用户赋予访问权限）

REVOKE - withdraw access privileges given with the GRANT command（撤销由GRANT命令赋予的访问权限）

DML is Data Manipulation Language statements. Some examples:（DML是数据操作语言，如：）



SELECT - retrieve data from the a database（从指定的数据库中返回符合一定要求的数据）

INSERT - insert data into a table（向一个表中插入数据）

UPDATE - updates existing data within a table（更新表内存在的数据）

DELETE - deletes all records from a table, the space for the records remain（删除表中所有记录，但保留记录所占空间）

CALL - call a PL/SQL or Java subprogram（调用一个PL/SQL或JAVA子程序）

EXPLAIN PLAN - explain access path to data（解释分析数据的访问路径）

LOCK TABLE - control concurrency（控制并发）

DCL is Data Control Language statements. Some examples:（DCL 是数据控制语言，如：）



COMMIT - save work done（保存已完成工作）

SAVEPOINT - identify a point in a transaction to which you can later roll back（在事务中标示一个点，便于之后可以回滚到此处）

ROLLBACK - restore database to original since the last COMMIT（在最近一次COMMIT之后重新保存数据库）

SET TRANSACTION - Change transaction options like what rollback segment to use（改变事务选项）
