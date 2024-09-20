with productFirstYear
as
(
	select *, ROW_NUMBER() over (partition by product_id order by [year]) as rowNumber
	from Sales
)

select pfy.product_id, year, quantity, price, product_name from productFirstYear pfy
inner join Product p
on pfy.product_id = p.product_id
where rowNumber = 1