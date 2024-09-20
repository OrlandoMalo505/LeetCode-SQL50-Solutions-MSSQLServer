SELECT contest_id, ROUND(cast(COUNT(user_id) as float) / (SELECT COUNT(user_id) FROM users) * 100, 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id