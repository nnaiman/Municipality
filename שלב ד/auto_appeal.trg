create or replace trigger auto_appeal
  after insert
  on fines 
  for each row
declare
  last_iid INTEGER;
  fine_date DATE;
  fined_id INTEGER;
  details VARCHAR(100);
begin
  SELECT MAX(IID) INTO last_iid FROM INQUIRIES;
  SELECT sdate INTO fine_date from SOURCE WHERE sid = :new.sid;
  SELECT id INTO fined_id FROM COLLECTION WHERE sid = :new.sid;
  details := 'Appeal for fine number ' || :new.sid;
  
  
  INSERT INTO INQUIRIES (IID, IDATE, TYPE, DETAILS, STATUS, ID, COMMITNAME)
  VALUES (last_iid + 1, fine_date, 'A', details, '1', fined_id, 'Welfare');
  DBMS_OUTPUT.put_line('Automatic appeal was sent!');
  
end auto_appeal;
/
