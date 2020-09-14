set schema 'enfants';

select * from enfant;

BEGIN TRANSACTION; --t2

UPDATE enfant SET points=points+7 WHERE nopers = 2; --t4

UPDATE enfant SET points=points + 11 WHERE nopers = 1; --t6

commit; --t8
