declare @secondSalary int

set @secondSalary = (
select top(1) salary SecondHighestSalary
from 
(select salary, DENSE_RANK() over (order by salary desc) as rowNum
from Employee) e
where rowNum = 2)

select @secondSalary SecondHighestSalary