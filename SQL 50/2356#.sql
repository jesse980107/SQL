select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id

-- Beats 95.35% of users with MySQL