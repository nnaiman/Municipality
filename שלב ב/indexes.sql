create index inst_indx on INSTITUTION ( commitname );
create unique index clc_indx on COLLECTION ( sid, id );
create index inq_indx on INQUIRIES ( commitname );


create index emp_indx on EMPLOYEE ( bankdetail );
create index res_indx on RESIDENT ( phone );

create index finc_indx on FINANCE ( name );


create index src_ne_indx on SOURCE ( amount );
