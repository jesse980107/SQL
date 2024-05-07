select max(num) as num
from MyNumbers m1
where num in (
    select num 
    from MyNumbers m2 
    group by m2.num 
    having count(*)=1)


-- better
select max(num) as num
from 
(select num, count(*) as cnt
from myNumbers
group by num
having cnt = 1) as sub_table