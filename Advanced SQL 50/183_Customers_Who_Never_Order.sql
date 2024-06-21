--Easy
select name as Customers 
from Customers c
left join Orders o on c.id = o.customerID
where customerID is null
2nd--------------------
select name as Customers 
from Customers c
where id not in (
    select customerID
    from Orders 
)
