-- Session 1
begin;

update pizzeria set rating = 5 where name LIKE '%Hut%';

select * from pizzeria where name LIKE '%Hut%';

commit;

-- Session 2
select * from pizzeria where name LIKE '%Hut%';