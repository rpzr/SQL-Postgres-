begin;

set transaction isolation level serializable;

select * from pizzeria where name like '%Hut';

select * from pizzeria where name like '%Hut';

commit;

select * from pizzeria where name like '%Hut';

-- Session 2
begin;

set transaction isolation level serializable;

update pizzeria set rating = 3.0 where name like '%Hut';

commit;

select * from pizzeria where name like '%Hut';