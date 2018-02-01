-- 函数语法
create or replace function function_name()
    return type;
begin

end;

-- 无参数传递
create or replace function fun_emp return varchar2 as
     v_result varchar2(50);
 begin
     select to_char(max(emp_no)) into v_result from employees;
     return(v_result);
end;

-- select fum_emp() from dual;
-- 有参数传进
create or replace function fun_emp1(v_birth_date in varchar2) return varchar2 as
      v_result varchar2(50);
  begin
      select to_char(max(emp_no)) into v_result from employees where birth_date = v_birth_date;
      return(v_result);
  end;

  -- select fum_emp1('1953-09-02') from dual;

  -- 带输入参数，带输出参数
create or replace function fun_emp2(v_birth_date in varchar2,v_count_num out number) return varchar2 as
      v_result varchar2(50);
  begin
      select to_char(max(emp_no)) into v_result from employees where birth_date = v_birth_date;
      select count(emp_no) count_num into v_count_num from employees;
      dbms_output.put_line(v_result);
      return(v_result);
  end;

  select fum_emp2('1953-09-02') from dual;

  --存储过程、函数练习题

  --（1）创建一个存储过程，以员工号为参数，输出该员工的工资
  create or replace procedure p_sxt1(v_emp_no in dept_emp.emp_no%type, v_sal out dept_emp.sal%type) as
  begin
    select sal into v_sal from emp where emp_no = v_emp_no;
  end;
  --（1）执行
  declare
    v_emp_no dept_emp.emp_no%type := 7369;
    v_sal dept_emp.sal%type;
  begin
    p_sxt1(v_emp_no,v_sal);
    dbms_output.put_line(v_emp_no || ' 员工的工资为：' || v_sal);
  end;


  --（2）创建一个存储过程，以员工号为参数，修改该员工的工资。若该员工属于10号部门，
  --则工资增加150；若属于20号部门，则工资增加200；若属于30号部门，则工资增加250；
  --若属于其他部门，则增加300。
  create or replace procedure p_sxt2(v_emp_no in dept_emp.emp_no%type) as
    v_dept_no dept_emp.dept_no%type;
    v_sal dept_emp.sal%type;
  begin
    select dept_no into v_dept_no from emp where emp_no = v_emp_no;
    select sal into v_sal from emp where emp_no = v_emp_no;
    dbms_output.put_line(v_emp_no || ' 的部门是 ' || v_dept_no || ' 修改前的工资是 ' || v_sal);

    case v_dept_no
    when 10 then
      update emp set sal = sal + 150 where emp_no = v_emp_no;
    when 20 then
      update emp set sal = sal + 200 where emp_no = v_emp_no;
    when 30 then
      update emp set sal = sal + 250 where emp_no = v_emp_no;
    else
      update emp set sal = sal + 300 where emp_no = v_emp_no;
    end case;

    select sal into v_sal from emp where emp_no = v_emp_no;
    dbms_output.put_line(v_emp_no || ' 的部门是 ' || v_dept_no || ' 修改后的工资是 ' || v_sal);
    commit;
  end;
  --（2）执行
  begin
    p_sxt2(7369);
  end;


  --（3）创建一个存储过程，以员工号为参数，返回该员工的工作年限（以参数形式返回）。
  create or replace procedure p_sxt3(v_emp_no in dept_emp.emp_no%type, v_year out number) as
  begin
    select round((sysdate - hiredate)/365,1) into v_year from emp where emp_no = v_emp_no;
  end;
  --（3）执行
  declare
    v_emp_no dept_emp.emp_no%type := 7369;
    v_year number;
  begin
    p_sxt3(v_emp_no,v_year);
    dbms_output.put_line(v_emp_no || ' 工作年限为 ' || v_year || '年');
  end;


  --（4）创建一个存储过程，以部门号为参数，输出入职日期最早的10个员工信息。
  create or replace procedure p_sxt4(v_dept_no dept_emp.dept_no%type) as
    cursor c_emp is select * from emp where dept_no = v_dept_no order by hiredate;
    v_times number := 0;
  begin
    for v_emp in c_emp loop
      v_times := v_times + 1;
      dbms_output.put_line(v_dept_emp.emp_no || '**' || v_dept_emp.ename || '**' || to_char(v_dept_emp.hiredate,'yyyy-mm-dd'));
      if v_times = 10 then
        exit;
      end if;
    end loop;
  end;
  --（4）执行
  begin
    p_sxt4(20);
  end;


  --（5）创建一个函数，以员工号为参数，返回该员工的工资。
  create or replace function f_sxt5(v_emp_no dept_emp.emp_no%type) return dept_emp.sal%type as
    vr_sal dept_emp.sal%type;
  begin
    select sal into vr_sal from emp where emp_no = v_emp_no;
    return vr_sal;
  end;
  --(5)执行
  select f_sxt5(7369)||'元' 工资 from dual;


  --（6）创建一个函数，以部门号为参数，返回该部门的平均工资。
  create or replace function f_sxt6(v_dept_no dept_emp.dept_no%type) return dept_emp.sal%type as
    vr_sal dept_emp.sal%type;
  begin
    select avg(sal) into vr_sal from emp where dept_no = v_dept_no;
    return vr_sal;
  end;
  --（6）执行
  select f_sxt6(20) 部门平均工资 from dual;


  --（7）创建一个函数，以员工号为参数，返回该员工所在的部门的平均工资。
  create or replace function f_sxt7(v_emp_no dept_emp.emp_no%type) return dept_emp.sal%type as
    vr_sal dept_emp.sal%type;
  begin
    select avg(sal) into vr_sal from emp where dept_no = (select dept_no from emp where emp_no = v_emp_no);
    return vr_sal;
  end;
  --（7）执行
  select  f_sxt7(7369) from dual;


  --（8）创建一个存储过程，以员工号和部门号作为参数，修改员工所在的部门为所输入的部门号。
  --如果修改成功，则显示“员工由……号部门调入调入……号部门”；如果不存在该员工，则显示
  --“员工号不存在，请输入正确的员工号。”；如果不存在该部门，则显示
  --“该部门不存在，请输入正确的部门号。”。
  create or replace procedure p_sxt14(v_emp_no in dept_emp.emp_no%type, v_dept_no in dept_emp.dept_no%type) as
    vt_emp_no number := 0;
    vt_dept_no number := 0;
    vm_dept_no dept_emp.dept_no%type;
  begin
    select count(*) into vt_emp_no from dept_emp where emp_no = v_emp_no;
    select dept_no into vm_dept_no from dept_emp where emp_no = v_emp_no;
    select count(distinct dept_no) into vt_dept_no from dept_emp where dept_no = v_dept_no;

    if vt_emp_no = 0 then
      dbms_output.put_line('员工号不存在，请输入正确的员工号。');
    end if;
    if vt_dept_no = 0 then
      dbms_output.put_line('该部门不存在，请输入正确的部门号。');
    end if;

    if vt_emp_no = 1 and vt_dept_no = 1 then
      dbms_output.put_line('员工由 ' || vm_dept_no || ' 号部门调入调入 ' || v_dept_no || ' 号部门');
      update dept_emp set dept_no = v_dept_no where emp_no = v_emp_no;
      commit;
    end if;
  end;
  --（8）执行
  begin
    p_sxt14(7369,30);
  end;


  --（9）创建一个存储过程，以一个整数为参数，输入工资最高的前几个（参数值）员工的信息。
  create or replace procedure p_sxt15(v_number in number) as
    cursor c_emp is select * from emp order by sal desc;
    v_n number := 0;
  begin
    for v_emp in c_emp loop
      v_n := v_n + 1;
      dbms_output.put_line(v_n || ' - ' || v_dept_emp.ename || ' - ' || v_dept_emp.sal);
      if v_n = v_number then
        exit;
      end if;
    end loop;
  end;
  --（9）执行
  begin
    p_sxt15(5);
  end;


  --（10）创建一个存储过程，以两个整数为参数，输出工资排序在两个参数之间的员工信息。
  create or replace procedure p_sxt16(v_up in number,v_down in number) as
    cursor c_emp is select * from emp order by sal desc;
    v_n number := 0;
  begin
    for v_emp in c_emp loop
      v_n := v_n + 1;
      if v_n >= v_up and v_n <= v_down then
        dbms_output.put_line(v_n || ' - ' || v_dept_emp.ename || ' - ' || v_dept_emp.sal);
      end if;
    end loop;
  end;
  --（10）执行
  begin
    p_sxt16(2,3);
  end;

-- 在存储过程中创建表
create or replace procedure proc_test as
  v_sql varchar2(2000) := '';
  begin
     v_sql := 'create or replace view v_test as select emp_no ,dept_no from dept_emp';
     execute immediate v_sql;
     commit;
  end;
