select product_id
     , year as 'first_year'
     , quantity
     , price
from(
    select *
         , dense_rank() over(partition by product_id order by year) as 'r'
    from sales) s
where r=1

