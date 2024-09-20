SELECT 
    a.sell_date, 
    COUNT(DISTINCT a.product) [num_sold],
    (
        SELECT STRING_AGG(p.product, ',') WITHIN GROUP (ORDER BY p.product) 
        FROM (
            SELECT DISTINCT product 
            FROM Activities 
            WHERE sell_date = a.sell_date
        ) p
    ) [products]
FROM Activities a
GROUP BY sell_date
ORDER BY sell_date

--or
SELECT 
    a.sell_date, 
    COUNT(DISTINCT a.product) [num_sold],
    STRING_AGG(a.product, ',') WITHIN GROUP (ORDER BY a.product) [products]
FROM (
    SELECT DISTINCT
        sell_date,
        product 
    FROM Activities 
) a
GROUP BY a.sell_date
ORDER BY a.sell_date