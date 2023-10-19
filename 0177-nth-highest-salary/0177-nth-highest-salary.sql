CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set N = N-1;
  RETURN (
      select distinct salary
      from employee
      order by salary desc
      limit 1
      offset N  -- offset: skip N results
  );
END
