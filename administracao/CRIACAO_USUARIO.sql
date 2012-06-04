-- Create the user 
create user DESENV
  default tablespace TS_SOTEC_PDV
  temporary tablespace TS_TEMP_SOTEC_PDV
  profile DEFAULT
  password expire
  quota unlimited on ts_sotec_pdv;
-- Grant/Revoke role privileges 
grant connect to DESENV;
grant dba to DESENV;
grant resource to DESENV;
-- Grant/Revoke system privileges 
grant unlimited tablespace to DESENV;
