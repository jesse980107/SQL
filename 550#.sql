with firstdate as (
    select player_id, min(event_date) as fd
    from Activity 
    group by player_id
)

select round(
    count(a.player_id)/(
        select count(distinct b.player_id)  from Activity b
    )
    ,2) as fraction
from Activity a
join firstdate using(player_id)
where datediff(a.event_date,firstdate.fd) = 1


-- Beats 49.55% of users with MySQL