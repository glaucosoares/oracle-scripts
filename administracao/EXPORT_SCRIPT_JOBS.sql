declare

what user_jobs.what%TYPE;
interval user_jobs.interval%TYPE;

CURSOR c IS
    select what, interval
    from user_jobs;

BEGIN
    dbms_output.put_line('DECLARE');
    dbms_output.put_line('job user_jobs.job%TYPE;');
    dbms_output.put_line('BEGIN');

    OPEN c;
    LOOP
        fetch c into what, interval;
        exit when c%NOTFOUND;

        dbms_output.put_line('dbms_job.submit(');
        dbms_output.put_line('job => job,');
        dbms_output.put('what => ''');
        dbms_output.put(replace(what, '''', ''''''));
        dbms_output.put_line(''',');
        dbms_output.put_line('next_date => sysdate,');
        dbms_output.put('interval => ''');
        dbms_output.put(replace(interval, '''', ''''''));
        dbms_output.put_line(''');');
        dbms_output.put_line('');
    END LOOP;

    CLOSE c;
    dbms_output.put_line('commit;');
    dbms_output.put_line('END;');
    dbms_output.put_line('/');
END;
