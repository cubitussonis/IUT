set schema 'enfants';

BEGIN TRANSACTION; --t2

UPDATE enfant SET classe = 'CM1_1' WHERE nopers = 1; --t5

commit; --t7
