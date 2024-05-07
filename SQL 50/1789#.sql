select a.employee_id, a.department_id 
from Employee a 
where a.primary_flag = "Y" or employee_id in (
    select employee_id 
    from Employee
    group by employee_id 
    having count(department_id) = 1
)

--this is better since it avoids potential pitfalls
--with the IN subquery performance issues in the first solution.
SELECT employee_id, department_id
FROM Employee 
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM Employee 
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
ORDER BY employee_id;