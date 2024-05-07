select machine_id, round(avg(b.timestamp-a.timestamp),3) as processing_time 
from Activity a
join Activity b using(machine_id)
where a.activity_type = "start" and b.activity_type = "end" and a.machine_id = b.machine_id 
group by machine_id