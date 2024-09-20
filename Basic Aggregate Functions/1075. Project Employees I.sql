select p.project_id, round(avg(cast(e.experience_years as float)),2) as avg_years
from Employee e 
left join Project p
on e.employee_id = p.employee_id
group by p.project_id