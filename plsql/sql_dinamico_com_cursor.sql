declare
  type tipo_cursor is ref cursor;
  c tipo_cursor;
  str_sql varchar(100) := 'SELECT * FROM USER_OBJECTS';
  user_obj user_objects%rowtype;
begin
  open c for str_sql;
  loop
    fetch c into user_obj;
    if user_obj.object_type = 'FUNCTION' then
      dbms_output.put_line(user_obj.object_name);
    end if;
    exit when c%notfound;
  end loop;
  close c;
end;
