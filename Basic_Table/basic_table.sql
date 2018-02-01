Drop TABLE dept_emp;
CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  dept_no char(4) NOT NULL,
  from_date varchar2(10) NOT NULL,
  to_date varchar2(10) NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
) ;

Drop TABLE dept_manager;
CREATE TABLE dept_manager (
  dept_no char(4) NOT NULL,
  emp_no int NOT NULL,
  from_date varchar2(10) NOT NULL,
  to_date varchar2(10) NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
) ;

Drop TABLE employees;
CREATE TABLE employees (
  emp_no int NOT NULL,
  birth_date varchar2(10) NOT NULL,
  first_name varchar(14) NOT NULL,
  last_name varchar(16) NOT NULL,
  gender char(1) NOT NULL,
  hire_date varchar2(10) NOT NULL,
  PRIMARY KEY (emp_no)
) ;

Drop TABLE salaries;
CREATE TABLE salaries (
  emp_no int NOT NULL,
  salary int NOT NULL,
  from_date varchar2(10) NOT NULL,
  to_date varchar2(10) NOT NULL,
  PRIMARY KEY (emp_no, from_date)
) ;
