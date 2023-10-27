with perdayamount as (
     select visited_on
          , sum(amount) as amount
     from customer
     group by visited_on)

select p1.visited_on
      , sum(p2.amount) as amount
      , round(avg(p2.amount), 2) as average_amount
from perdayamount p1
     join perdayamount p2 
     on datediff(p1.visited_on, p2.visited_on) between 0 and 6
group by p1.visited_on 
having count(*) = 7