set schema 'enfants';

select init();
commit;

select * from enfant;

BEGIN TRANSACTION; --t1

SELECT points FROM enfant WHERE nopers = 1  --t3
  FOR UPDATE;

UPDATE enfant SET points=points+8 WHERE nopers = 1; --t6


commit; --t8

SELECT points FROM enfant WHERE nopers = 1;
