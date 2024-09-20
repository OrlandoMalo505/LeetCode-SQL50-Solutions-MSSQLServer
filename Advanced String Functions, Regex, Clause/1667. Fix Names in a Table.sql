select user_id,
upper(left(name, 1)) + lower(right(name, LEN(name)-1)) name
from users