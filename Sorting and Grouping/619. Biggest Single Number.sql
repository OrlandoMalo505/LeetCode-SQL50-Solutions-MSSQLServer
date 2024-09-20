select MAX(num) as num from MyNumbers
group by num 
having COUNT(*) = 1

--or
select top (1) * from MyNumbers
group by num 
having COUNT(*) = 1
order by num desc 