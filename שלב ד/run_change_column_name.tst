PL/SQL Developer Test script 3.0
9
declare 
  table_name varchar(30) := 'Donor';
  old_name varchar(30) := 'id';
  new_name varchar(30) := 'donor_id';
begin
  change_column_name(table_name => table_name,
                     old_name   => old_name,
                     new_name   => new_name);
end;
0
1
command
