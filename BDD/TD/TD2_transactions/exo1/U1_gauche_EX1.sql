set schema 'enfants';
select init();
commit;

begin transaction; --t1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT classe
FROM enfant WHERE nopers = 1 ; --t3

SELECT classe
FROM enfant WHERE nopers = 1; --t5

SELECT classe
FROM enfant WHERE nopers = 1;  --t7

commit; --t8

SELECT classe FROM enfant WHERE nopers = 1;  --t9
