select user_id
     , round(sum(case when action = 'confirmed' then 1 else 0 end) / count(user_id), 2) as confirmation_rate
from confirmations c
     right join signups s using (user_id)
group by user_id