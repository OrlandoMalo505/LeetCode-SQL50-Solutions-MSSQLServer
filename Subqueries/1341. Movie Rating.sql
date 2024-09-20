select * from (

select top(1) name as results
from MovieRating mr
inner join Users u
on mr.user_id = u.user_id
group by mr.user_id, u.name
order by count(mr.user_id) desc, name asc

union all

select top(1) title as results
from MovieRating mr
inner join Movies m
on mr.movie_id = m.movie_id
WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
group by mr.movie_id, title
order by avg(cast(rating as float)) desc, title

) as res