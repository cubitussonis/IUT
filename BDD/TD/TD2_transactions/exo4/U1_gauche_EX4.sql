set schema 'enfants';
select init();

select * from enfant;

BEGIN TRANSACTION; --t1

UPDATE enfant SET points=points + 5 WHERE nopers = 1; --t3

UPDATE enfant SET points=points + 9 WHERE nopers = 2; --t5

commit; --t9


