-- Session 1
begin;

select * from pizzeria where name like '%Hut';

select * from pizzeria where name like '%Hut';

commit;

select * from pizzeria where name like '%Hut';

-- Session 2
begin;

update pizzeria set rating = 3.6 where name like '%Hut';

commit;

select * from pizzeria where name like '%Hut';