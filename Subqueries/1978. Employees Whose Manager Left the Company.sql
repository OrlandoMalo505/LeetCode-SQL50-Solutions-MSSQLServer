select e1.employee_id from Employees e1
left join Employees managers
on e1.manager_id = managers.employee_id
where e1.salary < 30000
and e1.manager_id is not null
and managers.employee_id is null

--or
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id IS NOT NULL AND manager_id NOT IN(
    SELECT employee_id 
    FROM employees
)
ORDER BY employee_id