select s.user_id, sum(if(action="confirmed",1,0))/count(*) as confirmation_rate 
from Signups s
left join Confirmations c using(user_id)
group by s.user_id  