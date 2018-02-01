### Learn SQL
- 学习Oracle基本的语法
- 练习Oracle DDL,DCL,TCL,DML语句
- 练习函数和存储过程的书写

#### 文件夹使用
- Basic_Tabel部分是基本的表定义和表数据
- Other部分为db2的脚本和语句
- Part部分为Oracle练习语句

#### 刚开始安装Oracle时权限不足的情况解决办法
- 电脑 -> 管理 -> 本地用户和组 -> 组 -> ora_dba -> 添加
- 然后找到当前Windows登录用户，不是数据库的用户名，手打加入进去就行，例如ragrok,Administrator
- 执行cmd命令行，执行 `sqlplus / as sysdba` 测试通过即可

#### 登录Oracle
- 执行cmd命令行，执行 `sqlplus / as sysdba` 以超级用户SYS无密码登录
- 执行cmd命令行，执行 `sqlplus sys/change_on_install as sysdba` 以超级用户SYS账户密码登录
- 执行cmd命令行，执行 `sqlplus system/manager as sysdba` 以超级用户SYS无密码登录
- 执行cmd命令行，执行 `sqlplus scott/tiger as sysdba` 用户密码登录

#### SQL经典问题
- [查看Oracle执行计划](https://www.cnblogs.com/Dreamer-1/p/6076440.html)
- [truncat,delete,drop的区别](http://blog.csdn.net/ws0513/article/details/49980547)
- [delte和alter的区别](http://blog.csdn.net/datouniao1/article/details/52742584)
- [Oracle函数和存储过程的区别](https://www.cnblogs.com/jmj1993/p/7625252.html)
