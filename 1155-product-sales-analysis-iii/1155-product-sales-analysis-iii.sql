# select product_id, year as 'first_year', quantity, price
# from(
#     select *, dense_rank() over(partition by product_id order by year) as 'r'
#     from sales
#     ) s
# where r=1


select product_id
     , year as first_year
     , quantity
     , price
from sales
where (product_id, year) in (
    select product_id
         , min(year)
    from sales
    group by product_id)
