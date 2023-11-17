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



# 이런 방법도 있다
where  3 > (select count(distinct e2.Salary)
             from  Employee e2
             where e2.Salary > e1.Salary
             and e1.DepartmentId = e2.DepartmentId)

note:
- e1 직원 기준 자기 보다 높은 급여를 받는 e2 직원 수를 계산하고, 그 수가 3 미만인 경우에만 결과를 반환 -> 자기보다 급여가 높은 직원이 3명 미만인 경우 = 상위 랭크 3위까지 
- 나는 e2 직원 기준 자기 보다 낮은 급여를 받는 e1 직원 수를 계산했다고 생각했음.. 
- 하지만 카운트는 e2니까 e1보다 급여를 더 많이 받는 e2를 세는 게 맞다



