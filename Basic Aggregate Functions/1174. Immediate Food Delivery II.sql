WITH delivery2 AS  
(  
select *,
 ROW_NUMBER() over (partition by customer_id order by order_date asc) as rowNumber
  FROM Delivery   
)  

SELECT 
ROUND(avg(CASE WHEN order_date = customer_pref_delivery_date then 1.0 else 0.0 END) * 100, 2)
as immediate_percentage
FROM delivery2  
WHERE rowNumber = 1