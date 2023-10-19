select Department
     , Employee
     , Salary
from (
     select d.name as Department
          , e.name as Employee
          , Salary
          , MAX(salary) over (partition by departmentId) as max_sal
     from employee e
          join department d on e.departmentId = d.id) sub
where Salary = max_sal











