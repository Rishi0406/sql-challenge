select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries; 
select * from titles; 

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no as employee_number, e.last_name, e.first_name, e.sex, s.salary
from salaries as s 
join employees as e
on s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees e 
where hire_date between '1986-01-01' and '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no department_number, d.dept_name department_name, d_manager.emp_no managers_employee_number, e.last_name managers_lastname, e.first_name managers_firstname
from departments d
join dept_manager d_manager on d.dept_no = d_manager.dept_no
join employees e on d_manager.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no employee_number, e.last_name, e.first_name, d.dept_name department_name
from employees e
join dept_emp on e.emp_no = dept_emp.emp_no
join departments d on dept_emp.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees e
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no employee_number, e.last_name, e.first_name, d.dept_name department_name
from employees e
join dept_emp on e.emp_no = dept_emp.emp_no 
join departments d on dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no employee_number, e.last_name, e.first_name, d.dept_name department_name
from employees e
join dept_emp on e.emp_no = dept_emp.emp_no 
join departments d on dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "frequency" 
from employees
group by last_name
order by count(last_name) desc; 