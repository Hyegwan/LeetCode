with tb as (
    select *
        , (select sum(weight)
            from queue q2
            where q2.turn <= q1.turn) as cum_weight
    from queue q1
    order by turn)

select person_name
from tb
where cum_weight <= 1000
order by cum_weight desc
limit 1