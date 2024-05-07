select product_name ,sum(unit) as unit
from Products
join Orders using(product_id)
where MONTH(order_date) = 2 AND YEAR(order_date) = 2020
group by product_id
having sum(unit)>=100

--------------------------
# Write your MySQL query statement below
SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
INNER JOIN Orders o ON p.product_id = o.product_id AND MONTH(o.order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY o.product_id HAVING unit >= 100;