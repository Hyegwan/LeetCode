select person_name
from (
    select person_name
         , weight
         , turn
         , sum(weight) over(order by turn) as cum_weight
    from queue) tb
where cum_weight <= 1000
order by turn desc 
limit 1

# select q1.person_name
# from queue q1 
#      join queue q2 on q1.turn >= q2.turn
# group by q1.turn, q1.person_name
# having sum(q2.weight) <= 1000
# order by q1.turn desc
# limit 1                           -- 속도가 더 나빠져버린..


# with tb as (
#     select *
#         , (select sum(weight)
#             from queue q2
#             where q2.turn <= q1.turn) as cum_weight
#     from queue q1
#     order by turn)

# select person_name
# from tb
# where cum_weight <= 1000
# order by cum_weight desc
# limit 1