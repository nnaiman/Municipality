create or replace procedure delete_inquries(committee_name in out varchar2, before_date in out Date) is
  cursor getInquries(cname varchar2) IS
                     SELECT *
                     FROM INQUIRIES
                     WHERE committee_name = commitname;
  inq_id INQUIRIES.IID%type;
  count_inq INTEGER := 0;
                          
begin
  FOR inq in getInquries(committee_name)
    LOOP
      IF (inq.idate < before_date AND inq.status = '1') THEN
        inq_id := inq.iid;
        DELETE FROM INQUIRIES I WHERE I.iid = inq_id;
        count_inq := count_inq + 1;
      END IF;
    END LOOP;
    
  DBMS_OUTPUT.put_line('Deleted ' || count_inq || ' inquries successfuly.');
end delete_inquries;
/
