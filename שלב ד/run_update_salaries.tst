PL/SQL Developer Test script 3.0
8
declare 
  emp_role VARCHAR2(20) := 'Engineer';
  percent INTEGER := 2;
  result NUMBER;
begin
  result := update_salaries(emp_role => emp_role, percent => percent);
  DBMS_OUTPUT.put_line('Raise of salaries of role ' || emp_role || ' costs: ' || :result || ' per month ');
end;
2
result
1
36285
5
emp_role
0
-5
3
emp_role
FunctionResult
(select * from employee where erole=role)
