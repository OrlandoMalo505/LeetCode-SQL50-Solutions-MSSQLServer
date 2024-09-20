select s.sale_id, p.product_name, s.price, s.year
from Sales s 
inner join Product p
on s.product_id = p.product_id