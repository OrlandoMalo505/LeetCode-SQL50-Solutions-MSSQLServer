with employeeYN
as
(
select *, row_number() over (partition by employee_id order by primary_flag desc) as yDepartment
from Employee
)

select employee_id, department_id from employeeYN where yDepartment = 1