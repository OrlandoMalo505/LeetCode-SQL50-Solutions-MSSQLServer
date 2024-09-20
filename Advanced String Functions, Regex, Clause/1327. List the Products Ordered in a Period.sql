select p.product_name, sum(unit) units
from Products p
inner join Orders o
on p.product_id = o.product_id
where Month(o.order_date) = 2 and year(o.order_date) = 2020
group by p.product_id, p.product_name
having sum(unit) >= 100