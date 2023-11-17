select Department
     , Employee
     , Salary
from (
    select d.name as Department
        , e.name as Employee
        , e.salary as Salary
        , dense_rank() over (partition by e.departmentId order by e.salary desc) as ranking
    from employee e
        join department d on e.departmentId = d.id) sub
where ranking < 4
