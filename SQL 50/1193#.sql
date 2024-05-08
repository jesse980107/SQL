# Write your MySQL query statement below
select  DATE_FORMAT(trans_date,'%Y-%m') month, country, count(*) as trans_count ,
sum(if(state="approved",1,0)) as approved_count ,
sum(amount) as  trans_total_amount,
sum(CASE WHEN state = 'approved' then amount else 0 END) as approved_total_amount
from Transactions
group by month,country 
