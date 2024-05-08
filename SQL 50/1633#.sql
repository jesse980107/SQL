select 
    contest_id ,
    round(count(distinct user_id )/(select COUNT(user_id) from Users)*100,2) as percentage
from Register
group by contest_id
order by percentage desc, contest_id