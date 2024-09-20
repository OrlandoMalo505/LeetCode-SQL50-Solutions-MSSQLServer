with duplicateEmail
as
(
select *, ROW_NUMBER() over(partition by email order by id) as rowNum from Person
)

DELETE
FROM duplicateEmail
WHERE rowNum > 1