--登录hr，ok  emp--员工档案  dept--部门信息
 --查询所有员工信息
 select * from emp;
--查询所有员工的姓名和薪水，列名标注上姓名和薪水标题
select ename,sal from emp;
--查询1999-01-01之后入职的员工信息。
select * from emp where hiredate > to_date('1999-01-01','yyyy-mm-dd');
--查询职位是程序员（IT_PROG）并且工资大于5k的员工	(多个条件之间并且关系用and，或者关系就用or)
select ename from emp em,dept de where de.empno = em.empno and de.dname = 'IT_PROG' and em.sal > 5000;
--查询职位不是程序员（IT_PROG）并且工资大于5k的员工(不等于  ！=,<>)
select ename from emp em,dept de where de.empno = em.empno and de.dname != 'IT_PROG' and em.sal > 5000;
--查询部门编号是30,60,100的所有员工信息(某列在某个范围内，可以用in，不在范围内用not in)
select ename from emp em where em.empno in ('30','60','100');
--查询工资在4k到5k之间的员工
select ename from emp wher 4000<sal and sal < 5000;
--查询公司老板信息（manager_id为空的）判断一个列是否为空用is null, is not null
select ename from emp em,dept de where de.manager_id is null and de.empno = em.empnop;
--字符串拼接每个员工基本信息包括姓名，工作岗位，邮箱。
select ename || deptno || work from emp;
--搜索邮箱以“J”开头的员工信息 like 'J%'  %表示出现任意数量的任意字符  _表示出现任意字符，但是是一个字符

--搜索邮箱包含“EE”的员工信息

--函数部分
--查询员工总人数--显示结果为单值就是采用统计函数。sum(列名) ，avg(列名)，count(列名)个数，min(列名)，max（列名），
--count列名建议采用唯一约束的列，或者非空的列，count函数会忽略值为空的行。


---查出部门编号为60的员工总人数(select部分如果出现了统计函数，select部分就不能出现其他列)

---查出IT部门的最高薪水和最低薪水，平均薪水

 --显示所有员工的姓名和工资信息，如果没录入工资显示为0  nvl(列名，0)--如果列名对应的行没有值，就显示右边参数值
select ename ,nvl(sal,0) sal from emp
--decode 函数
--显示员工工资临界档次，等于3000显示低收入，等于5000显示中等，等于8000显示高薪。
select decode(sal,3000,'低收入',5000,'中等',8000,'高薪') from emp;
--Count 函数和distinct关键字：
--统计所有的姓氏有多少个

-- --查询员工都来自那些部门

--日期函数
--日期转字符串

--字符串转日期

--字符串处理
--分组
--按照部门编号进行分组，求每个部门的员工总人数,显示部门编号和该部门总人数

---每个部门编号以及该部门的平均工资

--每个部门编号以及部门平均工资,要求只显示平均工资大于4k的部门。

--四舍五入round(12.3456,2)
select round(12.3456,2) from dual;
--习题
--2、选出EMP表中commission_pct为空的数据
select * from emp where commission is null;
--3、显示出表EMP中deptno为10的用户

--5、找出姓名长度为6的SALESMAN雇员
select ename from emp where length(ename) = 6;
--6、找出姓名的末位为字符‘N’的雇员
select ename from emp where ename like '%N';
