WITH first_login AS (
    SELECT player_id, MIN(event_date) [first_day]
    FROM Activity
    GROUP BY player_id
),
second_login AS (
    SELECT a.player_id
    FROM Activity a
    INNER JOIN first_login f ON a.player_id = f.player_id AND a.event_date = DATEADD(day, 1, f.first_day)
)
SELECT 
    ROUND(COUNT(DISTINCT s.player_id) * 1.0 / COUNT(DISTINCT f.player_id), 2) [fraction]
FROM 
    first_login f
LEFT JOIN 
    second_login s ON f.player_id = s.player_id