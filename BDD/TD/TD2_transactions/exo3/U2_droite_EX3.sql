set schema 'enfants';

select * from enfant;

BEGIN TRANSACTION; --t2

SELECT points FROM enfant WHERE nopers = 1  --t4
  FOR UPDATE;

UPDATE enfant SET points=points+5 WHERE nopers = 1; --t5

commit; --t7
