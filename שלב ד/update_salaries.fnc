create or replace function update_salaries(emp_role in VARCHAR2, percent in INTEGER) return NUMBER is
  FunctionResult NUMBER;
  cur_raise number;
  sum_of_raises number := 0;
  
begin
  for emp in (select * 
             from employee
             where erole=emp_role)
    loop
      cur_raise := ceil(emp.salary * (percent) / 100);
      sum_of_raises := sum_of_raises + cur_raise;
      update employee e set e.salary = e.salary + cur_raise
      where e.id = emp.id;
    end loop;
  functionResult := sum_of_raises;
  return(functionResult);
end update_salaries;
/
