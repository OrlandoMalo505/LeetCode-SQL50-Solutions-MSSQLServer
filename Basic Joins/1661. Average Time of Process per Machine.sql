select a1.machine_id, round(sum(a2.timestamp - a1.timestamp) / 2, 3) as processing_time  from 
(select * from Activity 
where activity_type = 'start') a1
inner join (select * from Activity where activity_type = 'end') as a2
on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
group by a1.machine_id

--or
select s.machine_id, round(avg(e.timestamp-s.timestamp), 3) as processing_time
from Activity s join Activity e on
    s.machine_id = e.machine_id and s.process_id = e.process_id and
    s.activity_type = 'start' and e.activity_type = 'end'
group by s.machine_id