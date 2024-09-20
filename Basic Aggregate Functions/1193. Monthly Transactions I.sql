select MONTH(trans_date) as trans_month,
country,
count(*) as trans_count, 
Sum(CASE WHEN state = 'approved' then 1 else 0 END),
sum(amount) as trans_total_amount,
Sum(CASE WHEN state = 'approved' then amount else 0 END) as trans_approved_amount
from Transactions
group by MONTH(trans_date), country
order by country 