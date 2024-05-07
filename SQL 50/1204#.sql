select person_name FROM(
select
person_name, 
sum(weight) over (order by turn) as Total_weight
FROM Queue
) tot
where total_weight <= 1000
order by Total_weight desc
limit 1