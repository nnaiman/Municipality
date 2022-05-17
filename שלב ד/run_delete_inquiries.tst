PL/SQL Developer Test script 3.0
6
declare 
  cname VARCHAR2(20) := 'Health';
  before_date DATE := to_date('31-12-2015','DD-MM-YYYY');
begin
  delete_inquries(committee_name => cname, before_date => before_date);
end;
0
0
