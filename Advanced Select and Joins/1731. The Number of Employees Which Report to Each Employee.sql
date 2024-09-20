select managers.employee_id,
managers.name,
count(e1.employee_id) as reports_count,
avg(cast(e1.age as float)) avgAge
from Employees e1
inner join Employees managers
on e1.reports_to = managers.employee_id
group by managers.employee_id, managers.name
order by managers.employee_id