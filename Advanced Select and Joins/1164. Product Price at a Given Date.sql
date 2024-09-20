with poductsLastChange 
as
(
select *, row_number() over (partition by product_id order by change_date desc) as rowNumber
from products
where change_date <= '2019-08-16'
),
no_change as
(
select product_id, 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16'
)

select product_id, new_price from poductsLastChange where rowNumber = 1
union all
select * from no_change