CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) 
RETURNS TABLE(fibonacci int) AS $$ 
    WITH RECURSIVE fib_number(first_number, second_number) AS (
        SELECT 0, 1
        UNION ALL
        SELECT second_number,
            first_number + second_number
        FROM fib_number
        WHERE second_number < pstop)
    SELECT first_number FROM fib_number;
$$ LANGUAGE SQL;

select * from fnc_fibonacci (100);

select * from fnc_fibonacci ();