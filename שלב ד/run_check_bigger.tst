PL/SQL Developer Test script 3.0
7
declare 
  amount INTEGER := 500000;
  result VARCHAR2(5);
begin
  result := check_bigger(amount => amount);
  DBMS_OUTPUT.put_line('Is there a political employee that earns more than ' || amount || '? ' || result);
end;
0
0
