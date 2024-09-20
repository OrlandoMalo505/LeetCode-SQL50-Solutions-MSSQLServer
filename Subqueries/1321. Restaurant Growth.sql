SELECT 
    a.visited_on, 
    SUM(b.amount) AS amount, 
    ROUND(SUM(b.amount) / 7.0, 2) AS average_amount
FROM 
    (SELECT DISTINCT visited_on FROM Customer) a
    INNER JOIN Customer b ON DATEDIFF(DAY, b.visited_on, a.visited_on) BETWEEN 0 AND 6
GROUP BY 
    a.visited_on
HAVING 
    a.visited_on >= DATEADD(DAY, 6, MIN(b.visited_on));