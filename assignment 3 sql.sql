select employees.first_name, jobs.job_title, departments.department_name from job_history
join jobs on jobs.job_id = job_history.job_id
join departments on departments.department_id = job_history.department_id
join employees on employees.employee_id = job_history.employee_id
where departments.department_id = 60;
select first_name from employees
where department_id = 60;

select first_name, manager_id from employees;

select employees.first_name, round(datediff(job_history.end_date,job_history.start_date)/365,2) from employees
join job_history on job_history.employee_id = employees.employee_id;

select countries.country_name, count(departments.department_id) from countries
join departments on departments.location_id = locations.location_id
join locations on locations.country_id = countries.country_id; 

select e.first_name as emp_name, m.first_name as mgn_name from employees m
join employees e on m.employee_id = e.manager_id;

drop database sakila;

select a.first_name, a.last_name, count(f.film_id) as Num from film_actor f
join actor a on a.actor_id = f.actor_id
group by a.actor_id limit 5;

select count(employees.first_name), departments.department_name from employees
join departments on departments.department_id = employees.department_id
group by department_name;

select employees.first_name, employees.last_name, jobs.job_title from employees
join jobs on jobs.job_id = employees.job_id;

select count(employees.first_name) as num, jobs.job_title  from employees
join jobs on jobs.job_id = employees.job_id
group by jobs.job_title;

select employees.first_name,max(employees.salary) as max_sal, jobs.job_title from employees
join jobs on jobs.job_id = employees.job_id
group by jobs.job_title
order by max_sal desc;

select employees.first_name,max(employees.salary) as max_sal, jobs.job_title from employees
join jobs on jobs.job_id = employees.job_id
group by jobs.job_title
order by max_sal desc; 

select employees.first_name,max(employees.salary) as max_sal, jobs.job_title from employees
join jobs on jobs.job_id = employees.job_id
where jobs.job_title = "Accounting Manager" 


SELECT concat_ws(' ', e.first_name, e.last_name) as employee_name,j.job_title as previous_job_title, 
FROM   employees e
JOIN job_history h ON e.employee_id = h.employee_id
JOIN jobs j ON h.job_id = j.job_id; 

create view emp_current_job_title as
select employees.first_name,jobs.job_title from employees
join jobs on jobs.job_id = employees.job_id;

create view emp_previous_job_title as
select employees.first_name,jobs.job_title, job_history.job_id from employees
join jobs on jobs.job_id = employees.job_id;

SELECT Concat_ws(' ', e.first_name, e.last_name) employee_name, j_last.job_title as previous_job_title,j_present.job_title as present_job_title
FROM   employees e
LEFT OUTER JOIN job_history h ON e.employee_id = h.employee_id
LEFT OUTER JOIN jobs j_last ON h.job_id = j_last.job_id
LEFT OUTER JOIN jobs j_present ON e.job_id = j_present.job_id; 

select employees.first_name, jobs.job_title, departments.department_name from job_history
join jobs on jobs.job_id = job_history.job_id
join departments on departments.department_id = job_history.department_id
join employees on employees.employee_id = job_history.employee_id
where departments.department_name = "IT";

select employees.first_name, jobs.job_title, departments.department_name from job_history
left outer join departments on departments.department_id = employees.department_id
join employees on employees.employee_id = job_history.employee_id
join jobs on jobs.job_id = job_history.job_id
where departments.department_id = 60;

select count(d.department_id) as number_of_departments, c.country_name from departments d 
join locations l on d.location_id = l.location_id 
join countries c on l.country_id = c.country_id 
group by c.country_name;