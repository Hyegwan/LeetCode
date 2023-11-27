select request_at as 'Day'
      , round(count(case when status != 'completed' then 1 end) / count(*), 2) 
        as 'Cancellation Rate'
from trips 
where client_id in (
     select users_id
     from users
     where banned = 'No')
and driver_id in (
     select users_id
     from users
     where banned = 'No')
and request_at between '2013-10-01' and '2013-10-03'
group by request_at

# case를 if로 푼다면 이렇게
count(if(status != 'completed', true, null)) -- true, null 역시 대문자 아니어도 ㄱㅊㄱㅊ
