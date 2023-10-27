(select name as results
from users u
     join movierating r using (user_id)
group by user_id
order by count(user_id) desc, name
limit 1)

union all

(select title as results
from movies m
     join movierating r 
     on m.movie_id = r.movie_id and r.created_at like '2020-02%'
group by m.movie_id
order by avg(rating) desc, title
limit 1)

