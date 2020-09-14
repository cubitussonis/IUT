set schema 'enfants';
select init();

select * from enfant;

BEGIN TRANSACTION; --t1

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ ; --t3


SELECT classe FROM enfant WHERE nopers = 1 ; --t4

SELECT classe FROM enfant WHERE nopers = 1; --t6

SELECT classe FROM enfant WHERE nopers = 1;  --t8

commit; --t9

SELECT classe FROM enfant WHERE nopers = 1;  --t10
