select query_name,
round(sum(rating/ cast(position as float)) / count(*), 2) as quality,
ROUND(SUM(CASE WHEN rating < 3 then 1 else 0 END) / cast(count(*) as float) * 100, 2) as poor_query_percentage
from Queries
group by query_name

--or

SELECT query_name, ROUND(AVG(rating / cast(position as float)), 2) AS quality,
ROUND((AVG(CASE WHEN rating < 3 THEN 1.0 ELSE 0.0 END) * 100), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name