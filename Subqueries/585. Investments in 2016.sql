select round(sum(tiv_2016), 2) tiv_2016
from Insurance 
where tiv_2015 in(
select tiv_2015
from Insurance
group by tiv_2015
having count(tiv_2015) > 1)
and 
CONCAT(lat, lon) in
(
select CONCAT(lat, lon) from Insurance
group by CONCAT(lat, lon)
having count(CONCAT(lat, lon)) = 1
)