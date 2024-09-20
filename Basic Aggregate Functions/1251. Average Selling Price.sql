select p.product_id, round(sum(units * price) / sum(cast(units as float)), 2) AS average_price
from Prices p
left join UnitsSold as us
on p.product_id = us.product_id
AND purchase_date BETWEEN start_date AND end_date
group by p.product_id