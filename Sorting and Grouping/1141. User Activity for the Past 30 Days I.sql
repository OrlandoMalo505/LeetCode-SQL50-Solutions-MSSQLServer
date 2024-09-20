select activity_date, count(distinct user_id) as active_users from Activity
where activity_date between DATEADD(day, -30, '2019-07-27') and '2019-07-27'
group by activity_date