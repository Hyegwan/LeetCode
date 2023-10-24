select requester_id as id
     , count(*) as num
from (
    select requester_id
         , accepter_id
    from requestaccepted
    union
    select accepter_id as requester_id
        , requester_id as accepter_id
    from requestaccepted) sub
group by requester_id
order by num desc
limit 1

