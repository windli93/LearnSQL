-- 存储过程的写法
-- 1. 变量说明
-- 2. 标准的SQL命令
-- 3. 流程控制语句
-- 4. 内部函数的使用

-- 存储过程的要点
-- 1. 增强了SQL语言的功能和灵活性
-- 2. 保证了数据的安全性和完整性
-- 3. 通过存储过程可以在没有权限的用户控制下间接的存取数据库，从而保证数据的安全
-- 4. 在运行存储过程之前，数据库已经对其进行了语法和语句分析，给出了优化方案，这样可以使存储
-- 5. 它最大的有点在于，一次编译，后面可以及时运行，大大的提高了sql运行的效率。


-- 存储过程的写法
CREATE OR REPLACE PROCEDURE ODS.RPC_CL_D_022()
     -- 定义的存储过程细节
        specific CL_M_20170228_023 --取别名
        language sql --说明是sql语句
        modifies sql data
BEGIN
     -- 定义临时变量，作局部的参数使用
     declare v_variable variable_type;
     declare v_variable1 variable_type;
     declare v_variable2 variable_type;

     -- 接收某个值
     select ac_date into v_variable from sctjprm;
     --  set赋值
     set v_variable1 = cast(to_char(last_day(to_date(v_variable,'YYMMDD')-2 months) + 1 days, 'YYMMDD')));
     set v_variable2 = cast(to_char(last_day(to_date(v_variable,'YYMMDD')-1 months) + 1 days, 'YYMMDD')));

     insert into  RPT_CL_M_023_T()
       -- 使用with as 子句
       with T0 as
       (
         --- 使用某个表的数据，做逻辑操作

       ),
       T1 as(
         --- T1 会引用T0的数据，做进一步的操作，可以看做嵌套。

       )
        -- 筛选了T0， T1 的数据之后，下面的语句可以很方便的将两者拿到的数据集合到一起。
        select ....  from ....
       commit;
       -- 存储过程就是这么应对复杂的SQL逻辑而生。
