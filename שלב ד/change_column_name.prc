create or replace procedure change_column_name(table_name in out varchar2, old_name in out varchar2, new_name in out varchar2) is
   command varchar(100);
begin
  command := 'alter table ';
  command := command || table_name;
  command := command || ' rename column ';
  command := command || old_name;
  command := command || ' to ';
  command := command || new_name;
  
  EXECUTE IMMEDIATE command;
  COMMIT;
  
  DBMS_OUTPUT.put_line('Column name changed successfully!');
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('Error in chaging name.');
  
end change_column_name;
/
