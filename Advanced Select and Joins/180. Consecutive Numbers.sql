﻿select distinct l1.num from Logs l1
inner join logs l2 
on l1.num = l2.num and l1.id = l2.id + 1
inner join logs l3
on l2.num = l3.num and l2.id = l3.id + 1