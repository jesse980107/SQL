select distinct
    l1.Num as ConsecutiveNums
from
    Logs l1,
    Logs l2,
    Logs l3
where
    l1.Id = l2.Id - 1
    and l2.Id = l3.Id - 1
    and l1.Num = l2.Num
    and l2.Num = l3.Num
;

----------------- better approach
WITH temporary_table(num, next_num, prev_num) AS (
    SELECT 
        num, 
        LEAD(num, 1, 0) OVER (ORDER BY id ASC) AS next_num,
        LAG(num, 1, 0) OVER (ORDER BY id ASC) AS prev_num 
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM temporary_table 
WHERE num = next_num AND num = prev_num;