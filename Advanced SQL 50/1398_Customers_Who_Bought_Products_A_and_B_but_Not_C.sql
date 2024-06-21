--Medium
with c as(
    select customer_id
    from Customers c
    left join Orders o using(customer_id)
    where product_name  = "C"
),
b as(
    select customer_id
    from Customers c
    left join Orders o using(customer_id)
    where product_name  = "B"
)

select distinct  c.customer_id , c.customer_name 
from Customers c
left join Orders o using(customer_id)
where product_name  = "A" and customer_id in (select * from b) and customer_id not in (select * from c)

2nd-------------------------
WITH product_cnt AS
(SELECT customer_id,
    SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) AS A_cnt,
    SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) AS B_cnt,
    SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) AS C_cnt
FROM Orders
GROUP BY customer_id)

SELECT c.*
FROM Customers c
JOIN product_cnt p_cnt
ON c.customer_id = p_cnt.customer_id AND A_cnt != 0 AND B_cnt != 0 AND C_cnt = 0
ORDER BY c.customer_id
;