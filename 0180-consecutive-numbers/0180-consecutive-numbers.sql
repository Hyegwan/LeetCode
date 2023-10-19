-- lag, lead(col, n): col에서 n개의 행을 밀거나 당김!

select distinct num as ConsecutiveNums
from (
     select num
          , lead(num, 1) over (order by id) as l1
          , lead(num, 2) over (order by id) as l2
     from logs
     ) sub
where num = l1
and l1 = l2