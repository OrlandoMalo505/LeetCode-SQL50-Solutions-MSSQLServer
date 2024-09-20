SELECT s.user_id,
ROUND(SUM(CASE WHEN c.action = 'confirmed' then 1 else 0 END) / CAST(COUNT(*) as float) ,2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id