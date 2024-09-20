WITH departmentRank AS (
    SELECT *, 
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rowNum
    FROM Employee
)

select d.name Department, dr.name Employee, dr.salary Salary
from departmentRank dr
inner join Department d
on dr.departmentId = d.id
where dr.rowNum <= 3