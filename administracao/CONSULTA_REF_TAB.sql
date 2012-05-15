select table_name, constraint_name, status, owner
  from all_constraints
 where r_owner = :OWNER
   and constraint_type = 'R'
   and r_constraint_name in (select constraint_name
                               from all_constraints
                              where constraint_type in ('P', 'U')
                                and table_name = :TABLE_NAME
                                and owner = :OWNER)
