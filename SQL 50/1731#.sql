with tmp as(
    select reports_to as employee_id , count(employee_id ) as reports_count, avg(age) as average_age
    from Employees
    where reports_to is not null
    group by reports_to
    )
-- select employee_id, name, count() as reports_count
-- from Employees
-- where employee_id in (
--     select distinct reports_to  
--     from Employees
--     where reports_to is not null
    
-- );
select employee_id, name, reports_count , round(average_age,0) as average_age
from Employees
join tmp using(employee_id)
order by employee_id asc