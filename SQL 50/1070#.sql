with firstyear as(
    select product_id , min(year) as fy 
    from Sales
    group by product_id
)

select s.product_id, s.year as first_year, s.quantity, s.price 
from Sales s
join firstyear on firstyear.product_id = s.product_id  and s.year = firstyear.fy;
--------------------------------------

select product_id, s.year as first_year,quantity, price
from Sales s
where (s.year,s.product_id) in (
    select min(year) as year,product_id
    from Sales 
    group by product_id) ;