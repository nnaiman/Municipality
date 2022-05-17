create or replace trigger minimum_wage
  before insert or update
  on employee 
  for each row
declare
  minimum_wage Employee.Salary%type := 5300;
  new_emp_salary Employee.Salary%type;
begin
  new_emp_salary := :new.salary;
  
  IF new_emp_salary < minimum_wage THEN
    :new.salary := minimum_wage;
    DBMS_OUTPUT.put_line('Cannot pay less than minimum wage!');
  END IF;
  
end minimum_wage;
/
