-- create each table 
create table deparment (
    dept_no varchar(10) primary key,
    dept_name varchar(30) not null 
);

create table data_employees (
    emp_no int primary key,
    birth_date date not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    gender varchar(1) null, 
    hire_date date not null
);

create table employee(
    emp_no int not null,
    dept_no varchar(10),
    from_date date,
    to_date date,
    foreign key (emp_no) references data_employees(emp_no)
);

create table manager(
    emp_no int not null,
    dept_no varchar(10),
    from_date date,
    to_date date,
    foreign key (emp_no) references data_employees(emp_no)
);
