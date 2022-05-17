create or replace function check_bigger(amount in INTEGER) return varchar2 is
  cursor getSalary (eid INTEGER) is
                          SELECT salary
                          FROM EMPLOYEE
                          WHERE id = eid;
  FunctionResult varchar2(4);
  max_salary INTEGER := 0;
  cur_salary INTEGER;
begin
  for pol_emp in (select *
                 from POLEMP)
      loop
        OPEN getSalary(pol_emp.id);
        fetch getSalary INTO cur_salary;
        IF (max_salary < cur_salary) THEN
          max_salary := cur_salary;
        END IF;
        CLOSE getSalary;
      END LOOP;
  
  IF (max_salary < amount) THEN
    FunctionResult := 'NO';
    
  ELSE
    FunctionResult := 'YES';
  END IF;
  
  return(FunctionResult);
end check_bigger;
/
