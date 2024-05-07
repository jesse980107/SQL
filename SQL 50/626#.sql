select
    (case
        when id % 2 != 0 and id!= total then id+1
        when id % 2 != 0 and id = total then id
        else id -1
    end) as id , student
from seat , (
    SELECT COUNT(*) as total 
    FROM seat) as s
order by id

----------------------
SELECT CASE
           WHEN s.id % 2 <> 0 AND s.id = (SELECT COUNT(*) FROM Seat) THEN s.id
           WHEN s.id % 2 = 0 THEN s.id - 1
           ELSE
               s.id + 1
           END AS id,
       student
FROM Seat AS s
ORDER BY id