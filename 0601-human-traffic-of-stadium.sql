with sub as (
    select *
         , id - row_number() over (order by id) as id_diff
    from stadium
    where people > 99
)

select id
     , visit_date
     , people
from sub s1
where id_diff in (
    select id_diff
    from sub s2
    group by id_diff
    having count(*) > 2
)
order by visit_date
