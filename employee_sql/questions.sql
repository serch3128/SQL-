--List the following details of each employee: employee number, last name, first name, gender, and salary.

select de.emp_no,de.first_name,de.last_name,de.gender,sa.salary  
from data_employees as de
left join salary  as sa on de.emp_no=sa.emp_no
order by emp_no asc
limit 60 ;

--List employees who were hired in 1986.

select emp_no, first_name, last_name, extract(year from hire_date) as "hire_year"
from data_employees
where extract(year from hire_date)  = 1986
order by emp_no asc;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dep.dept_no, dep.dept_name, man.emp_no, dat.first_name,dat.last_name,man.from_date,man.to_date
from deparment as dep
left join manager as man on dep.dept_no=man.dept_no
left join data_employees as dat on man.emp_no=dat.emp_no
order by dep.dept_no, man.from_date asc;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no,dat.last_name,dat.first_name,dep.dept_name
from employee as emp
left join data_employees as dat on emp.emp_no=dat.emp_no
left join deparment as dep on emp.dept_no = dep.dept_no
order by emp.emp_no asc;
 --List all employees whose first name is "Hercules" and last names begin with "B."
 
select first_name, last_name
from data_employees
where first_name = 'Hercules' and last_name like ('B%');

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select emp.emp_no,dat.last_name,dat.first_name,dep.dept_name
from employee as emp
left join data_employees as dat on emp.emp_no=dat.emp_no
right join (select * from deparment where dept_name = 'Sales') as dep on emp.dept_no = dep.dept_no
order by emp.emp_no asc;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select emp.emp_no,dat.last_name,dat.first_name,dep.dept_name
from employee as emp
left join data_employees as dat on emp.emp_no=dat.emp_no
right join (select * from deparment where dept_name in ('Sales','Development')) as dep on emp.dept_no = dep.dept_no
order by dep.dept_name,emp.emp_no asc;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name,count(last_name) as "freq"
from data_employees
group by last_name
order by count(last_name) desc;
