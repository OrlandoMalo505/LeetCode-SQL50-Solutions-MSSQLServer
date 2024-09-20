WITH
    categories AS 
	(
        SELECT 'Low Salary' AS category
        UNION
        SELECT 'Average Salary'
        UNION
        SELECT 'High Salary'
    )

	select c.category, count(account_id) accounts_count 
	from categories c
	left join 
	(select
	case
	when income < 20000 then 'Low Salary'
	when income between 20000 and 50000 then 'Average Salary'
	when income > 50000 then 'High Salary'
	end as category, account_id
	from Accounts) acc
	on c.category = acc.category
	group by c.category