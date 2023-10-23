select round(sum(tiv_2016), 2) as tiv_2016
from insurance i1
where tiv_2015 in (
    select tiv_2015
    from insurance i2
    where i2.pid != i1.pid)
and (lat, lon) not in (
    select lat, lon
    from insurance i3
    where i3.pid != i1.pid)


# select round(sum(tiv_2016), 2) as tiv_2016
# from insurance
# where tiv_2015 IN (
#     select tiv_2015
#     from insurance
#     group by tiv_2015
#     having count(*) > 1)
# and (lat, lon) NOT IN (
#     select lat, lon
#     from insurance
#     group by lat, lon
#     having count(*) > 1)