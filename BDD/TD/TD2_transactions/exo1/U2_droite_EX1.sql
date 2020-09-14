set schema 'enfants';

begin transaction; --t2

UPDATE enfant
SET classe = 'CM1_1' WHERE nopers = 1; --t4

commit; --t6
