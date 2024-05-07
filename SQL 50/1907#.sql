with cte as(
    select account_id , income , 
    (case 
        when income <20000 then "Low Salary"
        when 20000 <= income and income <=50000 then "Average Salary"
        else "High Salary"
    end) as category       
    from Accounts
)


-- select * from cte

select category,sum(accounts_count) as accounts_count from
(
select category ,COUNT(*) as accounts_count 
from cte 
group by category
UNION ALL
SELECT 'Low Salary' as category , 0 as accounts_count
UNION ALL
SELECT 'Average Salary' as category , 0 as accounts_count
UNION ALL
SELECT 'High Salary' as category , 0 as accounts_count
) as b group by category