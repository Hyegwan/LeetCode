select round(count(case when datediff(event_date, first_login) = 1 then player_id end) / count(distinct player_id), 2) as fraction
from (
     select player_id
          , event_date
          , min(event_date) over (partition by player_id order by event_date) as first_login
     from activity
     ) sub
