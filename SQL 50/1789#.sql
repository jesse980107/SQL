select a.employee_id, a.department_id 
from Employee a 
where a.primary_flag = "Y" or employee_id in (
    select employee_id 
    from Employee
    group by employee_id 
    having count(department_id) = 1
)

