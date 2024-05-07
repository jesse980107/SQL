select id, count(*) as num  
from (
    select requester_id id from RequestAccepted
    union all
    select accepter_id id from RequestAccepted) cte
group by id
order by num desc 
limit 1

-----------------
with base as(select requester_id id from RequestAccepted
union all
select accepter_id id from RequestAccepted)


select id, count(*) num  from base group by 1 order by 2 desc limit 1