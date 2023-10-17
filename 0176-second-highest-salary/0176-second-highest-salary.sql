select lead(salary, 1) over (order by salary desc) as SecondHighestSalary
from (
  select distinct salary
  from employee) sub
limit 1
