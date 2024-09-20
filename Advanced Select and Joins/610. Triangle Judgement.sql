select *,
CASE 
     WHEN x + y > z and x + z > y and y + z > x
     THEN 'Yes' ELSE 'No' 
    END AS Triangle
from Triangle